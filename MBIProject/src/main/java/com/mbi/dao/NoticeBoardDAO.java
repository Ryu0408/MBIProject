package com.mbi.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.mbi.vo.NoticeBoardVO;

public interface NoticeBoardDAO {
	List<NoticeBoardVO> select();
	List<NoticeBoardVO> selectType(@Param("type") int type);
	void create(@Param("vo") NoticeBoardVO vo);
	NoticeBoardVO read(@Param("sid") int sid);
	void viewUp(@Param("view") int view );
	void modify(@Param("data") HashMap<String, Object>data);
	void delete(@Param("delId") int delId);
}

