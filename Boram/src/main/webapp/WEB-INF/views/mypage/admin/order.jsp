<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-2.1.3.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/nav.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/subnav.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/subFooter.css">
<style>
	body{
		margin: 0;
		padding: 0;
		height: 100%;
	}
	#subMenuText{
		height: 80px;
		position:relative;
	}
	#order_wr {
		height:800px;
		display:flex;
		justify-content: center;
		font-size: 18px;
	} 
	#body_content{
		display:flex;
		flex-direction: column;
		align-items: center;
	}
	#order_table{
		height:500px;
		text-align:center;
	}
	#order_table table th{
		padding-bottom: 15px;
		border-bottom: 3px solid black;
	}
	#order_table tbody tr:hover{
		background-color: #A1A1AB;
	}
	footer{
		width:100%;
		bottom: 0px;
	}
	#condition{
		width:150px;
		display:inline-block;
	}
	#keyword{
		width:750px;
		display:inline-block;
	}
	#searchForm{
		display:inline-block
	}
	.btn{
		border-radius:0px;
	}
	
	#order_table table th:nth-child(1){
		width: 30px;
	}
	#order_table table th:nth-child(2){
		width: 120px;
	}
	#order_table table th:nth-child(3){
		width: 110px;
	}
	#order_table table th:nth-child(4){
		width: 110px;
	}
	#order_table table th:nth-child(5){
		width: 150px;
	}
	#order_table table th:nth-child(6){
		width: 230px;
	}
	#order_table table th:nth-child(7){
		width: 230px;
	}
	#order_table table th:nth-child(8){
		width: 200px;
	}
	#order_table table th:nth-child(9){
		width: 200px;
	}
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
		<jsp:param value="manager" name="thisPage"/>
		<jsp:param value="order" name="subPage"/>
	</jsp:include>
	<div id="order_wr" class="container">
		<div id="body_content">
			<div style="width:100%;display:inline-block; text-align:center; " class="mb-3">
				<form action="order.do" method="get" id="searchForm" > 
					<input type="hidden" name="state" value="${state }"/>
					<select name="condition" id="condition" class="form-select form-select-lg">
						<option value="code" ${condition eq 'code' ? 'selected' : '' }>주문번호</option>
						<option value="orderer_name" ${condition eq 'orderer_name' ? 'selected' : '' }>아이디/이름</option>
					</select>
					<input type="text" class="form-control form-control-lg" id="keyword" name="keyword" placeholder="검색어..." value="${keyword }"/>
					<button type="submit" class="btn btn-dark btn-lg" style="width:80px;">검색</button>
				</form>	
			</div>
			<form  action="admin_order_update.do" id="orderForm" method="post">
			<div class="mb-3" style="display:inline-block;">
				<button type="button" id="updateBtn" class="btn btn-dark" style="display:inline-block">수정</button>
				<button type="button" id="changeBtn" class="btn btn-info" style="display:none;" style="display:inline-block">확인</button>
				<button type="button" id="cancleBtn" class="btn btn-secondary" style="display:none;" style="display:inline-block">취소</button>
				<select id="updateState" name="state" class="form-select" style="display:inline-block; width:150px;"disabled>
					<option>상태</option>
					<option>예약완료</option>
					<option>수거중</option>
					<option>수거완료</option>
					<option>세탁중</option>
					<option>세탁완료</option>
					<option>반환중</option>
					<option>반환완료</option>
				</select>
			</div>
			<div style="display:inline-block; float: right;">
				<select name="courier" id="courier" class="form-select" style="display:inline-block; width:200px;">
					<option>DHL</option>
					<option>Sagawa</option>
					<option>Kuroneko Yamato</option>
					<option>Japan Post</option>
					<option>천일택배</option>
					<option>CJ대한통운</option>
					<option>CU 편의점택배</option>
					<option>GS Postbox 택배</option>
					<option>CWAY (Woori Express)</option>
					<option>대신택배</option>
					<option selected>우체국 택배</option>
					<option>한의사랑택배</option>
					<option>홈픽</option>
					<option>한서호남택배</option>
					<option>일양로지스</option>
					<option>경동택배</option>
					<option>건영택배</option>
					<option>로젠택배</option>
					<option>롯데택배</option>
					<option>SLX</option>
					<option>성원글로벌카고</option>
					<option>EMS</option>
					<option>Fedex</option>
					<option>UPS</option>
					<option>USPS</option>
				</select>
				<button type="button" id="getBtn" class="btn btn-dark">수거용 송장번호 발급</button>
				<button type="button" id="sendBtn" class="btn btn-dark">반환용 송장번호 발급</button>
			</div>
			<div id="order_table">
				<table class="table">
					<thead>
						<tr>
							<th><input type="checkbox" id="allCheck" class="form-check-input"/></th>
							<th>주문번호</th>
							<th>주문자</th>
							<th>주문금액</th>
							<th>
								<select id="state" class="form-select" style="text-align:center;">
									<option ${state eq '상태' ? 'selected' : '' }>상태</option>
									<option ${state eq '예약완료' ? 'selected' : '' }>예약완료</option>
									<option ${state eq '수거중' ? 'selected' : '' }>수거중</option>
									<option ${state eq '수거완료' ? 'selected' : '' }>수거완료</option>
									<option ${state eq '세탁중' ? 'selected' : '' }>세탁중</option>
									<option ${state eq '세탁완료' ? 'selected' : '' }>세탁완료</option>
									<option ${state eq '반환중' ? 'selected' : '' }>반환중</option>
									<option ${state eq '반환완료' ? 'selected' : '' }>반환완료</option>
								</select>
							</th>
							<th>예약일</th>
							<th>요청일</th>
							<th>수거용 송장번호</th>
							<th>반환용 송장번호</th>
							<th>...</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach var="tmp" items="${ list }">
						<tr class="selectRow">
							<td><input type="checkbox" class="form-check-input" name="codes" value="${tmp.code }" 
									data-state="${tmp.state }" data-courier1="${tmp.get_courier }" data-courier2="${tmp.send_courier }"/></td>
							<td>${tmp.code }</td>
							<td>${tmp.orderer }</td>
							<td><f:formatNumber value="${tmp.order_price }" pattern="#,###" /></td>
							<td>${tmp.state }</td>
							<td>${tmp.regdate }</td>
							<td>${tmp.reservation_date }</td>
							<c:choose>
								<c:when test="${not empty tmp.get_courier }">
									<td>${tmp.get_invoice_num } </td>
								</c:when>
								<c:otherwise>
									<td>-</td>
								</c:otherwise>
							</c:choose>
							<c:choose>
								<c:when test="${not empty tmp.send_courier }">
									<td>${tmp.send_invoice_num }</td>
								</c:when>
								<c:otherwise>
									<td>-</td>
								</c:otherwise>
							</c:choose>
							<td><a href="admin_detail.do?code=${tmp.code }" class="btn">...</a></td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
			</div>
			</form>
			<!-- 페이징처리 -->
			<nav aria-label="Page navigation">
				<ul class="pagination">
					<c:if test="${startPageNum ne 1 }">
					<li class="page-item">
						<a class="page-link" href="order.do?pageNum=${startPageNum-1 }&condition=${condition }&keyword=${encodedK }" aria-label="Previous">
							<span aria-hidden="true">&laquo;</span>
						</a>
					</li>
					</c:if>
					<c:forEach var="i" begin="${startPageNum }" end="${endPageNum }">
						<li>
							<c:choose>
								<c:when test="${pageNum eq i }">
									<a  class="page-link active" href="order.do?pageNum=${i }&condition=${condition }&keyword=${encodedK }">${i }</a>
								</c:when>
								<c:otherwise>
									<a class="page-link" href="order.do?pageNum=${i }&condition=${condition }&keyword=${encodedK }">${i }</a>
								</c:otherwise>
							</c:choose>
						</li>
					</c:forEach>
					<c:if test="${endPageNum lt totalPageCount }">
					<li class="page-item">
					  	<a class="page-link" href="order.do?pageNum=${endPageNum+1 }&condition=${condition }&keyword=${encodedK }" aria-label="Next">
					    	<span aria-hidden="true">&raquo;</span>
					  	</a>
					</li>
					</c:if>
				</ul>
			</nav>
			<div style="clear:both;"></div>
		</div>	
	</div>
	<jsp:include page="/include/footer.jsp"></jsp:include>
	<script src="${pageContext.request.contextPath}/resources/js/gura_util.js"></script>
	<script>
		document.querySelector("#state").addEventListener("change",function(){
			let val=this.value;
			location.href="order.do?state="+val+"&condition=${condition }&keyword=${encodedK }";
		});
		
		let selectRows=document.querySelectorAll(".selectRow");
		let checks=document.querySelectorAll('.selectRow input[type=checkbox]');
		for(let i=0;i<selectRows.length;i++){
			selectRows[i].addEventListener("click", function(){
				if(checks[i].checked==false){
					checks[i].checked =true;	
				}else{
					checks[i].checked =false;
				}
				
			});
		}
		for(let i=0;i<checks.length;i++){
			checks[i].addEventListener("click", function(event){
				event.stopPropagation(); //부모객체에 전파되는걸 막는 함수
			});
		}
		
		document.querySelector("#allCheck").addEventListener("click",function(){
			for(let i=0;i<selectRows.length;i++){
				if(this.checked==true){
					checks[i].checked =true;	
				}else{
					checks[i].checked =false;
				}
			}
		});
		
		
		const updateBtn=document.querySelector("#updateBtn");
		const changeBtn=document.querySelector("#changeBtn");
		const cancleBtn=document.querySelector("#cancleBtn");
		const updateState=document.querySelector("#updateState");
		
		updateBtn.addEventListener("click",function(){
			this.style.display="none";
			changeBtn.style.display="inline";
			cancleBtn.style.display="inline";
			updateState.removeAttribute('disabled');
		});

		cancleBtn.addEventListener("click",function(){
			this.style.display="none";
			changeBtn.style.display="none";
			updateBtn.style.display="inline";
			updateState.setAttribute('disabled',true);
			$('#updateState').val('상태').prop('selected',true);
		});
		
		changeBtn.addEventListener("click",function(){
			let updateUsers=document.querySelectorAll('.selectRow input[type=checkbox]:checked');
			
			if(updateUsers.length==0){
				alert("수정할 회원을 선택해주세요.");
				return;
			}else if(updateState.value=='상태'){
				alert("변경할 상태를 선택해주세요.");
				return;
			}else{
			    if (!confirm("상태를 '"+updateState.value+"' 로 변경하시겠습니까?")) {
			        return;
			    } else {
			    	let form=document.querySelector("#orderForm");
					//form.setAttribute('action','admin_user_delete.do');
					ajaxFormPromise(form)
					.then(function(res){
						return res.json();
					})
					.then(function(data){
						if(data.isSuccess == true){
							alert(data.count+'명의 회원을 수정했습니다');
							location.href="${pageContext.request.contextPath}/mypage/order.do";
						}else{
							alert('회원 수정에 실패했습니다.');
						}
					});
			    }
			}
		});
		
		document.querySelector("#getBtn").addEventListener("click",function(){
			let updateUsers=document.querySelectorAll('.selectRow input[type=checkbox]:checked');
			let selectCourier=document.querySelector('#courier');
			
			if(updateUsers.length==0){
				alert("회원을 선택해주세요.");
				return;
			}else{
				for(let i=0;i<updateUsers.length;i++){
					if(updateUsers[0].dataset.state != '예약완료'){
						alert('예약완료인 주문만 발급가능합니다.');
						return;
					}
					
					if(updateUsers[0].dataset.courier1 != ''){
						alert('발급은 한번만 가능합니다.');
						return;
					}
				}
				if (!confirm("택배사를 '"+selectCourier.value+"' 로 선택하시겠습니까?")) {
			        return;
			    } else {
			    	let form=document.querySelector("#orderForm");
					form.setAttribute('action','admin_insert_courier.do');
					ajaxFormPromise(form)
					.then(function(res){
						return res.json();
					})
					.then(function(data){
						if(data.isSuccess == true){
							alert(data.count+'명의 회원의 송장번호를 발급했습니다');
							location.href="${pageContext.request.contextPath}/mypage/order.do";
						}else{
							alert('송장번호 발급이 실패했습니다.');
						}
					});
			    }

			}
		});
		
		document.querySelector("#sendBtn").addEventListener("click",function(){
			let updateUsers=document.querySelectorAll('.selectRow input[type=checkbox]:checked');
			let selectCourier=document.querySelector('#courier');
			
			if(updateUsers.length==0){
				alert("회원을 선택해주세요.");
				return;
			}else{
				for(let i=0;i<updateUsers.length;i++){
					if(updateUsers[0].dataset.state != '세탁완료'){
						alert('세탁완료인 주문만 발급가능합니다.');
						return;
					}
					
					if(updateUsers[0].dataset.courier2 != ''){
						alert('발급은 한번만 가능합니다.');
						return;
					}
				}
				if (!confirm("택배사를 '"+selectCourier.value+"' 로 선택하시겠습니까?")) {
			        return;
			    } else {
			    	let form=document.querySelector("#orderForm");
					form.setAttribute('action','admin_insert_courier2.do');
					ajaxFormPromise(form)
					.then(function(res){
						return res.json();
					})
					.then(function(data){
						if(data.isSuccess == true){
							alert(data.count+'명의 회원의 송장번호를 발급했습니다');
							location.href="${pageContext.request.contextPath}/mypage/order.do";
						}else{
							alert('송장번호 발급이 실패했습니다.');
						}
					});
			    }
			}
		});
	</script>
</body>
</html>