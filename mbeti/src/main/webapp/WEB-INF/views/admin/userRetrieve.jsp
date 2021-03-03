<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="../header.jsp"></jsp:include>

<script type="text/javascript">
		$(document).ready(function(){
			var formObj = $("form[name='readForm']");
			
			// 수정 
			$(".update_btn").on("click", function(){
				formObj.attr("action", "/admin/userUpdate");
				formObj.attr("method", "get");
				formObj.submit();				
			})
			
			// 삭제
			$(".delete_btn").on("click", function(){
				
				var deleteYN = confirm("해당 회원틀 탈퇴시키겠습니가?");
				if(deleteYN == true){
					
				formObj.attr("action", "/admin/delete");
				formObj.attr("method", "post");
				formObj.submit();
					
				}
			})
			
			// 취소
			$(".list_btn").on("click", function(){
				
				location.href = "/admin/userList";
			})
		})
	</script>
	
	<!-- //contents  -->
	<div class="contents">
		<div class="layout about">
		<h2 class="h2">회원 상세조회</h2>
			<jsp:include page="../nav.jsp"></jsp:include>
		
		<div class="register">
				<form name="readForm" role="form" method="post">
					<input type="hidden" id="userID" name="userID" value="${retrieve.userID}" />
				</form>
				<div class="keyword-box">
					<div class="keyword-tit">
						<span><strong class="tit-name">${retrieve.userName}</strong>님</span>
					</div>
					<div class="keyword-cont">
						<div class="keyword-item">
							<span class="keyword-img"></span>
							<span class="keyword-txt" title="${retrieve.keyword1}">${retrieve.keyword1}</span>							
						</div>
						<span class="keyword-key">${retrieve.keyword2}</span>
						<span class="keyword-key">${retrieve.keyword4}</span>
						<span class="keyword-key">${retrieve.keyword5}</span>
					</div>
				</div>
				<script>
					var keytxt = $(".keyword-txt").attr("title");
					var keyimg = $(".keyword-img");
					
					if(keytxt == "IT/기술/전문"){
						keyimg.addClass("k1");
					}else if(keytxt == "경영/금융/관리"){
						keyimg.addClass("k2");
					}else if(keytxt == "공공/사회/서비스"){
						keyimg.addClass("k3");
					}else if(keytxt == "학문/교육/인재"){
						keyimg.addClass("k4");
					}else if(keytxt == "언론/방송/미디어"){
						keyimg.addClass("k5");
					}else if(keytxt == "역사/관광/운송"){
						keyimg.addClass("k6");
					}else if(keytxt == "생활/레저/식품"){
						keyimg.addClass("k7");
					}else{
						keyimg.addClass("k8");
					}
				</script>
				
				<div class="form-group has-feedback">
					<label class="control-label" for="userID">MBTI</label>
					<span class="form-control" id="mb">${retrieve.mb}</span>
					<%-- <input class="form-control" type="text" id="mb" name="mb" value="${member.mb}" readonly="readonly"/> --%>
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="userID">아이디</label>
					<span class="form-control" id="userID">${retrieve.userID}</span>
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="userEmail">이메일</label>
					<span class="form-control" id="userEmail">${retrieve.userEmail}</span>
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="userBirthday">생일</label>
					<span class="form-control">${retrieve.userBirthday}</span>
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="regdate">회원가입일</label>	
					<span class="form-control" id="regdate"><fmt:formatDate value="${retrieve.regdate}" pattern="yyyy년 MM월 dd일" /></span>
				</div>			
				
				<div class="form-group has-feedback form-btn right">
					<button type="submit" class="delete_btn btn btn-primary floatl">회원탈퇴</button>
					<button type="submit" class="update_btn btn btn-success">회원정보 수정</button>
					<button type="submit" class="list_btn btn btn-danger">이전페이지</button>	
				</div>
		</div>
			
		</div><!-- //layout  -->
	</div><!-- //contents  -->

<jsp:include page="../footer.jsp"></jsp:include>
	
	
