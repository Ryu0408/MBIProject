package com.mbi.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mbi.dao.MainDAO;
import com.mbi.vo.GuideBoardVO;
import com.mbi.vo.NoticeBoardVO;

@Service
public class MainService {
	
	@Autowired MainDAO maindao;
	
	public List<NoticeBoardVO> selectNoticeBoard(){
		return maindao.selectNoticeBoard();
	}
	
	public List<GuideBoardVO> selectGuideBoard(){
		return maindao.selectGuideBoard();
	}

}
