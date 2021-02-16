package com.mbeti.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mbeti.domain.MemberVO;
import com.mbeti.service.MemberService;

@Controller
@RequestMapping("/user/*")
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Inject
	MemberService service;
	
	
// 회원가입 get
@RequestMapping(value = "/user/register", method = RequestMethod.GET)
public void getRegister() throws Exception {
	logger.info("get register");
}

// 아이디 중복 체크
@ResponseBody
@RequestMapping(value="/user/idChk", method = RequestMethod.POST)
public int idChk(MemberVO vo) throws Exception {
	int result = service.idChk(vo);
	return result;
}

// 회원가입 post
@RequestMapping(value = "/user/register", method = RequestMethod.POST)
public String postRegister(MemberVO vo) throws Exception {
	logger.info("post register");
	int result = service.idChk(vo);
	try {
		if(result == 1) {
			return "/user/register";
		}else if(result == 0) {
			service.register(vo);
		}
		// 요기에서~ 입력된 아이디가 존재한다면 -> 다시 회원가입 페이지로 돌아가기 
		// 존재하지 않는다면 -> register
	} catch (Exception e) {
		throw new RuntimeException();
	}
	return "redirect:/";
}

//로그인 POST
@RequestMapping(value = "/user/login", method = RequestMethod.POST)
public String login(MemberVO vo, HttpServletRequest req, RedirectAttributes rttr) throws Exception{
	logger.info("post login");
	
	HttpSession session = req.getSession();
	MemberVO login = service.login(vo);
	
	if(login == null) {
		session.setAttribute("member", null);
		rttr.addFlashAttribute("msg", false);
	}else {
		session.setAttribute("member", login);
	}
	
	return "redirect:/";
}

//로그인 GET
@RequestMapping(value = "/user/logout", method = RequestMethod.GET)
public String logout(HttpSession session) throws Exception{
	
	session.invalidate();
	
	return "redirect:/";
}

//회원정보수정 뷰
@RequestMapping(value="/user/memberUpdateView", method = RequestMethod.GET)
public String registerUpdateView() throws Exception{
	
	return "/user/memberUpdateView";
}

//회원정보수정
@RequestMapping(value="/user/memberUpdate", method = RequestMethod.POST)
public String registerUpdate(MemberVO vo, HttpSession session) throws Exception{
	
	service.memberUpdate(vo);
	
	session.invalidate();
	
	return "redirect:/";
}

// 회원 탈퇴 get
@RequestMapping(value="/user/memberDeleteView", method = RequestMethod.GET)
public String memberDeleteView() throws Exception{
	return "/user/memberDeleteView";
}

// 회원 탈퇴 post
@RequestMapping(value="/user/memberDelete", method = RequestMethod.POST)
public String memberDelete(MemberVO vo, HttpSession session, RedirectAttributes rttr) throws Exception{
	
	MemberVO member = (MemberVO) session.getAttribute("member");
	String sessionPass = member.getUserPassword();
	String voPass = vo.getUserPassword();
	
	if(!(sessionPass.equals(voPass))) {
		rttr.addFlashAttribute("msg", false);
		return "redirect:/user/memberDeleteView";
	}
	service.memberDelete(vo);
	session.invalidate();
	return "redirect:/";
}

	// 패스워드 체크
	@ResponseBody
	@RequestMapping(value="/user/passChk", method = RequestMethod.POST)
	public int passChk(MemberVO vo) throws Exception {
		int result = service.passChk(vo);
		return result;
	}
	
	
	// 회원프로필
	@RequestMapping(value = "/user/memberProfile", method = RequestMethod.GET)
	public String memberProfile() {
		return "/user/memberProfile";
	}
	
	
	
	
	
}