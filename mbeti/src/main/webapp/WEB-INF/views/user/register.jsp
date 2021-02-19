<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="../header.jsp"></jsp:include>
      
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
            
            if($("#userPassword2").val()==""){
               alert("비밀번호 확인을 입력해주세요.");
               $("#userPassword2").focus();
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
               alert("아이디 중복확인 버튼을 눌러주세요.");
               return false;
            }else if(idChkVal == "Y"){
               $("#regForm").submit();
            }
            
            var nameChkVal = $("#nameChk").val();
            if(nameChkVal == "N"){
               alert("닉네임 중복확인 버튼을 눌러주세요.");
               return false;
            }else if(nameChkVal == "Y"){
               $("#regForm").submit();
            }
         
            //비번-비번확인 일치여부
            if($("#userPassword").val() != $("#userPassword2").val()){
               alert("비밀번호가 일치하지 않습니다.");
               $("#userPassword2").focus();
               return false;
            }
         
            //아이디 패스워드 값 데이터 정규식
              var regul1 = /^[a-zA-Z0-9]{4,12}$/;
              if (!regul1.test($("#userID").val())) {
                 alert("아이디는 4~12자의 대소문자와 숫자로만 입력 가능합니다.");
                 $("#userID").focus();
                  return false;//반환 할 곳 없이 if문 탈출
              }
              
            //아이디 패스워드 값 데이터 정규식
              var pwPattern = /[a-zA-Z0-9~!@#$%^&*()_+|<>?:{}]{8,16}/;
              if (!pwPattern.test($("#userPassword").val())) {
                 alert("비밀번호는 8~16자의 문자를 입력해주세요.");
                 $("#userPassword").focus();
                  return false;//반환 할 곳 없이 if문 탈출
              }
              
            //닉네임 정규식
             var namePattern = /^[a-zA-Z가-힣0-9]{2,}$/;
              if (!namePattern.test($("#userName").val())) {
                 alert("닉네임은 2글자 이상의 문자를 입력해주세요. (특수기호, 공백 사용 불가)");
                 $("#userName").focus();
                  return false;//반환 할 곳 없이 if문 탈출
              }
              
            //이메일 정규식
               var emailPattern = /[a-z0-9]{2,}@[a-z0-9-]{2,}\.[a-z0-9]{2,}/;
                 if (!emailPattern.test($("#userEmail").val())) {
                    alert("이메일 양식을 다시 확인해 주세요");
                    $("#userEmail").focus();
                     return false;//반환 할 곳 없이 if문 탈출
                 }
                 
          //랜덤 닉네임
               var myNic = new Array('1', '2', '3', '4', '5', '6', '7', '8', '9', '0');
               /* document.write(randomItem(myNic), '<br />'); */
               
               
                if($("#mb").val()=="INTJ"){    
                        myNic = new Array('전략', '전략적인', '전술적인', '철두철미한', '계산적인', '상상력이 풍부한', '결단력이있는', '올곧은', '냉소적인', '용의주도한');
                         } else if($("#mb").val()=="INTP"){    
                           myNic = new Array('독특한', '몽상가', '사색가', '아이디어가 쏟아지는', '잠재력이 있는', '논리적인' );
                         } else if($("#mb").val()=="ENTJ"){    
                           myNic = new Array('리더', '빠른 판단력의', '정확성이있는', '계획적인', '의지력이있는', '자아실현적인', '대담한', '통솔자');
                         } else if($("#mb").val()=="ENTP"){    
                           myNic = new Array('비판자', '입담좋은', '의문을 제기하는', '솔직한', '자유분방한', '변론가', '논쟁을 즐기는');
                         } else if($("#mb").val()=="INFJ"){    
                           myNic = new Array('강직한', '의지력이있는', '섬세한', '신념있는', '따듯한', '옹호자', '선의의');
                         } else if($("#mb").val()=="INFP"){    
                           myNic = new Array('긍적적인', '이상주의자', '침착한', '내성적인', '수줍은', '순수한', '양심적인', '창의적인', '친절한', '중재자', '열정적인');
                         } else if($("#mb").val()=="ENFJ"){    
                           myNic = new Array('열정적인', '리더', '공동체적인', '이타주의적인', '정의로운', '사회운동가');
                         } else if($("#mb").val()=="ENFP"){    
                           myNic = new Array('분위기 메이커', '사교적인', '호기심이 많은', '에너지가 넘치는', '독립적인', '열정적인', '진취적인', '통찰력이 있는', '재기발랄한', '활동가');
                         } else if($("#mb").val()=="ISTJ"){    
                           myNic = new Array('실용적인', '헌신적인', '책임감이 있는', '현실적인', '논리주의자', '예리한', '자율적인', '청렴결백한');
                         } else if($("#mb").val()=="ISFJ"){    
                           myNic = new Array('내성적인', '안정적인', '세심한', '겸손한', '섬세한', '용감한', '수호자');
                         } else if($("#mb").val()=="ESTJ"){    
                           myNic = new Array('엄격한', '관리자', '정직한', '헌신적인', '위풍당당한', '단결력 있는', '공명정대한', '엄격한 가치관의', '모범시민');
                         } else if($("#mb").val()=="ESFJ"){    
                           myNic = new Array('사교적인', '외교관', '이타주의적인', '위계질서가 있는', '예민한', '오지랖이 넓은');
                         } else if($("#mb").val()=="ISTP"){    
                           myNic = new Array('만능 재주꾼', '냉철한', '이성주의적인', '호기심이 많은', '즉흥적인', '공정한', '창의적인', '예측불허한');
                         } else if($("#mb").val()=="ISFP"){    
                           myNic = new Array('호기심이 많은', '예술가', '감각적인', '즉흥적인', '실험정신의', '자아성찰적인', '자기중심적인', '자기애의');
                         } else if($("#mb").val()=="ESTP"){    
                           myNic = new Array('모험을 즐기는', '사업가', '직설적인', '자발적인', '이성적인', '관찰력있는', '예리한', '행동력있는', '도덕적인');
                         } else if($("#mb").val()=="ESFP"){    
                           myNic = new Array('자유로운 영혼의', '연예인', '즉흥적인', '사교적인', '단순한', '미적감각이 있는', '독창적인', '관찰력이 풍부한');
                         }

               var random = randomItem(myNic) + " " + $("#userName").val();
               /* document.write(random, '<br />'); */
               
               // 주어진 배열에서 요소 1개를 랜덤하게 골라 반환하는 함수
               function randomItem(a) {
                 return a[Math.floor(Math.random() * a.length)];
               }
               
               $('#userName').val(random);
              
              
         });
         
      });
      
            
   </script>
   
   <script type="text/javascript">
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
   
   function fn_nameChk(){
      $.ajax({
         url : "/user/nameChk",
         type : "post",
         dataType : "json",
         data : {"userName" : $("#userName").val()},
         success : function(data){
            if(data == 1){
               alert("중복된 닉네임입니다.");
            }else if(data == 0){
               $("#nameChk").attr("value", "Y");
               alert("사용가능한 닉네임입니다.");
            }
         }
      })
   }
   </script>
   

   
   <!-- //contents  -->
   <div class="contents">
      <div class="layout">
      <h2 class="h2">회원가입</h2>
      
         <div class="register">            
            
            <form action="/user/register" method="post">
               <div class="form-group">
                  <label class="control-label" for="mb">MBTI</label>
                  <select id="mb" name="mb" SIZE=1>
                       <option value=---->MBTI를 선택하세요</option>
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
               <div class="form-group">
                  <label class="control-label" for="userID">아이디</label>
                  <input class="form-control" type="text" id="userID" name="userID"  maxlength="30" placeholder="아이디를 입력하세요"/>
                  <button class="idChk btn btn-primary" type="button" id="idChk" onclick="fn_idChk();" value="N">중복확인</button>
               </div>
               <div class="form-group">
                  <label class="control-label" for="userPassword">비밀번호</label>
                  <input class="form-control" type="password" id="userPassword" name="userPassword" maxlength="30" placeholder="비밀번호를 입력하세요"/>
               </div>
               <div class="form-group">
                  <label class="control-label" for="userPassword2">비밀번호확인</label>
                  <input class="form-control" type="password" id="userPassword2" name="userPassword2" maxlength="30"/>
               </div>
               <div class="form-group">
                  <label class="control-label" for="userName">닉네임</label>
                  <input class="form-control" type="text" id="userName" name="userName" maxlength="30" placeholder="닉네임을 입력하세요"/>
                  <button class="nameChk btn btn-primary" type="button" id="nameChk" onclick="fn_nameChk();" value="N">중복확인</button>
               </div>
               <div class="form-group">
                  <label class="control-label" for="userEmail">이메일</label>
                  <input class="form-control" type="text" id="userEmail" name="userEmail" maxlength="50" placeholder="example@gmail.com"/>
               </div>
               <div class="form-group">
                  <label class="control-label" for="userBirthday">생일</label>
                  <input type="date" id="userBirthday" name="userBirthday" />
               </div>
               <!-- <div class="form-group">
              	   <label class="control-label" for="keyword1">키워드선택</label>
	               <div class="search-cont">
		              	<div class="search-item">	 		
				 			<input type="radio" id="chk01" name="keyword1" class="keyword1" value="IT/기술/전문">
				 				<label for="chk01">IT&middot;기술&middot;전문</label>
							<input type="radio" id="chk02" name="keyword1" class="keyword1" value="경영/금융/관리">
								<label for="chk02">경영&middot;금융&middot;관리</label>
							<input type="radio" id="chk03" name="keyword1" class="keyword1" value="공공/사회/서비스">
								<label for="chk03">공공&middot;사회&middot;서비스</label>
							<input type="radio" id="chk04" name="keyword1" class="keyword1" value="학문/교육/인재">
								<label for="chk04">학문&middot;교육&middot;인재</label>	
							<input type="radio" id="chk05" name="keyword1" class="keyword1" value="언론/방송/미디어">
								<label for="chk05">언론&middot;방송&middot;미디어</label>
							<input type="radio" id="chk06" name="keyword1" class="keyword1" value="역사/관광/운송">
								<label for="chk06">역사&middot;관광&middot;운송</label>
							<input type="radio" id="chk07" name="keyword1" class="keyword1" value="생활/레저/식품">
								<label for="chk07">생활&middot;레저&middot;식품</label>
							<input type="radio" id="chk08" name="keyword1" class="keyword1" value="광고/홍보/시각">
								<label for="chk08">광고&middot;홍보&middot;시각</label>
			            </div>			            
		            </div>
		            <div class="form-group">
		            	<label class="control-label" for="keyword2">키워드입력</label>
		             	<input class="form-control" type="text" id="keyword2" name="keyword2" placeholder="추가하고싶은 키워드를 입력하세요"/>
                 	</div>
	           </div> -->
	           
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
		            <div class="form-group">
		            	<label class="control-label" for="keyword2">키워드입력</label>
		             	<input class="form-control" type="text" id="keyword2" name="keyword2" placeholder="추가하고싶은 키워드를 입력하세요"/>
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
                  <button class="btn btn-success" type="submit" id="submit">회원가입</button>                  
               </div>
            </form>
         </div>
         
         
      </div><!-- //layout  -->
   </div><!-- //contents  -->

<jsp:include page="../footer.jsp"></jsp:include>