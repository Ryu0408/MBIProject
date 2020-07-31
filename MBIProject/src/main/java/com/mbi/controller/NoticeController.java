package com.mbi.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mbi.service.NoticeService;
import com.mbi.vo.NoticeBoardVO;
import com.mbi.vo.UserLoginVO;

@Controller
//@RequestMapping("/noticeBoard/")
public class NoticeController {
	@Autowired
	private NoticeService ns;
	
	// 리스트
	@RequestMapping(value= "/noticeBoard/")
	public String noticeList(Model model, HttpServletRequest request) {
		UserLoginVO uvo = null;
		if(request.getSession() != null){ uvo = (UserLoginVO)request.getSession().getAttribute("userSession"); }
		else { uvo = null; }
		
		model.addAttribute("list", ns.noticeListAll());
		model.addAttribute( "user", uvo);
		return "noticeBoard";
	}
	
	@RequestMapping(value="/noticeBoard/{typeData}/", method=RequestMethod.GET, produces="application/text;charset=utf-8")
	@ResponseBody
	public String noticeTypelist(@PathVariable("typeData")int typeData) {
		System.out.println("data: " + typeData);
		System.out.println("호출한다.!!!");
		
		//typeData = typeData - 1;
//		ArrayList<HashMap<String, Object>>vo
		//List<NoticeBoardVO>vo
		List<NoticeBoardVO>vo = ns.noticeTypelist(typeData);
		System.out.println("size: " + vo.size());
		String jsonString = null;
		ObjectMapper jsonMapper = new ObjectMapper();
		
		try {
			jsonString = jsonMapper.writeValueAsString(vo);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			System.out.println("JSON 파싱 실패");
		}
		System.out.println("res: " + vo != null ? jsonString : null);
		return vo != null ? jsonString : null;
	}
	
	// 쓰기
	@RequestMapping(value="/noticeBoard/noticeWrite/", method=RequestMethod.GET)
	public String noticeWrite(Model model,  HttpServletRequest request) {
		try {
			HttpSession hSession = request.getSession();
			UserLoginVO uvo = (UserLoginVO)hSession.getAttribute("userSession");			
			model.addAttribute("user", uvo);
		
		}catch (NullPointerException e) {
			e.printStackTrace();
			UserLoginVO uvo =  null;
			model.addAttribute("user", uvo);
		}
		return "noticeWrite";
	}
	
	@RequestMapping(value="/noticeBoard/noticeWrite/", method=RequestMethod.POST)
	public String noticePostWrite(NoticeBoardVO vo) {
		ns.noticeInsert(vo);
		//"redirect:/noticeBoard/";
		return "redirect:/noticeBoard/";
	}
	
	// 읽기
	@RequestMapping(value="/noticeBoard/noticeRead/{sid}/", method=RequestMethod.GET)
	public String noticeRead(@PathVariable("sid")int sid, Model model, HttpServletRequest request) {
		System.out.println("sid: " + sid);
		
		UserLoginVO uvo = null;
		if(request.getSession() != null){ uvo = (UserLoginVO)request.getSession().getAttribute("userSession"); }
		else { uvo = null; }
			
		model.addAttribute("nData", ns.noticeRead(sid));
		model.addAttribute("user", uvo);
		return "noticeRead";
		//return null;
	}
	
	// 수정
	@RequestMapping(value="/noticeBoard/noticeModify/{sid}/", method=RequestMethod.GET)
	public String noticeUpdate(@PathVariable("sid")int sid, Model model, HttpServletRequest request) {
		
		UserLoginVO uvo = null;
		if(request.getSession() != null){ uvo = (UserLoginVO)request.getSession().getAttribute("userSession"); }
		else { uvo = null; }
		
		// 데이터를 불러오기 (sid)
		model.addAttribute("uData", ns.noticeRead(sid));
		model.addAttribute("user", uvo);
		
		return "noticeModify";
	}
	
	@RequestMapping(value="/noticeBoard/noticeModify/{sid}/", method=RequestMethod.POST)
	public String noticeModify(@PathVariable("sid")int sid ,NoticeBoardVO vo, Model model) {
		System.out.println("수정할 SID : " + sid);
		
		ns.noticeModify(sid, vo);
		return "redirect:/noticeBoard/";
	}
	
	@RequestMapping(value="/noticeBoard/noticeDelete/{sid}/", method=RequestMethod.GET)
	public String noticeDelete(@PathVariable("sid")int sid, Model model, HttpServletRequest request) {
		System.out.println("삭제할 ID: " + sid);
		ns.noticeDelete(sid);
		return "redirect:/noticeBoard/";
	}
	
}
