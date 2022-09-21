<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/review/detail.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/nav.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/subnav.css">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/subFooter.css">
<!--font-->
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<!-- Font awesome -->
<script src="http://code.jquery.com/jquery-2.1.3.min.js"></script>
<style>
	.content{
		border: 1px dotted gray;
	}
	
	.a1 {
	  text-decoration: none; /* 링크의 밑줄 제거 */
	  color: inherit; /* 링크의 색상 제거 */	  
	}
	
	.a2 a{
		text-decoration: none;
		color: #000;
		font-size : 17px
	}
	
	.a2 a:hover{
		text-decoration: underline;
	}
	
	.a2 a.active{
		color: gray;
		font-weight: bold;
		text-decoration: underline;
	}
	.a2 ul{
		text-align: center;

	}
	.a2 ul > li{
		display:inline-block;
		
	}
	.container > img {

	  width: 100%;
	  height: 200px;	  
	  }	
</style>
</head>
<body>
<jsp:include page="/include/nav.jsp"></jsp:include>
   <!-- sub nav바 -->
   <!-- 
      thisPage는 대메뉴를 구별하는데 사용
      subPage는 소메뉴를 구별하는데 사용
    -->
 <jsp:include page="/include/subnav.jsp">
 	<jsp:param value="client" name="thisPage"/>
    <jsp:param value="review" name="subPage"/>
 </jsp:include>
<div class="container" style= "width:800px">
	<img src="${pageContext.request.contextPath}/images/review6.jpg"  />
	<table class="table table-bordered table-striped-columns ">
		<tr>
			<th>글번호</th>
			<td>${dto.num }</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${dto.writer }</td>
		</tr>
		<tr>
			<th>제목</th>
			<td>${dto.title }</td>
		</tr>
		<tr>
			<th>조회수</th>
			<td>${dto.viewCount }</td>
		</tr>
		<tr>
			<th>등록일</th>
			<td>${dto.regdate }</td>
		</tr>
		<tr>
			<th>평점</th>
			<td>
				<c:choose>
					<c:when test="${dto.star eq 1 }">
						★☆☆☆☆
					</c:when>
					<c:when test="${dto.star eq 2 }">
						★★☆☆☆
					</c:when>
					<c:when test="${dto.star eq 3 }">
						★★★☆☆
					</c:when>
					<c:when test="${dto.star eq 4 }">
						★★★★☆
					</c:when>
					<c:when test="${dto.star eq 5 }">
						★★★★★
					</c:when>																								
				</c:choose>				
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<div class="content">${dto.content }</div>
			</td>
		</tr>
	</table>
</div>		
	<div class="a2">
	<ul>
	<c:if test="${dto.prevNum ne 0 }">
			<li><a class="a1" href="detail.do?num=${dto.prevNum }&keyword=${encodedK }&condition=${condition }">이전글</a></li>
		</c:if>
		<c:if test="${dto.nextNum ne 0 }">
			<li><a class="a1" href="detail.do?num=${dto.nextNum }&keyword=${encodedK }&condition=${condition }">다음글</a></li>
	</c:if>
	</ul>
	</div>
	<div class="container mb-5" style= "width:800px">
		<a class="a1" href="list.do" style= "float: right">목록보기</a>
		<c:if test="${dto.writer eq id }">
			<a class="a1" href="updateform.do?num=${dto.num }" "float: left" >수정</a>
			<a class="a1" href="delete.do?num=${dto.num }" "float: left" >삭제</a>
		</c:if>
	</div>		
<jsp:include page="/include/footer.jsp"></jsp:include>	
</body>
</html>