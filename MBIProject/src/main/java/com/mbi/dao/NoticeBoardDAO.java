package com.mbi.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.mbi.vo.NoticeBoardVO;

public interface NoticeBoardDAO {
	List<NoticeBoardVO> select();
	
	void create(@Param("vo") NoticeBoardVO vo);
}
