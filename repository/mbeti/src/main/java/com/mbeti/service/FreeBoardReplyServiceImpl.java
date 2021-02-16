package com.mbeti.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mbeti.domain.FreeBoardReplyVO;
import com.mbeti.persistence.FreeBoardDAO;
import com.mbeti.persistence.FreeBoardReplyDAO;

@Service
public class FreeBoardReplyServiceImpl implements FreeBoardReplyService{

	@Inject
	private FreeBoardReplyDAO fbrdao; //ReplyDAO dao;

	@Inject
	private FreeBoardDAO fbdao;//BoardDAO boardDAO;

	// 댓글 조회
	@Override
	public List<FreeBoardReplyVO> readReply(int bno) throws Exception {
		return fbrdao.readReply(bno);
	}

	
	// 댓글 작성
	@Transactional
	@Override public void writeReply(FreeBoardReplyVO vo) throws Exception {
		fbrdao.writeReply(vo);
		fbdao.updateReplyCnt(vo.getBno(), 1);
	}
	 
	// 댓글 수정
	@Override public void updateReply(FreeBoardReplyVO vo) throws Exception {
	fbrdao.updateReply(vo); }
	  
	// 댓글 삭제
	@Transactional
	@Override public void deleteReply(FreeBoardReplyVO vo) throws Exception {
		fbrdao.deleteReply(vo);
		fbdao.updateReplyCnt(vo.getBno(), -1); 
	}
	  
	// 댓글 조회
	@Override public FreeBoardReplyVO selectReply(int rno) throws Exception {
	return fbrdao.selectReply(rno); }
	 
	 
	
	
	
	
	
}
