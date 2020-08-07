package com.mbi.controller;

import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.mbi.service.NoticeService;
import com.mbi.vo.NoticeBoardVO;
import com.mbi.vo.UserLoginVO;

@Controller
//@RequestMapping("/noticeBoard/")
public class NoticeController {
	@Autowired
	private NoticeService ns;
	
	// 리스트
	@RequestMapping(value= "/noticeBoard/")
	public ModelAndView noticeList(HttpServletRequest request) {
		return board(1, request);
	}
	
	@RequestMapping(value="/noticeBoard/{page}/")
	public ModelAndView board(@PathVariable("page")int page, HttpServletRequest request) {
		return ns.noticeBoardList(page, request);
	}
	
	@RequestMapping(value="/noticeBoard/guide/")
	public ModelAndView noticeGuide(HttpServletRequest request) {
		return guideBoard(1, request);
	}
	
	@RequestMapping(value= "/noticeBoard/guide/{page2}")
	public ModelAndView guideBoard(@PathVariable("page2")int page, HttpServletRequest request) {
		return ns.noticeBoardList1(page, request);
	}
	
	@RequestMapping(value= "/noticeBoard/24hour/")
	public ModelAndView notice24hour(HttpServletRequest request){
		return infoBoard(1, request);
	}
	
	@RequestMapping(value= "/noticeBoard/24hour/{page3}")
	public ModelAndView infoBoard(@PathVariable("page3")int page, HttpServletRequest request) {
		return ns.noticeBoardList2(page, request);
	}
	
	
	@RequestMapping(value= "/noticeBoard/event/")
	public ModelAndView noticeEvent(HttpServletRequest request) {
		return eventBoard(1, request);
	}
	
	@RequestMapping(value= "/noticeBoard/event/{page4}")
	public ModelAndView eventBoard(@PathVariable("page4")int page, HttpServletRequest request) {
		return ns.noticeBoardList3(page, request);
	}
	
	
	/*
	// 글쓰기 세션의 수정
	// typeData,
	@RequestMapping(value="/noticeBoard/{typeData}/", method=RequestMethod.GET)
	public ModelAndView noticeTypelist(@PathVariable("page") int page, HttpServletRequest request, @PathVariable("typeData") String typeData) {
		return guide(1, request, typeData);
	}
	*/
	
	// 쓰기
	@RequestMapping(value="/noticeBoard/noticeWrite/", method=RequestMethod.GET)
	public String noticeWrite(Model model,  HttpServletRequest request) {
		try {
			HttpSession hSession = request.getSession();
			UserLoginVO uvo = (UserLoginVO)hSession.getAttribute("userSession");			
			model.addAttribute("user", uvo);
		
		}catch (NullPointerException e) {
			e.printStackTrace();
			UserLoginVO uvo =  null;
			model.addAttribute("user", uvo);
		}
		return "noticeWrite";
	}
	
	@RequestMapping(value="/noticeBoard/noticeWrite/", method=RequestMethod.POST)
	public String noticePostWrite(NoticeBoardVO vo) {
		ns.noticeInsert(vo);
		//"redirect:/noticeBoard/";
		return "redirect:/noticeBoard/";
	}
	
	// 읽기
	@RequestMapping(value="/noticeBoard/noticeRead/{sid}/", method=RequestMethod.GET)
	public String noticeRead(@PathVariable("sid")int sid, Model model, HttpServletRequest request) {
		System.out.println("sid: " + sid);
		
		UserLoginVO uvo = null;
		if(request.getSession() != null){ uvo = (UserLoginVO)request.getSession().getAttribute("userSession"); }
		else { uvo = null; }
			
		model.addAttribute("nData", ns.noticeRead(sid));
		model.addAttribute("user", uvo);
		return "noticeRead";
		//return null;
	}
	
	// 수정
	@RequestMapping(value="/noticeBoard/noticeModify/{sid}/", method=RequestMethod.GET)
	public String noticeUpdate(@PathVariable("sid")int sid, Model model, HttpServletRequest request) {
		
		UserLoginVO uvo = null;
		if(request.getSession() != null){ uvo = (UserLoginVO)request.getSession().getAttribute("userSession"); }
		else { uvo = null; }
		
		// 데이터를 불러오기 (sid)
		model.addAttribute("uData", ns.noticeRead(sid));
		model.addAttribute("user", uvo);
		
		return "noticeModify";
	}
	
	@RequestMapping(value="/noticeBoard/noticeModify/{sid}/", method=RequestMethod.POST)
	public String noticeModify(@PathVariable("sid")int sid ,NoticeBoardVO vo, Model model) {
		System.out.println("수정할 SID : " + sid);
		
		ns.noticeModify(sid, vo);
		return "redirect:/noticeBoard/";
	}
	
	@RequestMapping(value="/noticeBoard/noticeDelete/{sid}/", method=RequestMethod.GET)
	public String noticeDelete(@PathVariable("sid")int sid, Model model, HttpServletRequest request) {
		System.out.println("삭제할 ID: " + sid);
		ns.noticeDelete(sid);
		return "redirect:/noticeBoard/";
	}
	
}
