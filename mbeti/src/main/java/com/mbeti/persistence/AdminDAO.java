package com.mbeti.persistence;

import java.util.List;

import com.mbeti.domain.MemberVO;

public interface AdminDAO {
	
	//회원 리스트
	public List<MemberVO> list() throws Exception;

	
		
}
