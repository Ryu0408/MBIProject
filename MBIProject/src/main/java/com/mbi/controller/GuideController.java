package com.mbi.controller;


import java.net.http.HttpRequest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.mbi.dao.GuideBoardDAO;
import com.mbi.service.BoardService;
import com.mbi.vo.GuideBoardVO;
import com.mbi.vo.UserLoginVO;

@Controller
public class GuideController {

	@Autowired BoardService boardservice;
	@Autowired GuideBoardDAO gdao;
	
	@RequestMapping(value = "/guideBoard/")
	public ModelAndView guideBoard(HttpServletRequest req) throws NullPointerException {
//		HttpSession session = req.getSession();
//		UserLoginVO vo = (UserLoginVO)session.getAttribute("userSession");
//		System.out.println(vo.getUserid());
//		System.out.println(vo.getUsername());
		 
//		String userid = (String)session.getAttribute("userid");
//		
//		System.out.println(userid);
		
		return boardservice.guideBoard();
	}
	//글쓰기GET
	@RequestMapping(value = "/guideBoard/writeBoard/", method = RequestMethod.GET)
	public String writeBoard() {
		return "writeBoard";
	}
	//글쓰기POST
	@RequestMapping(value = "/guideBoard/writeBoard/", method = RequestMethod.POST)
	public String writeBoardPost(GuideBoardVO gvo) {
		
		boardservice.create(gvo);
		return "writeBoard";
	}
	//글읽기 GET
	@RequestMapping(value = "/guideBoard/readBoard/{sid}/", method = RequestMethod.GET)
	public ModelAndView readBoard(@PathVariable int sid,HttpServletRequest req) throws NullPointerException{
		//로그인 유무확인
		try{
			//로그인 되어있으면
			HttpSession session = req.getSession();
			UserLoginVO vo = (UserLoginVO)session.getAttribute("userSession");	
			return boardservice.readBoard(sid, session);
		}catch(NullPointerException e){
			//로그인 안되있으면
			e.printStackTrace();
			return boardservice.readBoard(sid, null);
		}
	}
	//글읽기POST
	@RequestMapping(value = "/guideBoard/readBoard/{sid}/", method = RequestMethod.POST)
	public String readBoardPost() {
		return "readBoard";
	}

	//글수정 GET
	@RequestMapping(value = "/guideBoard/updateBoard/{sid}/", method = RequestMethod.GET)
	public ModelAndView updateBoard(@PathVariable int sid) {
		return boardservice.updateBoard(sid);
		
	}
	//글수정 POST
	@RequestMapping(value = "/guideBoard/updateBoard/{sid}/", method = RequestMethod.POST)
	public String updateBoardPost() {
		return "updateBoard";
	}
}
