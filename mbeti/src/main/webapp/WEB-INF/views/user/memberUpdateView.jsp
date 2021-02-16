<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


	<head>
		<!-- 합쳐지고 최소화된 최신 CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<!-- 부가적인 테마 -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
		
	 	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	 	<jsp:include page="../header.jsp"></jsp:include>
	</head>
	
	
	
	<script type="text/javascript">
		$(document).ready(function(){
			// 취소
			$(".cencle").on("click", function(){
				location.href = "/";
			})
			
			$("#diverge").on("click", function(){
				location.href = "/user/memberDeleteView";
			})
		
			$("#submit").on("click", function(){
				if($("#userPassword").val()==""){
					alert("비밀번호를 입력해주세요.");
					$("#userPassword").focus();
					return false;
				}
				if($("#userName").val()==""){
					alert("성명을 입력해주세요.");
					$("#userName").focus();
					return false;
				}
			});
			
				
			
		})
	</script>
	
		<div class="contents">
			<%@include file="../nav.jsp" %>
		<section id="container">
			<form action="/user/memberUpdate" method="post">
				<div class="form-group has-feedback">
					<label class="control-label" for="userID">아이디</label>
					<input class="form-control" type="text" id="userID" name="userID" value="${member.userID}" readonly="readonly"/>
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="userPassword">패스워드</label>
					<input class="form-control" type="password" id="userPassword" name="userPassword" />
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="userName">닉네임</label>
					<input class="form-control" type="text" id="userName" name="userName" value="${member.userName}" readonly="readonly" />
				</div>
				<div class="form-group has-feedback">
					<button class="btn btn-success" type="submit" id="submit">변경하기</button>
					<button class="btn btn-success" type="button" id="diverge">회원탈퇴</button>
					<button class="cencle btn btn-danger" type="button">취소</button>
				</div>
			</form>
		</section>
	</div>
	
