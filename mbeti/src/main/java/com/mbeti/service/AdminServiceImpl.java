package com.mbeti.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.mbeti.domain.MemberVO;
import com.mbeti.persistence.AdminDAO;
import com.mbeti.persistence.MemberDAO;

@Service
public class AdminServiceImpl  implements AdminService {
	
	@Inject AdminDAO dao;
	
	//회원가입
	@Override
	public List<MemberVO> list() throws Exception {
		
		return dao.list();
	}

	
}
