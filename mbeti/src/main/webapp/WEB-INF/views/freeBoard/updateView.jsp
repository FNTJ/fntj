<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	
<jsp:include page="../header.jsp"></jsp:include>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		
		var formObj = $("form[name='updateForm']");
		
		$(document).on("click","#fileDel", function(){
			$(this).parent().remove();
		})
		
		fn_addFile();
		
		$(".cancel_btn").on("click", function(){
			event.preventDefault();
			location.href = "/freeBoard/readView?bno=${fbUpdate.bno}"
				   + "&page=${scri.page}"
				   + "&perPageNum=${scri.perPageNum}"
				   + "&searchType=${scri.searchType}"
				   + "&category=${scri.category}"
				   + "&keyword=${scri.keyword}";
		})
		
		$(".update_btn").on("click", function(){
			if(fn_valiChk()){
				return false;
			}
			formObj.attr("action", "/freeBoard/update");
			formObj.attr("method", "post");
			formObj.submit();
		})
	})
	
	function fn_valiChk(){
		var updateForm = $("form[name='updateForm'] .chk").length;
		for(var i = 0; i<updateForm; i++){
			if($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null){
				alert($(".chk").eq(i).attr("title"));
				return true;
			}
		}
	}
		function fn_addFile(){
		var fileIndex = 1;
		//$("#fileIndex").append("<div><input type='file' style='float:left;' name='file_"+(fileIndex++)+"'>"+"<button type='button' style='float:right;' id='fileAddBtn'>"+"추가"+"</button></div>");
		$(".fileAdd_btn").on("click", function(){
			$("#fileIndex").append("<div class='uploadbox'><input type='file' class='fileinput' name='file_"+(fileIndex++)+"'>"+"</button>"+"<button type='button' class='btn btn-sm btn-basic' id='fileDelBtn'>"+"삭제"+"</button></div>");
		});
		$(document).on("click","#fileDelBtn", function(){
			$(this).parent().remove();
			
		});
	}
		var fileNoArry = new Array();
		var fileNameArry = new Array();
		function fn_del(value, name){
			
			fileNoArry.push(value);
			fileNameArry.push(name);
			$("#fileNoDel").attr("value", fileNoArry);
			$("#fileNameDel").attr("value", fileNameArry);
		}
</script>
	<body>
	
		<div class="contents">
			<div class="layout">
				<h2 class="h2">공지사항 글 수정</h2>	
				<jsp:include page="../nav.jsp"></jsp:include>
		
				<form name="updateForm" role="form" method="post" action="/freeBoard/update" enctype="multipart/form-data">
					<input type="hidden" name="bno" value="${fbUpdate.bno}" readonly="readonly"/>
					<input type="hidden" id="page" name="page" value="${scri.page}"> 
					<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
					<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
					<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}"> 
					<input type="hidden" id="fileNoDel" name="fileNoDel[]" value=""> 
					<input type="hidden" id="fileNameDel" name="fileNameDel[]" value=""> 
					
					
					<div class="form-group">
						<label for="category">카테고리</label>
						<select id="category" name="category" class="chk form-control" title="카테고리를 선택해주세요.">
				            <option value="${fbUpdate.category}">${fbUpdate.category}</option>
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
						<label for="title">제목</label>
						<input type="text" id="title" name="title" class="chk form-control" value="${fbUpdate.title}" placeholder="제목을 입력하세요." title="제목을 입력하세요."/>
					</div>
					<div class="form-group">
						<label for="content">내용</label>
						<textarea id="content" name="content" class="chk" placeholder="내용을 입력하세요." title="내용을 입력하세요." style="resize: none;"><c:out value="${fbUpdate.content}" /></textarea>
					</div>
					<div class="form-group">
						<label for="writer">작성자</label>
						<input type="text" id="writer" name="writer" class="chk" title="작성자를 입력하세요." value="${fbUpdate.writer}" />
					</div>
					<div class="form-group">
						<label for="fileIndex">파일</label>
						<button type="button" class="fileAdd_btn btn btn-basic">파일추가</button>
						<div id="fileIndex" class="formcontrol">
						</div>
						<c:forEach var="file" items="${file}" varStatus="var">						
						<div id="filereup" class="formcontrol">							
							<input type="hidden" id="FILE_NO" name="FILE_NO_${var.index}" value="${file.fno }">
							<input type="hidden" id="FILE_NAME" name="FILE_NAME" value="FILE_NO_${var.index}">
							<a href="#" id="fileName" onclick="return false;">${file.org_fname}</a>(${file.fsize}KB)
							<button id="fileDel" onclick="fn_del('${file.fno}','FILE_NO_${var.index}');" type="button" class=" btn btn-sm btn-basic">삭제</button><br>
						</div>
						</c:forEach>					
					</div>
					<div class="form-group">
						<label for="regdate">작성날짜</label>
						<fmt:formatDate value="${fbUpdate.date}" pattern="yyyy-MM-dd"/>							
					</div>					
					<div class="form-group form-btn">
						<button type="submit" class="cancel_btn btn btn-basic">취소</button>
						<a href="/freeBoard/list" class="btn btn-danger">목록</a>
						<button type="submit" class="update_btn btn btn-success">저장</button>
					</div>
				</form>
			
			</div><!-- //layout  -->
		</div><!-- //contents  -->

<jsp:include page="../footer.jsp"></jsp:include>