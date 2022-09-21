<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/qna/list.jsp</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/nav.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/subFooter.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/subnav.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
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
</style>
</head>
<body>
	<header>
		<!-- main nav바  -->
   		<jsp:include page="/include/nav.jsp"></jsp:include>
   		<!-- sub nav바 -->
   		<jsp:include page="/include/subnav.jsp">
      		<jsp:param value="cs" name="thisPage"/>
      		<jsp:param value="faq" name="subPage"/>
   		</jsp:include>
	</header>
	<div class="container">
		<h1 class="text-center">1:1문의</h1>
		<button class="btn btn-dark" style="float:right" onclick="location.href='${pageContext.request.contextPath}/qna/insertform.do' "><i class="bi bi-plus"></i>문의하기</button>
		<table class="table">
			<thead>
				<tr>
					<th scope="col">제목</th>
					<th scope="col">작성일</th>
					<th scope="col">답변여부</th>
					<c:if test="${dto.writer eq id }">
					<th scope="col">삭제</th>
					</c:if>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="tmp" items="${list }">
				<tr onclick="location.href='detail.do?num=${tmp.num }'">
					<td scope="row">${tmp.title }</td>
					<td scope="row">${tmp.regdate }</td>
					<td scope="row"></td>
					<c:if test="${dto.writer eq id }">
					<td scope="row"><a href="deleteform.do?num=${dto.num }">삭제</a></td>
					</c:if>
				</tr>
			</c:forEach>
			</tbody>
		</table>
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
	</div>
</body>
</html>