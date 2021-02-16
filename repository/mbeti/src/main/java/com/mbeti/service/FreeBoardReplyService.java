package com.mbeti.service;

import java.util.List;

import com.mbeti.domain.FreeBoardReplyVO;

public interface FreeBoardReplyService {

	// 댓글 조회
	public List<FreeBoardReplyVO> readReply(int bno) throws Exception;
	
	
	// 댓글 작성 
	public void writeReply(FreeBoardReplyVO vo) throws Exception;
	 
	// 댓글 수정 
	public void updateReply(FreeBoardReplyVO vo) throws Exception;
	  
	// 댓글 삭제 
	public void deleteReply(FreeBoardReplyVO vo) throws Exception;
	  
	// 댓글 조회 
	public FreeBoardReplyVO selectReply(int rno) throws Exception;
	 
	
	
	
}
