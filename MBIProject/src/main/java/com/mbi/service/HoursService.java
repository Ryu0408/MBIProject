package com.mbi.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.mbi.dao.HoursDAO;

@Service
public class HoursService {

	@Autowired HoursDAO hdao;
	
	public ModelAndView getList() {
		ModelAndView mav = new ModelAndView("hours24");
		mav.addObject("list", hdao.selectAll());
		return mav;
	}

}
