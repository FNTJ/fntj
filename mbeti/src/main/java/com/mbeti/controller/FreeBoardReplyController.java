package com.mbeti.controller;


import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mbeti.domain.FreeBoardReplyVO;
import com.mbeti.domain.SearchCriteria;
import com.mbeti.service.FreeBoardReplyService;
import com.mbeti.service.FreeBoardService;


@Controller
@RequestMapping("/freeBoard/*")
public class FreeBoardReplyController {

	private static final Logger logger = LoggerFactory.getLogger(FreeBoardReplyController.class);
	
	@Inject
	FreeBoardService fbservice;
	
	@Inject
	FreeBoardReplyService freeBoardReplyService;
	
	
//댓글 작성
@RequestMapping(value="/freeBoard/replyWrite", method = RequestMethod.POST)
public String replyWrite(FreeBoardReplyVO vo, SearchCriteria scri, RedirectAttributes rttr) throws Exception {
	logger.info("reply Write");
	
	freeBoardReplyService.writeReply(vo);
	
	rttr.addAttribute("bno", vo.getBno());
	rttr.addAttribute("page", scri.getPage());
	rttr.addAttribute("perPageNum", scri.getPerPageNum());
	rttr.addAttribute("searchType", scri.getSearchType());
	rttr.addAttribute("category", scri.getCategory());
	rttr.addAttribute("keyword", scri.getKeyword());
	
	return "redirect:/freeBoard/readView";
}
	
	
	
	
	
	
}