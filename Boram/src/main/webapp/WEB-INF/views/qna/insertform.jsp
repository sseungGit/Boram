<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>views/qna/insertform.jsp</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/nav.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/subFooter.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/subnav.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
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
		<h1 class="text-center">문의 작성 폼</h1>
		<form action="insert.do" method="post" id="insertForm" enctype="multipart/form-data">
			<div class="mb-3">
				<label class="form-label" for="title">제목</label>
				<input class="form-control" type="text" name="title" id="title"/>
			</div>
			<div class="mb-3">
				<label class="form-label" for="content">내용</label>
				<textarea class="form-control"  name="content" id="content"></textarea>
			</div>
			<button class="btn btn-dark" type="submit">문의 등록</button>
		</form>
	</div>
	<script src="${pageContext.request.contextPath }/SmartEditor/js/HuskyEZCreator.js"></script>
	<script>

	</script>
	<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>