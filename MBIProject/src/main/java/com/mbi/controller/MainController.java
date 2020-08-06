package com.mbi.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mbi.service.MainService;
import com.mbi.vo.GuideBoardVO;

@Controller
public class MainController {
	
	@Autowired MainService mainservice;
	
	@RequestMapping(value = "/")
	public String home(Model model) {
		model.addAttribute("noticeboard",mainservice.selectNoticeBoard());
		model.addAttribute("guideboard",mainservice.selectGuideBoard());
		List<GuideBoardVO> vo = mainservice.selectGuideBoard();
				
		return "main";
	}
}
