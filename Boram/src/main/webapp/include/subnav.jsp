<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div id="subnav">
    <c:choose>
    	<c:when test="${param.thisPage eq 'guide'}">
    		<div id="image-box">
    			<img id="image-thumbnail" 
    				src="${pageContext.request.contextPath }/resources/img/sub/guideimg.jpg" alt="" />
    		</div>
    		<div id="sub-text">
    			<p id="subTitle">이용안내</p>
				<p id="subContent">편한한 이용을 위해 Laundry365가 함께하겠습니다.</p>	
    		</div>
    	</c:when>
	 	<c:when test="${param.thisPage eq 'support'}">
	    	<div id="image-box">
	    		<img id="image-thumbnail" 
	    			src="${pageContext.request.contextPath }/resources/img/sub/subimgcs.png" alt="" />
	    	</div>
	    	<div id="sub-text">
	    		<p id="subTitle">고객지원</p>
				<p id="subContent">365일 신속, 정확한 고객케어 서비스를 운영합니다.</p>	
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
    	<c:when test="${param.thisPage eq 'support'}">
			<ul id="subNavUl">
				<li class="subNavItem ${param.subPage eq 'review' ? 'deco' : ''}">
				  	<a class="${param.subPage eq 'review' ? 'active' : ''}" aria-current="page" href="#">후기게시판</a>
				</li>
				<li class="subNavItem ${param.subPage eq 'faq' ? 'deco' : ''}">
				  	<a class="${param.subPage eq 'faq' ? 'active' : ''}" href="#">질문게시판</a>
				</li>
				<li class="subNavItem ${param.subPage eq 'notice' ? 'deco' : ''}">
				  	<a class="${param.subPage eq 'notice' ? 'active' : ''}" href="#">공지사항</a>
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
    	<c:when test="${param.subPage eq 'review'}">
    		<p>후기게시판</p>
    	</c:when>
  	    <c:when test="${param.subPage eq 'faq'}">
    		<p>질문게시판</p>
    	</c:when>
  	    <c:when test="${param.subPage eq 'notice'}">
    		<p>공지사항</p>
    	</c:when>
	</c:choose>
</div>
