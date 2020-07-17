package com.mbi.dao;

import com.mbi.vo.UserLoginVO;

public interface LoginDAO {
	
	UserLoginVO login(String userid);
}
