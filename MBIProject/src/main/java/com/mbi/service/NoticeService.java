package com.mbi.service;

import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.mbi.classes.AES256Util;
import com.mbi.dao.NoticeBoardDAO;
import com.mbi.vo.NoticeBoardVO;
import com.mbi.vo.Pageing;
import com.mbi.vo.UserLoginVO;

@Service
public class NoticeService {
	@Autowired
	NoticeBoardDAO nbDao;
	@Autowired AES256Util aes;
	
	private final int perPage = 10;		// 페이지 당 출력할 글의 개수
	
	// 리스트
	public List<NoticeBoardVO> noticeListAll(Pageing bp){
		return nbDao.selectAll(bp);
	}
	
	public ModelAndView noticeBoardList(int page, HttpServletRequest req) {
		ModelAndView mav = new ModelAndView("noticeBoard");
		
		HttpSession hSession = req.getSession();
		UserLoginVO uvo = writeIdDecrypt(hSession);
			
		// 검색 파라미터 처리 
		Pageing bp = new Pageing();
		
		// 총 페이지 개수
		int boardCount = 0;
		boardCount = nbDao.selectCount(bp);
		 
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
			System.out.println("section : " + section);	// 페이징 구역
			System.out.println("begin : " + begin);		// 페이징에 표시할 시작 페이지
			System.out.println("end : " + end);			// 페이징에 표시할 마지막 페이지
		System.out.println("boardCount : " + boardCount);	// 총 게시글 개수
		System.out.println("pageCount : " + pageCount);		// 총 페이지 개수
		System.out.println("prev : " + (section != 0));		// 이전을 표시할 조건
		System.out.println("next : " + (boardCount > perPage * end));	// 다음을 표시할 조건
		System.out.println("==========================");
				
		// 뷰에 전달
		mav.addObject("list", nbDao.selectAll(bp));
	
		mav.addObject("begin", begin);
		mav.addObject("end", end);
		mav.addObject("page", page);
//		mav.addObject("bp", bp);
		mav.addObject("prev", section != 0);
		mav.addObject("next", boardCount > perPage * end);
		mav.addObject("session", uvo);
		
		return mav;
	}
	

	public ModelAndView noticeBoardList1(int page, HttpServletRequest req) {
		ModelAndView mav = new ModelAndView("noticeBoard");
		
		HttpSession hSession = req.getSession();
		UserLoginVO uvo = writeIdDecrypt(hSession);
		
		// 검색 파라미터 처리 
		Pageing bp = new Pageing();
		
		// 총 페이지 개수
		int boardCount = 0;
		boardCount = nbDao.selectGuideCount(bp);
		 
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
			System.out.println("section : " + section);	// 페이징 구역
			System.out.println("begin : " + begin);		// 페이징에 표시할 시작 페이지
			System.out.println("end : " + end);			// 페이징에 표시할 마지막 페이지
		System.out.println("boardCount : " + boardCount);	// 총 게시글 개수
		System.out.println("pageCount : " + pageCount);		// 총 페이지 개수
		System.out.println("prev : " + (section != 0));		// 이전을 표시할 조건
		System.out.println("next : " + (boardCount > perPage * end));	// 다음을 표시할 조건
		System.out.println("==========================");
				
		// 뷰에 전달
		mav.addObject("list", nbDao.selectGuidelist(bp));
	
		mav.addObject("begin", begin);
		mav.addObject("end", end);
		mav.addObject("page", page);
//		mav.addObject("bp", bp);
		mav.addObject("prev", section != 0);
		mav.addObject("next", boardCount > perPage * end);
		mav.addObject("session", uvo);
		
		return mav;
	}
	
