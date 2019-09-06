<%@page import="com.conn.spring.VO.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<% if (session.getAttribute("user") != null) { %>
<c:redirect url="마이페이지" />
<% } %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>meiB</title>
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
		<form method="post" action="<c:url value="/member/sign/signInMyPage" />">
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
		<form method="post" action="<c:url value="주문조회폼" />">
			<table id="unUser">
				<tr>
					<td id="unUserTd" style="text-align:center;" colspan="3">비회원 주문 조회</td>
				</tr>
				<tr><td/></tr>
				<tr>
					<td id="unUserLine">주문자 명</td>
					<td id="unUsertd" style="text-align:left;" colspan="2"><input type="text" name="name" maxlength="10"></td>
				</tr>
				<tr>
					<td id="unUserLine">주문 번호</td>
					<td id="unUsertd"><input type="text" name="odnum_1" maxlength="10"> - </td>
					<td id="unUsertd"><input type="password" name="odnum_2" maxlength="10"></td>
				</tr>
				<tr><td style="text-align:right;" colspan="3"><input type="submit" value="주문 조회"></td></tr>
			</table>
		</form>
	</body>
</html>