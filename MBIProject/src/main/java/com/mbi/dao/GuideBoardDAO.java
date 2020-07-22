package com.mbi.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.mbi.vo.GuideBoardVO;

public interface GuideBoardDAO {
	
	List<GuideBoardVO> selectAll();
	
	void create(@Param("gvo") GuideBoardVO gvo);

	GuideBoardVO selectOne(@Param("gvo")int boardsid);
	void updateView(@Param("vvo")int boardsid);

	void updateBoard(@Param("gvo") GuideBoardVO gvo);

	void deleteBoard(int boardsid);
	
}
