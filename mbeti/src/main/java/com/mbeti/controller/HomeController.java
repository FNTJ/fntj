package com.mbeti.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mbeti.domain.BoardVO;
import com.mbeti.domain.MemberVO;
import com.mbeti.domain.PageMaker;
import com.mbeti.domain.ReplyVO;
import com.mbeti.domain.SearchCriteria;
import com.mbeti.service.BoardService;
import com.mbeti.service.MemberService;
import com.mbeti.service.ReplyService;

@Controller
@RequestMapping("/*")
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Inject
	BoardService service;
	
	@Inject
	ReplyService replyService;
	
	@Inject
	MemberService memberService;
	
	
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index() {
		return "index";
	}
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
	logger.info("Welcome home! the client locale is "+ locale.toString());

	Date date = new Date();
	DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

	String formattedDate = dateFormat.format(date);

	model.addAttribute("serverTime", formattedDate );

	return "home";
	}
	
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main() {
		return "main";
	}
	
	@RequestMapping(value = "/notice", method = RequestMethod.GET)
	public String notice() {
		return "notice";
	}
	
////////////////////////////////////////////////////////////////////////////////////
///////////////////////        boardController         /////////////////////////////
	
	// ????????? ??? ?????? ??????
	@RequestMapping(value = "/writeView", method = RequestMethod.GET)
	public void writeView() throws Exception{
		logger.info("writeView");
		
	}
	
	
	// ????????? ??? ??????
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String write(BoardVO boardVO) throws Exception{
		logger.info("write");
		
		service.write(boardVO);
		
		return "redirect:/";
	}
	
	// ????????? ?????? ??????
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception{
		logger.info("list");
		
		model.addAttribute("list", service.list(scri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.listCount(scri));
		
		model.addAttribute("pageMaker", pageMaker);
		
		return "/list";
		
	}
	
	// ????????? ??????
	@RequestMapping(value = "/readView", method = RequestMethod.GET)
	public String read(BoardVO boardVO, @ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception{
		logger.info("read");
		
		model.addAttribute("read", service.read(boardVO.getBno()));
		model.addAttribute("scri", scri);
		
		List<ReplyVO> replyList = replyService.readReply(boardVO.getBno());
		model.addAttribute("replyList", replyList);
		return "/readView";
	}
	
		// ????????? ?????????
		@RequestMapping(value = "/updateView", method = RequestMethod.GET)
		public String updateView(BoardVO boardVO, @ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception{
			logger.info("updateView");
			
			model.addAttribute("update", service.read(boardVO.getBno()));
			model.addAttribute("scri", scri);
			
			return "/updateView";
		}
		
		// ????????? ??????
		@RequestMapping(value = "/update", method = RequestMethod.POST)
		public String update(BoardVO boardVO, @ModelAttribute("scri") SearchCriteria scri, RedirectAttributes rttr) throws Exception{
			logger.info("update");
			
			service.update(boardVO);
			
			rttr.addAttribute("page", scri.getPage());
			rttr.addAttribute("perPageNum", scri.getPerPageNum());
			rttr.addAttribute("searchType", scri.getSearchType());
			rttr.addAttribute("keyword", scri.getKeyword());
			
			return "redirect:/list";
		}

		// ????????? ??????
		@RequestMapping(value = "/delete", method = RequestMethod.POST)
		public String delete(BoardVO boardVO, @ModelAttribute("scri") SearchCriteria scri, RedirectAttributes rttr) throws Exception{
			logger.info("delete");
			
			service.delete(boardVO.getBno());
			
			rttr.addAttribute("page", scri.getPage());
			rttr.addAttribute("perPageNum", scri.getPerPageNum());
			rttr.addAttribute("searchType", scri.getSearchType());
			rttr.addAttribute("keyword", scri.getKeyword());
			
			return "redirect:/list";
		}
		
		//?????? ?????? GET
				@RequestMapping(value="/replyUpdateView", method = RequestMethod.GET)
				public String replyUpdateView(ReplyVO vo, SearchCriteria scri, Model model) throws Exception {
					logger.info("reply Write");
					
					model.addAttribute("replyUpdate", replyService.selectReply(vo.getRno()));
					model.addAttribute("scri", scri);
					
					return "board/replyUpdateView";
				}
				
		//?????? ?????? POST
		@RequestMapping(value="/replyUpdate", method = RequestMethod.POST)
		public String replyUpdate(ReplyVO vo, SearchCriteria scri, RedirectAttributes rttr) throws Exception {
			logger.info("reply Write");
			
			replyService.updateReply(vo);
			
			rttr.addAttribute("bno", vo.getBno());
			rttr.addAttribute("page", scri.getPage());
			rttr.addAttribute("perPageNum", scri.getPerPageNum());
			rttr.addAttribute("searchType", scri.getSearchType());
			rttr.addAttribute("keyword", scri.getKeyword());
			
			return "redirect:board/readView";
		}
		
		//?????? ?????? GET
			@RequestMapping(value="/replyDeleteView", method = RequestMethod.GET)
			public String replyDeleteView(ReplyVO vo, SearchCriteria scri, Model model) throws Exception {
				logger.info("reply Write");
				
				model.addAttribute("replyDelete", replyService.selectReply(vo.getRno()));
				model.addAttribute("scri", scri);
				

				return "board/replyDeleteView";
			}
			
		//?????? ??????
		@RequestMapping(value="/replyDelete", method = RequestMethod.POST)
		public String replyDelete(ReplyVO vo, SearchCriteria scri, RedirectAttributes rttr) throws Exception {
			logger.info("reply Write");
			
			replyService.deleteReply(vo);
			
			rttr.addAttribute("bno", vo.getBno());
			rttr.addAttribute("page", scri.getPage());
			rttr.addAttribute("perPageNum", scri.getPerPageNum());
			rttr.addAttribute("searchType", scri.getSearchType());
			rttr.addAttribute("keyword", scri.getKeyword());
			
			return "redirect:board/readView";
		}
			
			
////////////////////////////////////////////////////////////////////////////////////
///////////////////////        replyController         /////////////////////////////	
		
		//?????? ??????
		@RequestMapping(value="/replyWrite", method = RequestMethod.POST)
		public String replyWrite(ReplyVO vo, SearchCriteria scri, RedirectAttributes rttr) throws Exception {
			logger.info("reply Write");
			
			replyService.writeReply(vo);
			
			rttr.addAttribute("bno", vo.getBno());
			rttr.addAttribute("page", scri.getPage());
			rttr.addAttribute("perPageNum", scri.getPerPageNum());
			rttr.addAttribute("searchType", scri.getSearchType());
			rttr.addAttribute("keyword", scri.getKeyword());
			
			return "redirect:/readView";
		}
		
////////////////////////////////////////////////////////////////////////////////////
///////////////////////        memberController         /////////////////////////////	
		
		// ???????????? get
		@RequestMapping(value = "/register", method = RequestMethod.GET)
		public void getRegister() throws Exception {
			logger.info("get register");
		}
		
		// ???????????? post
		@RequestMapping(value = "/register", method = RequestMethod.POST)
		public String postRegister(MemberVO vo) throws Exception {
			logger.info("post register");
			
			memberService.register(vo);
			
			return null;
		}
		
		//????????? POST
		@RequestMapping(value = "/login", method = RequestMethod.POST)
		public String login(MemberVO vo, HttpServletRequest req, RedirectAttributes rttr) throws Exception{
			logger.info("post login");
			
			HttpSession session = req.getSession();
			MemberVO login = memberService.login(vo);
			
			if(login == null) {
				session.setAttribute("member", null);
				rttr.addFlashAttribute("msg", false);
			}else {
				session.setAttribute("member", login);
			}
			
			return "redirect:/";
		}

		//????????? GET
		@RequestMapping(value = "/logout", method = RequestMethod.GET)
		public String logout(HttpSession session) throws Exception{
			
			session.invalidate();
			
			return "redirect:/";
		}
		
		
		
		
		
		
		
		
		
		
		
}
