package com.mbi.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.mbi.dao.GuideBoardDAO;
import com.mbi.vo.GuideBoardVO;


@Service
public class BoardService{

	@Autowired GuideBoardDAO gdao;
	
	public void create(GuideBoardVO gvo) {
		System.out.println("create : " + gvo);
		gdao.create(gvo);
	}
	
	public ModelAndView guideBoard() {
		ModelAndView mav = new ModelAndView("guideBoard");
		
		mav.addObject("vo", gdao.selectAll());
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
