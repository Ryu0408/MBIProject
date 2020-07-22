package com.mbi.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mbi.service.HoursService;

@Controller
public class Hours24Controller {
	
	@Autowired HoursService hs;
	
	@RequestMapping(value = "/hours24/")
	public ModelAndView hourss24() {
		return hs.getList();
	}


}






