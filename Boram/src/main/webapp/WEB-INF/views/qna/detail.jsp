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
	  	<jsp:param value="cs" name="thisPage"/>
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
			<%--만일 답글의 글번호가 댓글의 그룹와 같다면(원글의 댓글이라면) --%>
			<c:if test="${tmp.rnum eq tmp.ref_num }">
				<li id="reli${tmp.rnum }">
			</c:if>
			<dl>
				<dt>
					<c:if test="${ tmp.writer eq sessionScope.id }">
						<a data-num="${tmp.rnum }" class="update-link" href="javascript:">수정</a>
						<a data-num="${tmp.rnum }" class="delete-link" href="javascript:">삭제</a>
					</c:if>
				</dt>
				<dd>
					<pre id="pre${tmp.rnum }">${tmp.content }</pre>
				</dd>
			</dl>		
		</c:forEach>
	</div>
		<form id="reForm${tmp.rnum }" class="reply-form insert-form" action="reply_insert.do" method="post">
			<!-- 원글의 글번호가 답변의 ref_num 번호가 된다. -->
			<input type="hidden" name="ref_num" value="${dto.rnum }"/>
			<!-- 원글의 작성자가 댓글의 대상자가 된다. -->
			<input type="hidden" name="writer" value="${dto.writer }"/>
	
			<textarea name="content">${empty id ? '답글 작성을 위해 로그인이 필요 합니다.' : '' }</textarea>
			<button type="submit">등록</button>
		</form>
	</div>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script>
		//관리자만 작성가능
		let isManager=${manager =='Y'};
		let isLogin=${ not empty id };
	
		//원글의 댓글 폼에 submit이벤트가 일어났을때 실행할 함수 등록
		document.querySelector(".insert-form")
			.addEventListener("submit", function(e){
				//만일 로그인 하지 않았으면 
				if(!isLogin){
					//폼 전송을 막고 w
					e.preventDefault();
					//로그인 폼으로 이동 시킨다.
					//로그인 성공후 다시 해당글 자세히 보기 페이지로 돌아올 수 있도록 url 정보를  같이 전달한다.
					location.href=
						"${pageContext.request.contextPath}/users/loginform.do?url=${pageContext.request.contextPath}/qna/detail.do?num=${dto.num}";
				}
			});
	
		addUpdateFormListener(".update-form");
		addUpdateListener(".update-link");
		addDeleteListener(".delete-link");
		addReplyListener(".reply-link");
	
		//인자로 전달되는 선택자를 이용해서 이벤트 리스너를 등록하는 함수 
		function addUpdateListener(sel){
			//댓글 수정 링크의 참조값을 배열에 담아오기 
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
		function addDeleteListener(sel){
			//댓글 삭제 링크의 참조값을 배열에 담아오기 
			let deleteLinks=document.querySelectorAll(sel);
			for(let i=0; i<deleteLinks.length; i++){
				deleteLinks[i].addEventListener("click", function(){
					//click 이벤트가 일어난 바로 그 요소의 data-num 속성의 value 값을 읽어온다. 
					const num=this.getAttribute("data-num"); //댓글의 글번호
					const isDelete=confirm("댓글을 삭제 하시겠습니까?");
					if(isDelete){
						// gura_util.js 에 있는 함수들 이용해서 ajax 요청
						ajaxPromise("reply_delete.do", "post", "num="+num)
						.then(function(response){
							return response.json();
						})
						.then(function(data){
							//만일 삭제 성공이면 
							if(data.isSuccess){
								//댓글이 있는 곳에 삭제된 댓글입니다를 출력해 준다. 
								document.querySelector("#reli"+num).innerText="삭제된 댓글입니다.";
							}
						});
					}
				});
			}
		}
		function addReplyListener(sel){
			//댓글 링크의 참조값을 배열에 담아오기 
			let replyLinks=document.querySelectorAll(sel);
			//반복문 돌면서 모든 링크에 이벤트 리스너 함수 등록하기
			for(let i=0; i<replyLinks.length; i++){
				replyLinks[i].addEventListener("click", function(){
					
					if(!isLogin){
						const isMove=confirm("로그인이 필요 합니다. 로그인 페이지로 이동 하시겠습니까?");
						if(isMove){
							location.href=
								"${pageContext.request.contextPath}/users/loginform.do?url=${pageContext.request.contextPath}/cafe/detail.do?num=${dto.num}";
						}
						return;
					}
					
					//click 이벤트가 일어난 바로 그 요소의 data-num 속성의 value 값을 읽어온다. 
					const num=this.getAttribute("data-num"); //댓글의 글번호
					
					const form=document.querySelector("#reForm"+num);
					
					//현재 문자열을 읽어온다 ( "답글" or "취소" )
					let current = this.innerText;
					
					if(current == "답글"){
						//번호를 이용해서 댓글의 댓글폼을 선택해서 보이게 한다. 
						form.style.display="block";
						form.classList.add("animate__flash");
						this.innerText="취소";	
						form.addEventListener("animationend", function(){
							form.classList.remove("animate__flash");
						}, {once:true});
					}else if(current == "취소"){
						form.classList.add("animate__fadeOut");
						this.innerText="답글";
						form.addEventListener("animationend", function(){
							form.classList.remove("animate__fadeOut");
							form.style.display="none";
						},{once:true});
					}
				});
			}
		}
		
		function addUpdateFormListener(sel){
			//댓글 수정 폼의 참조값을 배열에 담아오기
			let updateForms=document.querySelectorAll(sel);
			for(let i=0; i<updateForms.length; i++){
				//폼에 submit 이벤트가 일어 났을때 호출되는 함수 등록 
				updateForms[i].addEventListener("submit", function(e){
					//submit 이벤트가 일어난 form 의 참조값을 form 이라는 변수에 담기 
					const form=this;
					//폼 제출을 막은 다음 
					e.preventDefault();
					//이벤트가 일어난 폼을 ajax 전송하도록 한다.
					ajaxFormPromise(form)
					.then(function(response){
						return response.json();
					})
					.then(function(data){
						if(data.isSuccess){
							/*
								document.querySelector() 는 html 문서 전체에서 특정 요소의 
								참조값을 찾는 기능
								
								특정문서의 참조값.querySelector() 는 해당 문서 객체의 자손 요소 중에서
								특정 요소의 참조값을 찾는 기능
							*/
							const num=form.querySelector("input[name=num]").value;
							const content=form.querySelector("textarea[name=content]").value;
							//수정폼에 입력한 value 값을 pre 요소에도 출력하기 
							document.querySelector("#pre"+num).innerText=content;
							form.style.display="none";
						}
					});
				});
			}
		}
	</script>
	<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>