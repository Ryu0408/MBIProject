package com.mbi.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class GuideController {
	
	@RequestMapping(value = "/guideBoard/")
	public String guideBoard() {
		return "guideBoard";
	}
	@RequestMapping(value = "/guideBoard/writeBoard/")
	public String writeBoard() {
		return "writeBoard";
	}
}
