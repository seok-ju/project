<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후기수정게시판</title>
</head>
<body>
		<form action="<c:url value="/board/edit/${boNum}"/>" method="post" enctype="multipart/form-data">
		<table>
			<tr>
				<th>분류</th>
				<td><input type="text" name="boDiv" value="${board.boDiv}"></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="boTitle" value="${board.boTitle}"></td>
			</tr>
			<tr>
				<th>사진</th>
				<td><input type="file" name="file1"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="boContent" rows="13" cols="50" style="resize:none">"${board.boContent}"</textarea></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="check"></td>
			</tr>
		</table>
		
		<div>
		<input type="submit" value="등록"> 
			<a href="<c:url value="/board/listhg" />">목록</a>
		</div>
		</form>
				<div>${msg}</div>
		

</body>
</html> 