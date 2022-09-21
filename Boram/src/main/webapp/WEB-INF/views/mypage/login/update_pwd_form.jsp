<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<form action="update_pwd.do" id="updatePwdForm" method="post" autocomplete="off">
		<input type="hidden" id="id" name="id"  value="${param.id }"/>
		<div class="mb-3">
			<input class="form-control" type="password" name="pwd" id="pwd" maxlength="13" placeholder="암호"/>
			<div class="invalid-feedback">최소 하나의 영문자,숫자,특수문자가 들어가고 8글자~13글자 이내로 입력해주세요.</div>
		</div>
		<div class="mb-4">
			<input class="form-control" type="password" name="pwd2" id="pwd2" maxlength="13"  placeholder="암호 확인"/>
			<div class="invalid-feedback">비밀 번호가 일치하지 않습니다.</div>
		</div>
		<button type="submit" class="btn">확인</button>
	</form>
	<div id="successDiv"></div>
	
	<script>
	const updateForm=document.querySelector("#updatePwdForm"); //폼의 참조값
	let isPwdValid=false;
	
	//비밀번호를 확인 하는 함수 
	function checkPwd(){
		document.querySelector("#pwd").classList.remove("is-valid");
		document.querySelector("#pwd").classList.remove("is-invalid");
		document.querySelector("#pwd2").classList.remove("is-valid");
		document.querySelector("#pwd2").classList.remove("is-invalid");
		
		const pwd=document.querySelector("#pwd").value;
		const pwd2=document.querySelector("#pwd2").value;
		//비밀번호를 검증할 정규 표현식
		//let reg=/[\W]/; 특수문자 하나는 꼭 들어가야 한다
		//최소 하나의 문자,숫자,특수문자가 들어가고 8글자~13글자 이내로 입력
		const reg=/^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&^])[A-Za-z\d@$!%*#?&^]{8,13}$/;
		//만일 비밀번호가 정규 표현식을 통과 하지 못한다면 
		if(!reg.test(pwd)){		
			document.querySelector("#pwd").classList.add("is-invalid");
			isPwdValid=false;
			return; //함수를 여기서 끝내라 
		}else{
			document.querySelector("#pwd").classList.add("is-valid");
		}
		
		if(pwd != pwd2){//만일 비밀번호 입력란과 확인란이 다르다면
			document.querySelector("#pwd2").classList.add("is-invalid");
			isPwdValid=false;
		}else{
			document.querySelector("#pwd2").classList.add("is-valid");
			isPwdValid=true;
		}
	}
		
	document.querySelector("#pwd").addEventListener("input", function(){
		//비밀번호를 검증하는 함수 호출
		checkPwd();
	});
	document.querySelector("#pwd2").addEventListener("input", function(){
		checkPwd();
	});
	
	updateForm.addEventListener("submit", function(event){
		event.preventDefault();
		if(!isPwdValid){
			return;
		}else{
			ajaxFormPromise(updateForm)
            .then(function(res){
				return res.json();
			}).then(function(data){
				updateForm.innerHTML="";
				let mag="";
				if(data.isSuccess){
					msg=`
						<h1>비밀번호를 수정했습니다.</h1>
						<a href="login_form.do" class="btn">로그인</a>
					`;
				}else{
					msg=`
						<h1>비밀번호 수정이 실패했습니다.</h1>
						<a href="find_pwd_form.do" class="btn">수정하기</a>
					`;
				}
				$('#successDiv').html(msg);
			});
		}
	});
	</script>