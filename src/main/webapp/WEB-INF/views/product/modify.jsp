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
					<form action="<c:url value="/product/modify/${productVO.proNum}" />" method="post" enctype="multipart/form-data">
						<table>
							<tr>
								<th rowspan="4">이미지 등록</th>
								<td>상품이름</td>
								<td><input type=text name="proName" value="${productVO.proName}"></td>
							</tr>
							<tr>
								<td>짧은설명</td>
								<td><input type=text name="proTitle" value="${productVO.proTitle}"></td>
							</tr>
							<tr>
								<td>상품분류</td>
								<td>
									<select name="proDiv">
										<option value="키링">키링</option>
										<option value="케이스">케이스</option>
									</select>
								</td>
							</tr>
							<tr>
								<td>판매가</td>
								<td>${productVO.proPrice}</td>
							</tr>
							<tr>
								<td><input type="file" name="file1"></td>
								<td>재고</td>
								<td><input type=text name="proStock" value="${productVO.proStock}"></td>
							</tr>
						</table>
						<table>
							<tr>
								<td>글내용</td>
								<td><textarea name="proContent" rows="13" cols="50" style="resize: none">${productVO.proContent}</textarea></td>
							</tr>
							<tr>
								<td><input type="file" name="file2" multiple></td>
							</tr>
						</table>
					<input type="submit" value="상품 수정">
				</form>
				</div>
			</div>
			<div id="footer">
				<p>Copyright 2019. Connect. all rights reserved.</p>
			</div>
		</div>
	</body>
</html>