<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록</title>
</head>
<body>
	<form action="<c:url value="/product/write" />" method="post" enctype="multipart/form-data">
<table>
	<tr>
		<th rowspan="4">이미지 등록</th>
		<td>상품이름</td>
		<td><input type=text name="proName"></td>
	</tr>
	<tr>
		<td>짧은설명</td>
		<td><input type=text name="proTitle"></td>
	</tr>
	<tr>
		<td>상품분류</td>
		<td>
			<select name="proDiv">
				<option value="키링">키링</option>
				<option value="케이스">케이스</option>
			</select>
		</td>
	</tr>
	<tr>
		<td>판매가</td>
		<td><input type=text name="proPrice"></td>
	</tr>
	<tr>
		<td><input type="file" name="file1"></td>
		<td>재고</td>
		<td><input type=text name="proStock"></td>
	</tr>
</table>

<table>
	<tr>
		<td>글내용</td>
		<td><textarea name="proContent" rows="13" cols="50" style="resize: none"></textarea></td>
	</tr>
	<tr>
		<td><input type="file" name="file2" multiple></td>
	</tr>
</table>
	<input type="submit" value="상품 등록">
	</form>
</body>
</html>