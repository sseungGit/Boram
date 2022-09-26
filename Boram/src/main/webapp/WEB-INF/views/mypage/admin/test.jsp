<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<div id="body-content">
			<table>
				<thead>
					<tr>
						<th><input type="checkbox" id="allCheck"/></th>
						<th>주문번호</th>
						<th>주문금액</th>
						<th>
							<select name="state" id="state">
								<option ${state eq '' ? 'selected' : '' }>상태</option>
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
						<td><p>${tmp.code }</p><p>${tmp.orderer }</p><p>${tmp.name }</p></td>
						<td>${tmp.order_price }</td>
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
			
			<form action="order.do" method="get"> 
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
		<script src="${pageContext.request.contextPath}/resources/js/gura_util.js"></script>
		<script>
			document.querySelector("#state").addEventListener("change",function(){
				let val=this.value;
				alert(val);
				ajaxPromise("select_state.do","get","state="+val+"&condition=${condition }&keyword=${encodedK }")
	            .then(function(res){
					return res.text();
				}).then(function(data){
					console.log(data);
					$('#order_wr').html(data);
					//$('#addPwdForm').html(data);
				});
			});
		
		</script>