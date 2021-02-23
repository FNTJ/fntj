<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../header.jsp"></jsp:include>

<script type="text/javascript">
   
      $(document).ready(function(){  	
    	  var mtbitxt = $(".mtbi-txt"); 	  
    	  
    	  $("#mb").on("click", function(){
    		  mtbitxt.addClass("on");
    		  var mop = $(this).find("option:selected").val();
    		  if(mop == "INTJ"){
	   			    mtbitxt.text("용의주도한 전략가이시군요!");
	   			}else if(mop == "INTP"){
	   			    mtbitxt.text("아이디어가 넘치는! 논리적인 사색가이시군요!");
	   			}else if(mop == "ENTJ"){
	   			    mtbitxt.text("지도자의 꿈! 대담한 통솔자이시군요!");
	   			}else if(mop == "ENTP"){
	   			    mtbitxt.text("뜨거운 논쟁을 즐기는 변론가이시군요!");
	   			}else if(mop == "INFJ"){
	   			    mtbitxt.text("선의의 옹호자이시군요!");
	   			}else if(mop == "INFP"){
	   			    mtbitxt.text("열정적인 중재자인 당신, 잔다르크이시군요!");
	   			}else if(mop == "ENFJ"){
	   			    mtbitxt.text("언변능숙한 당신, 정의로운 사회운동가이시군요!");
	   			}else if(mop == "ENFP"){
	   			    mtbitxt.text("재기발랄한 활동가이시군요!");
	   			}else if(mop == "ISTJ"){
	   			    mtbitxt.text("깨끗한 청렴결백한 논리주의자이시군요!");
	   			}else if(mop == "ISFJ"){
	   			    mtbitxt.text("내안의 권력이 있는 당신, 용감한 수호자이시군요!");
	   			}else if(mop == "ESTJ"){
	   			    mtbitxt.text("사업자를 꿈꾸는 당신, 엄격한 관리자이시군요!");
	   			}else if(mop == "ESFJ"){
	   			    mtbitxt.text("친밀도 높은 당신, 사교적인 외교관이시군요!");
	   			}else if(mop == "ISTP"){
	   			    mtbitxt.text("만능 재주꾼이시군요!");
	   			}else if(mop == "ISFP"){
	   			    mtbitxt.text("호기심 많은 예술가이시군요!");
	   			}else if(mop == "ESTP"){
	   			    mtbitxt.text("활발한 당신, 모험을 즐기는 사업가이시군요!");
	   			}else if(mop == "ESFP"){
	   			    mtbitxt.text("사교성이 넘치는 당신, 자유로운 영혼의 연예인이시군요!");
	   			}else{
	   				mtbitxt.text("");
	   				mtbitxt.removeClass("on");
	   			}
    	  }); //#mb click
    	  
         $("#searchBtn").on("click", function(){
        	 
         	// 체크여부 확인
         	  if ($("#sub01").is(":checked") == true) {
         		  var sub = $("#sub01").val();
         		  $('#sub').val(sub);
         	  }
         	  if ($("#sub02").is(":checked") == true) {
         		  var sub = $("#sub02").val();
         		  $('#sub').val(sub);
         	  }
         	  if ($("#sub03").is(":checked") == true) {
         		  var sub = $("#sub03").val();
         		  $('#sub').val(sub);
         	  }
         	  if ($("#sub04").is(":checked") == true) {
         		  var sub = $("#sub04").val();
         		  $('#sub').val(sub);
         	  }
         	  if ($("#sub05").is(":checked") == true) {
         		  var sub = $("#sub05").val();
         		  $('#sub').val(sub);
         	  }
         	  if ($("#sub06").is(":checked") == true) {
         		  var sub = $("#sub06").val();
         		  $('#sub').val(sub);
         	  }
         	  if ($("#sub07").is(":checked") == true) {
         		  var sub = $("#sub07").val();
         		  $('#sub').val(sub);
         	  }
         	  if ($("#sub08").is(":checked") == true) {
         		  var sub = $("#sub08").val();
         		  $('#sub').val(sub);
         	  }
        	 
         	// 유효성
            if($("#mb").val()=="MBTI"){
               alert("MBTI를 선택해주세요.");
               $("#mb").focus();
               return false;
            }
            
            if($("#mk").val()=="관심키워드"){
                alert("관심키워드를 선택해주세요.");
                $("#mb").focus();
                return false;
             }
            
            if($("#sub").val()==""){
                alert("직종키워드를 선택해주세요.");
                $("#mb").focus();
                return false;
             }
            
            
            if($("#mb").val() !=null && $("#mk").val() !=null &&$("#sub").val() !=null ){
				 self.location = "result" + '${pageMaker.makeQuery(1)}' 
				 + "&mb=" + $('#mb').val()
				 + "&mk=" + $('#mk').val() 
				 + "&sub=" + $('#sub').val();				 
        	 } 
            
 		});//searchBtn click
 		
 		
 		$(".mbtibtn").on("mouseover mousefocus",function(){
 			$(this).text("클릭하여 검사하러가기!");
 		});
 		$(".mbtibtn").on("mouseleave",function(){
 			$(this).text("mbti를 모르시나요? 지금 당장 검사해보세요!");
 		});
         
});
</script>

