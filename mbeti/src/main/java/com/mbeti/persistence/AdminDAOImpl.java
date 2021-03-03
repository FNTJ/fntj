package com.mbeti.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.mbeti.domain.Criteria;
import com.mbeti.domain.FreeBoardVO;
import com.mbeti.domain.MemberVO;
import com.mbeti.domain.SearchCriteria;

@Repository
public class AdminDAOImpl implements AdminDAO{

	@Inject SqlSession sql;
	
	// 회원리스트
	@Override
	public List<MemberVO> list(SearchCriteria scri) throws Exception {
		return sql.selectList("adminMapper.listPage", scri);
	}
	
	//회원 갯수
	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		return sql.selectOne("adminMapper.listCount", scri);
	}
		
	//회원 상세 조회
	@Override
	public MemberVO retrieve(String userID) throws Exception {
			
		return sql.selectOne("adminMapper.retrieve", userID);
	}

	// 회원정보 수정
	@Override
	public void memberUpdate(MemberVO memberVO) throws Exception {
		sql.update("adminMapper.memberUpdate", memberVO);
	}
	
	// 회원 탈퇴
	@Override
	public void delete(String userID) throws Exception {
		sql.delete("adminMapper.memberDelete", userID);
	}
	
	// 자유게시판 글삭제
	@Override
	public void deleteFB(FreeBoardVO freeBoardVO) throws Exception {
		sql.delete("adminMapper.deleteFB", freeBoardVO);
		
	}

	//회원 삭제
	@Override
	public void deleteUser(MemberVO memberVO) throws Exception {
		sql.delete("adminMapper.deleteUser", memberVO);
	}

	
	
	
	
}
