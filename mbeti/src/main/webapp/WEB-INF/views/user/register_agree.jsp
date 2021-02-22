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
					<li class="on">
						<span>step 01</span>
						<strong>약관동의</strong>
					</li>
					<li>
						<span>step 02</span>
						<strong>정보입력</strong>
					</li>
					<li>
						<span>step 03</span>
						<strong>가입완료</strong>
					</li>
				</ul>
	                  
				<div class="form-group">
	                  <label class="control-label" for="userAgree">개인정보<br> 수집 동의</label>
	                  <div class="form-control scrollbox">
	                  	<h4>가. 개인정보의 수집 및 이용 목적</h4>	                  	
						<h5>jambox는 다음의 목적을 위하여 개인정보를 처리합니다.</h5>
						<p>처리하고 있는 개인정보는 다음의 목적 이외의 용도로는 이용되지 않으며,
						이용 목적이 변경되는 경우에는 개인정보 보호법 제18조에 따라 별도의 동의를 받는 등 필요한 조치를 이행할 예정입니다.</p>
						<h6>jambox 서비스 제공을 위한 회원관리</h6>						
						<ul>
							<li>가. 수집하는 개인정보의 항목
							① 국가공간정보포털 회원정보(필수): 이름, 이메일(아이디), 비밀번호, 닉네임, 키워드		</li>
							<li>나. 개인정보의 보유 및 이용기간
							① jambox는 법령에 따른 개인정보 보유ㆍ이용기간 또는 정보주체로부터 개인정보를 수집 시에 동의 받은 개인정보 보유ㆍ이용기간 내에서 개인정보를 처리ㆍ보유합니다.</li>
						</ul>
						<h6>jambox 회원정보</h6>
						<ul>
							<li>- 수집근거: 정보주체의 동의</li>
							<li>- 보존기간: 회원 탈퇴 요청 전까지(1년 경과 시 재동의)</li>
							<li>- 보존근거: 정보주체의 동의</li>
						</ul>												
						<p>라. 동의 거부 권리 및 동의 거부에 따른 불이익</p>
						<p>위 개인정보의 수집 및 이용에 대한 동의를 거부할 수 있으나, 동의를 거부할 경우 회원 가입이 제한됩니다.</p>
	                  </div>
                </div>
                <div class="agreebox center">
                	<input id="disagreeck" type="radio" class="rabtn g2" name="grade" value="g2"/>
				    <label for="disagreeck">동의하지 않습니다</label>
                	<input id="agreeck" type="radio" class="rabtn g1" name="grade" value="g1"/>
				    <label for="agreeck">동의합니다 </label>				    
                </div>
				
				<div class="form-group has-feedback form-btn">	
				    <button class="btn btn-success" onclick="chk();" >다음</button> 
				</div>
				
				<script>
					
					function chk() {
						if($('input:radio[value=g1]').is(':checked')){
							console.log("g1 check");
							location.href = "/user/register";
						}else{
							alert("개인정보수집에 동의하셔야 합니다.");
						}
					}
					
				
					/* $(".rabtn").on("click",function(){
						console.log("ss");
						if($('input:radio[value=g1]').is(':checked')){
							console.log("g1 check");
							location.href = "/user/register";
						}else{
							alert("hello~");
						}
					}); */
				</script>
				
				
			</div>	
   
      </div><!-- //layout  -->
   </div><!-- //contents  -->

<jsp:include page="../footer.jsp"></jsp:include>