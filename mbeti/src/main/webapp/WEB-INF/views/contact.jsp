<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
	

<jsp:include page="header.jsp"></jsp:include>
	
	<!-- //contents  -->
	<div class="contents">
		<div class="layout about">
			
			<!-- 태연  -->
			<div class="cha-box">
				<div class="talkbox">
					<div class="txtbox">
						<strong class="tit">Love to do</strong>						
						<span class="txt">뮤지컬 사진</span>
						<strong class="tit">my Fav</strong>
						<span class="txt">카페라떼 떡볶이 고양이 돌고래 </span>
					</div>
				</div>
				<div class="probox">
					<div class="imgbox">
						<span class="img"></span>
						<span class="imgtxt">ENTJ</span>
					</div>
					<div class="txtbox">
						<strong class="name">Kem Tae Yeon</strong>
						<ul>
							<li>
								<a href="mailto:baenamoo9@gmail.com">baenamoo9@gmail.com</a>
							</li>
							<li>
								<a href="https://github.com/baenamoo" target="_balnk" title="새창열림">baenamoo</a>
							</li>
							<li>DB / Back-End</li>
						</ul>
					</div>
				</div>				
			</div>
			<!-- //태연  -->	
			
			<!-- 연주  -->
			<div class="cha-box">
				<div class="talkbox">
					<div class="txtbox">
						<strong class="tit">Love to do</strong>						
						<span class="txt">전시회 캠핑 영화 마라톤</span>
						<strong class="tit">my Fav</strong>
						<span class="txt">커피 산</span>
					</div>
				</div>
				<div class="probox">
					<div class="imgbox">
						<span class="img"></span>
						<span class="imgtxt">ENTJ</span>
					</div>
					<div class="txtbox">
						<strong class="name">Sung Yeoun Ju</strong>
						<ul>
							<li>
								<a href="mailto:yj0606yj@gmail.com">yj0606yj@gmail.com</a>
							</li>
							<li>
								<a href="https://github.com/sungyeounju" target="_balnk" title="새창열림">sungyeounju</a>
							</li>
							<li>Design / Front-End</li>
						</ul>
					</div>
				</div>				
			</div>
			<!-- //연주  -->	
			
			<!-- 호진  -->
			<div class="cha-box">
				<div class="talkbox">
					<div class="txtbox">
						<strong class="tit">Love to do</strong>						
						<span class="txt">피아노 영화  낮잠</span>
						<strong class="tit">my Fav</strong>
						<span class="txt">민트초코 치킨 </span>
					</div>
				</div>
				<div class="probox">
					<div class="imgbox">
						<span class="img"></span>
						<span class="imgtxt">INTJ</span>
					</div>
					<div class="txtbox">
						<strong class="name">Lee Ho Jin</strong>
						<ul>
							<li>
								<a href="mailto:cacabi24@gmail.com">cacabi24@hanmail.com</a>
							</li>
							<li>
								<a href="https://github.com/cocobi24" target="_balnk" title="새창열림">cocobi24</a>
							</li>
							<li>Server / Back-End</li>
						</ul>
					</div>
				</div>				
			</div>
			<!-- //호진  -->			
			
			<script>
				var tbox = $(".talkbox");
				var pbox = $(".probox");
				
				pbox.on("mouseover", function(){
					tbox.removeClass("on");
					$(this).siblings(".talkbox").addClass("on");
				});
				
			</script>
			
		</div><!-- //layout  -->
	</div><!-- //contents  -->

<jsp:include page="footer.jsp"></jsp:include>
	

