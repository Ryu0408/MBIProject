package com.mbi.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.mbi.vo.HoursVO;
import com.mbi.vo.Pageing;

public interface HoursDAO {

	List<HoursVO> selectAll();
	
	int selectCount(Pageing pg);

	List<HoursVO> getPageList(@Param("type")String type, 
			@Param("first") int first,
			@Param("last") int last);

}
