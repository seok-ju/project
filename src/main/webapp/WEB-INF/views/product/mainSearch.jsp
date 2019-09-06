<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>핫핑</title>
</head>
<body>
<%-- <a href='<c:url value="/product/write"/>'>상품등록</a><br>

<a href='<c:url value="/product/main?code=${code}&sort=1"/>'>최신순</a>
<a href='<c:url value="/product/main?code=${code}&sort=2"/>'>인기순</a>
<a href='<c:url value="/product/main?code=${code}&sort=3"/>'>오래된순</a><br>

<a href='<c:url value="/product/main?code=1"/>'>전체메뉴</a>
<a href='<c:url value="/product/main?code=2"/>'>키링</a>
<a href='<c:url value="/product/main?code=3"/>'>케이스</a><br> --%>

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
</body>

</html>