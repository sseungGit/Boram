<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/mypage/updateform.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/nav.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/subnav.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/subFooter.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/lsh.css">
<style>
/* 프로필 이미지를 작은 원형으로 만든다 */
img {
   width: 100px;
   height: 100px;
}
#profileImage {
   width: 100px;
   height: 100px;
   border-radius: 50%;
   margin:0 auto;
   text-align:center;
   display:block;
   
}
.container{width:40% !important;}
.subMenuText{display:none !important;}
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
	<!-- 
		<h1  style="font-size:30px !important; text-align:center; margin-top:30px !important;">가입 정보 수정</h1>
	 -->
	
	<a id="profileLink" href="javascript:">
		<c:choose>
			<c:when test="${empty dto.profile }">
				<svg id="profileImage" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="#ddd" class="bi bi-person-circle" viewBox="0 0 16 16">
					  <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
					  <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
				<a class="lshimgbtn" style="margin:0 auto !important; text-align:center !important; text-decoration:none !important; margin-top:10px !important;">사진변경</a>
				</svg>
			</c:when>
			<c:otherwise>
				<img id="profileImage" 
					src="${pageContext.request.contextPath}${dto.profile}" />
			</c:otherwise>
		</c:choose>
	</a>
	<p class="upimgtxt">회원님을 알릴 수 있는 사진을 등록해 주세요.<br>등록된 사진은 회원님의 게시물이나 댓글들에 사용됩니다.</p>
	<form action="${pageContext.request.contextPath}/mypage/users/update.do" method="post">
		<input type="hidden" name="profile" 
			value="${ empty dto.profile ? '' : dto.profile}"/>
		<div class="mb_15 mt_15">
			<label class="form-label" for="id">아이디</label>
			<input class="form-control" type="text" id="id" value="${id }" disabled/>
		</div>
		<div class="mb_15">
			<label class="form-label" for="email">이메일</label>
			<input class="form-control" type="text" name="email" id="email" value="${dto.email }"/>
		</div>
		<div class="mb_15">
			<label class="form-label" for="phone">전화번호</label>
			<input class="form-control" type="text" name="phone" id="phone" value="${dto.phone }" maxlength="11" placeholder="전화번호"/>
			<div class="invalid-feedback">01(0|1|6|7|8|9)로 시작하고 숫자만 입력해주세요</div>
		</div>
		<div>
			<label class="form-label" for="addr">주소</label>
			<input class="form-control" type="text" name="addr" id="addr" value="${dto.addr }"/>
		</div>		
		<button class="lshbtn" type="submit">저장</button>
	</form>
	
	
	<form style="display:none;" action="${pageContext.request.contextPath}/mypage/users/ajax_profile_upload.do" method="post" 
				id="imageForm" enctype="multipart/form-data">
		<input class="form-control" type="file" name="image" id="image" 
			accept=".jpg, .jpeg, .png, .JPG, .JPEG, .gif"/>
	</form>
	
</div>
<jsp:include page="/include/footer.jsp"></jsp:include>
<script src="${pageContext.request.contextPath}/resources/js/gura_util.js"></script>
<script>
	//프로필 이미지 링크를 클릭하면 
	document.querySelector("#profileLink").addEventListener("click", function(){
		// input type="file" 을 강제 클릭 시킨다. 
		document.querySelector("#image").click();
	});
	//이미지를 선택했을때 실행할 함수 등록 
	document.querySelector("#image").addEventListener("change", function(){
		
		let form=document.querySelector("#imageForm");
		
		// gura_util.js 에 정의된 함수를 호출하면서 ajax 전송할 폼의 참조값을 전달하면 된다. 
		ajaxFormPromise(form)
		.then(function(response){
			return response.json();
		})
		.then(function(data){
			// data 는 {imagePath:"/upload/xxx.jpg"} 형식의 object 이다.
			console.log(data);
			// let img='<img id="profileImage" src="${pageContext.request.contextPath}'+data.imagePath+'"/>`
			let img=`<img id="profileImage" src="${pageContext.request.contextPath}\${data.imagePath}"/>`;
			// img 변수에 들어있는 문자열을 HTML 로 해석하면서 링크 안에 넣어주세요
			document.querySelector("#profileLink").innerHTML=img;
			// input name="profile" 요소의 value 값으로 이미지 경로 넣어주기
			
			/*
				document.querySelector(" css 선택자 ") - 오브젝트 1개 리턴(오브젝트)
				document.querySelectorAll(" css 선택자 ") - 오브젝트 여러개 리턴(배열)
			
				# => 아이디 선택자
				. => 클래스 선택자
				[ ] => 속성 선택자
				
				ex) [속성명=속성값]
		
				[id=one] : id 속성의 값이 one 인 요소 선택 : < xxx id = "one" >
				[class=my-class] : class 속성의 값이 my-class 인 요소 선택 : < xxx class = "my-class" >
				[name=profile] : < xxx name = "profile" >
				
				input[name=profile] : input 요소이면서 name 속성의 값이 profile 인 요소 선택
				
				<input name="profile">
			*/
			document.querySelector("input[name=profile]").value=data.imagePath;
		});
	});
</script>
</body>
</html>