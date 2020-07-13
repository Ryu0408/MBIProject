package com.mbi.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Hours24 {
	@RequestMapping(value = "/hours24/")
	public String hours24() {
		return "hours24";
	}
	


}






