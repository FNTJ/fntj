<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../header.jsp"></jsp:include>

<script type="text/javascript">
   
      $(document).ready(function(){
    
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
            
 	});
         
});
</script>

<div class="contents">
	<div class="layout">

		<div class="search-cont">
			<div class="searchRe"></div>
				<div class="mbtibox">
					<div class="search-txtbox">
						<strong class="search-tit">MBTI 선택</strong> <span
							class="seaerch-txt">본인의 MBTI를 선택 후 관심있는 키워드를 선택해 주세요.</span>
					</div>
					<div class="search-item">
						<div class="form-group col-sm-4">
							<SELECT id="mb" name="mb" SIZE=1 class="category form-control">
								<OPTION selected>MBTI</OPTION>
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
				</div>
				
				<div class="keybox">
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