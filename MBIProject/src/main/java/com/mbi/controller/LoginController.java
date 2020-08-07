package com.mbi.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.security.NoSuchAlgorithmException;
//import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.mbi.classes.AES256Util;
import com.mbi.service.LoginService;
import com.mbi.vo.UserLoginVO;

@Controller
public class LoginController {
	
	@Autowired private LoginService ls;
	@Autowired AES256Util aes;
	
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
	@ResponseBody
	public ModelAndView join(UserLoginVO userVO) throws UnsupportedEncodingException, GeneralSecurityException {
		System.out.println("회원가입 넘어옴");
		ModelAndView mav = new ModelAndView();
		mav.addObject(ls.userJoin(userVO));
		return mav;
	}
	
	// 로그인
	@RequestMapping(value="loginForm/", method=RequestMethod.POST)
	@ResponseBody
	public ModelAndView loginPass(UserLoginVO userVO, HttpSession session, 
			HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException, GeneralSecurityException {
		
		String check = request.getParameter("remember_userid"); 	// 아이디 저장 값 들고오기

		System.out.println("check : " + check);
//		String userpw = userVO.getUserpw();
//		userVO.setUserpw(userpw);
		
		return ls.login(userVO, session, check, response);
	}
	
	// 아이디 중복 확인
	@RequestMapping(value="loginForm/loginJoin/checkid/", produces="application/text;charset=utf8")
	@ResponseBody
	public String idcheck(HttpServletRequest request) {
		try {
			String userid = request.getParameter("userid");
			String method = request.getMethod().equalsIgnoreCase("GET")
				? "GET" : "POST";
			
			System.out.println(method + userid);
			boolean alreadyExist = ls.idcheck(userid);
			return alreadyExist ? "이미 사용중인 계정입니다" : "사용 가능한 ID입니다";
		} catch(Exception e) {
			return "확인 실패 : " + e.getClass().getSimpleName();
		}
	}
	
	// 비밀번호 찾기
	@RequestMapping(value="loginForm/passwordSearch/{email}/", method=RequestMethod.GET,
			produces="application/text;charset=utf8")
	@ResponseBody
	public String newPass(String useremail, Model model) throws NoSuchAlgorithmException, UnsupportedEncodingException, GeneralSecurityException  {
        String jsonString = null;
		List<String> list = new ArrayList<String>();
		boolean checkEmail = ls.idcheck(useremail);
		String useEmail = checkEmail ? "이메일이 발송되었습니다" : "해당 이메일이 없습니다. 다시 입력해주세요";
		list.add(useEmail);
		list.add(ls.getPassword(useremail));
        ObjectMapper jsonMapper = new ObjectMapper();
        try {
            jsonString = jsonMapper.writeValueAsString(list);
         } catch (IOException e) {
            System.out.println("JSON 파싱 에러 !!");
         }
         return jsonString;
	}
	
	
	// 로그아웃
	@RequestMapping(value="logout/", method=RequestMethod.GET)
	public String logOut(HttpSession session) {
		System.out.println("로그아웃");
		session.removeAttribute("userSession");
		return "redirect:/";
	}
	
}
