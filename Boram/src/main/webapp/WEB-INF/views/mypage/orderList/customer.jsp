<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/mypage/ orderList/customer.jsp</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa"
	crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-2.1.3.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/nav.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/subnav.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/subFooter.css">
<style>
body {
	margin: 0;
	padding: 0;
	height: 100%;
}

#image-box {
	width: 100%;
	height: 300px;
	overflow: hidden;
	margin-bottom: 30px;
}

#subMenuText {
	height: 80px;
	position: relative;
}

#order_wr {
	width: 100%;
	margin-bottom: 250px;
	text-align: center;
}

#body-content {
	width: 100%;
	height: 100%;
}

#body-content table {
	width: 1000px;
}

#body-content table th {
	padding-bottom: 15px;
	border-bottom: 3px solid black;
}

#body-content table td {
	padding-top: 20px;
	padding-bottom: 20px;
	border-bottom: 1px solid #A1A1AB;
}

#body-content tbody tr:hover {
	background-color: #A1A1AB;
}

footer {
	width: 100%;
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
		<jsp:param value="mypage" name="thisPage" />
		<jsp:param value="orderlist" name="subPage" />
	</jsp:include>
	<div id="order_wr" class="container">
		<div id="btnGroup">
			<a href="javascript:clicked('orderlist')" class="btn" id="orderlist">주문/배송</a>
			<a href="javascript:clicked('cancellation')" class="btn"
				id="cancellation">취소내역</a>
		</div>
		<div id="body-content">
			<table>
				<thead>
					<tr>
						<th>신청일자</th>
						<th>품목</th>
						<th>상세보기</th>
						<th>주문금액</th>
						<th>처리상태</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="order" items="${orderList}">
						<tr>
							<td>${order.reservationDate}</td>
							<td>${order.item }</td>
							<td><a
								href="${pageContext.request.contextPath }/mypage/orderList/customer2.do?code=${order.code}">상세정보보기</a></td>
							<td>${order.totalPrice }</td>
							<td>${order.state}</td>
							<td><a href="https://tracker.delivery/#/kr.epost/1111111111111" target="_blank">배송조회</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>