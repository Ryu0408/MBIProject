package com.mbi.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.mbi.vo.NoticeBoardVO;
import com.mbi.vo.Pageing;

public interface NoticeBoardDAO {
	List<NoticeBoardVO> selectAll(Pageing pb);
	//List<NoticeBoardVO> selectType(@Param("type") int type);
	List<NoticeBoardVO> selectGuidelist(Pageing pb);
	List<NoticeBoardVO> select24hourlist(Pageing pb);
	List<NoticeBoardVO> selectEventlist(Pageing pb);
	
	int selectCount(Pageing pb);
	
	int selectGuideCount(Pageing pb);
	int select24hourCount(Pageing pb);
	int selectEventCount(Pageing pb);
	
	void create(@Param("vo") NoticeBoardVO vo);
	NoticeBoardVO read(@Param("sid") int sid);
	void viewUp(@Param("view") int view );
	void modify(@Param("data") HashMap<String, Object>data);
	void delete(@Param("delId") int delId);
}

