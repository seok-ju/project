<%@ page language="java" contentType="text/html; charset=EUC-KR"
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
					<br>
					<h2 style="color: #000000">고객센터</h3>
					<br><br>
					<a href='<c:url value="/hostboard/notice" />'><button> 공지사항 </button></a>
					<br><br>
					<a href='<c:url value="/hostboard/faq" />'><button> 자주 묻는 질문 </button></a>
					<br>
				</div>
			</div>
			<div id="footer">
				<p>Copyright 2019. Connect. all rights reserved.</p>
			</div>
		</div>
	</body>
</html>