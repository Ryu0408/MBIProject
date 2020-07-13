package com.mbi.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class GuideController {
	
	@RequestMapping(value = "/guideBorder/")
	public String guideBoard() {
		return "guideBorder";
	}
}
