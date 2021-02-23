package com.mbeti.controller;

import java.io.File;
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
import com.mbeti.domain.PageMaker;
import com.mbeti.domain.ReplyVO;
import com.mbeti.domain.SearchCriteria;
import com.mbeti.service.BoardService;
import com.mbeti.service.ReplyService;


@Controller
@RequestMapping("/notice/*")
public class BoardController {

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Inject
	BoardService service;
	
	@Inject
	ReplyService replyService;
	
	
	// 게시판 글 작성 화면
	@RequestMapping(value = "/notice/writeView", method = RequestMethod.GET)
	public void writeView() throws Exception{
		logger.info("writeView");
		
	}
	
	
	// 게시판 글 작성
	@RequestMapping(value = "/notice/write", method = RequestMethod.POST)
	public String write(BoardVO boardVO, MultipartHttpServletRequest mpRequest) throws Exception{
		logger.info("write");
		service.write(boardVO, mpRequest);
		
		return "redirect:/notice/list";
	}
	
	// 게시판 목록 조회
	@RequestMapping(value = "/notice/list", method = RequestMethod.GET)
	public String list(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception{
		logger.info("list");
		
		model.addAttribute("list", service.list(scri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.listCount(scri));
		
		model.addAttribute("pageMaker", pageMaker);
		
		model.addAttribute("fileList",service.fileList());
		
		return "/notice/list";
		
	}
	
	// 게시판 조회
	@RequestMapping(value = "/notice/readView", method = RequestMethod.GET)
	public String read(BoardVO boardVO, @ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception {
		logger.info("read");

		model.addAttribute("read", service.read(boardVO.getBno()));
		model.addAttribute("scri", scri);

		List<ReplyVO> replyList = replyService.readReply(boardVO.getBno());
		model.addAttribute("replyList", replyList);

		List<Map<String, Object>> fileList = service.selectFileList(boardVO.getBno());
		model.addAttribute("file", fileList);
		return "/notice/readView";
	}
	
//	// 게시판 수정뷰
//	@RequestMapping(value = "/updateView", method = RequestMethod.GET)
//	public String updateView(BoardVO boardVO, @ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception{
//		logger.info("updateView");
//		
//		model.addAttribute("update", service.read(boardVO.getBno()));
//		model.addAttribute("scri", scri);
//		
//		return "/updateView";
//	}
//	
//	// 게시판 수정
//	@RequestMapping(value = "/update", method = RequestMethod.POST)
//	public String update(BoardVO boardVO, @ModelAttribute("scri") SearchCriteria scri, RedirectAttributes rttr) throws Exception{
//		logger.info("update");
//		
//		service.update(boardVO);
//		
//		rttr.addAttribute("page", scri.getPage());
//		rttr.addAttribute("perPageNum", scri.getPerPageNum());
//		rttr.addAttribute("searchType", scri.getSearchType());
//		rttr.addAttribute("keyword", scri.getKeyword());
//		
//		return "redirect:/list";
//	}
	
	// 게시판 수정뷰
		@RequestMapping(value = "/notice/updateView", method = RequestMethod.GET)
		public String updateView(BoardVO boardVO, @ModelAttribute("scri") SearchCriteria scri, Model model)
				throws Exception {
			logger.info("updateView");

			model.addAttribute("update", service.read(boardVO.getBno()));
			model.addAttribute("scri", scri);

			List<Map<String, Object>> fileList = service.selectFileList(boardVO.getBno());
			model.addAttribute("file", fileList);
			return "/notice/updateView";
		}

		// 게시판 수정
		@RequestMapping(value = "/notice/update", method = RequestMethod.POST)
		public String update(BoardVO boardVO, 
							 @ModelAttribute("scri") SearchCriteria scri, 
							 RedirectAttributes rttr,
							 @RequestParam(value="fileNoDel[]") String[] files,
							 @RequestParam(value="fileNameDel[]") String[] fileNames,
							 MultipartHttpServletRequest mpRequest) throws Exception {
			logger.info("update");
			service.update(boardVO, files, fileNames, mpRequest);

			rttr.addAttribute("page", scri.getPage());
			rttr.addAttribute("perPageNum", scri.getPerPageNum());
			rttr.addAttribute("searchType", scri.getSearchType());
			rttr.addAttribute("keyword", scri.getKeyword());

			return "redirect:/notice/list";
		}

	// 게시판 삭제
	@RequestMapping(value = "/notice/delete", method = RequestMethod.POST)
	public String delete(BoardVO boardVO, @ModelAttribute("scri") SearchCriteria scri, RedirectAttributes rttr) throws Exception{
		logger.info("delete");
		
		service.delete(boardVO.getBno());
		
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		
		return "redirect:/notice/list";
	}
	
	//댓글 수정 GET
			@RequestMapping(value="/notice/replyUpdateView", method = RequestMethod.GET)
			public String replyUpdateView(ReplyVO vo, SearchCriteria scri, Model model) throws Exception {
				logger.info("reply Write");
				
				model.addAttribute("replyUpdate", replyService.selectReply(vo.getRno()));
				model.addAttribute("scri", scri);
				
				return "/notice/replyUpdateView";
			}
			
	//댓글 수정 POST
	@RequestMapping(value="/notice/replyUpdate", method = RequestMethod.POST)
	public String replyUpdate(ReplyVO vo, SearchCriteria scri, RedirectAttributes rttr) throws Exception {
		logger.info("reply Write");
		
		replyService.updateReply(vo);
		
		rttr.addAttribute("bno", vo.getBno());
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		
		return "redirect:/notice/readView";
	}
	
	//댓글 삭제 GET
		@RequestMapping(value="/notice/replyDeleteView", method = RequestMethod.GET)
		public String replyDeleteView(ReplyVO vo, SearchCriteria scri, Model model) throws Exception {
			logger.info("reply Write");
			
			model.addAttribute("replyDelete", replyService.selectReply(vo.getRno()));
			model.addAttribute("scri", scri);
			

			return "/notice/replyDeleteView";
		}
		
	//댓글 삭제
	@RequestMapping(value="/notice/replyDelete", method = RequestMethod.POST)
	public String replyDelete(ReplyVO vo, SearchCriteria scri, RedirectAttributes rttr) throws Exception {
		logger.info("reply Write");
		
		replyService.deleteReply(vo);
		
		rttr.addAttribute("bno", vo.getBno());
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		
		return "redirect:/notice/readView";
	}
	
	//파일다운
	@RequestMapping(value="/notice/fileDown")
	public void fileDown(@RequestParam Map<String, Object> map, HttpServletResponse response) throws Exception{
		Map<String, Object> resultMap = service.selectFileInfo(map);
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