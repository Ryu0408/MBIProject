package com.mbi.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mbi.service.BoardService;
import com.mbi.vo.GuideBoardVO;

@Controller
public class GuideController {

	@Autowired BoardService boardservice;
	
	@RequestMapping(value = "/guideBoard/")
	public String guideBoard() {
		return "guideBoard";
	}
	@RequestMapping(value = "/guideBoard/writeBoard/", method = RequestMethod.GET)
	public String writeBoard() {
//		List<GuideBoardVO> vo = dao.select();
//		System.out.println(vo.get(0).getBoardid());
//		System.out.println(vo.get(0).getBoardtitle());
		return "writeBoard";
	}
	//글쓰기
	@RequestMapping(value = "/guideBoard/writeBoard/", method = RequestMethod.POST)
	public String writeBoardPost(GuideBoardVO gvo) {
		
		boardservice.create(gvo);
		return "writeBoard";
	}

}
