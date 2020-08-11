package com.mbi.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.mbi.service.MyPageService;


@Controller
public class MypageController {
	
	@Autowired MyPageService mps;
	
	@RequestMapping(value = "/mypage/")
	public String mypage() {
		return "mypage";
	}
	
	@RequestMapping(value = "mypage/{username}/", method=RequestMethod.POST,
	         produces="application/text;charset=utf8")
	@ResponseBody
	public String list(@RequestParam("username") String username, Model model) {
		System.out.println("username : " + username);
//		List<String> list = mps.MypageSelectAll(username);
		String jsonString = null;
		ObjectMapper jsonMapper = new ObjectMapper();
		
		try {
			jsonString = jsonMapper.writeValueAsString(mps.MypageSelectAll(username));
			System.out.println("요것은" + jsonString);
		} catch (JsonProcessingException e) {
			System.out.println("JSON 파싱 에러 !!");
		}
		return jsonString;
	}
	
}



