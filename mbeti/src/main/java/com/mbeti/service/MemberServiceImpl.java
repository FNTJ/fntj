package com.mbeti.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.mbeti.domain.MemberVO;
import com.mbeti.persistence.MemberDAO;

@Service
public class MemberServiceImpl  implements MemberService {
	
	@Inject MemberDAO dao;
	
	//회원가입
	@Override
	public void register(MemberVO vo) throws Exception {
		
		dao.register(vo);
	}

	//로그인
	@Override
	public MemberVO login(MemberVO vo) throws Exception {
		return dao.login(vo);
	}
	
	
	
	
	
	
	
	
	
	
	
}
