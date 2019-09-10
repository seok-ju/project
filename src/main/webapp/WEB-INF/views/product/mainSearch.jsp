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
					<form method="post" action="<c:url value="/product/main/search"/>">
						<input type="text" name="search"> <input type="submit" value="상품검색">
					</form>
					<h3>"${search}" 검색결과  ${Cnt}개</h3> 
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
							<td>${product.proPrice}원</td>
	</c:forEach>
						</tr>
</c:forEach>
					</table>
					</div>
				</div>
			<div id="footer">
				<p>Copyright 2019. Connect. all rights reserved.</p>
			</div>
		</div>
	</body>
</html>