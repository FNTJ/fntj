package com.mbeti.persistence;

import java.util.List;
import java.util.Map;

import com.mbeti.domain.BoardVO;
import com.mbeti.domain.Criteria;
import com.mbeti.domain.FileVO;
import com.mbeti.domain.FreeBoardVO;
import com.mbeti.domain.SearchCriteria;

public interface FreeBoardDAO {

	// 게시글 작성
	public void write(FreeBoardVO freeBoardVO) throws Exception;

	// 게시물 목록 조회
	public List<FreeBoardVO> fbList(SearchCriteria scri) throws Exception;

	// 게시물 페이징
	public int listCount(SearchCriteria scri) throws Exception;
		
	// 게시물 조회
	public FreeBoardVO read(int bno) throws Exception;
	
	// 게시물 수정
	public void update(FreeBoardVO freeBoardVO) throws Exception;
		
	// 게시물 삭제
	public void delete(int bno) throws Exception;
	
	//펌부파일 업로드
	public void insertFile(Map<String, Object> map) throws Exception;
	
	// 첨부파일 조회
	public List<Map<String, Object>> selectFileList(int bno) throws Exception;
		
	// 첨부파일 다운
	public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception;
		
	// 첨부파일 수정
	public void updateFile(Map<String, Object> map) throws Exception;
		
	// 게시판 조회수
	public void boardHit(int bno) throws Exception;
		
	//댓글수
	void updateReplyCnt(Integer bno, int amount) throws Exception;
	
	// 파일 목록 조회
	public List<FileVO> fileList() throws Exception;
	
	
	
	
}