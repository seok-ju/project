<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
</head>
<body>
		<form action="<c:url value="/board/writehg?boDiv=${boDiv}"/>" method="post" enctype="multipart/form-data">
		
		<table>
			<tr>
				<th>분류</th>
				<td>${boDiv}</td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="boTitle"></td>
			</tr>
			
			<c:if test="${boDiv eq '후기'}">
			<tr>
				<th>사진</th>
				<td><input type="file" name="file1"></td>
			</tr>
			</c:if>
			
			<tr>
				<th>내용</th>
				<td><textarea name="boContent" rows="13" cols="50" style="resize:none"></textarea></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="boPw"></td>
			</tr>
		</table>
		<div>
		<input type="submit" value="등록"> 
			<c:if test="${boDiv eq '후기'}"> <a href="<c:url value="/board/listhg" />">목록</a></c:if>
			<c:if test="${boDiv eq '문의'}"> <a href="<c:url value="/board/listme" />">목록</a></c:if>
		</div>
		</form>
</body>
</html>
