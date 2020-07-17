package com.mbi.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mbi.dao.NoticeBoardDAO;
import com.mbi.vo.NoticeBoardVO;

@Service
public class NoticeService {
	@Autowired
	NoticeBoardDAO nbDao;
	
	
	public List<NoticeBoardVO> noticeListAll(){
		return nbDao.select();
	}
	
	public void noticeInsert(NoticeBoardVO vo) {
		System.out.println("content: " + vo.getNoticecontent());
		System.out.println("title: " + vo.getNoticetitle());
		System.out.println("id: " + vo.getNoticeid());
		System.out.println("type: " + vo.getNoticetype());
		System.out.println("view: " + vo.getNoticeview());
		
		nbDao.create(vo);
	}
}
