<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="../header.jsp"></jsp:include>
	
	
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
	
 <!-- //contents  -->
   <div class="contents">
		<div class="layout">
		<h2 class="h2">회원정보 수정</h2>
      
			<form action="/user/memberUpdate" method="post">
				<div class="form-group has-feedback">
						<label class="control-label" for="mb">MBTI</label>
						<select id="mb" name="mb" SIZE=1 >
					        <option value="${member.mb}">변경안함</option>
					        <option value="INTJ">INTJ</option>
			           		<option value="INTP">INTP</option>
				            <option value="ENTJ">ENTJ</option>
				            <option value="ENTP">ENTP</option>
				            <option value="INFJ">INFJ</option>
				            <option value="INFP">INFP</option>
				            <option value="ENFJ">ENFJ</option>
				            <option value="ENFP">ENFP</option>
				            <option value="ISTJ">ISTJ</option>
				            <option value="ISFJ">ISFJ</option>
				            <option value="ESTJ">ESTJ</option>
				            <option value="ESFJ">ESFJ</option>
				            <option value="ISTP">ISTP</option>
				            <option value="ISFP">ISFP</option>
				            <option value="ESTP">ESTP</option>
				            <option value="ESFP">ESFP</option>	
			    		</select>
					</div>
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

		</div><!-- //layout  -->
   </div><!-- //contents  -->

<jsp:include page="../footer.jsp"></jsp:include>