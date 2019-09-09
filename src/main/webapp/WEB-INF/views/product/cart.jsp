<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
</head>
<body>
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
</body>
</html>