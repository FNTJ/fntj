package com.mbeti.controller;

import java.io.File;
import java.io.Writer;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mbeti.domain.BoardVO;
import com.mbeti.domain.Criteria;
import com.mbeti.domain.FreeBoardReplyVO;
import com.mbeti.domain.FreeBoardVO;
import com.mbeti.domain.PageMaker;
import com.mbeti.domain.ReplyVO;
import com.mbeti.domain.SearchCriteria;
import com.mbeti.service.BoardService;
import com.mbeti.service.FreeBoardReplyService;
import com.mbeti.service.FreeBoardService;
import com.mbeti.service.ReplyService;


@Controller
@RequestMapping("/freeBoard/*")
public class FreeBoardController {

	private static final Logger logger = LoggerFactory.getLogger(FreeBoardController.class);
	
	@Inject
	FreeBoardService fbservice;
	
	@Inject
	FreeBoardReplyService freeBoardReplyService;
	
	// 게시판 글 작성 화면
	@RequestMapping(value = "/freeBoard/writeView", method = RequestMethod.GET)
	public void writeView() throws Exception{
		logger.info("writeView");
		
	}
		
	// 게시판 글 작성
	@RequestMapping(value = "/freeBoard/write", method = RequestMethod.POST)
	public String write(FreeBoardVO freeBoardVO, MultipartHttpServletRequest mpRequest) throws Exception{
		logger.info("write");
		
		fbservice.write(freeBoardVO, mpRequest);
		
		return "redirect:/freeBoard/list";
		
	}
	
	// 게시판 목록 조회
		@RequestMapping(value = "/freeBoard/list", method = RequestMethod.GET)
		public String list(Model model,@ModelAttribute("scri") SearchCriteria scri) throws Exception{
			logger.info("fbList");
			
			model.addAttribute("fbList",fbservice.fbList(scri));
			
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(scri);
			pageMaker.setTotalCount(fbservice.listCount(scri));
			
			model.addAttribute("pageMaker", pageMaker);
			
			
			return "/freeBoard/list";
			
		}		
	
