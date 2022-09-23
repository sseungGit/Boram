<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
						<th>주문금액</th>
						<th>상태</th>
						<th>운송장번호</th>
						<th>예약일</th>
						<th>요청일</th>
						<th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
						<th>...</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach var="tmp" items="${ list }">
					<tr>
						<td><input type="checkbox" id="Check${tmp.code }"/></td>
						<td><p>${tmp.code }</p><p>${tmp.orderer }</p><p>${tmp.name }</p></td>
						<td>${tmp.order_price }</td>
						<td>${tmp.state }</td>
						<td>${tmp.get_invoice_num }</td>
						<td>${tmp.regdate }</td>
						<td>${tmp.reservation_date }</td>
						<td><p>${tmp.phone }</p><p>${tmp.addr }</p></td>
						<td><a href="order_detail.do?code=${tmp.code }" class="btn">...</a></td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>	
	</div>
	<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>