package com.mbeti.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mbeti.domain.BoardVO;
import com.mbeti.domain.Criteria;
import com.mbeti.domain.FreeBoardVO;
import com.mbeti.domain.MemberVO;
import com.mbeti.domain.PageMaker;
import com.mbeti.domain.SearchCriteria;
import com.mbeti.service.AdminService;
import com.mbeti.service.BoardService;
import com.mbeti.service.FreeBoardService;
import com.mbeti.service.ReplyService;

@Controller
@RequestMapping("/admin/*")
public class AdminController {

   private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
   
   @Inject
   AdminService service;
   
   @Inject
   BCryptPasswordEncoder pwdEncoder;
   
	@Inject
	BoardService nService;
	
	@Inject
	ReplyService replyService;
	
	@Inject
	FreeBoardService fbservice;
   
   // 관리자페이지 홈
   @RequestMapping(value = "/admin/index", method = RequestMethod.GET)
   public String admintest() {
      return "/admin/index";
   }
   
   // 회원 리스트
   @RequestMapping(value = "/admin/userList", method = RequestMethod.GET)
   public String userList(Model model, SearchCriteria scri) throws Exception{
	    logger.info("list");
		
		model.addAttribute("list",service.list(scri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.listCount(scri));
		
		model.addAttribute("pageMaker", pageMaker);

		return "/admin/userList";
   }
 
   // 회원정보 상세 조회
	@RequestMapping(value = "/admin/retrieve", method = RequestMethod.GET)
	public String retrieve(MemberVO memberVO, Model model) throws Exception{
		logger.info("retrieve");
		
		model.addAttribute("retrieve", service.retrieve(memberVO.getUserID()));
		
		return "/admin/retrieve";
	}

	// 회원정보 수정뷰
		@RequestMapping(value = "/admin/userUpdate", method = RequestMethod.GET)
		public String updateView(MemberVO memberVO, Model model) throws Exception{
			logger.info("userUpdate");
			
			model.addAttribute("update", service.retrieve(memberVO.getUserID()));
			
			return "admin/userUpdate";
		}
		
	// 회원정보 수정
	@RequestMapping(value = "/admin/update", method = RequestMethod.POST)
	public String update(MemberVO vo, HttpSession session) throws Exception{
		logger.info("update");
		
		String inputPass = vo.getUserPassword(); 
    	String pwd = pwdEncoder.encode(inputPass);
    	vo.setUserPassword(pwd);
		service.memberUpdate(vo);
		
		return "redirect:/admin/userList";
	}

	// 회원 삭제
	@RequestMapping(value = "/admin/delete", method = RequestMethod.POST)
	public String delete(MemberVO memberVO) throws Exception{
		logger.info("delete");
		
		service.delete(memberVO.getUserID());
		
		return "redirect:/admin/userList";
	}
//////////////////////////////////////////////////////////////////////////////////////  
	// 게시판 글 작성 화면
		@RequestMapping(value = "/admin/writeView", method = RequestMethod.GET)
		public void writeView() throws Exception{
			logger.info("writeView");
			
		}
		
		
		// 게시판 글 작성
		@RequestMapping(value = "/admin/write", method = RequestMethod.POST)
		public String write(BoardVO boardVO, MultipartHttpServletRequest mpRequest) throws Exception{
			logger.info("write");
			nService.write(boardVO, mpRequest);
			
			return "redirect:/notice/list";
		}
	
		// 게시판 수정뷰
		@RequestMapping(value = "/admin/updateView", method = RequestMethod.GET)
		public String updateView(BoardVO boardVO, @ModelAttribute("scri") SearchCriteria scri, Model model)
				throws Exception {
			logger.info("updateView");

			model.addAttribute("update", nService.read(boardVO.getBno()));
			model.addAttribute("scri", scri);

			List<Map<String, Object>> fileList = nService.selectFileList(boardVO.getBno());
			model.addAttribute("file", fileList);
			return "/admin/updateView";
		}

		// 게시판 수정
		@RequestMapping(value = "/admin/noticeUpdate", method = RequestMethod.POST)
		public String update(BoardVO boardVO, 
							 @ModelAttribute("scri") SearchCriteria scri, 
							 RedirectAttributes rttr,
							 @RequestParam(value="fileNoDel[]") String[] files,
							 @RequestParam(value="fileNameDel[]") String[] fileNames,
							 MultipartHttpServletRequest mpRequest) throws Exception {
			logger.info("update");
			nService.update(boardVO, files, fileNames, mpRequest);

			rttr.addAttribute("page", scri.getPage());
			rttr.addAttribute("perPageNum", scri.getPerPageNum());
			rttr.addAttribute("searchType", scri.getSearchType());
			rttr.addAttribute("keyword", scri.getKeyword());

			return "redirect:/notice/list";
		}

		// 게시판 삭제
		@RequestMapping(value = "/admin/noticeDelete", method = RequestMethod.POST)
		public String delete(BoardVO boardVO, @ModelAttribute("scri") SearchCriteria scri, RedirectAttributes rttr) throws Exception{
			logger.info("delete");
			
			nService.delete(boardVO.getBno());
			
			rttr.addAttribute("page", scri.getPage());
			rttr.addAttribute("perPageNum", scri.getPerPageNum());
			rttr.addAttribute("searchType", scri.getSearchType());
			rttr.addAttribute("keyword", scri.getKeyword());
			
			return "redirect:/notice/list";
		}
		
		//자유게시판 리스트
		@RequestMapping(value = "/admin/fbList", method = RequestMethod.GET)
		public String list(Model model,@ModelAttribute("scri") SearchCriteria scri) throws Exception{
			logger.info("fbList");
			
			model.addAttribute("fbList",fbservice.fbList(scri));
			
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(scri);
			pageMaker.setTotalCount(fbservice.listCount(scri));
			
			model.addAttribute("pageMaker", pageMaker);
			
			model.addAttribute("fileList",fbservice.fileList());
			
			
			return "/admin/fbList";
			
		}		
	
		//자유게시판 글삭제
		// 카트 삭제
		@ResponseBody
		@RequestMapping(value = "/admin/deleteFB", method = RequestMethod.POST)
		public int deleteFB(HttpSession session,
		     @RequestParam(value = "chbox[]") List<String> chArr, FreeBoardVO freeBoardVO) throws Exception {
		 logger.info("delete FB");
		 
		 MemberVO member = (MemberVO)session.getAttribute("member");
		 
		 int result = 0;
		 int bno = 0;
		 
		 
		 if(member != null) {
		  
		  for(String i : chArr) {   
			  bno = Integer.parseInt(i);
			  freeBoardVO.setBno(bno);
			  service.deleteFB(freeBoardVO);
		  }   
		  result = 1;
		 }  
		 return result;  
		}
		
	
		//회원 삭제
		@ResponseBody
		@RequestMapping(value = "/admin/deleteUser", method = RequestMethod.POST)
		public String deleteUser(HttpSession session, MemberVO memberVO) throws Exception{
		 logger.info("deleteUser");
		 
		 MemberVO member = (MemberVO)session.getAttribute("member");
		 String userId = memberVO.getUserID();
		 
		 String result = "0";
		 
		 
		 memberVO.setUserID(userId);
		  
		   service.deleteUser(memberVO.getUserID());
		  result = "1";
		 return result;  
		}
	
}