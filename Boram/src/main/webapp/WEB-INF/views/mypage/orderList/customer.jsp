<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/mypage/ orderList/customer.jsp</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/nav.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/subnav.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/subFooter.css">
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
	<jsp:param value="orderlist" name="subPage"/>
</jsp:include>

<div>
	<div style="text-align: center; float:left; width:60%; ">
	<p>주문/배송</p>
	</div>
	<div style="text-align: center; float:left; width:40%;">
	<p>취소 내역</p>
	</div>
</div>
<div>
	<div style="text-align: center; float:left; width:25%">
	<p>신청일자</p>
	</div>
	<div style="text-align: center; float:left; width:25%">
	<p>주문정보</p>
	</div>
	<div style="text-align: center; float:left; width:25%">
		<p>주문금액</p>
	</div>
	<div style="text-align: center; float:left; width:25%">
		<p>주문처리상태</p>
	</div>
</div>
<c:forEach items="${orderList}" var="order">
<div>
	<div style="text-align: center; float:left; width:25%">
	<p>${order.regdate}</p>
	</div>
	<div style="text-align: center; float:left; width:25%">
	<p>${order.item}</p>
	<a href="${pageContext.request.contextPath }/mypage/orderList/customer2.do?code=${order.code}">상세정보보기</a>
	</div>
	<div style="text-align: center; float:left; width:25%">
		<p>${order.totalPrice}원</p>
	</div>
	<div style="text-align: center; float:left; width:25%">
		<p>${order.state} </p>
	</div>
	<div style="width:0px;clear:both"></div>
</div>
</c:forEach>

		<div class="section" id="section4">
			<jsp:include page="/include/footer.jsp"></jsp:include>
		</div>
</body>
</html>