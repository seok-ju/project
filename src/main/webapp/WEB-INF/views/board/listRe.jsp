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
	function click(num){
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
	<b>등록된 상품후기가 없습니다.</b>
</c:if>
<table>
<c:forEach var="board" items="${list}" varStatus="loop">
	<tr>
		<td>
		<c:if test="${board.boStep ne 0}">
		<img src="${pageContext.request.contextPath}/resources/image/Re.png" width="20">
		</c:if>
		<a href="javascript:click(${loop.index});">${board.boTitle}
		<c:if test="${not empty board.boImg}">
		<img src="${pageContext.request.contextPath}/resources/image/photo.JPG" width="20">
		</c:if></a></td>
		<td>${board.boId}</td>	
		<td><fmt:formatDate value="${board.boDate}" pattern="yyyy-MM-dd hh:mm"/></td>
	</tr>
	<tr id="${loop.index}" style="display:none">
		<td colspan="3">
		<c:if test="${not empty board.boImg}">
		<img src="${pageContext.request.contextPath}${board.boImg}">
		</c:if>
		${board.boContent}<br>
		<c:if test="${user.mem eq '관리자'}">
		<button onclick="location.href='<c:url value="/board/writeRe?proNum=${board.proNum}&boRef=${board.boRef}"/>'">답글</button>
		</c:if>
		<c:if test="${user.mem eq '회원'}">
		<button onclick="location.href='<c:url value="/board/modifyRe?boNum=${board.boNum}"/>'">수정</button>
		<button onclick="location.href='<c:url value=""/>'">삭제</button></c:if></td>
	</tr>
</c:forEach>
</table>
<c:if test="${proNum ne 0 && user.mem eq '회원'}">
	<button onclick="location.href='<c:url value="/board/writeRe?proNum=${proNum}"/>'">후기 작성</button>
</c:if>
<c:choose>
	<c:when test="${proNum eq 0}">
		<div>
		<c:if test="${pagination.curRange ne 1 }">
			<a href='<c:url value="/board/listRe?proNum=${proNum}"/>'>[처음]</a>
		</c:if>
		<c:if test="${pagination.curPage ne 1}">
			<a href='<c:url value="/board/listRe?proNum=${proNum}&curPage=${pagination.prevPage}"/>'>[이전]</a> 
		</c:if>
		<c:forEach var="pageNum" begin="${pagination.startPage }" end="${pagination.endPage }">
			<c:choose>
				<c:when test="${pageNum eq  pagination.curPage}">
					<span style="font-weight: bold;"><a href='<c:url value="/board/listRe?proNum=${proNum}&curPage=${pageNum}"/>'>${pageNum}</a></span> 
				</c:when>
				<c:otherwise>
					<a href='<c:url value="/board/listRe?proNum=${proNum}&curPage=${pageNum}"/>'>${pageNum}</a> 
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${pagination.curPage ne pagination.pageCnt && pagination.pageCnt > 0}">
			<a href='<c:url value="/board/listRe?proNum=${proNum}&curPage=${pagination.nextPage}"/>'>[다음]</a> 
		</c:if>
		<c:if test="${pagination.curRange ne pagination.rangeCnt && pagination.rangeCnt > 0}">
			<a href='<c:url value="/board/listRe?proNum=${proNum}&curPage=${pageCnt}"/>'>[끝]</a> 
		</c:if>
	</div>
	</c:when>
	<c:otherwise>
		<div>
		<c:if test="${pagination.curRange ne 1 }">
			<a href='<c:url value="/product/read/${proNum}#re"/>'>[처음]</a>
		</c:if>
		<c:if test="${pagination.curPage ne 1}">
			<a href='<c:url value="/product/read/${proNum}?rePage=${pagination.prevPage}#re"/>'>[이전]</a> 
		</c:if>
		<c:forEach var="pageNum" begin="${pagination.startPage }" end="${pagination.endPage }">
			<c:choose>
				<c:when test="${pageNum eq  pagination.curPage}">
					<span style="font-weight: bold;"><a href='<c:url value="/product/read/${proNum}?rePage=${pageNum}#re"/>'>${pageNum}</a></span> 
				</c:when>
				<c:otherwise>
					<a href='<c:url value="/product/read/${proNum}?rePage=${pageNum}#re"/>'>${pageNum}</a> 
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${pagination.curPage ne pagination.pageCnt && pagination.pageCnt > 0}">
			<a href='<c:url value="/product/read/${proNum}?rePage=${pagination.nextPage}#re"/>'>[다음]</a> 
		</c:if>
		<c:if test="${pagination.curRange ne pagination.rangeCnt && pagination.rangeCnt > 0}">
			<a href='<c:url value="/product/read/${proNum}?rePage=${pageCnt}#re"/>'>[끝]</a> 
		</c:if>
	</div>
	</c:otherwise>
</c:choose>
</body>
</html>