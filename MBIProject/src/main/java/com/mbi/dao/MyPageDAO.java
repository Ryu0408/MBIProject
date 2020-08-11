package com.mbi.dao;

import java.util.List;

import com.mbi.vo.MypageVO;

public interface MyPageDAO {
	
	List<MypageVO> MypageSelectAll(String username);
	
}
