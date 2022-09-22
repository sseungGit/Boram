<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/mypage/users/delete.jsp</title>
</head>
<body>
	<h1>알림</h1>
	<p>
		<strong>${requestScope.id }</strong> 님 탈퇴 처리 되었습니다.
		<a href="${pageContext.request.contextPath}/home.do">인덱스로 가기</a>
	</p>
</body>
</html>