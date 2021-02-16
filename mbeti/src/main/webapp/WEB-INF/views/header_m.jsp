<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap">
<link rel="stylesheet" href="//fonts.googleapis.com/css?family=Pacifico" />
<link rel="stylesheet" href="https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css">
<link rel="stylesheet" href="/resources/css/bootstrap.css">
<link rel="stylesheet" href="/resources/css/common.css">
<link rel="stylesheet" href="/resources/css/main.css">

<div class="header">
	<div class="top-left">
		<a href="#n" class="mbti-btn">mbti</a>
	</div>
	<div class="logo">
		<h1><a href="#n" class="logo-btn">jambox</a></h1>
	</div>
	<div class="top-right">
		<div class="login">
			<a href="#n" class="dropdown-toggle login-btn" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
				<i class='bx bx-user-circle' ></i>
			</a>
			<ul class="dropdown-menu">
				<li><a href="login">로그인</a></li>
				<li><a href="register">회원가입</a></li>
			</ul>
		</div>
		<div class="menu">
			
			<a href="#n" class="menu-btn"><span></span></a>
			<div class="menu-box">
				<a href="#n" class="close-btn">
					<i class='bx bx-x'></i>
				</a>			
				<ul class="nav">
					<li><a href="about">About</a></li>
					<li><a href="search"><span>jam</span> Search</a></li>
					<li><a href="/notice/list">Notice</a></li>
					<li><a href="/freeBoard/list">Community</a></li>
				</ul>
				<div class="mypage">
					<a href="#n" class="mypage-btn"><i class='bx bx-user-circle' ></i>mypage</a>
				</div>				
			</div>
		</div>
	</div>
</div>

<script src="/resources/jquery3.3.1.min.js"></script>
<script src="https://unpkg.com/boxicons@latest/dist/boxicons.js"></script>
<script src="/resources/js/bootstrap.js"></script>
<script>
	$(document).ready(function() {
		var menubtn = $(".menu .menu-btn");
		var closebtn = $(".menu .menu-box .close-btn");
		menubtn.on("click", function(){
			$("body").toggleClass("on");
		});
		closebtn.on("click", function(){
			$("body").toggleClass("on");
		});		
	});	
</script>

	
