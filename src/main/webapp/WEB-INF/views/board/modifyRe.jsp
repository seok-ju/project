<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후기수정 페이지</title>
</head>
<body>
<form action='<c:url value="/board/modifyRe?boNum=${boardVO.boNum}"/>' method="post" enctype="multipart/form-data">
<table>
	<tr>
		<th>제목</th>
		<td><input type="text" name="boTitle" value="${boardVO.boTitle}"></td>
	</tr>
	<tr>
		<th>작성자</th>
		<td>${user.id}</td>
	</tr>
	<tr>
		<th>내용</th>
		<td><textarea name="boContent" rows="13" cols="50" style="resize:none">${boardVO.boContent}</textarea></td>
	</tr>
	<tr>
		<th>사진첨부</th>
		<td><input type="file" name="file"></td>
	</tr>
	<tr>
		<th>비밀번호</th>
		<td><input type="password" name="pass"></td>
	</tr>
</table>
<input type="submit" value="후기수정">
<input type="reset" value="초기화">
</form>
</body>
</html>