<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="../header.jsp"></jsp:include>
<script type="text/javascript">
	$(document).ready(function(){
		// 취소
		$(".cencle").on("click", function(){			
			location.href = "/";					    
		});
	
 		$("#submit").on("click", function(){
			if($("#userPassword").val()==""){
				alert("비밀번호를 입력해주세요.");
				$("#userPassword").focus();
				return false;
			}
			$.ajax({
				url : "/user/passChk",
				type : "POST",
				dateType : "json",
				data : $("#delForm").serializeArray(),
				success: function(data){					
					if(data==true){
						if(confirm("회원탈퇴하시겠습니까?")){
							$("#delForm").submit();
						}
					}else{
						alert("패스워드가 틀렸습니다.");
						return;
					}
				}
			})			
		}); 
		
		// 삭제

	/* $("#submit").on("click", function() {

			if ($("#userPassword").val() == "") {
				alert("비밀번호를 입력해 주세요");
				false;
			} else if ("${member.userPassword}" == $("#userPassword").val()) {
				var deleteYN = confirm("해당 회원틀 탈퇴시키겠습니까?");
				if (deleteYN == true) {
					{
						formObj.attr("action", "/user/memberDelete");
						formObj.attr("method", "post");
						formObj.submit();
					}
				}
			} else {
				alert("비밀번호를 다시 확인해주세요.");
				false;
			}
		})*/

	}); 
</script>

	<!-- //contents  -->
   <div class="contents">
      <div class="layout">
      <h2 class="h2">회원탈퇴</h2>
      <jsp:include page="../nav.jsp"></jsp:include>
		
			<form action="/user/memberDelete" method="post" id="delForm">
				<div class="form-group has-feedback">
					<label class="control-label" for="userID">아이디</label>
					<span class="form-control" id="userID">${member.userID}</span>
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="userPassword">패스워드</label>
					<input class="form-control" type="password" id="userPassword" name="userPassword" />
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="userName">닉네임</label>
					<span class="form-control" id="userName">${member.userName}</span>
				</div>
			</form>
			<div class="form-group has-feedback form-btn">
				<button class="cencle btn btn-danger" type="button">취소</button>
				<button class="btn btn-success" type="button" id="submit">회원탈퇴</button>				
			</div>
			
			</div><!-- //layout  -->
	</div><!-- //contents  -->

<jsp:include page="../footer.jsp"></jsp:include>