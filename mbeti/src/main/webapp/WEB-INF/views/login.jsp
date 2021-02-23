<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
	
<jsp:include page="header.jsp"></jsp:include>
<script type="text/javascript">
	$(document).ready(function(){
		$("#logoutBtn").on("click", function(){
			location.href="/user/logout";
		});
		$("#memberUpdateBtn").on("click", function(){
			location.href="/user/memberUpdateView";
		});
		$("#registerBtn").on("click", function(){
			location.href="/user/register_agree";
		});		
	});
</script>
	
	<!-- //contents  -->
	<div class="contents">
		<div class="layout">
		
			<div class="login-box">
				<div class="tit-box">
					<strong>login</strong>
					<span>회원로그인</span>
				</div>
				<div class="item-box">
					<div class="login-item item">
						<form name='homeForm' method="post" action="/user/login">
							<c:if test="${member == null}">
								<div class="formbox">
									<label for="userID">아이디</label>
									<input type="text" id="userID" name="userID" class="form-control" placeholder="아이디를 입력하세요">
								</div>
								<div class="formbox">
									<label for="userPassword">비밀번호</label>
									<input type="password" id="userPassword" name="userPassword" class="form-control" placeholder="비밀번호를 입력하세요">
								</div>
								<div class="formbox">
									<button type="submit" class="loginbtn">로그인</button>
								</div>								
							</c:if>
							<c:if test="${member != null }">
								<div>
									<p>${member.userName}님 환영 합니다.</p>
									<button id="memberUpdateBtn" type="button">회원정보관리</button>
									<button id="logoutBtn" type="button">로그아웃</button>
								</div>
							</c:if>
							<c:if test="${msg == false}">
								<script>
									alert("error!");
								</script>
								<p>로그인 실패! 아이디와 비밀번호 확인해주세요.</p>
							</c:if>							
						</form>
					</div>
					<div class="regis-item item">
						<div class="formbox">
							<span>아직 회원이 아니신가요?</span>
							<span><em>jambox</em>에 가입하면 다양한 혜택이 주어집니다!</span>
							<button id="registerBtn" type="button" class="regisbtn">회원가입</button>
						</div>
					</div>
				</div>
			</div>
			
		</div><!-- //layout  -->
	</div><!-- //contents  -->

<jsp:include page="footer.jsp"></jsp:include>
	
	
