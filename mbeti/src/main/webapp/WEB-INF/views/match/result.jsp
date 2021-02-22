<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="java.text.DecimalFormat"%>

<jsp:include page="../header.jsp"></jsp:include>

<div class="contents">
		<div class="layout">
		<jsp:include page="../nav.jsp"></jsp:include>
		<div class="search-result">
		
		<script>
			
			
			var notrim = $(".job-info *");
			//notrim.trim();
			$.trim(notrim);
			//notrim.replace(/^[\s\u00a0]+|[\s\u00a0]+$/g, '');
		</script>
		
		
				<form role="form" method="get">
				
					<div class="form-group">
						<c:forEach items="${jobList}" var = "jobList">
							<c:if test="${jobList.job != null}">
								<div class="center">
									<div class="mtbi-box">
										<span class="mbti-img" title="${jobList.sub}"></span>
										<span class="mbti-tit"><c:out value="${jobList.mb}" /></span>
										<span class="mbti-key">#<c:out value="${jobList.mk}" /> #<c:out value="${jobList.sub}" /></span>
										<div class="job-box">
											<span>당신에게 어울리는 직업은</span>
											<strong>"<c:out value="${jobList.job}" />"</strong>
											<span>입니다.</span>										
										</div>
									</div>
									<div class="snsbox">
										<ul class="snsList">
										    <li><a href="#" id="vIconTw" onclick="return false;">트위터<i class="vIconTw"></i></a></li>										  
										    <li><a href="#" id="vIconFb" onclick="return false;">페이스북<i class="vIconFb"></i></a></li>										  
										    <li><a href="#" id="vIconKs" onclick="return false;">카카오<i class="vIconKs"></i></a></li>
										    <li><a href="#" id="addurl" onclick="return false;">구글<i class="addurl"></i></a></li>										  
										</ul>
										<script>
											$(document).ready(function(){   
										        $(".snsList li a").click(function(){  
										            shareAct(this);  
										        });  
											});
											  
											function shareAct(a){											  
										        var snsCode = $(a).attr('id');
										          
										        var cUrl = document.location.href;
										        switch(snsCode){  
										            case"vIconTw":
										                //트위터
										                cUrl = 'https://twitter.com/intent/tweet?text=jambox:&url='+cUrl;
										            break;                   
										            case"vIconFb":
										                //페이스북
										                cUrl = 'http://www.facebook.com/sharer/sharer.php?u='+cUrl;
										            break;  
										            case"vIconKs":
										                //카카오
										                cUrl = 'https://story.kakao.com/share?url='+cUrl;
										            break;
										            case 'addurl' :
										            	//구글
										            	cUrl = '//plus.google.com/share?url='+cUrl;
									    			break;
										        }											  
										        window.open(cUrl,'','width=600,height=300,top=200,left=200,scrollbars=yes');											  
										    }
										</script>
									</div>
								</div>
								<div class="job-info">
									<h2 class="h2">채용정보</h2>
									<?xml version="1.0" encoding="utf-8"?>
									<c:import url="http://api.career.co.kr/open?id=eakz6SshfFfdYQ765TLkzQ==&kw=${jobList.job}" />
									<span class="center nodata">채용 공고는 없습니다.</span>
								</div>								
							</c:if>
						</c:forEach>
					</div>
				</form>
				
				<script>
				 $( document ).ready( function() {
					 var cont = $(".mbti-img");
					 var key1 = "기술";
					 var key2 = "경영";
					 var key3 = "서비스";
					 var key4 = "교육";
					 var key5 = "미디어";
					 var key6 = "관광";
					 var key7 = "생활";
					 var key8 = "광고";
					 
					 if(cont.attr("title") === key1){
						 cont.addClass("key1"); 
					 }else if(cont.attr("title") === key2){
						 cont.addClass("key2");
					 }else if(cont.attr("title") === key3){
						 cont.addClass("key3"); 
					 }else if(cont.attr("title") === key4){
						 cont.addClass("key4"); 
					 }else if(cont.attr("title") === key5){
						 cont.addClass("key5"); 
					 }else if(cont.attr("title") === key6){
						 cont.addClass("key6"); 
					 }else if(cont.attr("title") === key7){
						 cont.addClass("key7"); 
					 }else{
						 cont.addClass("key8"); 
					 }
					 
				 } );
				</script>
		
		
				<script>
					
					
				
					$("jobs").on("click",function(){
						console.log("hello");
						var urjob = $(this).find("url");
						//location.href = $(this).find("url");
					});
				</script>
				
			</div>
		</div><!-- //layout  -->
	</div><!-- //contents  -->
	<jsp:include page="../footer.jsp"></jsp:include>