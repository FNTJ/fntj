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
		<jsp:include page="../nav.jsp"></jsp:include>
		
      		<div class="register">
				<form action="/user/memberUpdate" method="post">
				
					<div class="keyword-box left">
						<div class="keyword-tit">
							<span><strong class="tit-name">${member.userName}</strong>님</span>
						</div>
					</div>
				
				
					<div class="form-group has-feedback">
							<label class="control-label" for="mb">MBTI</label>
							<select id="mb" name="mb" SIZE=1 >
						        <option value="${member.mb}">mbti 변경안함</option>
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
					<div class="form-group">
	              	     <label class="control-label" for="keyword1">키워드선택</label>
		                 <div class="search-cont">
			              	<div class="search-item">	
			              		<ul class="searchobj">
			              			<li>
			              				<input type="radio" id="chk01" name="keyword1" class="keyword1" value="IT/기술/전문">
					 					<label for="chk01">IT&middot;기술&middot;전문</label>
					 				</li>
			              			<li>
			              				<input type="radio" id="chk02" name="keyword1" class="keyword1" value="경영/금융/관리">
										<label for="chk02">경영&middot;금융&middot;관리</label>
									</li>
			              			<li>
			              				<input type="radio" id="chk03" name="keyword1" class="keyword1" value="공공/사회/서비스">
										<label for="chk03">공공&middot;사회&middot;서비스</label>
			              			</li>
			              			<li>
				              			<input type="radio" id="chk04" name="keyword1" class="keyword1" value="학문/교육/인재">
										<label for="chk04">학문&middot;교육&middot;인재</label>	
			              			</li>
			              			<li>
			              				<input type="radio" id="chk05" name="keyword1" class="keyword1" value="언론/방송/미디어">
										<label for="chk05">언론&middot;방송&middot;미디어</label>
			              			</li>
			              			<li>
			              				<input type="radio" id="chk06" name="keyword1" class="keyword1" value="역사/관광/운송">
										<label for="chk06">역사&middot;관광&middot;운송</label>
			              			</li>
			              			<li>
			              				<input type="radio" id="chk07" name="keyword1" class="keyword1" value="생활/레저/식품">
										<label for="chk07">생활&middot;레저&middot;식품</label>
			              			</li>
			              			<li>
			              				<input type="radio" id="chk08" name="keyword1" class="keyword1" value="광고/홍보/시각">
										<label for="chk08">광고&middot;홍보&middot;시각</label>
			              			</li>
			              		</ul> 
			              		<ul class="boxcount">
			              			<li class="box_count"><input type="radio" name="keyword3" class="keyword3" value="k1"></li>
			              			<li class="box_count"><input type="radio" name="keyword3" class="keyword3" value="k2"></li>
			              			<li class="box_count"><input type="radio" name="keyword3" class="keyword3" value="k3"></li>
									<li class="box_count"><input type="radio" name="keyword3" class="keyword3" value="k4"></li>
									<li class="box_count"><input type="radio" name="keyword3" class="keyword3" value="k5"></li>
									<li class="box_count"><input type="radio" name="keyword3" class="keyword3" value="k6"></li>
									<li class="box_count"><input type="radio" name="keyword3" class="keyword3" value="k7"></li>
									<li class="box_count"><input type="radio" name="keyword3" class="keyword3" value="k8"></li>
			              		</ul>
				            </div>			            
			            </div>
			             <div class="form-group fa">
			            	<label class="control-label" for="keyword2">키워드입력</label>
			             	<input class="form-control" type="text" id="keyword2" value="${member.keyword2}" name="keyword2" placeholder="추가하고싶은 키워드를 입력하세요"/>
			             	<input class="form-control" type="text" id="keyword4" value="${member.keyword4}" name="keyword4" placeholder="추가하고싶은 키워드를 입력하세요"/>
			             	<input class="form-control" type="text" id="keyword5" value="${member.keyword5}" name="keyword5" placeholder="추가하고싶은 키워드를 입력하세요"/>
	               		</div>
		           </div>
		           <script>
			            var obj = $(".search-item");
			    		obj.ul = obj.find(" .searchobj");
			    		obj.btn = obj.ul.find("input");
				    	var count = $("[class*='box_count']");
				    	
			    		function fn_set_box(idx){
			    			//count.removeClass("active").eq(idx).addClass("active");
			    			var ctf = $(count.eq(idx).find("input"));
			    			ctf.prop("checked",true);
			    		}
			    		obj.btn.on("click", function(){
			    			var idx = obj.btn.parent().index($(this).parent());
			    			fn_set_box(idx);
			    		});
					</script>
					<div class="form-group has-feedback form-btn">
						<button class="cencle btn btn-danger" type="button">취소</button>						
						<button class="btn btn-primary" type="button" id="diverge">회원탈퇴</button>
						<button class="btn btn-success" type="submit" id="submit">변경하기</button>
						
					</div>
				</form>
			</div>

		</div><!-- //layout  -->
   </div><!-- //contents  -->

<jsp:include page="../footer.jsp"></jsp:include>