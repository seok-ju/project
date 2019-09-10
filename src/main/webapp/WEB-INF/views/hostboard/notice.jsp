<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>meiB</title>
		<link href="${pageContext.request.contextPath}/resources/css/main_style.css" rel="stylesheet" type="text/css">
		
	</head>
	<body>
		<div id="wrap">
			<div class='ribbon'>
				<a href='index'><span>product</span></a>
				<a href='<c:url value="/product/cart"/>'><span>cart</span></a>
				<a href='#'><span>myPage</span></a>
				<a href='support'><span>support</span></a>
			</div>
<c:if test="${user eq null }"> 
			<form action='<c:url value="/member/sign/signIn"/>' method="post" id="loginForm">
				<div class="left-box" style="text-align: left;">	
					<input type="text" id="id" name="id" placeholder="ID"> <input type="password" id="pw" name="pw" placeholder="Password">
					<input type="submit" disabled="disabled" value="Sign In" />	<input type="button" disabled="disabled" value="Sign up" />
				</div>
			</form>
</c:if>
<c:if test="${user ne null }">
			<div class="left-box" style="text-align: left;">
				<a href="/member/sign/signOut"><input type="button" value="sign Out"></a>
			</div>
</c:if>
			<form action="<c:url value="/product/main/search"/>" method="post" id="search">
				<div class="right-box" style="text-align: right;">	
					<input type="text" name="search" id="search" placeholder="검색하실 단어를 입력하세요.">
					<button type="submit" disabled="disabled">search</button>
				</div>
			</form>
			<br><br>
			<div id="header">
				<img alt="index" src="${pageContext.request.contextPath}/resources/image/logo.png" align="middle">
			</div>
			<div id="container">
				<div id="content">
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
				</div>
			</div>
			<div id="footer">
				<p>Copyright 2019. Connect. all rights reserved.</p>
			</div>
		</div>
	</body>
</html>