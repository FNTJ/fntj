<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="java.text.DecimalFormat"%>

<jsp:include page="../header.jsp"></jsp:include>

<div class="contents">
	<div class="layout">
	<jsp:include page="../nav.jsp"></jsp:include>
	<div class="search-result">
		
		<form role="form" method="get">
		
			<div class="form-group">
				<c:forEach items="${jobList}" var = "jobList">
					<c:if test="${jobList.job != null}">
						<div class="center">
							<div class="mtbi-box">
								<div class="wbox">
									<span class="mbti-img" title="${jobList.sub}"></span>
									<span class="mbti-tit"><c:out value="${jobList.mb}" /></span>
									<span class="mbti-key"><c:out value="${jobList.mk}" /> / <c:out value="${jobList.sub}" /></span>
									<div class="job-box">								
										<span>
											<c:if test="${member == null}">당신</c:if>
											<c:if test="${member != null }">${member.userName}님</c:if>
											에게 어울리는 직업은</span>
										<strong>"<c:out value="${jobList.job}" />"</strong>
										<span>입니다.</span>										
									</div>
								</div>
							</div>							
						</div>
						<div class="keyword-info infobox">						
							<div class="subbox" title="${jobList.sub}">
								<span class="subkeyword"></span>
								<strong class="subcont"></strong>
								<span class="subjob"></span>
							</div>
						</div>
						<div class="snsbox">
							<ul class="snsList">
							    <li><a href="#" id="vIconTw" onclick="return false;">트위터<i class='bx bxl-twitter' ></i></a></li>										  
							    <li><a href="#" id="vIconFb" onclick="return false;">페이스북<i class='bx bxl-facebook' ></i></a></li>										  
							    <li><a href="#" id="vIconKs" onclick="return false;">카카오<i class='bx bxs-message-rounded' ></i></a></li>
							    <li><a href="#" id="addurl" onclick="return false;">구글<i class='bx bxl-google' ></i></a></li>										  
							</ul>							
						</div>
						<div class="job-info infobox">
							<h2 class="h2">채용정보</h2>
							<a href="#n" target="_blank" id="target">
							<?xml version="1.0" encoding="utf-8"?>
							<c:import url="http://api.career.co.kr/open?id=eakz6SshfFfdYQ765TLkzQ==&kw=${jobList.job}" />
							</a>
							<span class="center nodata">채용 공고는 없습니다.</span>
						</div>								
					</c:if>
				</c:forEach>
			</div>
			
		</form>
		
		<script>
		// 키워드별 이미지선정
		 $( document ).ready( function() {
			 var cont = $(".mbti-img");
			 var subkey = $(".subkeyword");
			 var subbox = $(".subbox");
			 var subcont = $(".subcont");
			 var subjob = $(".subjob");
			 
			 var key1 = "기술";
			 var key2 = "경영";
			 var key3 = "서비스";
			 var key4 = "교육";
			 var key5 = "미디어";
			 var key6 = "관광";
			 var key7 = "생활";
			 var key8 = "광고";
			 
			 if(cont.attr("title") === key1 || subbox.attr("title") === key1){
				 cont.addClass("key1");
				 subkey.text("#it #기술 #전문");
				 subcont.text("남들과 다른 전문적인 능력을 갖추고, 멋지게 뽐내고 싶으시군요!");
				 subjob.text("이 카테고리에는 법률/의료 관련 전문직과 프로그래머/시스템 관리자/엔지니어 등 각종 컴퓨터/기계관련 직군이 포함됩니다.");
			 }else if(cont.attr("title") === key2 || subbox.attr("title") === key2){
				 cont.addClass("key2");
				 subkey.text("#경영 #금융 #관리");
				 subcont.text("끝내주는 조직의 없어서는 안 될 하나의 톱니바퀴가 되거나,  또는 전문적인 경제 감각을 발휘하고 싶다면?");
				 subjob.text("이 카테고리에는 경영 및 관리·행정직 / 주식, 보험, 회계 등 금융업과 관련된 직군들이 포함됩니다.");
			 }else if(cont.attr("title") === key3 || subbox.attr("title") === key3){
				 cont.addClass("key3"); 
				 subkey.text("#공공 #사회 #서비스");
				 subcont.text("따뜻하고 정의로운 마음을 가지고 멋진 사회의 일원으로서 뿌듯함을 느끼고 싶으신가요? ");
				 subjob.text("이 카테고리에는 경찰/소방관 등 각종 공무 직종이나 필요한 사람들에게 맞춤 서비스를 제공하는 봉사직 / 치료사 등이 포함됩니다.");
			 }else if(cont.attr("title") === key4 || subbox.attr("title") === key4){
				 cont.addClass("key4");
				 subkey.text("#학문 #교육 #인재");
				 subcont.text("새로운 것을 탐구하며 끊임없이 연구하는 일이 적성에 맞거나, 또는 그 지식과 능력을 참된 인재 발굴에 쓰고 싶다면?");
				 subjob.text("이 카테고리에는 교수/교사 등 교육업, 연구원, 학자 등 연구직과 이를 보조하는 직군들이 포함됩니다.");
			 }else if(cont.attr("title") === key5 || subbox.attr("title") === key5){
				 cont.addClass("key5"); 
				 subkey.text("#언론 #방송 #미디어");
				 subcont.text("언제나 유행에 뒤처지지 않는 꼼꼼함으로 트렌드를 이끌어가는 미디어 전문가가 되고 싶다면?");
				 subjob.text("이 카테고리에는 언론/방송 및 공연/예술 관련 직군들이 포함됩니다. 유튜버 또한 요즘 핫한 직군입니다!");
			 }else if(cont.attr("title") === key6 || subbox.attr("title") === key6){
				 cont.addClass("key6"); 
				 subkey.text("#역사 #관광 #운송");
				 subcont.text("낭만을 즐길 줄 아는 여행자이거나 신비로운 역사에 관심이 있으신가요 ?");
				 subjob.text("이 카테고리에는 관광/교통 서비스에 관련된 직업이나 역사와 문화재를 담당하는 전문직들이 포함됩니다. ");
			 }else if(cont.attr("title") === key7 || subbox.attr("title") === key7){
				 cont.addClass("key7"); 
				 subkey.text("#생활 #레저 #식품");
				 subcont.text("사람들의 일상에 ‘소소하지만 확실한 행복(소확행)’을 줄 수 있는 매력적인 직업이 있다면? ");
				 subjob.text("이 카테고리에는 우리의 일상에서 밀접하게 만날 수 있는 생활/식품 관련 직종, 즐거움을 주는 레저/스포츠 관련 직종들이 포함됩니다.");
			 }else{
				 cont.addClass("key8");
				 subkey.text("#광고 #홍보 #시각");
				 subcont.text("탁월한 예술적 감각으로 시선을 사로잡는 당신만의 작품들을 뽐내보세요! ");
				 subjob.text("이 카테고리에는 광고나 이벤트 등 시각적인 디자인이나 프로모션과 관련된 직종들이 포함됩니다. ");
			 }
			 
		 } );
		</script>
		<script> 
			//채용정보 클릭시 넘어가는 url
			$("jobs").on("click",function(){
				var urjob = $(this).find("url").text();
				var tjob = $("#target").attr("href",urjob).trigger("click");
				tjob.trigger("click");				
			});
		</script>
		<script>
			//sns 공유이벤트
			$(document).ready(function(){   
		        $(".snsList li a").click(function(){  
		            shareAct(this);  
		        });  
			});
			  
			function shareAct(a){											  
		        var snsCode = $(a).attr('id');
		          
		        var cUrl = document.location.href;
		        switch(snsCode){  
		            case"vIconTw": //트위터								                
		                cUrl = 'https://twitter.com/intent/tweet?text=jambox:&url='+cUrl;
		            break;                   
		            case"vIconFb": //페이스북								                
		                cUrl = 'http://www.facebook.com/sharer/sharer.php?u='+cUrl;
		            break;  
		            case"vIconKs": //카카오								                
		                cUrl = 'https://story.kakao.com/share?url='+cUrl;
		            break;
		            case 'addurl' : //구글								            	
		            	cUrl = '//plus.google.com/share?url='+cUrl;
	    			break;
		        }											  
		        window.open(cUrl,'','width=600,height=300,top=200,left=200,scrollbars=yes');											  
		    }
		</script>
				
		</div>
	</div><!-- //layout  -->
</div><!-- //contents  -->
<jsp:include page="../footer.jsp"></jsp:include>