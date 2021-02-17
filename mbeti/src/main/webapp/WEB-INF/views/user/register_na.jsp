<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="../header.jsp"></jsp:include>

<<style>
.error_next_box {
    margin-top: 9px;
    font-size: 12px;
    color: red;    
    display: none;
}
#alertTxt {
    position: absolute;
    top: 19px;
    right: 38px;
    font-size: 12px;
    color: red;
    display: none;
}
</style>
		
	<script type="text/javascript">
	
	
		$(document).ready(function(){
			// 취소
			$(".cencle").on("click", function(){
				location.href = "/";
			});
			
			$("#submit").on("click", function(){
				if($("#mb").val()=="----"){
					alert("MBTI를 선택해주세요.");
					$("#mb").focus();
					return false;
				}
				
				if($("#userID").val()==""){
					alert("아이디를 입력해주세요.");
					$("#userId").focus();
					return false;
				}
				
				if($("#userPassword").val()==""){
					alert("비밀번호를 입력해주세요.");
					$("#userPassword").focus();
					return false;
				}
				
				if($("#userName").val()==""){
					alert("닉네임을 입력해주세요.");
					$("#userName").focus();
					return false;
				}
				
				if($("#userEmail").val()==""){
					alert("이메일을 입력해주세요.");
					$("#userEmail").focus();
					return false;
				}
				
				if($("#userBirthday").val()==""){
					alert("생일을 입력해주세요.");
					$("#userBirthday").focus();
					return false;
				}
				var idChkVal = $("#idChk").val();
				if(idChkVal == "N"){
					alert("중복확인 버튼을 눌러주세요.");
					return false;
				}else if(idChkVal == "Y"){
					$("#regForm").submit();
				}
			});
			
		});
		
		
		function fn_idChk(){
			$.ajax({
				url : "/user/idChk",
				type : "post",
				dataType : "json",
				data : {"userID" : $("#userID").val()},
				success : function(data){
					if(data == 1){
						alert("중복된 아이디입니다.");
					}else if(data == 0){
						$("#idChk").attr("value", "Y");
						alert("사용가능한 아이디입니다.");
					}
				}
			})
		}
	</script>
	
	<<script type="text/javascript">
	var id = document.querySelector('#userID');

	var pw1 = document.querySelector('#userPassword');
	var pwMsg = document.querySelector('#alertTxt');

	var pw2 = document.querySelector('#userPassword2');
	var pwMsgArea = document.querySelector('.int_pass');

	var userName = document.querySelector('#userName');
	
	id.addEventListener("focusout", checkId);
	pw1.addEventListener("focusout", checkPw);
	pw2.addEventListener("focusout", comparePw);
	userName.addEventListener("focusout", checkName);
	
	function checkId() {
	    var idPattern = /[a-zA-Z0-9_-]{5,20}/;
	    if(id.value === "") {
	        error[0].innerHTML = "필수 정보입니다.";
	        error[0].style.display = "block";
	    } else if(!idPattern.test(id.value)) {
	        error[0].innerHTML = "5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.";
	        error[0].style.display = "block";
	    } else {
	        error[0].innerHTML = "멋진 아이디네요!";
	        error[0].style.color = "#08A600";
	        error[0].style.display = "block";
	    }
	}
	
	function checkPw() {
	    var pwPattern = /[a-zA-Z0-9~!@#$%^&*()_+|<>?:{}]{8,16}/;
	    if(pw1.value === "") {
	        error[1].innerHTML = "필수 정보입니다.";
	        error[1].style.display = "block";
	    } else if(!pwPattern.test(pw1.value)) {
	        error[1].innerHTML = "8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.";
	        pwMsg.innerHTML = "사용불가";
	        pwMsgArea.style.paddingRight = "93px";
	        error[1].style.display = "block";
	        
	        pwMsg.style.display = "block";
	    } else {
	        error[1].style.display = "none";
	        pwMsg.innerHTML = "안전";
	        pwMsg.style.display = "block";
	        pwMsg.style.color = "#03c75a";
	    }
	}

	function comparePw() {
	    if(pw2.value === pw1.value && pw2.value != "") {
	        error[2].style.display = "none";
	    } else if(pw2.value !== pw1.value) {
	        error[2].innerHTML = "비밀번호가 일치하지 않습니다.";
	        error[2].style.display = "block";
	    } 

	    if(pw2.value === "") {
	        error[2].innerHTML = "필수 정보입니다.";
	        error[2].style.display = "block";
	    }
	}

	function checkName() {
	    var namePattern = /[a-zA-Z가-힣]/;
	    if(userName.value === "") {
	        error[3].innerHTML = "필수 정보입니다.";
	        error[3].style.display = "block";
	    } else if(!namePattern.test(userName.value) || userName.value.indexOf(" ") > -1) {
	        error[3].innerHTML = "한글과 영문 대 소문자를 사용하세요. (특수기호, 공백 사용 불가)";
	        error[3].style.display = "block";
	    } else {
	        error[3].style.display = "none";
	    }
	}
</script>
	
	<!-- //contents  -->
	<div class="contents">
		<div class="layout">
		<h2 class="h2">회원가입</h2>
		
			<div class="register">				
				
				<form action="/user/register" method="post">
					<div class="form-group has-feedback">
						<label class="control-label" for="mb">MBTI</label>
						<SELECT id="mb" name="mb" SIZE=1>
					        <OPTION VALUE=---->-------</OPTION>
					        <OPTION VALUE=INTJ>INTJ</OPTION>
					        <OPTION VALUE=INTP>INTP</OPTION>
					        <OPTION VALUE=ENTJ>ENTJ</OPTION>
					        <OPTION VALUE=ENTP>ENTP</OPTION>
					        <OPTION VALUE=INFJ>INFJ</OPTION>
					        <OPTION VALUE=INFP>INFP</OPTION>
					        <OPTION VALUE=ENFJ>ENFJ</OPTION>
					        <OPTION VALUE=ENFP>ENFP</OPTION>
					        <OPTION VALUE=ISTJ>ISTJ</OPTION>
					        <OPTION VALUE=ISFJ>ISFJ</OPTION>
					        <OPTION VALUE=ESTJ>ESTJ</OPTION>
					        <OPTION VALUE=ESFJ>ESFJ</OPTION>
					        <OPTION VALUE=ISTP>ISTP</OPTION>
					        <OPTION VALUE=ISFP>ISFP</OPTION>
					        <OPTION VALUE=ESTP>ESTP</OPTION>
					        <OPTION VALUE=ESFP>ESFP</OPTION>
			    		</SELECT>
					</div>
					<div class="form-group has-feedback">
						<label class="control-label" for="userID">아이디</label>
						<span class="box int_id">
						<input class="form-control" type="text" id="userID" name="userID" maxlength="30"/>
						</span>
						<span class="error_next_box"></span>
						<button class="idChk btn btn-primary" type="button" id="idChk" onclick="fn_idChk();" value="N">중복확인</button>
					</div>
					<div class="form-group has-feedback">
						<label class="control-label" for="userPassword">비밀번호</label>
					   <span class="box int_pass">
						<input class="form-control" type="password" id="userPassword" name="userPassword" maxlength="30"/>
						</span>
						<span id="alertTxt">사용불가</span>
					</div>
					<div class="form-group has-feedback">
						<label class="control-label" for="userPassword2">비밀번호확인</label>
					  	<span class="box int_pass_check">
						<input class="form-control" type="password" id="userPassword2" name="userPassword2" maxlength="30"/>
						</span>
						<span class="error_next_box"></span>
					</div>
					<div class="form-group has-feedback">
						<label class="control-label" for="userName">닉네임</label>
						<span class="box int_name">
						<input class="form-control" type="text" id="userName" name="userName" maxlength="50"/>
						</span>
						<span class="error_next_box"></span>
					</div>
					<div class="form-group has-feedback">
						<label class="control-label" for="userEmail">이메일</label>
						<span class="box int_email">
						<input class="form-control" type="text" id="userEmail" name="userEmail" maxlength="50"/>
						</span>
						<span class="error_next_box">이메일 주소를 다시 확인해주세요.</span>
					</div>
					<div class="form-group has-feedback">
						<label class="control-label" for="userBirthday">생일</label>
						<input type="date" id="userBirthday" name="userBirthday" />
					</div>
					<div class="form-group has-feedback">
						<label class="control-label" for="keyword1">관심분야1</label>
						<input type="radio" id="keyword1" name="keyword1" value="선택안함" checked="checked">선택안함
						<input type="radio" id="keyword1" name="keyword1" value="사무">사무
						<input type="radio" id="keyword1" name="keyword1" value="경영" >경영
						<input type="radio" id="keyword1" name="keyword1" value="제조" >제조
						<input type="radio" id="keyword1" name="keyword1" value="IT">IT
						<input type="radio" id="keyword1" name="keyword1" value="회계">회계
					</div>
					<div class="form-group has-feedback">
						<label class="control-label" for="keyword2">관심분야2</label>
						<input type="radio" id="keyword2" name="keyword2" value="선택안함" checked="checked">선택안함
						<input type="radio" id="keyword2" name="keyword2" value="사무">사무
						<input type="radio" id="keyword2" name="keyword2" value="경영" >경영
						<input type="radio" id="keyword2" name="keyword2" value="제조" >제조
						<input type="radio" id="keyword2" name="keyword2" value="IT">IT
						<input type="radio" id="keyword2" name="keyword2" value="회계">회계
					</div>
					<div class="form-group has-feedback">
						<label class="control-label" for="keyword3">관심분야3</label>
						<input type="radio" id="keyword3" name="keyword3" value="선택안함" checked="checked">선택안함
						<input type="radio" id="keyword3" name="keyword3" value="사무">사무
						<input type="radio" id="keyword3" name="keyword3" value="경영" >경영
						<input type="radio" id="keyword3" name="keyword3" value="제조" >제조
						<input type="radio" id="keyword3" name="keyword3" value="IT">IT
						<input type="radio" id="keyword3" name="keyword3" value="회계">회계
					</div>
					<div class="form-group has-feedback">
						<label class="control-label" for="keyword4">관심분야4</label>
						<input type="radio" id="keyword4" name="keyword4" value="선택안함" checked="checked">선택안함
						<input type="radio" id="keyword4" name="keyword4" value="사무">사무
						<input type="radio" id="keyword4" name="keyword4" value="경영" >경영
						<input type="radio" id="keyword4" name="keyword4" value="제조" >제조
						<input type="radio" id="keyword4" name="keyword4" value="IT">IT
						<input type="radio" id="keyword4" name="keyword4" value="회계">회계
					</div>
					<div class="form-group has-feedback">
						<label class="control-label" for="keyword5">관심분야5</label>
						<input type="radio" id="keyword5" name="keyword5" value="선택안함" checked="checked">선택안함
						<input type="radio" id="keyword5" name="keyword5" value="사무">사무
						<input type="radio" id="keyword5" name="keyword5" value="경영" >경영
						<input type="radio" id="keyword5" name="keyword5" value="제조" >제조
						<input type="radio" id="keyword5" name="keyword5" value="IT">IT
						<input type="radio" id="keyword5" name="keyword5" value="회계">회계
					</div>
					<div class="form-group has-feedback form-btn">
						<button class="btn btn-success" type="submit" id="submit">회원가입</button>
						<button class="cencle btn btn-danger" type="button">취소</button>
					</div>
				</form>
			</div>
			
			
		</div><!-- //layout  -->
	</div><!-- //contents  -->

<jsp:include page="../footer.jsp"></jsp:include>