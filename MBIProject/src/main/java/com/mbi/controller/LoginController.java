package com.mbi.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mbi.service.LoginService;
import com.mbi.vo.UserLoginVO;

@Controller
public class LoginController {
	
	@Autowired private LoginService ls;
	
	// 로그인 폼
	@RequestMapping(value="/loginForm/", method=RequestMethod.GET)
	public ModelAndView loginForm() {
		ModelAndView mav = new ModelAndView();
		System.out.println("로그인 폼 입니다");
		mav.setViewName("loginForm");
		return mav;
	}
	
	// 회원 가입으로 이동
	@RequestMapping(value="/loginForm/loginJoin/", method=RequestMethod.GET)
	public String joinUse() {
		return "loginJoin";
	}
	
	// 회원 가입 폼 이동(x, 잠깐 보류)
//	@RequestMapping(value="/loginForm/joinUse/", method=RequestMethod.POST)
//	public ModelAndView loginJoin() {
//		ModelAndView mav = new ModelAndView();
//		System.out.println("회원가입 예제");
//		mav.setViewName("loginJoin");
//		return mav;
//	}
	
	// 회원 가입 후 로그인 페이지 이동
	@RequestMapping(value="loginForm/loginJoin/", method=RequestMethod.POST)
	public String join(UserLoginVO userVO) {
		System.out.println("회원가입 넘어옴");
		ls.userJoin(userVO);
		return "redirect:/loginForm/";
	}
	
	// 로그인
	@RequestMapping(value="loginForm/", method=RequestMethod.POST)
	@ResponseBody
	public ModelAndView loginPass(UserLoginVO userVO, HttpSession session, 
			HttpServletRequest request, HttpServletResponse response) {
		
		String check = request.getParameter("remember_userid"); 	// 아이디 저장 값 들고오기

		System.out.println("check : " + check);
//		String userpw = userVO.getUserpw();
//		userVO.setUserpw(userpw);
		
		return ls.login(userVO, session, check, response);
	}
	
	// 로그아웃
	@RequestMapping(value="logout/", method=RequestMethod.GET)
	public String logOut(HttpSession session) {
		System.out.println("로그아웃");
		session.removeAttribute("userSession");
		return "redirect:/";
	}
	
}
