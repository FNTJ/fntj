package com.mbeti.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.mbeti.domain.MatchVO;
import com.mbeti.domain.MatchingCriteria;
import com.mbeti.persistence.MatchDAO;

@Service
public class MatchServiceImpl implements MatchService {

	
	@Inject
	private MatchDAO mdao;

	@Override
	public List<MatchVO> jobList(MatchingCriteria mcri) throws Exception {
		return mdao.jobList(mcri);
	}
	
	
	
	
	
	
	
	
	
	
}