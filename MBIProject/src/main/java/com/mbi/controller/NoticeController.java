package com.mbi.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mbi.service.NoticeService;
import com.mbi.vo.NoticeBoardVO;

@Controller
@RequestMapping("/noticeBoard/")
public class NoticeController {
	@Autowired
	private NoticeService ns;
	
	// 리스트
	@RequestMapping(value= "/")
	public String noticeList(Model model) {
		model.addAttribute("list", ns.noticeListAll());
		return "noticeBoard";
	}
	
	// 쓰기
	@RequestMapping(value="noticeWrite/", method=RequestMethod.GET)
	public String noticeWrite() {
		return "noticeWrite";
	}
	
	@RequestMapping(value="noticeWrite/", method=RequestMethod.POST)
	public String noticePostWrite(NoticeBoardVO vo) {
		ns.noticeInsert(vo);
		//"redirect:/noticeBoard/";
		return "redirect:/noticeBoard/";
	}
	
	// 읽기
	@RequestMapping(value="/noticeRead/")
	public String noticeRead() {
		return "noticeRead";
	}
	
}
