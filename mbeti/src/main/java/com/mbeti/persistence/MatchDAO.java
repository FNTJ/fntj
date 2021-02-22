package com.mbeti.persistence;

import java.util.List;

import com.mbeti.domain.MatchVO;
import com.mbeti.domain.MatchingCriteria;

public interface MatchDAO {


	// 게시물 목록 조회
	public List<MatchVO> jobList(MatchingCriteria mcri) throws Exception;

	
	
	
	
}