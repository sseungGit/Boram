<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:choose>
		<c:when test="${isValid}">
			<script>
				location.href="${pageContext.request.contextPath }/home.do";
			</script>
		</c:when>
		<c:otherwise>
			<script>
				alert("아이디 또는 비밀번호가 틀립니다.");
				location.href="${pageContext.request.contextPath }/users/login_form.do";
			</script>
		</c:otherwise>
	</c:choose>
</body>
</html>