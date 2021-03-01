package com.mbeti.service;

import java.util.List;

import com.mbeti.domain.MemberVO;

public interface AdminService {

	//회원 리스트
	public List<MemberVO> list() throws Exception;
	
	//회원 상세 조회
	public MemberVO retrieve(String userID) throws Exception;
	
	// 회원정보 수정
	public void memberUpdate(MemberVO memberVO) throws Exception;

	// 회원 탈퇴
	public void delete(String userID) throws Exception;
	
	
}
