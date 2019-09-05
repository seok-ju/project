<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<style>
        table {
            border:3px solid #c9a383;
        }
        
        td {
            border:1px solid #c9a383;
            text-align:left;
        }
        
        #title {
            background-color:#c9a383;
        }
    	</style>
	</head>
	<body>
		<!-- 왼쪽, 오른쪽 바깥여백을 auto로 주면 중앙정렬된다.  -->
	    <div>
	        <br><br>
	        <b><font size="6" color="#c9a383">회원가입</font></b>
	        <br><br>
	        <form method="post" action="<c:url value="/product/write" />">
	            <p>약관 내용</p>
	        	<label><input type="checkbox" name="agree" value="true"> 약관동의 </label>
	            <!-- 약관 동의 -->
	            <br>
	            <table>
	                <tr>
	                    <td id="title">아이디</td>
	                    <td>
	                        <input type="text" name="id" maxlength="20">
	                        <button type="button"> 중복확인 </button> <!-- 중복확인 -->
	                    </td>
	                </tr>
	                <tr>
	                    <td id="title">비밀번호</td>
	                    <td>
	                        <input type="password" name="pw1" maxlength="15">
	                    </td>
	                </tr>
	                <tr>
	                    <td id="title">비밀번호 확인</td>
	                    <td>
	                        <input type="password" name="pw2" maxlength="15">
	                    </td>
	                </tr>
	                <tr>
	                    <td id="title">이름</td>
	                    <td>
	                        <input type="text" name="name" maxlength="40">
	                    </td>
	                </tr>
	                <tr>
	                    <td id="title">이메일</td>
	                    <td>
	                        <input type="text" name="email_1" maxlength="30">@
	                        <input type="text" name="email_2" maxlength="20">
	                        <button type="button"> 메일인증 </button> <!-- 메일인증 -->
	                    </td>
	                </tr>
	                <tr>
	                    <td id="title">휴대전화</td>
	                    <td>
	                        <input type="text" name="phone" />
	                    </td>
	                </tr>
	                <tr>
	                    <td id="title">주소</td>
	                    <td>
	                        <input type="text" size="30" name="addr_1"/><input type="button" value="주소검색">
	                        <br><input type="text" size="30" name="addr_2"/>
	                    </td>
	                </tr>
	            </table>
	            <br>
	            <input type="submit" value="가입"/>  <input type="reset" value="재작성"/>  <input type="button" value="취소">
	        </form>
	    </div>
	</body>
</html>