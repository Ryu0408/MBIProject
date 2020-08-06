package com.mbi.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.mbi.dao.GuideBoardDAO;
import com.mbi.service.BoardService;
import com.mbi.vo.GuideBoardVO;
import com.mbi.vo.UserLoginVO;

@Controller
public class GuideController {

	@Autowired BoardService boardservice;
	@Autowired GuideBoardDAO gdao;
	//일반
	@RequestMapping(value = "/guideBoard/")
	public ModelAndView guideBoard(HttpServletRequest req) throws NullPointerException {
		return board(1,req);
	}
	//일반페이지
	@RequestMapping(value="/guideBoard/{page}/")
	public ModelAndView board(@PathVariable("page")int page, HttpServletRequest request) {
		return boardservice.guideBoardList(page, request);
	}
	//타입 가이드
	@RequestMapping(value = "/guideBoard/guide/")
	public ModelAndView guideBoardtype(HttpServletRequest req) throws NullPointerException {

		return board2(1,req);
	}
	//타입페이지 가이드
	@RequestMapping(value = "/guideBoard/guide/{page2}")
	public ModelAndView board2(@PathVariable("page2")int page, HttpServletRequest request) {
		return boardservice.guideBoardList2(page, request);
	}
	//타입 맛집
	@RequestMapping(value = "/guideBoard/delicious/")
	public ModelAndView guideBoardtype3(HttpServletRequest req) throws NullPointerException {

		return board3(1,req);
	}
	//타입페이지 맛집
	@RequestMapping(value = "/guideBoard/delicious/{page3}")
	public ModelAndView board3(@PathVariable("page3")int page, HttpServletRequest request) {
		return boardservice.guideBoardList3(page, request);
	}
	//타입 지역행사
	@RequestMapping(value = "/guideBoard/area/")
	public ModelAndView guideBoardtype4(HttpServletRequest req) throws NullPointerException {

		return board4(1,req);
	}
	//타입페이지 지역행사
	@RequestMapping(value = "/guideBoard/area/{page4}")
	public ModelAndView board4(@PathVariable("page4")int page, HttpServletRequest request) {
		return boardservice.guideBoardList4(page, request);
	}
	
	//글쓰기GET
	@RequestMapping(value = "/guideBoard/writeBoard/", method = RequestMethod.GET)
	public String writeBoard() {
		return "writeBoard";
	}
	//글쓰기POST
	@RequestMapping(value = "/guideBoard/writeBoard/", method = RequestMethod.POST)
	public String writeBoardPost(GuideBoardVO gvo) {
//		System.out.println("create" + gvo.getBoardcontent());
		boardservice.create(gvo);
		return "redirect:/guideBoard/";
	}
	//글읽기 GET
	@RequestMapping(value = "/guideBoard/readBoard/{sid}/", method = RequestMethod.GET)
	public ModelAndView readBoard(@PathVariable int sid,HttpServletRequest req) throws NullPointerException{
		try{
			//로그인 되어있으면
			HttpSession session = req.getSession();
			UserLoginVO vo = (UserLoginVO)session.getAttribute("userSession");
	
			return boardservice.readBoard(sid);
		}catch(NullPointerException e){
			//로그인 안되있으면
			e.printStackTrace();
			return boardservice.readBoard(sid);
		}
	}
	//글읽기POST
	@RequestMapping(value = "/guideBoard/readBoard/{sid}/", method = RequestMethod.POST)
	public String readBoardPost() {
		return "readBoard";
	}
	//추천
	@RequestMapping(value = "/guideBoard/readBoard/ajax/{sid}/", produces="application/text;charset=utf8", method = RequestMethod.POST)
	@ResponseBody
	public String ajaxsid(String sid) {
		int sid2 = Integer.parseInt(sid);
		System.out.println("ajax성공");
		return boardservice.updateGood(sid2);
	}

	//글수정 GET
	@RequestMapping(value = "/guideBoard/updateBoard/{sid}/", method = RequestMethod.GET)
	public ModelAndView updateBoard(@PathVariable int sid) {
		return boardservice.updateBoard(sid);
	}

	//글수정 POST
	@RequestMapping(value = "/guideBoard/updateBoard/{sid}/", method = RequestMethod.POST)
	public String updateBoardPost(@PathVariable int sid, GuideBoardVO gvo) {
		boardservice.updateBoardPost(gvo);
		return "redirect:/guideBoard/readBoard/{sid}/";
	}
	//글삭제
	@RequestMapping(value="/guideBoard/readBoard/delete/{sid}/")
	public String deleteBoard(@PathVariable int sid, HttpServletRequest request) {
		boardservice.deleteBoard(sid);
		return "redirect:/guideBoard/";
	}
	
}
