package com.mbeti.service;

import java.util.List;

import com.mbeti.domain.Criteria;
import com.mbeti.domain.FreeBoardVO;
import com.mbeti.domain.MemberVO;
import com.mbeti.domain.SearchCriteria;

public interface AdminService {

	//회원 리스트
	public List<MemberVO> list(SearchCriteria scri) throws Exception;

	//회원 갯수
	public int listCount(SearchCriteria scri) throws Exception;
	
	//회원 상세 조회
	public MemberVO retrieve(String userID) throws Exception;
	
	// 회원정보 수정
	public void memberUpdate(MemberVO memberVO) throws Exception;

	// 회원 탈퇴
	public void delete(String userID) throws Exception;
	
	// 자유게시판 글삭제
	public void deleteFB(FreeBoardVO freeBoardVO) throws Exception;
	
	// 회원 삭제
	public void deleteUser(MemberVO memberVO) throws Exception;
		
}
