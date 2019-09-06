<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>고객센터 글수정</title>
</head>

<body>
	<section>
		<h2>글수정</h2>
		<article>
			<form method="post">
				<table border="1">
				<c:forEach var="board" items="${hostBoardList}" varStatus="loop">
					<tr>
						<td>작성자</td>
						<td>관리자</td>
					<tr>
					<tr>
						<td>분류</td>
						<td><c:choose>
							<c:when test="${board.hoclass == 1}"> FAQ </c:when>
							<c:otherwise>공지사항</c:otherwise>
						</c:choose></td>
					<tr>
						<td>제목</td>
						<td>
						<input type="text" name="hotitle" value="${board.hotitle}">
						</td>
					</tr>
					<tr>
						<td>내용</td>
						<td>
							<textarea name="hocontent" rows="10" cols="50">
							${board.hocontent}
							</textarea>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="submit" value="수정하기">
							<input type="reset" value="다시 쓰기">
							<input type="button" value="목록" onClick="location.href='<c:url value="/hostboard/notice"/>'">
						</td>
					</tr>
				</c:forEach>
				</table>
			</form>
		</article>
	</section>
</body>
</html>