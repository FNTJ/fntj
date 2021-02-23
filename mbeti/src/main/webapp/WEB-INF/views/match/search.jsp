<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
	
<jsp:include page="../header.jsp"></jsp:include>

	<!-- //contents  -->
	<div class="contents">
		<div class="layout">
			
			<div class="search-cont">
				 <div class="searchRe"></div>
				 <form method="get" action="search_result">
				 	<div class="mbtibox">
					 	<div class="search-txtbox">
				 			<strong class="search-tit">MBTI 선택</strong>
				 			<span class="seaerch-txt">본인의 MBTI를 선택 후 관심있는 키워드를 선택해 주세요.</span>
				 		</div>
				 		<div class="search-item">
						 	<div class="form-group col-sm-4">				 						 		
							 	<select name="mbti" id="mbtibox" onchange="categoryChange(this)" class="form-control">							 	
						            <option value="">MBTI</option>
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
					            </select>z
				            </div>
				            <div class="form-group col-sm-6">			            			 		
					            <select name="keyword" id="select_key" class="form-control">
					            	<option value="">---------</option>
					            </select>
				            </div>
			            </div>
		            </div>
		            <div class="keybox">
			            <div class="search-txtbox">
				 			<strong class="search-tit">키워드 선택</strong>
				 			<span class="seaerch-txt">본인이 관심있어하는 직종의 키워드를 선택해주세요.</span>
				 		</div>	
				 		<div class="search-item">
					 		<div class="form-group col-sm-12">
					 			<input type="radio" id="chk01" name="chk_info" value="IT/컴퓨터">
					 				<label for="chk01">IT/컴퓨터</label>
								<input type="radio" id="chk02" name="chk_info" value="서비스">
									<label for="chk02">서비스</label>
								<input type="radio" id="chk03" name="chk_info" value="교육">
									<label for="chk03">교육</label>
								<input type="radio" id="chk04" name="chk_info" value="영업">
									<label for="chk04">영업</label>	
				            </div>
			            </div>
			 		</div>
			 		<div class="submitbox">
				 		<input type="submit" value="Let's jam!" class="btn btn-success">
				 	</div>		 	
				 </form>
			 </div>
			
		</div><!-- //layout  -->
	</div><!-- //contents  -->



<script>
	/* 동적 select */
    function categoryChange(e) {
    var mbtiword;
    var INTJ = ["00", "01", "02", "03"];
    var INTP = ["10", "11", "12", "13"];
    var ENTJ = ["20", "21", "22", "23", "24"];
    var ENTP = [];
    var INFJ = [];
    var INFP = [];
    var ENFJ = [];
    var ENFP = [];
    var ISTJ = [];
    var ISFJ = [];
    var ESTJ = [];
    var ESFJ = [];
    var ISTP = [];
    var ISFP = [];
    var ESTP = [];
    var ESFP = [];
    var target = document.getElementById("select_key");
 
    if(e.value == "INTJ") var d = INTJ;
    else if(e.value == "INTP") var d = INTP;
    else if(e.value == "ENTJ") var d = ENTJ;
    
 
    target.options.length = 0;
 
    for (x in d) {
        var opt = document.createElement("option");
        opt.value = d[x];
        opt.innerHTML = d[x];
        target.appendChild(opt);
    }    
}
</script>


<jsp:include page="../footer.jsp"></jsp:include>
	
	
