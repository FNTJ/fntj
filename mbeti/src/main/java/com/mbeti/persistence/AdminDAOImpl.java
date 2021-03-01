package com.mbeti.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.mbeti.domain.MemberVO;

@Repository
public class AdminDAOImpl implements AdminDAO{

	@Inject SqlSession sql;
	
	// 회원리스트
	@Override
	public List<MemberVO> list() throws Exception {
		return sql.selectList("adminMapper.list");
	}
	
	
	
	
	
}
