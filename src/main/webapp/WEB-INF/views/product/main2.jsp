<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
				<a href='#'><span>product</span></a>
				<a href='#'><span>cart</span></a>
				<a href='#'><span>myPage</span></a>
				<a href='#'><span>support</span></a>
			</div>
			<form action="#" method="post" id="loginForm">
				<div class="left-box" style="text-align: left;">	
					<input type="text" id="id" name="id" placeholder="ID">
					<input type="password" id="pw" name="pw" placeholder="Password">
					<button type="submit" disabled="disabled">Sign In</button>
					<button type="button" disabled="disabled">Sign up</button>
					<input type="checkbox" id="keepId" name="keepId">
					<label for="keepId"><font color="#000000">아이디 저장</font></label>
				</div>
			</form>
			<form action="#" method="get" id="search">
				<div class="right-box" style="text-align: right;">	
					<input type="text" id="word" name="word" placeholder="검색하실 단어를 입력하세요.">
					<button type="submit" disabled="disabled">search</button>
				</div>
			</form>
			<br><br>
			<div id="header">
				<img alt="#" src="${pageContext.request.contextPath}/resources/image/logo.png" align="middle">
			</div>
			<div id="container">
				<div id="content">
					<a href='<c:url value="/product/write"/>'>상품등록</a><br>

<a href='<c:url value="/product/main?code=${code}&sort=1"/>'>최신순</a>
<a href='<c:url value="/product/main?code=${code}&sort=2"/>'>인기순</a>
<a href='<c:url value="/product/main?code=${code}&sort=3"/>'>오래된순</a><br>

<a href='<c:url value="/product/main?code=1"/>'>전체메뉴</a>
<a href='<c:url value="/product/main?code=2"/>'>키링</a>
<a href='<c:url value="/product/main?code=3"/>'>케이스</a><br>

<form method="post" action="<c:url value="/product/main/search"/>">
	<input type="text" name="search"> <input type="submit" value="상품검색">
</form>
<table>
	<c:forEach begin="0" end="${Cnt}" varStatus="status" step="5">
	<tr>
		<c:forEach begin="${status.index}" end="${status.index+4}" var="product" items="${allList}" varStatus="loop">
			<td><a href='<c:url value="/product/read/${product.proNum}"/>'><img src="${pageContext.request.contextPath}${product.proImg}" height="200"></a></td>
		</c:forEach>
	</tr>
	<tr>
		<c:forEach begin="${status.index}" end="${status.index+4}" var="product" items="${allList}" varStatus="loop">
			<td><a href='<c:url value="/product/read/${product.proNum}"/>'>${product.proName}</a></td>
		</c:forEach>
	</tr>
	<tr>
		<c:forEach begin="${status.index}" end="${status.index+4}" var="product" items="${allList}" varStatus="loop">
			<td><a href='<c:url value="/product/read/${product.proNum}"/>'>${product.proTitle}</a></td>
		</c:forEach>
	</tr>
	<tr>
		<c:forEach begin="${status.index}" end="${status.index+4}" var="product" items="${allList}" varStatus="loop">
			<td>${product.proViewPrice}<button onclick="window.open('<c:url value="/product/price/${product.proNum}"/>')">가격변경</button></td>
		</c:forEach>
	</tr>
	</c:forEach>
</table>
</body>

	<div>
		<c:if test="${pagination.curRange ne 1 }">
			<a href='<c:url value="/product/main?code=${code}&sort=${sort}"/>'>[처음]</a>
		</c:if>
		<c:if test="${pagination.curPage ne 1}">
			<a href='<c:url value="/product/main?code=${code}&sort=${sort}&curPage=${pagination.prevPage}"/>'>[이전]</a> 
		</c:if>
		<c:forEach var="pageNum" begin="${pagination.startPage }" end="${pagination.endPage }">
			<c:choose>
				<c:when test="${pageNum eq  pagination.curPage}">
					<span style="font-weight: bold;"><a href='<c:url value="/product/main?code=${code}&sort=${sort}&curPage=${pageNum}"/>'>${pageNum }</a></span> 
				</c:when>
				<c:otherwise>
					<a href='<c:url value="/product/main?code=${code}&sort=${sort}&curPage=${pageNum}"/>'>${pageNum }</a> 
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${pagination.curPage ne pagination.pageCnt && pagination.pageCnt > 0}">
			<a href='<c:url value="/product/main?code=${code}&sort=${sort}&curPage=${pagination.nextPage}"/>'>[다음]</a> 
		</c:if>
		<c:if test="${pagination.curRange ne pagination.rangeCnt && pagination.rangeCnt > 0}">
			<a href='<c:url value="/product/main?code=${code}&sort=${sort}&curPage=${pageCnt}"/>'>[끝]</a> 
		</c:if>
	</div>
				</div>
			</div>
			<div id="footer">
				<p>Copyright 2019. (팀이름) all rights reserved.</p>
			</div>
		</div>
	</body>
</html>