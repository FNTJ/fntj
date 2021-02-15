<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>jambox</title>
<link rel="icon" type="image/png"  href="/resources/images/common/favicon.png"/>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap">
<link rel="stylesheet" href="//fonts.googleapis.com/css?family=Pacifico" />
<link rel="stylesheet" href="https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link rel="stylesheet" type="text/css"	href="/resources/semantic.min.css">
<link rel="stylesheet" href="/resources/css/common.css">

<script src="resources/jquery3.3.1.min.js"></script>
<script src="resources/semantic.min.js"></script>
<script src="/resources/js/bootstrap.js"></script>
<script src="https://unpkg.com/boxicons@latest/dist/boxicons.js"></script>
</head>
<body>

<nav class="navbar navbar-default">
	<div class="navbar-header">
		<button type="button" class="navbar-toggle collapsed" 
		data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"	aria-expanded="false">
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="/main">MBETI</a>
	</div>
	<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
		<ul class="nav navbar-nav">
			<li ><a href="/main">메인</a></li>
			<li><a href="/notice/list">공지사항</a></li>
			<li class="active"><a href="/notice/notice">자유게시판</a></li>
		</ul>
		
		<c:if test="${member == null}">
		<ul class="nav navbar-nav navbar-right">
			<li class="dropdown">
				<a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">접속하기<span class="caret"></span></a>
				<ul class="dropdown-menu">
					<li><a href="home">로그인</a></li>
					<li><a href="/user/register">회원가입</a></li>
				</ul>
			</li>
		</ul>
		</c:if>
		
		<c:if test="${member != null}">
		<ul class="nav navbar-nav navbar-right">
		<li class="dropdown">
			<a href="#" class="dropdown-toggle"
				data-toggle="dropdown" role="button" aria-haspopup="true"
				aria-expanded="false">회원관리<span class="caret"></span></a>
			<ul class="dropdown-menu">
				<li><a href="/user/memberUpdateView">회원정보관리</a></li>
				<li><a href="/user/logout">로그아웃</a></li>
			</ul>
		</li>
		</ul>
		</c:if>
	</div>
</nav>
	
