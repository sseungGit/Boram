<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/subnav.css" />
</head>
<body>
	<jsp:include page="../include/subnav.jsp"></jsp:include>
	<div class="container" id="login-div">
		<h3>Users Login</h3>
		<form id="loginForm" action="login.do" method="post">
			<!-- 로그인 성공후 어디로 갈지에 대한 정보를 url 이라는 파라미터 명으로 같이 전송되도록 한다. -->
			<input type="hidden" name="url" value="${url }"/>
			
			<div class="input-group mb-3">
			  <span class="input-group-text" id="basic-addon1" style="background-color:#F5F5F5;">
			  	<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-person" viewBox="0 0 16 16">
				  <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z"/>
				</svg>
			  </span>
			  <input class="form-control" type="text" name="id" id="id" style="background-color:#F5F5F5;">
			</div>
			
			<div class="input-group mb-3">
			  <span class="input-group-text" id="basic-addon2" style="background-color:#F5F5F5;">
				<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-lock" viewBox="0 0 16 16">
				  <path d="M8 1a2 2 0 0 1 2 2v4H6V3a2 2 0 0 1 2-2zm3 6V3a3 3 0 0 0-6 0v4a2 2 0 0 0-2 2v5a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V9a2 2 0 0 0-2-2zM5 8h6a1 1 0 0 1 1 1v5a1 1 0 0 1-1 1H5a1 1 0 0 1-1-1V9a1 1 0 0 1 1-1z"/>
				</svg>
			  </span>
			  <input class="form-control" type="password"  name="pwd" id="pwd" style="background-color:#F5F5F5;">
			</div>
			<button class="btn btn-primary" type="submit">Sign in</button>
			<a href="signup_form.do" class="btn btn-light">Sign up</a>
			<a href="find_pwd_form.do" class="btn btn-light">Password?</a>
		</form>
	</div>
</body>
</html>