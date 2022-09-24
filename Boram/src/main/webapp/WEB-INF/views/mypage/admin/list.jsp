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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/nav.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/subnav.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/subFooter.css">
<style>
	body{
		margin: 0;
		padding: 0;
		height: 100%;
	}
	#image-box{
		width: 100%;
		height: 300px;
		overflow: hidden;
		margin-bottom: 30px;
	}
	#subMenuText{
		height: 80px;
		position:relative;
	}
	#order_wr {
		width: 100%;
		margin-bottom: 250px;
		text-align: center;
	} 
	#body-content{
		
		width: 100%;
		height: 100%;
	}
	#body-content table{
		width: 1000px;
	}
	#body-content table th{
		padding-bottom: 15px;
		border-bottom: 3px solid black;
	}
	#body-content table td{
		padding-top: 20px;
		padding-bottom: 20px;
		border-bottom: 1px solid #A1A1AB;
	}
	#body-content tbody tr:hover{
		background-color: #A1A1AB;
	}
	footer{
		width:100%;
		bottom: 0px;
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
		<jsp:param value="manager" name="subPage"/>
	</jsp:include>
	<div id="order_wr">
		<div id="body-content">
			<table>
				<thead>
					<tr>
						<th><input type="checkbox" id="allCheck"/></th>
						<th>주문번호</th>
						<th>주문자</th>
						<th>주문금액</th>
						<th>
							<select id="state">
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
						<th>운송장번호</th>
						<th>예약일</th>
						<th>요청일</th>
						<th>...</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach var="tmp" items="${ list }">
					<tr>
						<td><input type="checkbox" id="Check${tmp.code }"/></td>
						<td>${tmp.code }</td>
						<td>${tmp.orderer }</td>
						<td><f:formatNumber value="${tmp.order_price }" pattern="#,###" /></td>
						<td>${tmp.state }</td>
						<td>${tmp.get_invoice_num }</td>
						<td>${tmp.regdate }</td>
						<td>${tmp.reservation_date }</td>
						<td><a href="admin_detail.do?code=${tmp.code }" class="btn">...</a></td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
			<!-- 페이징처리 -->
			<div class="page-ui clearfix">
				<ul>
					<c:if test="${startPageNum ne 1 }">
						<li>
							<a href="order.do?pageNum=${startPageNum-1 }&condition=${condition }&keyword=${encodedK }">Prev</a>
						</li>
					</c:if>
					<c:forEach var="i" begin="${startPageNum }" end="${endPageNum }">
						<li>
							<c:choose>
								<c:when test="${pageNum eq i }">
									<a  class="active" href="order.do?pageNum=${i }&condition=${condition }&keyword=${encodedK }">${i }</a>
								</c:when>
								<c:otherwise>
									<a href="order.do?pageNum=${i }&condition=${condition }&keyword=${encodedK }">${i }</a>
								</c:otherwise>
							</c:choose>
						</li>
					</c:forEach>
					<c:if test="${endPageNum lt totalPageCount }">
						<li>
							<a href="order.do?pageNum=${endPageNum+1 }&condition=${condition }&keyword=${encodedK }">Next</a>
						</li>
					</c:if>
				</ul>
			</div>
			
			<div style="clear:both;"></div>
			
			<form action="order.do" method="get" id="searchForm"> 
				<input type="hidden" name="state" value="${state }"/>
				<label for="condition">검색조건</label>
				<select name="condition" id="condition">
					<option value="code" ${condition eq 'code' ? 'selected' : '' }>주문번호</option>
					<option value="orderer_name" ${condition eq 'orderer_name' ? 'selected' : '' }>아이디/이름</option>
				</select>
				<input type="text" id="keyword" name="keyword" placeholder="검색어..." value="${keyword }"/>
				<button type="submit">검색</button>
			</form>	
			<!-- 선생님 코드  -->
		</div>	
	</div>
	<jsp:include page="/include/footer.jsp"></jsp:include>
	<script src="${pageContext.request.contextPath}/resources/js/gura_util.js"></script>
	<script>
		document.querySelector("#state").addEventListener("change",function(){
			let val=this.value;
			alert(val);
			location.href="order.do?state="+val+"&condition=${condition }&keyword=${encodedK }";
			/* ajaxPromise("select_state.do","get","state="+val+"&condition=${condition }&keyword=${encodedK }")
            .then(function(res){
				return res.text();
			}).then(function(data){
				console.log(data);
				$('#order_wr').html(data);
				//$('#addPwdForm').html(data);
			}); */
		});
	
	</script>
</body>
</html>