<div class="contents">
	<div class="layout">

		<div class="search-cont">
			<div class="searchRe"></div>
				<div class="mbtibox contbox">
					<div class="search-txtbox">
						<strong class="search-tit">MBTI 선택</strong> <span
							class="seaerch-txt">본인의 MBTI를 선택 후 관심있는 키워드를 선택해 주세요.</span>
					</div>
					<div class="search-item">
						<div class="form-group col-sm-4">
							<select id="mb" name="mb" SIZE=1 class="category form-control">
								<option value="MBTI">MBTI</option>
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
							<span class="mtbi-txt"></span>
						</div>

						<div class="form-group col-sm-6">
							<select name="mk" id="mk" class="form-control">
								<OPTION selected>관심키워드</OPTION>
								<OPTION VALUE=지식>지식</OPTION>
								<OPTION VALUE=창의>창의</OPTION>
								<OPTION VALUE=안정>안정</OPTION>
								<OPTION VALUE=도전>도전</OPTION>
							</select>
						</div>
						
					</div>
					<a href="https://www.16personalities.com/ko" target="_blank" title="새창열림" class="mbtibtn">
					mbti를 모르시나요? 지금 당장 검사해보세요!
					</a>
				</div>
				
				<div class="keybox contbox">
					<div class="search-txtbox">
						<strong class="search-tit">키워드 선택</strong> <span
							class="seaerch-txt">본인이 관심있어하는 직종의 키워드를 선택해주세요.</span>
					</div>
					<div class="search-item">
						<div class="form-group">

							<div class="form-group">
							    <input type="radio" id="sub01" name="sub" value="기술"> 
							    <label	for="sub01">IT&middot;기술&middot;전문</label>
								
							    <input type="radio" id="sub02" name="sub" value="경영"> 
							    <label for="sub02">경영&middot;금융&middot;관리</label>
							    	
							    <input type="radio" id="sub03" name="sub" value="서비스"> 
							    <label for="sub03">공공&middot;사회&middot;서비스</label> 
								
							    <input type="radio" id="sub04" name="sub" value="교육"> 
							    <label for="sub04">학문&middot;교육&middot;인재</label>
								
							    <input type="radio" id="sub05" name="sub" value="미디어"> 
							    <label for="sub05">언론&middot;방송&middot;미디어</label>
								
							    <input type="radio" id="sub06" name="sub" value="관광"> 
							    <label for="sub06">역사&middot;관광&middot;운송</label>
								
							    <input type="radio" id="sub07" name="sub" value="생활"> 
							    <label for="sub07">생활&middot;레저&middot;식품</label>
								
							    <input type="radio" id="sub08" name="sub" value="광고"> 
							    <label for="sub08">광고&middot;홍보&middot;시각</label>
							</div>

							<input type="hidden" id="sub" name="sub"> 
						</div>
					</div>
				</div>
				
				<div class="submitbox">
					<input id="searchBtn" type="submit" value="Let's jam!" class="btn btn-success">
				</div>
				
		</div>
		<!-- //search -->
	</div>
	<!-- //layout  -->
</div>
<!-- //contents  -->
<jsp:include page="../footer.jsp"></jsp:include>