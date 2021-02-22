<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="../header.jsp"></jsp:include>
      
   
   

   
   <!-- //contents  -->
   <div class="contents">
      <div class="layout">
      <h2 class="h2">회원가입</h2>
      
			<div class="register regagree"> 
				
				<ul class="register-step">
					<li>
						<span>step 01</span>
						<strong>약관동의</strong>
					</li>
					<li>
						<span>step 02</span>
						<strong>정보입력</strong>
					</li>
					<li class="on">
						<span>step 03</span>
						<strong>가입완료</strong>
					</li>
				</ul>
	                  
				
				<div class="regis-success">
					<div class="resu-tit">
						<span>짝짝짝! 회원가입이 완료되었습니다.</span>
						<span>로그인 하여 <em>jambox</em>를 즐겨보세요!</span>
					</div>
				</div>
				
				<div class="form-group has-feedback form-btn">	
				    <a href="/login" class="btn btn-success">로그인 하러가기<i class='bx bxs-chevrons-right'></i></a> 
				</div>
				
			</div>	
   
      </div><!-- //layout  -->
   </div><!-- //contents  -->

<jsp:include page="../footer.jsp"></jsp:include>