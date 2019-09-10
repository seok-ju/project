<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<c:choose>
	<c:when test="${cnt == 0}">
					<b>장바구니가 비었습니다.</b><br>
	</c:when>
	<c:otherwise>
				<table>
		<c:forEach var="list" items="${cartList}">
					<tr>
						<td rowspan="4"><a href='<c:url value="/product/read/${list.proNum}"/>'><img src="${pageContext.request.contextPath}${list.proImg}" height="200"></a>
						<td rowspan="4" width="50"></td>
						<th>상품이름</th>
						<td>${list.proName}</td>
					</tr>
					<tr>
						<th>상품번호</th>
						<td>${list.proNum}</td>
					</tr>
					<tr>
						<th>상품 수</th>
						<td>1</td>
					</tr>
					<tr>
						<th>가격</th>
						<td>${list.proViewPrice}</td>
					</tr>
		</c:forEach>
					<tr>
						<td colspan="4"> 총 <b>${cnt}</b>개의 상품금액 <b>${price}원</b></td>
					</tr>
				</table>
	</c:otherwise>
</c:choose>
				<button onclick="location.href='<c:url value="/product/main"/>'">쇼핑계속하기</button>
				<button onclick="location.href='<c:url value="/product/cartDelete"/>'">장바구니 비우기</button>
				<button onclick="location.href='<c:url value="/cart/order"/>'">상품주문하기</button>
			</div>
			<div id="footer">
				<p>Copyright 2019. Connect. all rights reserved.</p>
			</div>
		</div>
	</body>
</html>