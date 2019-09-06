<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
	<title>공지사항</title>
</head>

<body>
<table border="1">
	<tr>
		<th>공지사항</th>
		<th>번 호</th>
		<th>제 목</th>
		<th>작 성 일</th>
	</tr>
	<c:forEach var="board" items="${hostBoardList}" varStatus="loop">
		<tr>
			<td>공지사항</td>
			<td>${loop.index + 1}</td>
 			<td><a href="<c:url value="/hostboard/content?honum=${board.honum}"/>">
 			${board.hotitle}
 			</a></td>
 			<td>
 			<fmt:formatDate value="${board.hodate}" pattern="yyyy-MM-dd HH:mm" />
 			</td>
 		</tr>
 	</c:forEach>
 </table>
 	<button type="button" onClick="location.href='<c:url value="/hostboard/write?hoclass=2"/>'">글쓰기</button>
 	<div>
 	<c:if test="${pagination.curRange ne 1}">
    	<a href="<c:url value='/hostboard/notice'/>">[처음]</a> 
  	</c:if>
  	
    <c:if test="${pagination.curPage ne 1}">
    	<a href="<c:url value='/hostboard/notice?curPage=${pagination.prevPage}'/>">[이전]</a> 
    </c:if>
    
   	<c:forEach var="pageNum" begin="${pagination.startPage }" end="${pagination.endPage }">
    	<c:choose>
        	<c:when test="${pageNum eq pagination.curPage}">
            	<span style="font-weight: bold;"><a href="<c:url value='/hostboard/notice?curPage=${pageNum}'/>">${pageNum}</a></span> 
            </c:when>
            <c:otherwise>
            	<a href="<c:url value='/hostboard/notice?curPage=${pageNum}'/>">${pageNum}</a> 
            </c:otherwise>
      	</c:choose>
    </c:forEach>
    
    <c:if test="${pagination.curPage ne pagination.pageCnt && pagination.pageCnt > 0}">
    	<a href="<c:url value='/hostboard/notice?curPage=${pagination.nextPage}'/>">[다음]</a> 
    </c:if>
    
    <c:if test="${pagination.curRange ne pagination.rangeCnt && pagination.rangeCnt > 0}">
    	<a href="<c:url value='/hostboard/notice?curPage=${pagination.pageCnt}'/>">[끝]</a> 
    </c:if>
 </div>
</body>
</html>