package com.mbeti.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.mbeti.domain.MatchVO;
import com.mbeti.domain.MatchingCriteria;


@Repository
public class MatchDAOImpl implements MatchDAO {

	@Inject
	private SqlSession sqlSession;

	@Override
	public List<MatchVO> jobList(MatchingCriteria mcri) throws Exception {
		return sqlSession.selectList("matchMapper.jobListPage",mcri);
	}
		
	
	
	
}