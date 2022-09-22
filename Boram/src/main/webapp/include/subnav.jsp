<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div id="subnav">
    <c:choose>
    	<c:when test="${param.thisPage eq 'guide'}">
    		<div id="image-box">
    			<img id="image-thumbnail" 
    				src="${pageContext.request.contextPath }/resources/img/subimg.jpg" alt="" />
    		</div>
    		<div id="sub-text">
    			<p id="subTitle">이용안내</p>
				<p id="subContent">편한한 이용을 위해 Laundry365가 함께하겠습니다.</p>	
    		</div>
    	</c:when>
    	<c:when test="${param.thisPage eq 'client'}">
    		<div id="image-box">
    			<img id="image-thumbnail" 
    				src="${pageContext.request.contextPath }/resources/img/client.png" alt="" />
    		</div>
    		<div id="sub-text">
    			<p id="subTitle">고객지원</p>
				<p id="subContent">고객님과 소통하는 Laundry365가 되겠습니다.</p>	
    		</div>
    	</c:when>
    	<c:when test="${param.thisPage eq 'brand'}">
    		<div id="image-box">
    			<img id="image-thumbnail" 
    				src="${pageContext.request.contextPath }/resources/img/brandSubImg2.jpg" alt="" />
    		</div>
    		<div id="sub-text">
    			<p id="subTitle">브랜드소개</p>
				<p id="subContent">Laundry365를 소개합니다.</p>	
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
				  	<a class="${param.subPage eq 'area' ? 'active' : ''}" aria-current="page" href="#">지역안내</a>
				</li>
				<li class="subNavItem ${param.subPage eq 'price' ? 'deco' : ''}">
				  	<a class="${param.subPage eq 'price' ? 'active' : ''}" href="#">가격안내</a>
				</li>
			</ul>
    	</c:when>
   		<c:when test="${param.thisPage eq 'client'}">
			<ul id="subNavUl">
				<li class="subNavItem ${param.subPage eq 'review' ? 'deco' : ''}">
				  	<a class="${param.subPage eq 'review' ? 'active' : ''}" aria-current="page" href="${pageContext.request.contextPath}/review/list.do">후기게시판</a>
				</li>
				<li class="subNavItem ${param.subPage eq 'qna' ? 'deco' : ''}">
				  	<a class="${param.subPage eq 'qna' ? 'active' : ''}" href="#">문의게시판</a>
				</li>
				<li class="subNavItem ${param.subPage eq 'notice' ? 'deco' : ''}">
				  	<a class="${param.subPage eq 'notice' ? 'active' : ''}" href="#">공지사항</a>
				</li>				
			</ul>
    	</c:when>
   		<c:when test="${param.thisPage eq 'brand'}">
			<ul id="subNavUl">
				<li class="subNavItem ${param.subPage eq 'corpor' ? 'deco' : ''}">
				  	<a class="${param.subPage eq 'corpor' ? 'active' : ''}" aria-current="page" href="${pageContext.request.contextPath}/corporation/brand.do">브랜드소개</a>
				</li>
				<li class="subNavItem ${param.subPage eq 'history' ? 'deco' : ''}">
				  	<a class="${param.subPage eq 'history' ? 'active' : ''}" href="${pageContext.request.contextPath}/corporation/history.do">연혁</a>
				</li>					
				<li class="subNavItem ${param.subPage eq 'startup' ? 'deco' : ''}">
				  	<a class="${param.subPage eq 'startup' ? 'active' : ''}" href="${pageContext.request.contextPath}/corporation/startup.do">창업안내</a>
				</li>
				<li class="subNavItem ${param.subPage eq 'members' ? 'deco' : ''}">
				  	<a class="${param.subPage eq 'members' ? 'active' : ''}" href="${pageContext.request.contextPath}/corporation/members.do">팀원소개</a>
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
  	    <c:when test="${param.subPage eq 'qna'}">
    		<p>문의게시판</p>
    	</c:when>
    	<c:when test="${param.subPage eq 'notice'}">
    		<p>공지사항</p>
    	</c:when>
	</c:choose>
	<c:choose>
    	<c:when test="${param.subPage eq 'corpor'}">
    		<p>브랜드소개</p>
    	</c:when>
  	    <c:when test="${param.subPage eq 'history'}">
    		<p>연혁</p>
    	</c:when>
    	<c:when test="${param.subPage eq 'startup'}">
    		<p>창업안내</p>
    	</c:when>
    	<c:when test="${param.subPage eq 'members'}">
    		<p>팀원소개</p>
    	</c:when>    	
	</c:choose>	
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