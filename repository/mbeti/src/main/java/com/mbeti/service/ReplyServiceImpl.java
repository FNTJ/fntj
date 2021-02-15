package com.mbeti.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mbeti.domain.ReplyVO;
import com.mbeti.persistence.BoardDAO;
import com.mbeti.persistence.ReplyDAO;

@Service
public class ReplyServiceImpl implements ReplyService{

	@Inject
	private ReplyDAO dao;

	@Inject
	private BoardDAO boardDAO;

	// 댓글 조회
	@Override
	public List<ReplyVO> readReply(int bno) throws Exception {
		return dao.readReply(bno);
	}

	// 댓글 작성
	@Transactional
	@Override
	public void writeReply(ReplyVO vo) throws Exception {
		dao.writeReply(vo);
		boardDAO.updateReplyCnt(vo.getBno(), 1);
		
	}

	// 댓글 수정
	@Override
	public void updateReply(ReplyVO vo) throws Exception {
		dao.updateReply(vo);
	}

	// 댓글 삭제
	@Transactional
	@Override
	public void deleteReply(ReplyVO vo) throws Exception {
		dao.deleteReply(vo);
		boardDAO.updateReplyCnt(vo.getBno(), -1);
	}

	// 댓글 조회
	@Override
	public ReplyVO selectReply(int rno) throws Exception {
		return dao.selectReply(rno);
	}

	
	
	
	
	
}
