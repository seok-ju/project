<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후기게시판</title>
<script>
	function clickQu(num){
		var con = document.getElementById(num);
		if(con.style.display == 'none'){
			con.style.display='';
		}else{
			con.style.display='none';
		}
	}
</script>
</head>
<body>
<c:if test="${cnt eq 0}">
	<b>등록된 상품문의가 없습니다.</b>
</c:if>
<table>
<c:forEach var="board" items="${list}" varStatus="loop">
	<tr>
		<td>
		<c:if test="${board.boStep ne 0}">
		<img src="${pageContext.request.contextPath}/resources/image/Re.png" width="20">
		</c:if>
		<a href="javascript:clickQu(${loop.index+10000000});">${board.boTitle}</a></td>
		<td>${board.boId}</td>
		<td><fmt:formatDate value="${board.boDate}" pattern="yyyy-MM-dd hh:mm"/></td>
	</tr>
	<tr id="${loop.index+10000000}" style="display:none">
		<td colspan="3">${board.boContent}<br>
		<c:if test="${user.mem eq '관리자'}">
		<button onclick="location.href='<c:url value="/board/writeQu?proNum=${board.proNum}&boRef=${board.boRef}"/>'">답글</button></c:if>
		<c:if test="${user.mem eq '회원'}">
		<button onclick="location.href='<c:url value="/board/modifyQu?boNum=${board.boNum}"/>'">수정</button>
		<button onclick="location.href='<c:url value=""/>'">삭제</button></c:if></td>
	</tr>
</c:forEach>
</table>
<c:if test="${proNum ne 0 && user.mem eq '회원'}">
	<button onclick="location.href='<c:url value="/board/writeQu?proNum=${proNum}"/>'">문의 작성</button>
</c:if>
<c:choose>
	<c:when test="${proNum eq 0}">
		<div>
		<c:if test="${pagination.curRange ne 1 }">
			<a href='<c:url value="/board/listQu?proNum=${proNum}"/>'>[처음]</a>
		</c:if>
		<c:if test="${pagination.curPage ne 1}">
			<a href='<c:url value="/board/listQu?proNum=${proNum}&curPage=${pagination.prevPage}"/>'>[이전]</a> 
		</c:if>
		<c:forEach var="pageNum" begin="${pagination.startPage }" end="${pagination.endPage }">
			<c:choose>
				<c:when test="${pageNum eq  pagination.curPage}">
					<span style="font-weight: bold;"><a href='<c:url value="/board/listQu?proNum=${proNum}&curPage=${pageNum}"/>'>${pageNum}</a></span> 
				</c:when>
				<c:otherwise>
					<a href='<c:url value="/board/listQu?proNum=${proNum}&curPage=${pageNum}"/>'>${pageNum}</a> 
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${pagination.curPage ne pagination.pageCnt && pagination.pageCnt > 0}">
			<a href='<c:url value="/board/listQu?proNum=${proNum}&curPage=${pagination.nextPage}"/>'>[다음]</a> 
		</c:if>
		<c:if test="${pagination.curRange ne pagination.rangeCnt && pagination.rangeCnt > 0}">
			<a href='<c:url value="/board/listQu?proNum=${proNum}&curPage=${pageCnt}"/>'>[끝]</a> 
		</c:if>
	</div>
	</c:when>
	<c:otherwise>
		<div>
		<c:if test="${pagination.curRange ne 1 }">
			<a href='<c:url value="/product/read/${proNum}#qu"/>'>[처음]</a>
		</c:if>
		<c:if test="${pagination.curPage ne 1}">
			<a href='<c:url value="/product/read/${proNum}?quPage=${pagination.prevPage}#qu"/>'>[이전]</a> 
		</c:if>
		<c:forEach var="pageNum" begin="${pagination.startPage }" end="${pagination.endPage }">
			<c:choose>
				<c:when test="${pageNum eq  pagination.curPage}">
					<span style="font-weight: bold;"><a href='<c:url value="/product/read/${proNum}?quPage=${pageNum}#qu"/>'>${pageNum}</a></span> 
				</c:when>
				<c:otherwise>
					<a href='<c:url value="/product/read/${proNum}?quPage=${pageNum}#qu"/>'>${pageNum}</a> 
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${pagination.curPage ne pagination.pageCnt && pagination.pageCnt > 0}">
			<a href='<c:url value="/product/read/${proNum}?quPage=${pagination.nextPage}#qu"/>'>[다음]</a> 
		</c:if>
		<c:if test="${pagination.curRange ne pagination.rangeCnt && pagination.rangeCnt > 0}">
			<a href='<c:url value="/product/read/${proNum}?quPage=${pageCnt}#qu"/>'>[끝]</a> 
		</c:if>
	</div>
	</c:otherwise>
</c:choose>
</body>
</html>