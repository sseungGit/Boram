<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/mypage/pwd_updateform.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/nav.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/subnav.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/subFooter.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/lsh.css">
<style>
.container{width:40% !important;}
</style>
</head>
<body>
<!-- main nav바  -->
	<jsp:include page="/include/nav.jsp"></jsp:include>
	<!-- sub nav바 -->
	<!-- 
		thisPage는 대메뉴를 구별하는데 사용
		subPage는 소메뉴를 구별하는데 사용
	 -->
	<jsp:include page="/include/subnav.jsp">
		<jsp:param value="mypage" name="thisPage"/>
		<jsp:param value="info" name="subPage"/>
	</jsp:include>
	<div class="container mb_250">
	<!-- <h1 style="font-size:30px !important; text-align:center; margin-top:120px !important;">비밀 번호 수정</h1> -->
	<form action="${pageContext.request.contextPath}/mypage/users/pwd_update.do" method="post" id="myForm">
		<div>
			<label class="form-label" for="pwd">기존 비밀 번호</label>
			<input class="form-control" type="password" name="pwd" id="pwd"/>
		</div>
		<div style="margin:20px 0!important;">
			<label class="form-label" for="newPwd">새 비밀번호</label>
			<input class="form-control" type="password" name="newPwd" id="newPwd"/>
		</div>
		<div>
			<label class="form-label" for="newPwd2">새 비밀번호 확인</label>
			<input class="form-control" type="password" id="newPwd2"/>
		</div>
		<div class="pwdbtnbox" style="text-align:center !important;">
			<button class="pwdlshbtn" type="submit">저장</button>
			<button class="pwdlshbtn" type="reset">초기화</button>
		</div>
	</form>
</div>
<jsp:include page="/include/footer.jsp"></jsp:include>
<script>
	//폼에 submit 이벤트가 일어났을때 실행할 함수를 등록하고 
	document.querySelector("#myForm").addEventListener("submit", function(e){
		let pwd1=document.querySelector("#newPwd").value;
		let pwd2=document.querySelector("#newPwd2").value;
		//새 비밀번호와 비밀번호 확인이 일치하지 않으면 폼 전송을 막는다.
		if(pwd1 != pwd2){
			alert("비밀번호를 확인 하세요!");
			e.preventDefault();//폼 전송 막기 
		}
	});
</script>
</body>
</html>