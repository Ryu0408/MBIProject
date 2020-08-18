package com.mbi.service;

import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mbi.classes.AES256Util;
import com.mbi.dao.MyPageDAO;
import com.mbi.vo.MypageVO;

@Service
public class MyPageService {

	@Autowired MyPageDAO mpd;
	@Autowired AES256Util aes;
	
	public List<MypageVO> MypageSelectAll(String username) throws NoSuchAlgorithmException, UnsupportedEncodingException, GeneralSecurityException{
		List<MypageVO> list = new ArrayList<MypageVO>();
		list = mpd.MypageSelectAll(username);		
		System.out.println("서비스의 " + list.get(0).getUserpw());
		String userpw = aes.decrypt(list.get(0).getUserpw());
		list.get(0).setUserpw(userpw.replaceAll(userpw, "**************"));
		System.out.println("service(SelectAll) : " + list.get(0).getUserpw());
		return list;
	}
	
	public List<MypageVO> updatePw(String username, String confirmpw) throws NoSuchAlgorithmException, UnsupportedEncodingException, GeneralSecurityException {
		List<MypageVO> list = MypageSelectAll(username);
		System.out.println("===== Service(updatePW) =====");
		System.out.println("confirmpw : " + confirmpw);
		System.out.println("updatePW : " + list.get(0).getUserpw());
		list.get(0).setUserpw(aes.encrypt(confirmpw));
		System.out.println("변경된 UserPW : " + list.get(0).getUserpw());
		mpd.updatePw(list.get(0));
		System.out.println("바뀐 list : " + list.get(0).getUserpw());
		list.get(0).setUserpw(list.get(0).getUserpw().replaceAll(list.get(0).getUserpw(), "**************"));
		return list;
	}

	public String delUser(String username) {
		// TODO Auto-generated method stub
		System.out.println("delUser(username) : " + username);
		mpd.delUser(username);
		return "redirect:/";
	}
	
	
}
