<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>views/faq/insertform.jsp</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/nav.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/subFooter.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/subnav.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
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
		<h1>자주묻는질문 작성 폼</h1>
		<form action="insert.do" method="post" id="insertForm">
			<div class="mb-3">
				<label class="form-label" for="category">카테고리</label>
				<select class="form-select" name="category" id="category">
					<option selected>카테고리 선택</option>
					<option value="service">서비스이용</option>
					<option value="order">주문결제배송</option>
					<option value="member">회원정보</option>
					<option value="etc">기타</option>
				</select>
			</div>
			<div class="mb-3">
				<label class="form-label" for="title">질문</label>
				<input class="form-control" type="text" name="title" id="title"/>
			</div>
			<div class="mb-3">
				<label class="form-label" for="content">답변 내용</label>
				<textarea class="form-control"  name="content" id="content"></textarea>
			</div>
			<button class="btn btn-dark" type="submit">저장</button>
		</form>
	</div>
<script>

</script>
</body>
</html>