<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/review/list_detail.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-2.1.3.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/nav.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/subnav.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/subFooter.css">
<style>
	#price-wr,#subMenuText{
		text-align: center;
		animation: fadeIn;
		animation-duration: 1s; 
	}
	#price-wr{
		 margin-bottom: 250px;
	}
	#btnGroup{
		display: inline-block;
		margin-bottom: 50px;
	}
	#btnGroup a{
		margin: 0px 30px;
		width: 100px;
	}
	#itemsTableDiv{
		display: inline-block;
		padding: 20px;
		/* border:1px solid black;
		border-radius: 10px; */
	}
	#itemsTableDiv table{
		width: 750px;
	}
	
	#itemsTableDiv table th{
		padding-bottom: 15px;
		border-bottom: 3px solid black;
	}
	
	#itemsTableDiv table td{
		padding-top: 20px;
		padding-bottom: 20px;
		border-bottom: 1px solid #A1A1AB;
	}
	#itemsTableDiv tbody tr:hover{
		background-color: #A1A1AB;
	}
	#itemsTableDiv table td:nth-child(2){
		text-align: center;
		padding-left: 20px;
	}
	.clickBtn{
		background-color: black;
	}
</style>
</head>
<body>
	<!-- main nav바 -->
	<jsp:include page="/include/nav.jsp"></jsp:include>
	<!-- sub nav바 -->
	<!-- 
      thisPage는 대메뉴를 구별하는데 사용
      subPage는 소메뉴를 구별하는데 사용
    -->
 <jsp:include page="/include/subnav.jsp">
	<jsp:param value="mypage" name="thisPage"/>
	<jsp:param value="orderlist" name="subPage"/>
 </jsp:include>
	<h1>주문 상세 정보입니다</h1>
	<div id="price-wr" class="container">
		<div id="itemsTableDiv">
			<table class="table  table-hover">
				<thead>
					<tr>
						<th>NO</th>
						<th>품목</th>
						<th>수량</th>
						<th>가격</th>
						<th>배송조회</th>	
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>${orders.code}</td>
						<td>${orders.inum }</td>
						<td>${orders.count }</td>
						<td>${orders.order_price }</td>
						<td><a href="https://tracker.delivery/#/kr.epost/1111111111111" target="_blank">배송조회</a></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>