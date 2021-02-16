package com.mbeti.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.mbeti.domain.FreeBoardReplyVO;

@Repository
public class FreeBoardReplyDAOImpl implements FreeBoardReplyDAO{
	
	@Inject SqlSession sql;

	// 댓글 조회
	@Override
	public List<FreeBoardReplyVO> readReply(int bno) throws Exception {
		return sql.selectList("freeBoardReplyMapper.fbReadReply", bno);
	}

	
	  // 댓글 작성
	  @Override public void writeReply(FreeBoardReplyVO vo) throws Exception {
	  sql.insert("freeBoardReplyMapper.fbWriteReply",vo); }
	  
	  // 댓글 수정
	  @Override public void updateReply(FreeBoardReplyVO vo) throws Exception {
	  sql.update("freeBoardReplyMapper.fbUpdateReply", vo); }
	  
	  // 댓글 삭제
	  
	  @Override public void deleteReply(FreeBoardReplyVO vo) throws Exception {
	  sql.delete("freeBoardReplyMapper.fbDeleteReply", vo); }
	  
	  // 조회
	  
	  @Override public FreeBoardReplyVO selectReply(int rno) throws Exception {
	  return sql.selectOne("freeBoardReplyMapper.fbSelectReply", rno); }
	  
	  //댓글수
	  
	  @Override public int getArticleNo(Integer reply_no) throws Exception { return
	  sql.selectOne("freeBoardReplyMapper.fbGetArticleNo", reply_no); }
	  
	 
	
	
	

}
