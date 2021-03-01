package com.mbeti.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mbeti.service.AdminService;

@Controller
@RequestMapping("/admin/*")
public class AdminController {

   private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
   
   @Inject
   AdminService service;
   
   // 관리자페이지 홈
   @RequestMapping(value = "/admin/index", method = RequestMethod.GET)
   public String admintest() {
      return "/admin/index";
   }
   
   // 회원 조회
   @RequestMapping(value = "/admin/userList", method = RequestMethod.GET)
   public String userList(Model model) throws Exception{
	    logger.info("list");
		
		model.addAttribute("list",service.list());

		return "/admin/userList";
   }
 


   
}