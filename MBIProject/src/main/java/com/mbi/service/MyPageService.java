package com.mbi.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mbi.dao.MyPageDAO;
import com.mbi.vo.MypageVO;

@Service
public class MyPageService {

	@Autowired MyPageDAO mpd;
	
	public List<MypageVO> MypageSelectAll(String username){
		return mpd.MypageSelectAll(username);
	}
	
	
}
