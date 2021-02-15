package com.mbeti.controller;


import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mbeti.domain.ReplyVO;
import com.mbeti.domain.SearchCriteria;
import com.mbeti.service.BoardService;
import com.mbeti.service.ReplyService;


@Controller
@RequestMapping("/notice/*")
public class ReplyController {

	private static final Logger logger = LoggerFactory.getLogger(ReplyController.class);
	
	@Inject
	BoardService service;
	
	@Inject
	ReplyService replyService;
	
	
//댓글 작성
@RequestMapping(value="/notice/replyWrite", method = RequestMethod.POST)
public String replyWrite(ReplyVO vo, SearchCriteria scri, RedirectAttributes rttr) throws Exception {
	logger.info("reply Write");
	
	replyService.writeReply(vo);
	
	rttr.addAttribute("bno", vo.getBno());
	rttr.addAttribute("page", scri.getPage());
	rttr.addAttribute("perPageNum", scri.getPerPageNum());
	rttr.addAttribute("searchType", scri.getSearchType());
	rttr.addAttribute("keyword", scri.getKeyword());
	
	return "redirect:/notice/readView";
}
	
	
	
	
	
	
}