<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div id="subnav">
    <c:choose>
    	<c:when test="${param.thisPage eq 'guide'}">
    		<div id="image-box">
    			<img id="image-thumbnail" 
    				src="${pageContext.request.contextPath }/resources/img/sub/subimg.jpg" alt="" />
    		</div>
    		<div id="sub-text">
    			<p id="subTitle">이용안내</p>
				<p id="subContent">편한한 이용을 위해 Laundry365가 함께하겠습니다.</p>	
    		</div>
    	</c:when>
    	<c:when test="${param.thisPage eq 'brand'}">
    		<div id="image-box">
    			<img id="image-thumbnail" 
    				src="${pageContext.request.contextPath }/resources/img/sub/brandSubImg2.jpg" alt="" />
    		</div>
    		<div id="sub-text">
    			<p id="subTitle">브랜드소개</p>
				<p id="subContent">Laundry365를 소개합니다.</p>	
    		</div>
    	</c:when> 
    	<c:when test="${param.thisPage eq 'mypage'}">
    		<div id="image-box">
    			<img id="image-thumbnail" 
    				src="${pageContext.request.contextPath }/resources/img/sub/mypageimg.jpg" alt="" />
    		</div>
    		<div id="sub-text">
    			<p id="subTitle">마이페이지</p>
				<p id="subContent">여러분의 배송정보를 여기서 확인해 보세요.</p>	
    		</div>
    	</c:when>
    </c:choose>
</div>
<nav class="bg-light">
  <div id="subNavbar">
    <div id="subNavbarNav">
    <c:choose>
    	<c:when test="${param.thisPage eq 'guide'}">
			<ul id="subNavUl">
				<li class="subNavItem ${param.subPage eq 'area' ? 'deco' : ''}">
				  	<a class="${param.subPage eq 'area' ? 'active' : ''}" aria-current="page" href="#">지역안내</a>
				</li>
				<li class="subNavItem ${param.subPage eq 'price' ? 'deco' : ''}">
				  	<a class="${param.subPage eq 'price' ? 'active' : ''}" href="#">가격안내</a>
				</li>
			</ul>
    	</c:when>
    	<c:when test="${param.thisPage eq 'brand'}">
			<ul id="subNavUl">
				<li class="subNavItem ${param.subPage eq 'corpor' ? 'deco' : ''}">
				  	<a class="${param.subPage eq 'brand' ? 'active' : ''}" aria-current="page" href="${pageContext.request.contextPath}/corporation/brand.do">회사소개</a>
				</li>
				<li class="subNavItem ${param.subPage eq 'history' ? 'deco' : ''}">
				  	<a class="${param.subPage eq 'history' ? 'active' : ''}" href="${pageContext.request.contextPath}/corporation/history.do">연혁</a>
				</li>					
				<li class="subNavItem ${param.subPage eq 'startup' ? 'deco' : ''}">
				  	<a class="${param.subPage eq 'startup' ? 'active' : ''}" href="${pageContext.request.contextPath}/corporation/startup.do">창업문의</a>
				</li>
				<li class="subNavItem ${param.subPage eq 'members' ? 'deco' : ''}">
				  	<a class="${param.subPage eq 'members' ? 'active' : ''}" href="${pageContext.request.contextPath}/corporation/members.do">팀원소개</a>
				</li>				
			</ul>
    	</c:when>   
    	<c:when test="${param.thisPage eq 'mypage'}">
			<ul id="subNavUl">
				<li class="subNavItem ${param.subPage eq 'info' ? 'deco' : ''}">
					<a class="${param.subPage eq 'info' ? 'active' : ''}" href="${pageContext.request.contextPath }/mypage/users/info.do">회원정보</a>
				</li>
				<li class="subNavItem ${param.subPage eq 'orderlist' ? 'deco' : ''}">
					<a class="${param.subPage eq 'orderlist' ? 'active' : ''}" aria-current="page" href="${pageContext.request.contextPath}/mypage/orderList/customer.do">신청내역확인</a>
				</li>
			</ul>
		</c:when>
    </c:choose>
    </div>
  </div>
</nav>
<div id="subMenuText">
	<c:choose>
    	<c:when test="${param.subPage eq 'area'}">
    		<p>지역안내</p>
    	</c:when>
  	    <c:when test="${param.subPage eq 'price'}">
    		<p>가격안내</p>
    	</c:when>
	</c:choose>		
	<c:choose>
    	<c:when test="${param.subPage eq 'corpor'}">
    		<p>회사소개</p>
    	</c:when>
  	    <c:when test="${param.subPage eq 'history'}">
    		<p>연혁</p>
    	</c:when>
    	<c:when test="${param.subPage eq 'startup'}">
    		<p>창업문의</p>
    	</c:when>
    	<c:when test="${param.subPage eq 'members'}">
    		<p>팀원소개</p>
    	</c:when>    	
	</c:choose>	
		<c:choose>
    	<c:when test="${param.subPage eq 'info'}">
    		<p>회원정보</p>
    	</c:when>
  	    <c:when test="${param.subPage eq 'orderlist'}">
    		<p>주문내역</p>
    	</c:when>  	
	</c:choose>	
</div>