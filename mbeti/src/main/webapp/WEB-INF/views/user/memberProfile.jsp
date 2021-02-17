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

		<div class="contents">
			<%@include file="../nav.jsp" %>
			<form action="/user/memberUpdateView">
				<div class="form-group has-feedback">
					<label class="control-label" for="userID">MBTI</label>
					<input class="form-control" type="text" id="mb" name="mb" value="${member.mb}" readonly="readonly"/>
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="userID">아이디</label>
					<input class="form-control" type="text" id="userID" name="userID" value="${member.userID}" readonly="readonly"/>
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="userName">닉네임</label>
					<input class="form-control" type="text" id="userName" name="userName" value="${member.userName}"  readonly="readonly"/>
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="userEmail">이메일</label>
					<input class="form-control" type="text" id="userEmail" name="userEmail" value="${member.userEmail}"  readonly="readonly"/>
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="userBirthday">생일</label>
					<input class="form-control" type="text" id="userBirthday" name="userBirthday" value="${member.userBirthday}"  readonly="readonly"/>
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="keyword1">키워드1</label>
					<input class="form-control" type="text" id="keyword1" name="keyword1" value="${member.keyword1}" readonly="readonly"/>
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="keyword1">키워드2</label>
					<input class="form-control" type="text" id="keyword2" name="keyword2" value="${member.keyword2}" readonly="readonly"/>
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="keyword1">키워드3</label>
					<input class="form-control" type="text" id="keyword3" name="keyword3" value="${member.keyword3}" readonly="readonly"/>
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="keyword1">키워드4</label>
					<input class="form-control" type="text" id="keyword4" name="keyword4" value="${member.keyword4}" readonly="readonly"/>
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="keyword1">키워드5</label>
					<input class="form-control" type="text" id="keyword5" name="keyword5" value="${member.keyword5}" readonly="readonly"/>
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="regdate">회원가입일</label>
					
					<input class="form-control" type="text" id="regdate" name="regdate" value="<fmt:formatDate value="${member.regdate}" pattern="yyyy년 MM월 dd일" />"readonly="readonly"/>
				</div>
				<div class="form-group has-feedback">
					<button class="userEdit btn btn-success">회원정보변경</button>
					<button class="cencle btn btn-danger" type="button">취소</button>
				</div>
			</form>
					<button class="btn btn-success" onClick="location.href='/user/memberBoard'">내가 작성한 글</button>
		</div>

		
	
<jsp:include page="../footer.jsp"></jsp:include>