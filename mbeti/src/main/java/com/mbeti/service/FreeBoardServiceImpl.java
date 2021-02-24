package com.mbeti.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.mbeti.domain.BoardVO;
import com.mbeti.domain.Criteria;
import com.mbeti.domain.FileVO;
import com.mbeti.domain.FreeBoardVO;
import com.mbeti.domain.SearchCriteria;
import com.mbeti.persistence.FreeBoardDAO;
import com.mbeti.util.FileUtils;
import com.mbeti.util.FreeBoardFileUtils;

@Service
public class FreeBoardServiceImpl implements FreeBoardService {

	@Resource(name="freeBoardFileUtils")
	private FreeBoardFileUtils freeBoardFileUtils;
	
	@Inject
	private FreeBoardDAO fbdao;

	//게시물 작성
	@Override
	public void write(FreeBoardVO freeBoardVO, MultipartHttpServletRequest mpRequest) throws Exception {
		fbdao.write(freeBoardVO);
		
		List<Map<String,Object>> list = freeBoardFileUtils.parseInsertFileInfo(freeBoardVO, mpRequest); 
		int size = list.size();
		for(int i=0; i<size; i++){ 
			fbdao.insertFile(list.get(i)); 
		}
	}

	//게시물 목록 조회
	@Override
	public List<FreeBoardVO> fbList(SearchCriteria scri) throws Exception {
		return fbdao.fbList(scri);
	}
	
	// 게시물 페이징
	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		return fbdao.listCount(scri);
	}
		
	
	// 게시물 목록 조회
	@Override
	public FreeBoardVO read(int bno) throws Exception {
		fbdao.boardHit(bno);
		return fbdao.read(bno);
	}

	// 게시물 수정
	@Override
	public void update(FreeBoardVO freeBoardVO) throws Exception {
		fbdao.update(freeBoardVO);
	}

	// 게시물 삭제
	@Override
	public void delete(int bno) throws Exception {
		fbdao.delete(bno);
	}
		
	// 첨부파일 조회
	@Override
	public List<Map<String, Object>> selectFileList(int bno) throws Exception {
		return fbdao.selectFileList(bno);
	}

	// 첨부파일 다운로드
	@Override
	public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception {
		return fbdao.selectFileInfo(map);
	}
	
	// 게시물 수정
	@Override
	public void update(FreeBoardVO freeBoardVO, String[] files, String[] fileNames, MultipartHttpServletRequest mpRequest) throws Exception {
		
		fbdao.update(freeBoardVO);
		
		List<Map<String, Object>> list = freeBoardFileUtils.parseUpdateFileInfo(freeBoardVO, files, fileNames, mpRequest);
		Map<String, Object> tempMap = null;
		int size = list.size();
		for(int i = 0; i<size; i++) {
			tempMap = list.get(i);
			if(tempMap.get("IS_NEW").equals("Y")) {
				fbdao.insertFile(tempMap);
			}else {
				fbdao.updateFile(tempMap);
			}
		}
	}
	
	//파일 목록 조회
		@Override
		public List<FileVO> fileList() throws Exception {
			return fbdao.fileList();
		}
	
	
	
	
	
	
	
	
}