package com.mbeti.controller;


import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mbeti.domain.MatchingCriteria;
import com.mbeti.domain.MatchingPageMaker;
import com.mbeti.service.MatchService;


@Controller
@RequestMapping("/match/*")
public class MatchController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Inject
	MatchService service;
	
	
	
	// 게시판 목록 조회
		@RequestMapping(value = "/match/list", method = RequestMethod.GET)
		public String list(Model model, @ModelAttribute("mcri") MatchingCriteria mcri) throws Exception{
			logger.info("jobList");
			
			model.addAttribute("jobList",service.jobList(mcri));
			
			MatchingPageMaker pageMaker = new MatchingPageMaker();
			pageMaker.setCri(mcri);
//			pageMaker.setTotalCount(service.listCount(mcri));
			
			model.addAttribute("pageMaker", pageMaker);
			
			return "/match/list";
			
		}
    
			
		// 게시판 목록 조회22
		@RequestMapping(value = "/match/result", method = RequestMethod.GET)
		public String result(Model model, @ModelAttribute("mcri") MatchingCriteria mcri) throws Exception{
			logger.info("jobList");
			
			model.addAttribute("jobList",service.jobList(mcri));
			
			MatchingPageMaker pageMaker = new MatchingPageMaker();
			pageMaker.setCri(mcri);
//			pageMaker.setTotalCount(service.listCount(mcri));
			
			model.addAttribute("pageMaker", pageMaker);
			
			return "/match/result";
			
		}	
			
			
		
		
		
		
}
