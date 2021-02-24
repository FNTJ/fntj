package com.mbeti.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.mbeti.domain.BoardVO;
import com.mbeti.domain.Criteria;
import com.mbeti.domain.FileVO;
import com.mbeti.domain.FreeBoardVO;
import com.mbeti.domain.SearchCriteria;


@Repository
public class FreeBoardDAOImpl implements FreeBoardDAO {

	@Inject
	private SqlSession sqlSession;

	//게시물 작성
	@Override
	public void write(FreeBoardVO freeBoardVO) throws Exception {
		sqlSession.insert("freeBoardMapper.fbInsert", freeBoardVO);
	}
	
	// 게시물 조회
	@Override
	public FreeBoardVO read(int bno) throws Exception {
			
		return sqlSession.selectOne("freeBoardMapper.fbRead", bno);
	}

	// 게시물 목록 조회
	@Override
	public List<FreeBoardVO> fbList(SearchCriteria scri) throws Exception {
	
		return sqlSession.selectList("freeBoardMapper.fbListPage", scri);
	}
		
	// 게시물 페이징
	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		return sqlSession.selectOne("freeBoardMapper.fbListCount", scri);
	}

	// 게시물 수정
	@Override
	public void update(FreeBoardVO freeBoardVO) throws Exception {
		sqlSession.update("freeBoardMapper.fbUpdate", freeBoardVO);
	}
	
	// 게시물 삭제
	@Override
	public void delete(int bno) throws Exception {
		sqlSession.delete("freeBoardMapper.fbDelete", bno);
	}
	
	// 첨부파일 업로드
	@Override
	public void insertFile(Map<String, Object> map) throws Exception {
		sqlSession.insert("freeBoardMapper.fbInsertFile", map);
	}
	
	// 첨부파일 조회
	@Override
	public List<Map<String, Object>> selectFileList(int bno) throws Exception {
		return sqlSession.selectList("freeBoardMapper.fbSelectFileList", bno);
	}
	
	// 첨부파일 다운로드
	@Override
	public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception {
		return sqlSession.selectOne("freeBoardMapper.fbSelectFileInfo", map);
	}
	
	//첨부파일 수정
	@Override
	public void updateFile(Map<String, Object> map) throws Exception {
		sqlSession.update("freeBoardMapper.fbUpdateFile", map);
	}
	
	//조회수
	@Override
	public void boardHit(int bno) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update("freeBoardMapper.fbBoardHit", bno);
	}
	
	//댓글수
	@Override public void updateReplyCnt(Integer bno, int amount) throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>(); 
		paramMap.put("bno", bno); paramMap.put("amount", amount); 
		sqlSession.update("freeBoardMapper.fbUpdateReplyCnt",paramMap); 
		}
	
	//파일목록조회
	@Override
	public List<FileVO> fileList() throws Exception {
		return sqlSession.selectList("freeBoardMapper.fileList");
	}
	
	
	
	
	
	
}