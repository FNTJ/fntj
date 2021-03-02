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
		$("#adminIndex").on("click", function(){
			location.href="/admin/index";
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
					
						<form name='homeForm' method="post" action="/user/login">
							<c:if test="${member == null}">
								<div class="login-item item">
									<div class="formbox">
										<label for="userID">아이디</label>
										<input type="text" id="userID" name="userID" class="form-control" placeholder="아이디를 입력하세요">
									</div>
									<div class="formbox">
										<label for="userPassword">비밀번호</label>
										<input type="password" id="userPassword" name="userPassword" class="form-control" placeholder="비밀번호를 입력하세요">
									</div>
									<div class="formbox">
										<input type="checkbox" id="idSaveCheck">아이디 기억하기
										<button type="submit" class="loginbtn">로그인</button>
									</div>
								</div>	
								<div class="regis-item item">
									<div class="formbox">
										<span>아직 회원이 아니신가요?</span>
										<span><em>jambox</em>에 가입하면 다양한 혜택이 주어집니다!</span>
										<button id="registerBtn" type="button" class="regisbtn">회원가입</button>
									</div>
								</div>							
							</c:if>
							<c:if test="${member != null }">
								<div class="regis-success">
									<div class="resu-tit">
									<c:if test="${member.enabled == 2 }">
										<span><strong>관리자 ${member.userName}</strong>님, 환영합니다.</span>
										<div class="resbtn">	
											<button id="logoutBtn" class="cencle btn btn-danger btn-sm" type="button">로그아웃</button>
											<button id="adminIndex" class="btn btn-success btn-sm" type="button">관리자페이지</button>
										</div>
									</c:if>
									<c:if test="${member.enabled == 1 }">
										<span><strong>${member.userName}</strong>님, 환영합니다.</span>
										<div class="resbtn">	
											<button id="logoutBtn" class="cencle btn btn-danger btn-sm" type="button">로그아웃</button>
											<button id="memberUpdateBtn" class="btn btn-success btn-sm" type="button">회원정보관리</button>
										</div>
									</c:if>
									</div>
								</div>
							</c:if>
							<c:if test="${msg == false}">
								<script>
									alert("로그인 실패! 아이디와 비밀번호 확인해주세요.");
								</script>
							</c:if>							
						</form>
										
				</div>
			</div>
			
		</div><!-- //layout  -->
	</div><!-- //contents  -->
	
<script type="text/javascript">
	$(document).ready(function(){
		 
	    // 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감.
	    var key = getCookie("key");
	    $("#userID").val(key); 
	     
	    if($("#userID").val() != ""){ // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
	        $("#idSaveCheck").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
	    }
	     
	    $("#idSaveCheck").change(function(){ // 체크박스에 변화가 있다면,
	        if($("#idSaveCheck").is(":checked")){ // ID 저장하기 체크했을 때,
	            setCookie("key", $("#userID").val(), 7); // 7일 동안 쿠키 보관
	        }else{ // ID 저장하기 체크 해제 시,
	            deleteCookie("key");
	        }
	    });
	     
	    // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
	    $("#userID").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
	        if($("#idSaveCheck").is(":checked")){ // ID 저장하기를 체크한 상태라면,
	            setCookie("key", $("#userID").val(), 7); // 7일 동안 쿠키 보관
	        }
	    });
	});
	 
	function setCookie(cookieName, value, exdays){
	    var exdate = new Date();
	    exdate.setDate(exdate.getDate() + exdays);
	    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
	    document.cookie = cookieName + "=" + cookieValue;
	}
	 
	function deleteCookie(cookieName){
	    var expireDate = new Date();
	    expireDate.setDate(expireDate.getDate() - 1);
	    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
	}
	 
	function getCookie(cookieName) {
	    cookieName = cookieName + '=';
	    var cookieData = document.cookie;
	    var start = cookieData.indexOf(cookieName);
	    var cookieValue = '';
	    if(start != -1){
	        start += cookieName.length;
	        var end = cookieData.indexOf(';', start);
	        if(end == -1)end = cookieData.length;
	        cookieValue = cookieData.substring(start, end);
	    }
	    return unescape(cookieValue);
	}
</script>

<jsp:include page="footer.jsp"></jsp:include>
	
	
