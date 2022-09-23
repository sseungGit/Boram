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
   	.reply dt{
		margin-top: 5px;
	}
	.reply dd{
		margin-left: 50px;
	}
	.reply-form textarea, .reply-form button{
		float: left;
	}
	.reply-form textarea{
		width: 84%;
		height: 100px;
	}
	.reply-form button{
		width: 14%;
		height: 100px;
	}
	pre {
	  display: block;
	  padding: 9.5px;
	  margin: 0 0 10px;
	  font-size: 13px;
	  line-height: 1.42857143;
	  color: #333333;
	  word-break: break-all;
	  word-wrap: break-word;
	  background-color: #f5f5f5;
	  border: 1px solid #ccc;
	  border-radius: 4px;
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
	<div>
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
		<div class="reply" >
			<c:if test="${not empty dtoReply.content }">
				<div class="rcontent">
					<dl>
						<dt><i class="bi bi-chat-square-quote"></i> 답변 드립니다.</dt>
						<dd>${dtoReply.content }</dd>
					</dl>
				
				</div>
			</c:if>

			<c:if test="${not empty manager and manager == 'Y'}">
				<!-- 원글의 답글 작성 폼 -->
				<form class="reply-form insert-form mt-3" action="reply_insert.do" method="post">
					<!-- 원글의 글번호가 답글의 ref_num 번호가 된다. -->
					<input type="hidden" name="ref_num" value="${dto.num }"/>
					<textarea name="content"></textarea>
					<button type="submit">답변 등록</button>
				</form>
			</c:if>
		</div>
		<button class="btn btn-dark" style="float:right" onclick="location.href='delete.do?num=${dto.num }' ">삭제</button>
		<button class="btn btn-dark" style="float:left" onclick="location.href='${pageContext.request.contextPath}/qna/list.do' ">목록보기</button>
	</div>
	</div>
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
					const num=this.getAttribute("data-num"); //답글의 글번호
					document.querySelector("#updateForm"+num).style.display="block";
					
				});
			}
		}
		function addDeleteListener(sel){
			//답글 삭제 링크의 참조값을 배열에 담아오기 
			let deleteLinks=document.querySelectorAll(sel);
				deleteLinks.addEventListener("click", function(){
					const isDelete=confirm("답글을 삭제 하시겠습니까?");
					if(isDelete){
						// gura_util.js 에 있는 함수들 이용해서 ajax 요청
						ajaxPromise("reply_delete.do", "post", "num="+num)
						.then(function(response){
							return response.json();
						})
						.then(function(data){
							//만일 삭제 성공이면 
							if(data.isSuccess){
								//답글이 있는 곳에 삭제된 답글입니다를 출력해 준다. 
								document.querySelector("#reli"+num).innerText="삭제된 답글입니다.";
							}
						});
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
							const num=form.querySelector("input[name=rnum]").value;
							const content=form.querySelector("textarea[name=content]").value;
							//수정폼에 입력한 value 값을 pre 요소에도 출력하기 
							document.querySelector("#pre"+num).innerText=content;
							
						}
					});
				});
			}
		}
	</script>
	<footer>
		<jsp:include page="/include/footer.jsp"></jsp:include>
	</footer>
</body>
</html>