package com.mbi.service;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.mbi.dao.LoginDAO;
import com.mbi.vo.UserLoginVO;

@Service
public class LoginService {

	@Autowired private LoginDAO lDAO;

	public ModelAndView login(UserLoginVO userVO, HttpSession session, String check, 
			HttpServletResponse response) {
		
		ModelAndView mav = new ModelAndView();
		
//		System.out.println("로그인 객체 확인" + userVO.getUserid());
		String viewName = "";
		String userid = userVO.getUserid();
		String userpw = userVO.getUserpw();
		
		UserLoginVO vo = lDAO.login(userid);
//		System.out.println("로그인 객체 확인 : " + vo);
		
		// 로그인 결과
//		int result = 0;
		
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
//					System.out.println("3단계 : 쿠키 저장 안함!");
					c.setMaxAge(0);
					response.addCookie(c);	// 체크가 되어있지 않은경우 쿠키를 없애고 서버로 반환
				}
				
				// 세션에 객체 저장
				session.setAttribute("userSession", vo);
				
//				result = 1;	// 1은 Ajax 로그인 성공 값
				viewName = "redirect:/";
				mav.setViewName(viewName);
				mav.addObject("name", session);
				System.out.println("vo는 넘어갑니다 : " + vo.getUsername());
			}
		}
		
		return mav;
	}

	public void userJoin(UserLoginVO userVO) {
//		System.out.println("회원가입 넘어오나?");
		lDAO.join(userVO);
	}

	
	
	
}
