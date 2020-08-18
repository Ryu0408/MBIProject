package com.mbi.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.mbi.vo.MypageVO;

public interface MyPageDAO {
	
	List<MypageVO> MypageSelectAll(String username);

	void updatePw(@Param("mvo") MypageVO mypageVO);

	void delUser(String username);
	
}
