package com.mbeti.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.mbeti.domain.Criteria;
import com.mbeti.domain.FreeBoardVO;
import com.mbeti.domain.MemberVO;
import com.mbeti.domain.SearchCriteria;
import com.mbeti.persistence.AdminDAO;
import com.mbeti.persistence.MemberDAO;

@Service
public class AdminServiceImpl  implements AdminService {
	
	@Inject AdminDAO dao;
	
	//회원 리스트
	@Override
	public List<MemberVO> list(SearchCriteria scri) throws Exception {
		return dao.list(scri);
	}
	//회원 갯수
	@Override
	public int listCount(SearchCriteria scri) throws Exception{
		return dao.listCount(scri);
	}

	//회원 상세 조회
	@Override
	public MemberVO retrieve(String userID) throws Exception {
		return dao.retrieve(userID);
	}

	// 회원정보 수정
	@Override
	public void memberUpdate(MemberVO memberVO) throws Exception {
		dao.memberUpdate(memberVO);
	}

	// 회원 탈퇴
	@Override
	public void delete(String userID) throws Exception {
		dao.delete(userID);
	}
	
	// 자유게시판 글삭제
	@Override
	public void deleteFB(FreeBoardVO freeBoardVO) throws Exception {
		dao.deleteFB(freeBoardVO);
	}
	
	//회원 삭제
	@Override
	public void deleteUser(MemberVO memberVO) throws Exception {
		dao.deleteUser(memberVO);
	}
	
	
	
	
	
	
	
	
}
