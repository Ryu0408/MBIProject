package com.mbi.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class NoticeController {
	// 리스트
	@RequestMapping(value="/noticeList/")
	public String noticeList() {
		return "noticeList";
	}
	
	// 쓰기
	@RequestMapping(value="/noticeWrite/")
	public String noticeWrite() {
		return "noticeWrite";
	}
	
	// 읽기
	@RequestMapping(value="/noticeRead/")
	public String noticeRead() {
		return "noticeRead";
	}
	
	
	// 수정
	
	
	// 삭제
}
