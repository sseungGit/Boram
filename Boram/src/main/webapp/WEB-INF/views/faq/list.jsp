<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>views/faq/list.jsp</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/nav.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/subFooter.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/subnav.css">

<style>
	.page-ui a{
		text-decoration: none;
		color: #000;
	}
	
	.page-ui a:hover{
		text-decoration: underline;
	}
	
	.page-ui a.active{
		color: red;
		font-weight: bold;
		text-decoration: underline;
	}
	.page-ui ul{
		list-style-type: none;
		padding: 0;
	}
	
	.page-ui ul > li{
		float: left;
		padding: 5px;
	}
	.question:hover{
		cursor: pointer;
	}
	.answer{
		display: none;
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
	<div class="container">
		<h1 class="text-center">자주 묻는 질문</h1>
			<button class="btn btn-dark" id="qna" style="float:right" onclick="location.href='${pageContext.request.contextPath}/qna/list.do' ">1:1문의하러 가기</button>
		<table class="table" id="table">
			<thead>
				<tr>
					<th scope="col">#</th>
					<th scope="col">카테고리</th>
					<th scope="col">제목</th>
					<c:if test="${not empty manager and manager == 'Y'}">
					<th scope="col">수정</th>
					<th scope="col">삭제</th>
					</c:if>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="tmp" items="${list }">
				<tr class="question" data-num="${tmp.num }">
					<td scope="row">${tmp.num }</td>
					<c:choose>
						<c:when test="${tmp.category eq 'service' }">
						<th scope="row">[서비스 이용]</th>
						</c:when>
						<c:when test="${tmp.category eq 'order' }">
						<th scope="row">[주문·결제·배송]</th>
						</c:when>
						<c:when test="${tmp.category eq 'member' }">
						<th scope="row">[회원정보]</th>
						</c:when>
						<c:when test="${tmp.category eq 'etc' }">
						<th scope="row">[기타]</th>
						</c:when>
					</c:choose>
					<td scope="row">
					
						${tmp.title }<i class="bi bi-chevron-down" style="float:right"></i>
		
					</td>
					<c:if test="${ not empty manager and manager == 'Y'}">
					<td scope="row"><a href="updateform.do?num=${tmp.num }">수정</a></td>
					<td scope="row"><a href="delete.do?num=${tmp.num }">삭제</a></td>
					</c:if>
				</tr>
	
	
				<tr class="answer" id="answer${tmp.num }">
					<td colspan="100%">
					<div>
						<p style="text-align: left;">${tmp.content}</p>
					</div>
					</td> 
				</tr>
			</c:forEach>
			</tbody>
		</table>
		<c:if test="${not empty manager and manager == 'Y'}">
			<button class="btn btn-dark" style="float:right" onclick="location.href='insertform.do' ">글쓰기</button>
		</c:if>	
		<div class="page-ui clearfix">
		<ul>
			<c:if test="${startPageNum ne 1 }">
				<li>
					<a href="list.do?pageNum=${startPageNum-1 }&condition=${condition }&keyword=${encodedK }">Prev</a>
				</li>
			</c:if>
			<c:forEach var="i" begin="${startPageNum }" end="${endPageNum }">
				<li>
					<c:choose>
						<c:when test="${pageNum eq i }">
							<a  class="active" href="list.do?pageNum=${i }&condition=${condition }&keyword=${encodedK }">${i }</a>
						</c:when>
						<c:otherwise>
							<a href="list.do?pageNum=${i }&condition=${condition }&keyword=${encodedK }">${i }</a>
						</c:otherwise>
					</c:choose>
				</li>
			</c:forEach>
			<c:if test="${endPageNum lt totalPageCount }">
				<li>
					<a href="list.do?pageNum=${endPageNum+1 }&condition=${condition }&keyword=${encodedK }">Next</a>
				</li>
			</c:if>
		</ul>
	</div>
	
	<div style="clear:both;"></div>
		<form action="list.do" method="get"> 
		<label for="condition">검색조건</label>
		<select name="condition" id="condition">
			<option value="writer" ${condition eq 'category' ? 'selected' : '' }>카테고리</option>
			<option value="title_content" ${requestScope.condition eq 'title_content' ? 'selected' : '' }>제목+내용</option>
			<option value="title" ${condition eq 'title' ? 'selected' : '' }>제목</option>
			
		</select>
		<input type="text" id="keyword" name="keyword" placeholder="검색어..." value="${keyword }"/>
		<button type="submit">검색</button>
	</form>	
	<c:if test="${ not empty condition }">
		<p>
			<strong>${totalRow }</strong> 개의 글이 검색 되었습니다.
		</p>
	</c:if>
		</div>
		
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script>
		
		$(".question").click(function(){
			//data-num 속성으로 저장된 번호를 읽어와서 
			let num=$(this).attr("data-num");
			//선택자로 활용한다.
			$("#answer"+num).fadeToggle(400);
		});
		
		//클라이언트가 로그인 했는지 여부
		let isLogin=${ not empty id };
		
		//1:1문의하러가기 버튼에 click이벤트가 일어났을때 실행할 함수 등록
		document.querySelector("#qna")
			.addEventListener("click", function(e){
				//만일 로그인 하지 않았으면 
				if(!isLogin){
					//폼 전송을 막고 
					e.preventDefault();
					//로그인 폼으로 이동 시킨다.
					//로그인 성공후 다시 해당글 자세히 보기 페이지로 돌아올 수 있도록 url 정보를  같이 전달한다.
					location.href=
						"${pageContext.request.contextPath}/users/loginform.do?url=${pageContext.request.contextPath}/faq/list.do";
				}
			});
	</script>
	<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>







