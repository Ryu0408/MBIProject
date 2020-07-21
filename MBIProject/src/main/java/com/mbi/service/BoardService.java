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
		gdao.create(gvo);
	}
	
	public ModelAndView guideBoard() {
		ModelAndView mav = new ModelAndView("guideBoard");
		
		mav.addObject("vo", gdao.selectAll());
		return mav;
	}

	public ModelAndView readBoard(int boardsid, HttpSession session) {
		ModelAndView mav = new ModelAndView("readBoard");
		GuideBoardVO gvo = gdao.selectOne(boardsid);
		System.out.println(gvo.getBoardid());
		mav.addObject("gvo", gvo);
		return mav;
	}

	public ModelAndView updateBoard(int boardsid) {
		ModelAndView mav = new ModelAndView("updateBoard");
		GuideBoardVO gvo = gdao.selectOne(boardsid);
		System.out.println(gvo.getBoardid());
		mav.addObject("gvo", gvo);
		return mav;
	}
}
