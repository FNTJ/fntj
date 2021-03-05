<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="../header.jsp"></jsp:include>
<%	
	String JobKey =  request.getParameter("keyword1");
%>
<!-- //contents  -->
   <div class="contents">
      <div class="layout">
      <h2 class="h2">회원정보</h2>
      <jsp:include page="../nav.jsp"></jsp:include>
      	
		<div class="register">
			<form action="/user/memberUpdateView">
				
				<div class="keyword-box">
					<div class="keyword-tit">
						<span><strong class="tit-name">${member.userName}</strong>님</span>
					</div>
					<div class="keyword-cont">
						<div class="keyword-item">
							<span class="keyword-img"></span>
							<span class="keyword-txt" title="${member.keyword1}">${member.keyword1}</span>							
						</div>
						<span class="keyword-key">${member.keyword2}</span>
						<span class="keyword-key">${member.keyword4}</span>
						<span class="keyword-key">${member.keyword5}</span>
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
					<span class="form-control" id="mb">${member.mb}</span>
					<%-- <input class="form-control" type="text" id="mb" name="mb" value="${member.mb}" readonly="readonly"/> --%>
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="userID">아이디</label>
					<span class="form-control" id="userID">${member.userID}</span>
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="userEmail">이메일</label>
					<span class="form-control" id="userEmail">${member.userEmail}</span>
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="userBirthday">생일</label>
					<span class="form-control">${member.userBirthday}</span>
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="regdate">회원가입일</label>	
					<span class="form-control" id="regdate"><fmt:formatDate value="${member.regdate}" pattern="yyyy년 MM월 dd일" /></span>
				</div>			
				
				<div class="form-group has-feedback form-btn right">
					<button class="btn btn-primary floatl" type="button" onClick="location.href='http://192.168.0.77:8080/user/memberBoard?page=1&perPageNum=10&searchType=w&category=all&keyword=${member.userName}'">내가 작성한 글</button>
					<button class="cencle btn btn-danger" type="button"  onClick="location.href='../home'">취소</button>					
					<button class="userEdit btn btn-success">회원정보변경</button>					
				</div>
			</form>
		</div>
			
		
		
		</div><!-- //layout  -->
	</div><!-- //contents  -->

<jsp:include page="../footer.jsp"></jsp:include>