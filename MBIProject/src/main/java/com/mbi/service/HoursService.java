package com.mbi.service;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.mbi.dao.HoursDAO;
import com.mbi.vo.HoursVO;

@Service
public class HoursService {

	@Autowired HoursDAO hdao;
	
	private final int perPage = 12;
	
	public ModelAndView getList() {
		ModelAndView mav = new ModelAndView("hours24");
		mav.addObject("list",hdao.selectAll());
//		Pageing bp = new Pageing();
		
//		// 총 페이지 개수
//		int cardCount = hdao.selectCount(bp);
//		int pageCount = cardCount / perPage;
//		pageCount += cardCount % perPage == 0 ? 0 : 1;
//		
//		// 작은 페이징
//		int first = (page - 1) * perPage + 1;
//		int last = first + perPage - 1;
//		bp.setStart(first);
//		bp.setEnd(last);
//		
//		// 큰 페이징
//		int section = (page - 1) / 5;
//		int begin = 5 * section + 1;
//		int end = begin + 4 > pageCount ? pageCount : begin + 4;
//		
//		// 뷰에 전달
//		mav.addObject("list", hdao.selectAll(bp));
//		mav.addObject("begin", begin);
//		mav.addObject("end", end);
//		mav.addObject("page", page);
//		mav.addObject("bp", bp);
//		mav.addObject("prev", section != 0);
//		mav.addObject("next", cardCount > perPage * end);
		
		return mav;
	}

	public List<HoursVO> getPageList(String type, String page) {
		int first = (Integer.parseInt(page) - 1) * perPage + 1;
		int last = first + perPage - 1;
		return hdao.getPageList(type, first, last);
	}

}
