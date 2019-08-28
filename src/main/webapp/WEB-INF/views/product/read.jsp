<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${productVO.proName}</title>
</head>
<body>
<table>
	<tr>
		<th rowspan="5"><img src="${pageContext.request.contextPath}${productVO.proImg}" height="400"></th>
		<th colspan="2">${productVO.proName}</th>
	</tr>
	<tr>
		<td>짧은설명</td>
		<td>${productVO.proTitle}</td>
	</tr>
	<tr>
		<td>판매가</td>
		<td>${productVO.proPrice}</td>
	</tr>
	<tr>
		<td>판매량</td>
		<td>${productVO.proSell}</td>
	</tr>
	<tr>
		<td>재고</td>
		<td>${productVO.proStock}</td>
	</tr>
</table>

<table>
	<tr>
		<td colspan="2'">${productVO.proContent}</td>
	</tr>
	<c:forEach var="img" items="${img}">
	<tr>
		<td><img src="${pageContext.request.contextPath}${img}" height="400"></td>
	</tr>
	</c:forEach>
</table>
</body>
</html>