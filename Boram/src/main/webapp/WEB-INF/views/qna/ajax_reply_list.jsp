<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:forEach var="tmp" items="${replyList }">
			<c:if test="${tmp.rnum eq tmp.ref_num }">
				<li id="reli${tmp.rnum }">
			</c:if>
			<c:if test="${tmp.rnum ne tmp.ref_num }">
				<li id="reli${tmp.num }" class="page-${pageNum }" style="padding-left:50px;" >
					<svg class="reply-icon" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-return-right" viewBox="0 0 16 16">
 							<path fill-rule="evenodd" d="M1.5 1.5A.5.5 0 0 0 1 2v4.8a2.5 2.5 0 0 0 2.5 2.5h9.793l-3.347 3.346a.5.5 0 0 0 .708.708l4.2-4.2a.5.5 0 0 0 0-.708l-4-4a.5.5 0 0 0-.708.708L13.293 8.3H3.5A1.5 1.5 0 0 1 2 6.8V2a.5.5 0 0 0-.5-.5z"/>
					</svg>
			</c:if>
					<dl>
						<dt>
							<span>${tmp.writer }</span>
							<span>${tmp.regdate }</span>
							<a data-num="${tmp.rnum }" href="javascript:" class="reply-link">답글</a>
							<c:if test="${ tmp.writer eq id }">
								<a data-num="${tmp.rnum }" class="update-link" href="javascript:">수정</a>
								<a data-num="${tmp.rnum }" class="delete-link" href="javascript:">삭제</a>
							</c:if>
						</dt>
						<dd>
							<pre id="pre${tmp.rnum }">${tmp.content }</pre>						
						</dd>
					</dl>
					<form id="reForm${tmp.rnum }" class="animate__animated reply-form re-insert-form" action="reply_insert.do" method="post">
						<input type="hidden" name="ref_num" value="${rnum }"/>
						<input type="hidden" name="target_id" value="${tmp.writer }"/>
						<textarea name="content"></textarea>
						<button type="submit">등록</button>
					</form>
				<c:if test="${tmp.writer eq id }">
					<form id="updateForm${tmp.rnum }" class="reply-form update-form" action="reply_update.do" method="post">
						<input type="hidden" name="num" value="${tmp.rnum }" />
						<textarea name="content">${tmp.content }</textarea>
						<button type="submit">수정</button>
					</form>
				</c:if>		

</c:forEach> 