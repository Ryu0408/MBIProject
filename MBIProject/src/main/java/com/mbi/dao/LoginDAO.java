package com.mbi.dao;

import org.apache.ibatis.annotations.Param;

import com.mbi.vo.UserLoginVO;

public interface LoginDAO {
	
	UserLoginVO login(String userid);
	void join(@Param("vo")UserLoginVO userVO);

}
