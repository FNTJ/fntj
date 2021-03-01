package com.mbeti.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mbeti.domain.MemberVO;
import com.mbeti.service.AdminService;

@Controller
@RequestMapping("/admin/*")
public class AdminController {

   private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
   
   @Inject
   AdminService service;
   
   @Inject
	BCryptPasswordEncoder pwdEncoder;
   
   // 관리자페이지 홈
   @RequestMapping(value = "/admin/index", method = RequestMethod.GET)
   public String admintest() {
      return "/admin/index";
   }
   
   // 회원 리스트
   @RequestMapping(value = "/admin/userList", method = RequestMethod.GET)
   public String userList(Model model) throws Exception{
	    logger.info("list");
		
		model.addAttribute("list",service.list());

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
   
}