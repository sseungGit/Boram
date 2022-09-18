<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>signup_form.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/nav.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/subFooter.css">
<style>
	html,body{  
		margin:0;
		padding:0;
	    height:100%;
	}
    body {
		display: flex;
		flex-direction: column;
		text-align: center;
		background-color: #999;
		margin: 0;
	}
	main {
        flex: 2;
        background-color: cornflowerblue;
		padding:10px;
		margin:20px;
        display: flex;
        justify-content:center;
        align-items:center;
		height:100%;
		width:100%;
		overflow:auto;
	}
	#register_agree{
		background-color: white;
		height:100%;
		width:100%;
		border:1px solid black;
	}
</style>
</head>
<body>
	<jsp:include page="/include/nav.jsp"></jsp:include>
	<main>
		<jsp:include page="include/join_terms.jsp"></jsp:include>
		<jsp:include page="include/join_form.jsp"></jsp:include>
	</main>
</body>
</html>










