<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/qna/detail.jsp</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/nav.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/subFooter.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/subnav.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
<style>
   .content{
      border: 1px dotted gray;
   }
	.reply-form textarea{
		width: 84%;
		height: 100px;
	}
	.reply-form button{
		width: 14%;
		height: 100px;
	}

</style>
</head>
<body>
	<!-- main nav바  -->
	<jsp:include page="/include/nav.jsp"></jsp:include>
	<!-- sub nav바 -->
	<jsp:include page="/include/subnav.jsp">
	  	<jsp:param value="support" name="thisPage"/>
	  	<jsp:param value="faq" name="subPage"/>
	</jsp:include>
	<div class="container" style= "width:800px">
	<h1>1:1문의</h1>
		<table class="table table-bordered table-striped-columns">
				<tr>
					<th>글번호</th>
					<td>${dto.num }</td>
				</tr>
				<tr>
					<th>작성자</th>
					<td>${dto.writer }</td>
				</tr>
				<tr>
					<th>제목</th>
					<td>${dto.title }</td>
				</tr>
				<tr>
					<th>등록일</th>
					<td>${dto.regdate }</td>
				</tr>
				<tr>
					<td colspan="2">
						<div class="content">${dto.content }</div>
					</td>
				</tr>
		
		</table>
		<button class="btn btn-dark" style="float:right" onclick="location.href='delete.do?num=${dto.num }' ">삭제</button>
		<button class="btn btn-dark" style="float:left" onclick="location.href='${pageContext.request.contextPath}/qna/list.do' ">목록보기</button>		
	<div class="reply">
	<c:forEach var="tmp" items="${replyList }">
		<div id="reli${tmp.rnum}">
		
		</div>
		<dl>
			<dt>
				<%--만일 프로필 이미지가 없다면 기본 아이콘 출력 --%>
				<c:if test="${ empty tmp.profile }">
					<svg class="profile-image" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
					  <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
					  <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
					</svg>
				</c:if>
				<%--만일 프로필 이미지가 empty가 아니라면(있다면) 프로필 이미지 출력 --%>
				<c:if test="${not empty tmp.profile }">
					<img class="profile-image" src="${pageContext.request.contextPath}${tmp.profile }"/>
				</c:if>
				<span>${tmp.writer }</span>
				<span>${tmp.regdate }</span>
				<%--답글 링크를 눌렀을때 해당댓글의 글번호를 위해 data-num 속성에 댓글의 번호 넣어두기 --%>
				<a data-num="${tmp.rnum }" href="javascript:" class="reply-link">답글</a>
				<%--만일 글 작성자가 로그인된 사용자와 같다면 수정, 삭제 링크를 출력 --%>
				<c:if test="${ tmp.writer eq sessionScope.id }">
					<a data-num="${tmp.rnum }" class="update-link" href="javascript:">수정</a>
					<a data-num="${tmp.rnum }" class="delete-link" href="javascript:">삭제</a>
				</c:if>
			</dt>
			<dd>
				<%--댓글은 textarea로 입력 받았기 때문에 tab, 공백, 개행 기호도 같이 존재한다.
					html에서 pre요소는 tab, 공백, 개행기호를 해석해주는 요소이기 때문에
					pre 요소의 innerText 로 댓글의 내용을 출력했다.
					그리고 해당 댓글을 javascript로 바로 수정할 수 있도록 댓글 번호를 조합해서
					아이디를 부여해 놓았다.
				 --%>
				<pre id="pre${tmp.rnum }">${tmp.content }</pre>						
			</dd>
		</dl>
	</c:forEach>
	<c:if test="${not empty manager and manager == 'Y'}">
		<form class="reply-form insert-form" action="reply_insert.do" method="post">
			<!-- 원글의 글번호가 답글의 ref_num 번호가 된다. -->
			<input type="hidden" name="ref_num" value="${dto.num }"/>
			<textarea name="content"></textarea>
			<button type="submit">답변 등록</button>
		</form>
	</c:if>
	</div>
	</div>
	<jsp:include page="/include/footer.jsp"></jsp:include>
	<script src="${pageContext.request.contextPath}/resources/js/gura_util.js"></script>
   	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script>
		addUpdateFormListener(".update-form");
		addUpdateListener(".update-link");
		addDeleteListener(".delete-link");
		addReplyListener(".reply-link");
		
		function addUpdateListener(sel){
			//답글 수정 링크 참조값을 배열에 담아오기
			// sel 은  ".page-xxx  .update-link" 형식의 내용이다
			let updateLinks=document.querySelectorAll(sel);
			for(let i=0; i<updateLinks.length; i++){
				updateLinks[i].addEventListener("click", function(){
					//click 이벤트가 일어난 바로 그 요소의 data-num 속성의 value 값을 읽어온다. 
					const num=this.getAttribute("data-num"); //댓글의 글번호
					document.querySelector("#updateForm"+num).style.display="block";
					
				});
			}
		}
	</script>
</body>
</html>