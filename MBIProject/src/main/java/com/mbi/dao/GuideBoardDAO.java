package com.mbi.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.mbi.vo.GuideBoardVO;
import com.mbi.vo.Pageing;

public interface GuideBoardDAO {
	
	List<GuideBoardVO> selectAll(Pageing pg);
	
	List<GuideBoardVO> selectAllpg(Pageing pg2);
	
	List<GuideBoardVO> selectAllpg3(Pageing pg3);

	List<GuideBoardVO> selectAllpg4(Pageing pg4);
	
	void create(@Param("gvo") GuideBoardVO gvo);

	GuideBoardVO selectOne(@Param("gvo")int boardsid);
	
	void updateView(@Param("vvo")int boardsid);

	void updateBoard(@Param("gvo") GuideBoardVO gvo);

	void deleteBoard(int boardsid);
	
	int selectCount(Pageing pg);
	
	int selectCount2(Pageing pg2);
	
	int selectCount3(Pageing pg3);
	
	int selectCount4(Pageing pg4);

	void updateGood(@Param("vov")int boardsid);
	
	String updateGoodSelect(@Param("uvou")int boardsid);
}
