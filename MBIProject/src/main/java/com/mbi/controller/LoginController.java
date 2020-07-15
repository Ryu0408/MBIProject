package com.mbi.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class LoginController {

	@RequestMapping(value="/loginForm/")
	public String loginForm() {
		return "loginForm";
	}
	
	@RequestMapping(value="/loginForm/joinUse/", method=RequestMethod.GET)
	public String joinUse() {
		return "joinUse";
	}
	
	@RequestMapping(value="/loginForm/joinUse/loginJoin/", method=RequestMethod.POST)
	public String loginJoin() {
		return "loginJoin";
	}
	
//	@RequestMapping(value="/loginForm/joinUse/loginJoin/loginForm/")
//	public String joinLogin() {
//		return "redirect:/loginForm";
//	}
}
