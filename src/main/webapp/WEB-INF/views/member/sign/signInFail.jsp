<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>meiB</title>
		<link href="${pageContext.request.contextPath}/resources/css/main_style.css" rel="stylesheet" type="text/css">
		<style type="text/css">
			#line {
				margin:auto;
				text-align:center;
				border:2px solid #c9a383;
				color: #c9a383;
			}
		</style>
	</head>
		<body>
		<div id="wrap">
			<div class='ribbon'>
				<a href='index'><span>product</span></a>
				<a href='<c:url value="/product/cart"/>'><span>cart</span></a>
				<a href='#'><span>myPage</span></a>
				<a href='support'><span>support</span></a>
			</div>
			<form action="#" method="get" id="search">
				<div class="right-box" style="text-align: right;">	
					<input type="text" id="word" name="word" placeholder="검색하실 단어를 입력하세요.">
					<button type="submit" disabled="disabled">search</button>
				</div>
			</form>
			<br><br>
			<div id="header">
				<img alt="#" src="/resources/image/logo.png" align="middle">
			</div>
			<div id="container">
				<div id="content">
		<div id="line">
	        <p>로그인에 실패하셨습니다.</p>
	        다시한번 로그인 해주세요.
	    </div>
	</div>
			</div>
			<div id="footer">
				<p>Copyright 2019. Connect. all rights reserved.</p>
			</div>
		</div>
	</body>
</html>