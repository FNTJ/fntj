package com.mbeti.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.mbeti.domain.MemberVO;


public class AdminInterceptor extends HandlerInterceptorAdapter {

 @Override // 회원의 권한 enabled 를 확인하여 페이지 이동을 제어함
 public boolean preHandle(HttpServletRequest req,
    HttpServletResponse res, Object obj) throws Exception {
  
  HttpSession session = req.getSession();
  MemberVO member = (MemberVO)session.getAttribute("member");
  
  if(member == null) {
	  res.sendRedirect("/login");
	  return false;
	 }
  
  if(member.getEnabled() != 2) {
   res.sendRedirect("/");
   return false;
  }
  
  return true;
 }
}