<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가격안내</title>
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
	.btn{
    border: 1px solid rgb(0, 0, 0);
    text-transform: uppercase;
    padding: 0.6rem 1rem;
    cursor: pointer;
    background: rgb(0, 0, 0);
    color: #ffffff;
    transition: all 0.5s ease;
    border-radius: 0px;
}
	.btn:hover{
    background: transparent;
    color: #000000;
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
		text-align: left;
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
	<jsp:include page="/include/subnav.jsp">
		<jsp:param value="guide" name="thisPage"/>
		<jsp:param value="price" name="subPage"/>
	</jsp:include>
	<div id="price-wr" class="container">
		<div id="btnGroup">
			<a href="javascript:clicked('clothes')" class="btn" id="clothes">의류</a>
			<a href="javascript:clicked('bedding')" class="btn" id="bedding">침구</a>
			<a href="javascript:clicked('shoes')" class="btn" id="shoes">신발</a>
			<a href="javascript:clicked('living')" class="btn" id="living">리빙</a>
		</div>
		<div id="itemsTableDiv">
			<table class="table  table-hover">
				<thead>
					<tr>
						<th>NO</th>
						<th>품목</th>
						<th>가격</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach var="tmp" items="${list}">
					<c:set var="i" value="${i+1 }"/>
					<tr>
						<td>${i}</td>
						<td>${tmp.item }</td>
						<td><f:formatNumber value="${tmp.price }" pattern="#,###" /></td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<jsp:include page="/include/footer.jsp"></jsp:include>
	
	<script src="${pageContext.request.contextPath}/resources/js/gura_util.js"></script>
	<script>
		function clicked(category){			
			ajaxPromise('price_guide.do','get',"category="+category)
			.then(function(res){
				return res.text();
			})
			.then(function(data){
				$('#itemsTableDiv').html("");
				$('#itemsTableDiv').html(data);
			});
		}
	</script>
</body>
</html>