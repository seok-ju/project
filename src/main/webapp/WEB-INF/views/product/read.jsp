<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${productVO.proName}</title>
<script>
function remove(num){
	if(confirm("상품을 삭제하시겠습니까?") == true){
		window.location.href="../delete?proNum="+num;
	}else {v
		retuarn;
	}
}
</script>
</head>
<body>
<form method="post" action="<c:url value="/product/main/search"/>">
	<input type="text" name="search"> <input type="submit" value="상품검색">
</form>
<a href='<c:url value="/product/main"/>'>목록</a>
<a href='<c:url value="/product/modify/${productVO.proNum}"/>'>수정</a>
<table>
	<tr>
		<th rowspan="7"><img src="${pageContext.request.contextPath}${productVO.proImg}" height="400"></th>
		<td rowspan="7" width="100"></td>
		<th colspan="2">${productVO.proName}</th>
	</tr>
	<tr>
		<td>짧은설명</td>
		<td>${productVO.proTitle}</td>
	</tr>
	<tr>
		<td>판매가</td>
		<td>${productVO.proViewPrice}</td>
	</tr>
	<tr>
		<td>구매혜택</td>
		<td>적립금 <b>+${point}원</b></td>
	</tr>
	<tr>
		<td>배송비</td>
		<td>무료</td>
	</tr>
	<tr>
		<td>상품코드</td>
		<td>${productVO.proNum}</td>
	</tr>
	<tr>
		<td><button onclick="location.href='<c:url value=""/>'">바로구매</button></td>
		<c:choose>
			<c:when test="${loginID.mem eq '회원'}">
				<td><button onclick="location.href='<c:url value="/product/cartMem/${productVO.proNum}"/>'">장바구니</button></td>
			</c:when>
			<c:otherwise>
				<td><button onclick="location.href='<c:url value="/product/cartNoMem/${productVO.proNum}"/>'">장바구니</button></td>
			</c:otherwise>
		</c:choose>
	</tr>
	<tr>
		<td>판매량 ${productVO.proSell}</td>
		<td>재고 ${productVO.proStock}</td>
		<td><button onclick="remove(${productVO.proNum})">상품삭제</button></td>
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

<c:import url="/board/listRe?proNum=${productVO.proNum}"/>

</body>
</html>