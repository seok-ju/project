<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>meiB</title>
		<link href="css/main_style.css" rel="stylesheet" type="text/css">
	</head>
	<body>
		<div id="wrap">
			<div class='ribbon'>
				<a href='<c:url value=""/>'><span>product</span></a>
				<a href='#'><span>cart</span></a>
				<a href='#'><span>myPage</span></a>
				<a href='#'><span>support</span></a>
			</div>
			<form action="#" method="post" id="loginForm">
				<div class="left-box" style="text-align: left;">	
					<input type="text" id="id" name="id" placeholder="ID">
					<input type="password" id="pw" name="pw" placeholder="Password">
					<button type="submit" disabled="disabled">Sign In</button>
					<button type="button" disabled="disabled">Sign up</button>
					<input type="checkbox" id="keepId" name="keepId">
					<label for="keepId"><font color="#000000">아이디 저장</font></label>
				</div>
			</form>
			<form action="#" method="get" id="search">
				<div class="right-box" style="text-align: right;">	
					<input type="text" id="word" name="word" placeholder="검색하실 단어를 입력하세요.">
					<button type="submit" disabled="disabled">search</button>
				</div>
			</form>
			<br><br>
			<div id="header">
				<img alt="#" src="image/logo.png" align="middle">
			</div>
			<div id="container">
				<div id="content">
					<p>내용</p>
					이쪽에 내용 수정
					content 자유롭게 변경가능
				</div>
			</div>
			<div id="footer">
				<p>Copyright 2019. (팀이름) all rights reserved.</p>
			</div>
		</div>
	</body>
</html>