<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<% if (session.getAttribute("user") != null) { %>
<c:redirect url="/board/order" />
<% } %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>meiB</title>
		<link href="${pageContext.request.contextPath}/resources/css/main_style.css" rel="stylesheet" type="text/css">
		<style>
        #sign {
            border:3px solid #c9a383;
        }
        
        #signTd {
            border:1px solid #c9a383;
            text-align:left;
        }
        
        #signLine {
            background-color:#c9a383;
        }
        
        #unUser {
            border:3px solid gray;
            text-align: center;
        }
        #unUserTd {
            border:1px solid gray;
            text-align: left;
        }
        #unUserLine {
            background-color:gray;
            color: #ffffff;
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
					<form method="post" action="<c:url value="/member/sign/signIn" />">
						<table id="sign">
							<tr>
								<td id="signLine">아이디</td>
								<td id="signTd"><input type="text" name="id" maxlength="20"></td>
							</tr>
							<tr>
								<td id="signLine">비밀번호</td>
								<td id="signTd"><input type="password" name="pw" maxlength="20"></td>
							</tr>
						</table>
						<br>
						<input type="submit" value="sign In" />   <a href="<c:url value="/member/sign/signUp" />"><button type="button" >sign Up</button></a>
					</form>
					<br><br>
					<form action="#" method="post">
						<table id="unUser">
							<tr id="unUserLine">
								<td><a href="구매폼"><button>비회원 구매</button></a></td>
								<td>비회원 구매시 적립금은 적립되지 않습니다.</td>
						</table>
					</form>
				</div>
			</div>
			<div id="footer">
				<p>Copyright 2019. Connect. all rights reserved.</p>
			</div>
		</div>
	</body>
</html>