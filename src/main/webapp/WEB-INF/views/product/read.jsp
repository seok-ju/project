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
					<a href='<c:url value="/product/main"/>'>목록</a>
<c:if test="${user.mem eq '관리자'}">
					<a href='<c:url value="/product/modify/${productVO.proNum}"/>'>수정</a>
</c:if>
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
							<td><button onclick="location.href='<c:url value="/product/order/${productVO.proNum}"/>'">바로구매</button></td>
<c:choose>
	<c:when test="${user.mem eq '회원'}">
									<td><button onclick="location.href='<c:url value="/product/cartMem/${productVO.proNum}"/>'">장바뀨니</button></td>
	</c:when>
	<c:otherwise>
									<td><button onclick="location.href='<c:url value="/product/cartNoMem/${productVO.proNum}"/>'">장바구니</button></td>
	</c:otherwise>
</c:choose>
						</tr>
<c:if test="${user.mem eq '관리자'}">
						<tr>
							<td>판매량 ${productVO.proSell}</td>
							<td>재고 ${productVO.proStock}</td>
							<td><button onclick="remove(${productVO.proNum})">상품삭제</button></td>
						</tr>
</c:if>
					</table>
					
					<table>
						<tr>
							<td><button onclick="location.href='#info'">상품상세정보</button></td>
							<td><button onclick="location.href='#re'">상품구매후기</button></td>
							<td><button onclick="location.href='#qu'">상품문의</button></td>
						</tr>
					</table><br>
					
					<div id="info">
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
					</div>
					<br><br>
					
					<table>
						<tr>
							<td><button onclick="location.href='#info'">상품상세정보</button></td>
							<td><button onclick="location.href='#re'">상품구매후기</button></td>
							<td><button onclick="location.href='#qu'">상품문의</button></td>
						</tr>
					</table><br>
					
					<div id="re">
<c:import url="/board/listRe?proNum=${productVO.proNum}&curPage=${rePage}"/>
					<br><br>
					</div>
					
					<table>
						<tr>
							<td><button onclick="location.href='#info'">상품상세정보</button></td>
							<td><button onclick="location.href='#re'">상품구매후기</button></td>
							<td><button onclick="location.href='#qu'">상품문의</button></td>
						</tr>
					</table><br>
					
					<div id="qu">
<c:import url="/board/listQu?proNum=${productVO.proNum}&curPage=${quPage}"/>
					</div>
				</div>
			</div>
			<div id="footer">
				<p>Copyright 2019. Connect. all rights reserved.</p>
			</div>
		</div>
	</body>
</html>