package com.mbi.service;


import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mbi.dao.NoticeBoardDAO;
import com.mbi.vo.NoticeBoardVO;

@Service
public class NoticeService {
	@Autowired
	NoticeBoardDAO nbDao;
	
	// 리스트
	public List<NoticeBoardVO> noticeListAll(){
		return nbDao.select();
	}
	
	// 카테고리 - 분류 (리스트)
	public List<NoticeBoardVO> noticeTypelist(int type){		
		return nbDao.selectType(type);
	}
	
	// 쓰기
	public void noticeInsert(NoticeBoardVO vo) {
//		System.out.println("content: " + vo.getNoticecontent());
//		System.out.println("title: " + vo.getNoticetitle());
//		System.out.println("id: " + vo.getNoticeid());
//		System.out.println("type: " + vo.getNoticetype());
//		System.out.println("view: " + vo.getNoticeview());
		
		nbDao.create(vo);
	}
	
	// 읽기
	public NoticeBoardVO noticeRead(int sid) {
		nbDao.viewUp(sid);
		return nbDao.read(sid);
	}
	
	// 수정
	public void noticeModify(int sid, NoticeBoardVO vo) {
//		System.out.println("sid : " + sid);
//		System.out.println("title : " + vo.getNoticetitle());
//		System.out.println("content : " + vo.getNoticecontent());
//		System.out.println("type : " + vo.getNoticetype());
		
		
		HashMap<String, Object>data = new HashMap<String, Object>();
		data.put("noticesid", (Integer)sid);
		data.put("noticetitle", vo.getNoticetitle());
		data.put("noticecontent", vo.getNoticecontent());
		data.put("noticetype", (Integer)vo.getNoticetype());
		
		nbDao.modify(data);
	}
	
	
	// 삭제
	public void noticeDelete(int sid) {
		nbDao.delete(sid);
	}
}
