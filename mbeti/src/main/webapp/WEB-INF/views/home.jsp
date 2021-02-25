<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

	
	<jsp:include page="header.jsp"></jsp:include>
	<link rel="stylesheet" href="/resources/css/main.css">
	<!-- header  -->
	
	<!-- main -->

	<div class="main-wrap">
		<div class="layout">
			<div class="main-txt">		
				
				<div class="title-box">
					<strong class="typing">나에게 어울리는 직업이 뭘까?</strong>
					<strong class="title-b"></strong>										
					<!-- <strong class="title-b"><span>직업</span>이 뭘까?</strong> -->
					<div class="title-cont">
						<span class="title-s"><span class="font-s">jam</span>검색으로 나의 성향과 알맞는 직업을 찾아보자!</span>
					</div>
					<div class="btn-cont">
						<div class="btn-box">
							<a href="/match/list" class="btn-jam">나의 직업 잼하러 가기</a>
						</div>					
					</div>
				</div>				
			</div>
			<div class="main-img">
				<img src="/resources/images/main/main_img01.png">	
			</div>	
		</div>
		<div class="svgwrap">
			<?xml version="1.0" encoding="utf-8"?>
            <svg version="1.1" id="Layer_1" x="0px" y="0px" viewBox="0 0 1000 600">
            <path></path>
            </svg>
		</div>
            
           
	</div>
	<script>
        var typingBool = false; 
        var typingIdx=0; 
        var typingTxt = $(".typing").text(); // 타이핑될 텍스트를 가져온다 
        typingTxt=typingTxt.split(""); // 한글자씩 자른다. 
        if(typingBool==false){ // 타이핑이 진행되지 않았다면 
        typingBool=true; 
        
        var tyInt = setInterval(typing,130); // 반복동작 
        } 
        
        function typing(){ 
        if(typingIdx<typingTxt.length){ // 타이핑될 텍스트 길이만큼 반복 
            $(".title-b").append(typingTxt[typingIdx]); // 한글자씩 이어준다. 
            typingIdx++; 
        } else{ 
            clearInterval(tyInt); //끝나면 반복종료 
        } 
        }  
    </script>
    
	<!-- main -->


</body>
</html>