	// 게시판 조회
	@RequestMapping(value = "/freeBoard/readView", method = RequestMethod.GET)
	public String read(FreeBoardVO freeBoardVO, @ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception{
		logger.info("fbRead");
		
		model.addAttribute("fbRead", fbservice.read(freeBoardVO.getBno()));
		model.addAttribute("scri", scri);
		
		List<FreeBoardReplyVO> replyList = freeBoardReplyService.readReply(freeBoardVO.getBno());
		model.addAttribute("replyList", replyList);

		List<Map<String, Object>> fileList = fbservice.selectFileList(freeBoardVO.getBno());
		model.addAttribute("file", fileList);
		
		return "/freeBoard/readView";
	}
	
	// 게시판 수정뷰
	@RequestMapping(value = "/freeBoard/updateView", method = RequestMethod.GET)
	public String updateView(FreeBoardVO freeBoardVO, @ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception{
		logger.info("updateView");
		
		model.addAttribute("fbUpdate", fbservice.read(freeBoardVO.getBno()));
		model.addAttribute("scri", scri);

		List<Map<String, Object>> fileList = fbservice.selectFileList(freeBoardVO.getBno());
		model.addAttribute("file", fileList);
		return "/freeBoard/updateView";
	}
	
	// 게시판 수정
	@RequestMapping(value = "/freeBoard/update", method = RequestMethod.POST)
	public String update(FreeBoardVO freeBoardVO, 
				 @ModelAttribute("scri") SearchCriteria scri, 
				 RedirectAttributes rttr,
				 @RequestParam(value="fileNoDel[]") String[] files,
				 @RequestParam(value="fileNameDel[]") String[] fileNames,
				 MultipartHttpServletRequest mpRequest) throws Exception {
		
			logger.info("fbUpdate");
			fbservice.update(freeBoardVO, files, fileNames, mpRequest);
			
			rttr.addAttribute("page", scri.getPage());
			rttr.addAttribute("perPageNum", scri.getPerPageNum());
			rttr.addAttribute("searchType", scri.getSearchType());
			rttr.addAttribute("keyword", scri.getKeyword());
			
			return "redirect:/freeBoard/list";
	}

	// 게시판 삭제
	@RequestMapping(value = "/freeBoard/delete", method = RequestMethod.POST)
	public String delete(FreeBoardVO freeBoardVO, @ModelAttribute("scri") SearchCriteria scri, RedirectAttributes rttr) throws Exception{
			logger.info("fbDelete");
			
			fbservice.delete(freeBoardVO.getBno());
			
			rttr.addAttribute("page", scri.getPage());
			rttr.addAttribute("perPageNum", scri.getPerPageNum());
			rttr.addAttribute("searchType", scri.getSearchType());
			rttr.addAttribute("keyword", scri.getKeyword());
			
			return "redirect:/freeBoard/list";
	}
	///////////////////////////////////////////////////////////////////
	//댓글 수정 GET
	@RequestMapping(value="/freeBoard/replyUpdateView", method = RequestMethod.GET)
	public String replyUpdateView(ReplyVO vo, SearchCriteria scri, Model model) throws Exception {
		logger.info("reply Write");
		
		model.addAttribute("replyUpdate", freeBoardReplyService.selectReply(vo.getRno()));
		model.addAttribute("scri", scri);
		
		return "/freeBoard/replyUpdateView";
	}
	
	//댓글 수정 POST
	@RequestMapping(value="/freeBoard/replyUpdate", method = RequestMethod.POST)
	public String replyUpdate(FreeBoardReplyVO vo, SearchCriteria scri, RedirectAttributes rttr) throws Exception {
	logger.info("reply Write");
	
	freeBoardReplyService.updateReply(vo);
	
	rttr.addAttribute("bno", vo.getBno());
	rttr.addAttribute("page", scri.getPage());
	rttr.addAttribute("perPageNum", scri.getPerPageNum());
	rttr.addAttribute("searchType", scri.getSearchType());
	rttr.addAttribute("keyword", scri.getKeyword());
	
	return "redirect:/freeBoard/readView";
	}
	
	//댓글 삭제 GET
	@RequestMapping(value="/freeBoard/replyDeleteView", method = RequestMethod.GET)
	public String replyDeleteView(FreeBoardReplyVO vo, SearchCriteria scri, Model model) throws Exception {
		logger.info("reply Write");
		
		model.addAttribute("replyDelete", freeBoardReplyService.selectReply(vo.getRno()));
		model.addAttribute("scri", scri);
		
	
		return "/freeBoard/replyDeleteView";
	}
	
	//댓글 삭제
	@RequestMapping(value="/freeBoard/replyDelete", method = RequestMethod.POST)
	public String replyDelete(FreeBoardReplyVO vo, SearchCriteria scri, RedirectAttributes rttr) throws Exception {
	logger.info("reply Write");
	
	freeBoardReplyService.deleteReply(vo);
	
	rttr.addAttribute("bno", vo.getBno());
	rttr.addAttribute("page", scri.getPage());
	rttr.addAttribute("perPageNum", scri.getPerPageNum());
	rttr.addAttribute("searchType", scri.getSearchType());
	rttr.addAttribute("keyword", scri.getKeyword());
	
	return "redirect:/freeBoard/readView";
	}
	
	//파일다운
	@RequestMapping(value="/freeBoard/fileDown")
	public void fileDown(@RequestParam Map<String, Object> map, HttpServletResponse response) throws Exception{
		Map<String, Object> resultMap = fbservice.selectFileInfo(map);
		String storedFileName = (String) resultMap.get("stored_fname");
		String originalFileName = (String) resultMap.get("org_fname");
		
		// 파일을 저장했던 위치에서 첨부파일을 읽어 byte[]형식으로 변환한다.
		byte fileByte[] = org.apache.commons.io.FileUtils.readFileToByteArray(new File("C:\\file\\"+storedFileName));
		
		response.setContentType("application/octet-stream");
		response.setContentLength(fileByte.length);
		response.setHeader("Content-Disposition",  "attachment; fileName=\""+URLEncoder.encode(originalFileName, "UTF-8")+"\";");
		response.getOutputStream().write(fileByte);
		response.getOutputStream().flush();
		response.getOutputStream().close();
		
	}
	
	
	
	
	
	
	
}