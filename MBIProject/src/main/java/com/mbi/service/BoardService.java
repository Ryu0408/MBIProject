package com.mbi.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mbi.dao.GuideBoardDAO;
import com.mbi.vo.GuideBoardVO;

@Service
public class BoardService{

	@Autowired GuideBoardDAO gdao;
	
	public void create(GuideBoardVO gvo) {
		gdao.create(gvo);
	}

}
