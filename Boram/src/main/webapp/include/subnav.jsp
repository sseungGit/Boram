<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div id="subnav">
    <c:choose>
    	<c:when test="${param.thisPage eq 'guide'}">
    		<div id="image-box">
    			<img id="image-thumbnail" 
    				src="${pageContext.request.contextPath }/resources/img/img1.jpg" alt="" />
    		</div>
    		<div id="sub-text">
    			<p id="subTitle">예약하기</p>
				<p id="subContent">편한한 예약을 위해 Laundry365가 함께하겠습니다.</p>	
    		</div>
    	</c:when>
    	<%-- 각 서브 메뉴를 밑에 이어서 추가하면 됩니다 --%>
 	    <%-- 예시
	 	    <c:when test="${param.thisPage eq '메뉴별 param 값'}">
	    		<div id="image-box">
	    			<img id="image-thumbnail" 
	    				src="${pageContext.request.contextPath }/resources/img/sub/메뉴별 이미지경로" alt="" />
	    		</div>
	    		<div id="sub-text">
	    			<p id="subTitle">메뉴명</p>
					<p id="subContent">메뉴별 문구</p>	
	    		</div>
	    	</c:when> 
    	--%>
    </c:choose>
</div>
<nav class="bg-light">
  <div id="subNavbar">
    <div id="subNavbarNav">
    <c:choose>
    	<c:when test="${param.thisPage eq 'guide'}">
			<ul id="subNavUl">
				<li class="subNavItem ${param.subPage eq 'area' ? 'deco' : ''}">
				  	<a class="${param.subPage eq 'area' ? 'active' : ''}" aria-current="page" href="#">예약하기</a>
				</li>
			</ul>
    	</c:when>
    	<%-- 각 서브 메뉴를 밑에 이어서 추가하면 됩니다 --%>
    	<%-- 예시
    	<c:when test="${param.thisPage eq '메뉴별 param 값'}">
			<ul id="subNavUl">
				<li class="subNav-item">
				  	<a class=" ${param.subPage eq '서브메뉴별 param값' ? 'active' : ''}" aria-current="page" href="경로">서브 메뉴명1</a>
				</li>
				<li class="subNav-item">
				  	<a class=" ${param.subPage eq '서브메뉴별 param값' ? 'active' : ''}" href="경로">서브 메뉴명2</a>
				</li>
			</ul>
    	</c:when>
    	 --%>
    </c:choose>
    </div>
  </div>
</nav>
<div id="subMenuText">
    		<p>예약하기</p>
	<%-- 각 서브 메뉴를 밑에 이어서 추가하면 됩니다 --%>
    <%-- 예시
  	<c:choose>
    	<c:when test="${param.subPage eq '서브메뉴 param 값'}">
    		<p>서브메뉴명1</p>
    	</c:when>
  	    <c:when test="${param.subPage eq '서브메뉴 param 값'}">
    		<p>서브메뉴명2</p>
    	</c:when>
	</c:choose>
  	--%>
</div>