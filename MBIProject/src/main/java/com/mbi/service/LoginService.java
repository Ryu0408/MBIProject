package com.mbi.service;

import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
//import java.security.NoSuchAlgorithmException;
import java.security.NoSuchAlgorithmException;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.mbi.classes.AES256Util;
//import com.mbi.classes.SHA256Util;
import com.mbi.dao.LoginDAO;
import com.mbi.vo.UserLoginVO;

@Service
public class LoginService {

	@Autowired private LoginDAO lDAO;
	@Autowired AES256Util aes;

	public ModelAndView login(UserLoginVO userVO, HttpSession session, String check, 
			HttpServletResponse response) throws UnsupportedEncodingException, GeneralSecurityException {
		
		ModelAndView mav = new ModelAndView();
		
//		System.out.println("로그인 객체 확인" + userVO.getUserid());
		String viewName = "";

		String userid = userVO.getUserid();
//		System.out.println("userid(암호화 전) : " + userid);
//		userid = aes.encrypt(userid);		
//		userVO.setUserid(userid);		
//		System.out.println("userid(암호화 후) : " + userid);
//		System.out.println("userid(복호화 후) : " + aes.decrypt(userid));
		
		String userpw = userVO.getUserpw();
//		System.out.println("userpw(암호화 전) : " + userpw);
		userpw = aes.encrypt(userpw);
		userVO.setUserpw(userpw);
//		System.out.println("userpw(암호화 후) : " + userpw);
//		System.out.println("userpw(복호화 후) : " + aes.decrypt(userpw));
		
		
//		String salt = lDAO.getSaltById(userid);
//		userpw = SHA256Util.getEncrypt(userpw, salt);
//		System.out.println("암호화 성공 : " + userpw);
		
		UserLoginVO vo = lDAO.login(userid);
//		System.out.println("로그인 객체 확인 : " + vo);
		
		// 로그인 결과
//		int data = 0;
		
		// 회원 정보 x
		if(vo == null) {
			viewName = "redirect:/loginForm/";
			mav.setViewName(viewName);
		}
		
		// 정보가 존재 할 경우
		if(vo != null) {
//			System.out.println("1단계");
			if(vo.getUserid().equals(userid) && vo.getUserpw().equals(userpw)) {
			// 아이디와 비밀번호가 동일할 경우
//				System.out.println("2단계");
				// 쿠키 체크 확인
				Cookie c = new Cookie("check", userid);		// 쿠키를 생성하여 보관
				if(check != null) {	// 아이디 저장을 체크 하였을 경우					
					c.setMaxAge(365 * 24 * 60 * 60);	// 쿠키 시간 설정 값
					response.addCookie(c);
//					System.out.println("3단계 : 쿠키 저장 완료!" + check);
				}
				else {
//					System.out.println("비밀번호 : " + vo.getUserpw() + "가져온것 : " + userpw);
//					System.out.println("3단계 : 쿠키 저장 안함!");
					c.setMaxAge(0);
					response.addCookie(c);	// 체크가 되어있지 않은경우 쿠키를 없애고 서버로 반환
				}
				
				// 세션에 객체 저장
				session.setAttribute("userSession", vo);
				
//				data = 1;	// 1은 Ajax 로그인 성공 값
				viewName = "redirect:/";
				mav.setViewName(viewName);
				mav.addObject("name", session);
//				mav.addObject("data", data);
//				System.out.println("vo는 넘어갑니다 : " + vo.getUsername());
			}
			else {
				System.out.println("로그인 실패");
				viewName = "redirect:/loginForm/";
				mav.setViewName(viewName);
//				mav.addObject("data", data);
			}
		}
		return mav;
	}

	public void userJoin(UserLoginVO userVO) throws UnsupportedEncodingException, GeneralSecurityException {
//		System.out.println("회원가입 넘어오나?");
		
//		ModelAndView mav = new ModelAndView();
//		mav.setViewName("redirect:/loginForm/");
		
		String userpw = userVO.getUserpw();
		String userJuminB = userVO.getUserjuminB();
		
		userpw = aes.encrypt(userpw);
		userJuminB = aes.encrypt(userJuminB);
		
		System.out.println("userpw(암호화 후) : " + userpw);
		System.out.println("userJuminB(암호화 후) : " + userJuminB);
		
		System.out.println("userpw(복호화 후) : " + aes.decrypt(userpw));
		System.out.println("userJuminB(암호화 후) : " + aes.decrypt(userJuminB));
		
		userVO.setUserpw(userpw);
		userVO.setUserjuminB(userJuminB);

		lDAO.join(userVO);
	}

	public boolean idcheck(String userid) {
		UserLoginVO vo = null;
		vo = lDAO.selectUser(userid);
		return vo != null;
	}
	
	public String getPassword(String userid) throws NoSuchAlgorithmException, 
	UnsupportedEncodingException, GeneralSecurityException {
		String password = lDAO.getPassword(userid);
		System.out.println(password);
		password = aes.decrypt(password);
		System.out.println(password);
		return password;
	}

	

	

	
	
	
}
