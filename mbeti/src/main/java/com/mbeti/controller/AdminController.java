package com.mbeti.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/admin/*")
public class AdminController {

   private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
   
   
   // 회원프로필
   @RequestMapping(value = "/admin/test", method = RequestMethod.GET)
   public String admintest() {
      return "/admin/test";
   }
 


   
}