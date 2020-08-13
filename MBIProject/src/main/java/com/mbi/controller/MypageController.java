package com.mbi.controller;

import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.security.NoSuchAlgorithmException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.mbi.service.MyPageService;
import com.mbi.vo.MypageVO;
import com.mbi.vo.UserLoginVO;


@Controller
public class MypageController {
	
	@Autowired MyPageService mps;
	
	@RequestMapping(value = "/mypage/")
	public String mypage() {
		return "mypage";
	}
	
	@RequestMapping(value = "mypage/{username}/",
	         produces="application/text;charset=utf8")
	@ResponseBody
	public String list(@PathVariable("username") String username, String confirmpw) 
			throws NoSuchAlgorithmException, UnsupportedEncodingException, GeneralSecurityException {
		System.out.println("username : " + username + ", confirmpw : " + confirmpw);
//		List<String> list = mps.MypageSelectAll(username);
		List<MypageVO> mypageVO = mps.MypageSelectAll(username);
		System.out.println("실행이 된다?" + mypageVO.get(0).getUsername());
		String jsonString = null;
		ObjectMapper jsonMapper = new ObjectMapper();
		try {
			if(username != null && mypageVO.get(0).getUsername().equals(username) && confirmpw == null) {
				jsonString = jsonMapper.writeValueAsString(mps.MypageSelectAll(username));
			}
			else if(username != null && confirmpw != null && !(mypageVO.get(0).getUserpw().equals(confirmpw))) {
				System.out.println("업데이트 넘어왔음");
				jsonString = jsonMapper.writeValueAsString(mps.updatePw(username, confirmpw));
			}
			System.out.println("요것은" + jsonString);
		} catch (JsonProcessingException e) {
			System.out.println("JSON 파싱 에러 !!");
		}
		return jsonString;
	}
	
	// 정보 수정
//	@RequestMapping(value = "mypage/{confirmpw}/", method=RequestMethod.POST,
//	         produces="application/text;charset=utf8")
//	@ResponseBody
//	public String name(@RequestParam("confirmpw") String confirmpw, MypageVO vo) 
//			throws NoSuchAlgorithmException, UnsupportedEncodingException, GeneralSecurityException {
//		System.out.println("confirmpw : " + confirmpw);
//		String jsonString = null;
//		ObjectMapper jsonMapper = new ObjectMapper();
//		
//		try {
//			jsonString = jsonMapper.writeValueAsString(mps.updateName(confirmpw, vo));
//			System.out.println("요것은" + jsonString);
//		} catch (JsonProcessingException e) {
//			System.out.println("JSON 파싱 에러 !!");
//		}
//		return jsonString;
//	}
}



