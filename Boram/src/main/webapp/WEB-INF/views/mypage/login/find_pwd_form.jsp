<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>find_pwd_form</title>
</head>
<body>
	<form action="find_pwd.do" method="post">
		아이디 : <input type="text" id="id" name="id"/> <br />
		이름 : <input type="text" id="name" name="name"/> <br />
		이메일 : <input type="text" id="email" name="email"/> <br />
		<button type="submit">계속</button>
	</form>
</body>
</html>