	public ModelAndView noticeBoardList2(int page, HttpServletRequest req) {
		ModelAndView mav = new ModelAndView("noticeBoard");
		
		HttpSession hSession = req.getSession();
		UserLoginVO uvo = writeIdDecrypt(hSession);
		
		// 검색 파라미터 처리 
		Pageing bp = new Pageing();
		
		// 총 페이지 개수
		int boardCount = 0;
		boardCount = nbDao.select24hourCount(bp);
		 
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
			System.out.println("section : " + section);	// 페이징 구역
			System.out.println("begin : " + begin);		// 페이징에 표시할 시작 페이지
			System.out.println("end : " + end);			// 페이징에 표시할 마지막 페이지
		System.out.println("boardCount : " + boardCount);	// 총 게시글 개수
		System.out.println("pageCount : " + pageCount);		// 총 페이지 개수
		System.out.println("prev : " + (section != 0));		// 이전을 표시할 조건
		System.out.println("next : " + (boardCount > perPage * end));	// 다음을 표시할 조건
		System.out.println("==========================");
				
		// 뷰에 전달
		mav.addObject("list", nbDao.select24hourlist(bp));
	
		mav.addObject("begin", begin);
		mav.addObject("end", end);
		mav.addObject("page", page);
//		mav.addObject("bp", bp);
		mav.addObject("prev", section != 0);
		mav.addObject("next", boardCount > perPage * end);
		mav.addObject("session", uvo);
		
		return mav;
	}
	
	public ModelAndView noticeBoardList3(int page, HttpServletRequest req) {
		ModelAndView mav = new ModelAndView("noticeBoard");
		
		HttpSession hSession = req.getSession();
		UserLoginVO uvo = writeIdDecrypt(hSession);
		
		// 검색 파라미터 처리 
		Pageing bp = new Pageing();
		
		// 총 페이지 개수
		int boardCount = 0;
		boardCount = nbDao.selectEventCount(bp);
		 
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
			System.out.println("section : " + section);	// 페이징 구역
			System.out.println("begin : " + begin);		// 페이징에 표시할 시작 페이지
			System.out.println("end : " + end);			// 페이징에 표시할 마지막 페이지
		System.out.println("boardCount : " + boardCount);	// 총 게시글 개수
		System.out.println("pageCount : " + pageCount);		// 총 페이지 개수
		System.out.println("prev : " + (section != 0));		// 이전을 표시할 조건
		System.out.println("next : " + (boardCount > perPage * end));	// 다음을 표시할 조건
		System.out.println("==========================");
				
		// 뷰에 전달
		mav.addObject("list", nbDao.selectEventlist(bp));
	
		mav.addObject("begin", begin);
		mav.addObject("end", end);
		mav.addObject("page", page);
//		mav.addObject("bp", bp);
		mav.addObject("prev", section != 0);
		mav.addObject("next", boardCount > perPage * end);
		mav.addObject("session", uvo);
		
		return mav;
	}

	public int selectCount(Pageing pb) { return nbDao.selectCount(pb); }
	public int selectGuideCount(Pageing pb) { return nbDao.selectGuideCount(pb); }
	public int select24hourCount(Pageing pb) { return nbDao.select24hourCount(pb); }
	public int selectEventCount(Pageing pb) { return nbDao.selectEventCount(pb); }
	
	public UserLoginVO writeIdDecrypt(HttpSession session) {
		UserLoginVO uvo = (UserLoginVO)session.getAttribute("userSession");
		return uvo;
	}
	
	
	// 쓰기
	public void noticeInsert(NoticeBoardVO vo) {
//		System.out.println("content: " + vo.getNoticecontent());
//		System.out.println("title: " + vo.getNoticetitle());
//		System.out.println("id: " + vo.getNoticeid());
//		System.out.println("type: " + vo.getNoticetype());
//		System.out.println("view: " + vo.getNoticeview());
		
		nbDao.create(vo);
	}
	
	// 읽기
	public NoticeBoardVO noticeRead(int sid) {
		nbDao.viewUp(sid);
		return nbDao.read(sid);
	}
	
	// 수정
	public void noticeModify(int sid, NoticeBoardVO vo) {
//		System.out.println("sid : " + sid);
//		System.out.println("title : " + vo.getNoticetitle());
//		System.out.println("content : " + vo.getNoticecontent());
//		System.out.println("type : " + vo.getNoticetype());
		
		
		HashMap<String, Object>data = new HashMap<String, Object>();
		data.put("noticesid", (Integer)sid);
		data.put("noticetitle", vo.getNoticetitle());
		data.put("noticecontent", vo.getNoticecontent());
		data.put("noticetype", (Integer)vo.getNoticetype());
		
		nbDao.modify(data);
	}
	
	
	// 삭제
	public void noticeDelete(int sid) {
		nbDao.delete(sid);
	}
}
