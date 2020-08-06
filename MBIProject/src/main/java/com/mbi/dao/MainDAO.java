package com.mbi.dao;

import java.util.List;

import com.mbi.vo.GuideBoardVO;
import com.mbi.vo.NoticeBoardVO;


public interface MainDAO {

	List<NoticeBoardVO> selectNoticeBoard();
	
	List<GuideBoardVO> selectGuideBoard();
}
