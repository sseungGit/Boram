<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<table class="table table-hover" id="table">
	<thead>
		<tr>
			<th scope="col">#</th>
			<th scope="col">카테고리</th>
			<th scope="col">제목</th>
			<c:if test="${not empty manager and manager == 'Y'}">
			<th scope="col">수정</th>
			<th scope="col">삭제</th>
			</c:if>
		</tr>
	</thead>
	<tbody>
	<c:forEach var="tmp" items="${list }">
		<c:if test="${tmp.category eq param.category }">
			<tr class="question" data-num="${tmp.num }">
				<td scope="row">${tmp.num }</td>
				<c:choose>
					<c:when test="${tmp.category eq 'service' }">
					<th scope="row">[서비스 이용]</th>
					</c:when>
					<c:when test="${tmp.category eq 'order' }">
					<th scope="row">[주문·결제·배송]</th>
					</c:when>
					<c:when test="${tmp.category eq 'member' }">
					<th scope="row">[회원정보]</th>
					</c:when>
					<c:when test="${tmp.category eq 'etc' }">
					<th scope="row">[기타]</th>
					</c:when>
				</c:choose>
				<td scope="row">
				
					${tmp.title }<i class="bi bi-chevron-down" style="float:right"></i>
		
				</td>
				<c:if test="${ not empty manager and manager == 'Y'}">
				<td scope="row"><a href="updateform.do?num=${tmp.num }">수정</a></td>
				<td scope="row"><a href="delete.do?num=${tmp.num }">삭제</a></td>
				</c:if>
			</tr>
			<tr class="answer" id="answer${tmp.num }">
				<td colspan="100%">
				<div>
					<p style="text-align: left;">${tmp.content}</p>
				</div>
				</td> 
			</tr>
		</c:if>
		
	</c:forEach>
	</tbody>
</table>