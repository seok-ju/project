<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후기작성 페이지</title>
</head>
<body>
<form action='<c:url value="/board/writeRe?proNum=${proNum}&boRef=${boRef}"/>' method="post" enctype="multipart/form-data">
<table>
	<input type="hidden" name="boDiv" value="후기">
	<tr>
		<th>제목</th>
		<td>
		<c:choose>
			<c:when test="${boRef eq 0}">
				<input type="text" name="boTitle" required>
			</c:when>
			<c:otherwise>
				<input type="text" name="boTitle" value="RE : " required>
			</c:otherwise>
		</c:choose></td>
	</tr>
	<tr>
		<th>작성자</th>
		<td>${user.id}</td>
		<input type="hidden" name="boId" value="${user.id}">
		<input type="hidden" name="num" value="${user.num}">
	<tr>
	<tr>
		<th>내용</th>
		<td><textarea name="boContent" rows="13" cols="50" style="resize:none" required></textarea></td>
	</tr>
	<c:if test="${boRef eq 0}">
	<tr>
		<th>사진첨부</th>
		<td><input type="file" name="file"></td>
	</tr>
	</c:if>
	<tr>
		<th>비밀번호</th>
		<td><input type="password" name="boPw" required></td>
	</tr>
</table>
<input type="submit" value="후기작성">
<input type="reset" value="초기화">
</form>
</body>
</html>