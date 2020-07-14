package com.mbi.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mbi.dao.testdao;
import com.mbi.vo.TestVO;


@Controller
public class MainController {
	
	@Autowired testdao dao;
	@RequestMapping(value = "/")
	public String home() {
//		List<TestVO> vo = dao.selectAllMembers();
//		System.out.println(vo.get(0).getUserid());
//		System.out.println(vo.get(0).getUsername());
		return "main";
	}
}
