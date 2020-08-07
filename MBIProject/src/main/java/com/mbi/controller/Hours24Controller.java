package com.mbi.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mbi.service.HoursService;
import com.mbi.vo.HoursVO;

@Controller
public class Hours24Controller {
	
	@Autowired HoursService hs;
	
	@RequestMapping(value = "/hours24/")
	public ModelAndView hourss24() {
		return hs.getList();
	}

	@RequestMapping(value = "/hours24/{type}/{page}/",
			method=RequestMethod.GET,
	         produces="application/text;charset=utf8")
	@ResponseBody
	public String paging(@PathVariable("type") String type,
			@PathVariable("page") String page,
			Model model) {
        String jsonString = null;
        ObjectMapper jsonMapper = new ObjectMapper();
        try {
            jsonString = jsonMapper.writeValueAsString(hs.getPageList(type, page));
         } catch (IOException e) {
            System.out.println("JSON 파싱 에러 !!");
         }
		return jsonString;
		
	}
//	@RequestMapping(value = "/hours24/")
//	public ModelAndView guideBoard(HttpServletRequest req) throws NullPointerException {
//		return hourss24(1,req);
//	}
//	@RequestMapping(value = "/hours24/{page}/")
//	public ModelAndView hourss24(@PathVariable("page") int page, HttpServletRequest request) {
//		return hs.getList(page, request);
//	}

}






