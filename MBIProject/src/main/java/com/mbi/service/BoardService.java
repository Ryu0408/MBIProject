package com.mbi.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.mbi.dao.GuideBoardDAO;
import com.mbi.vo.GuideBoardVO;
import com.mbi.vo.Pageing;


@Service
public class BoardService{

	@Autowired GuideBoardDAO gdao;
	private final int perPage = 10;		// 페이지 당 출력할 글의 개수

	
	public void create(GuideBoardVO gvo) {
		System.out.println("create : " + gvo);
		gdao.create(gvo);
	}
	
//	public ModelAndView guideBoard() {
//		ModelAndView mav = new ModelAndView("guideBoard");
//		
//		mav.addObject("vo", gdao.selectAll());
//		return mav;
//	}

	public ModelAndView guideBoardList(int page, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("guideBoard");

		// 검색 파라미터 처리 
		Pageing bp = new Pageing();

		// 총 페이지 개수
		int boardCount = gdao.selectCount(bp);
		int pageCount = boardCount / perPage;
		pageCount += boardCount % perPage == 0 ? 0 : 1;
		
		// 작은 페이징
		int first = (page - 1) * perPage + 1;
		int last = first + perPage - 1;
		bp.setStart(first);	// 시작 글 rownum
		bp.setEnd(last);	// 마지막 글 rownum
		
		// 큰 페이징
		int section = (page - 1) / 5;
		int begin = 5 * section + 1;
		int end = begin + 4 > pageCount ? pageCount : begin + 4;
		
		System.out.println("first : " + first );	// 첫번째 글 번호
		System.out.println("last : " + last);		// 마지막 글 번호
//		System.out.println("section : " + section);	// 페이징 구역
//		System.out.println("begin : " + begin);		// 페이징에 표시할 시작 페이지
//		System.out.println("end : " + end);			// 페이징에 표시할 마지막 페이지
		System.out.println("boardCount : " + boardCount);	// 총 게시글 개수
		System.out.println("pageCount : " + pageCount);		// 총 페이지 개수
		System.out.println("prev : " + (section != 0));		// 이전을 표시할 조건
		System.out.println("next : " + (boardCount > perPage * end));	// 다음을 표시할 조건
		System.out.println("==========================");
		
		// 뷰에 전달
		mav.addObject("vo", gdao.selectAll(bp));
		mav.addObject("begin", begin);
		mav.addObject("end", end);
		mav.addObject("page", page);
		mav.addObject("bp", bp);
		mav.addObject("prev", section != 0);
		mav.addObject("next", boardCount > perPage * end);
		
		return mav;
	}


	public ModelAndView readBoard(int boardsid, HttpSession session) {
		ModelAndView mav = new ModelAndView("readBoard");
		gdao.updateView(boardsid);
		GuideBoardVO gvo = gdao.selectOne(boardsid);
//		mav.addObject("vvo", vvo);
		
		mav.addObject("gvo", gvo);
		System.out.println(gvo.getBoardview());
		return mav;
	}

	public ModelAndView updateBoard(int boardsid) {
		ModelAndView mav = new ModelAndView("updateBoard");
		mav.addObject("gvo", gdao.selectOne(boardsid));
		return mav;
	}

	public void updateBoardPost(GuideBoardVO gvo) {
//		System.out.println("update" + gdao);
		gdao.updateBoard(gvo);
	}
	//삭제서비스
	public void deleteBoard(int boardsid) {
//		System.out.println("딜리트 서비스 실행");
		gdao.deleteBoard(boardsid);
	}


}
