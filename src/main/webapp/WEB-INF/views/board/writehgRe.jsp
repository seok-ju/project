<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<meta charset=UTF-8>
<title>답글후기게시판</title>
</head>
<body>
		
		<form action='<c:url value="/board/writehgRe/${boNum}"/>' method="post">
		<table>
			<tr>
				<th>분류</th>
				<td><input type="text" name="boDiv" value="후기"></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="boTitle" value="[답변]"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="boContent" rows="13" cols="50" style="resize:none"></textarea></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="boPw"></td>
			</tr>		
			
		</table>
				<%-- <input type="hidden" value="${boRef} ">
				<input type="hidden" value="${boDepth}">
				<input type="hidden" value="${boStep}"> --%>
		<div>
		<input type="submit" value="등록"> 
			<a href="<c:url value="/board/listhg" />">목록</a>
		</div>
		</form>

</body>
</html>