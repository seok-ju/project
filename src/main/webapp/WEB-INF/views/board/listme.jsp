<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>문의게시판</title>
</head>
<body>
		<table border="1">
				<tr>
						<th>이미지</th>
						<th>NO</th>
						<th>글제목</th>
						<th>글내용</th>
						<th>작성자</th>
						<th>날짜</th>
						<th>삭제</th>
				</tr>
				<c:forEach var="board" items="${boardList}" varStatus="loop">
						<tr>
								<td>${board.boImg}</td>
								<td>${board.boNum}</td>
								<td>${board.boTitle}</td>
								<td>${board.boContent}
							<c:set var="name" value="관리자"/>
							<c:if test="${name eq '관리자'}" >
					<a href="<c:url value="/board/writemeRe" />">답글쓰기</a>
							</c:if> </td>
								<td>${board.boId}</td>
								<td>${board.boDate}</td>
								
					<td><a href="<c:url value="/board/delete/${boardVO.boNum}"/>">삭제</a></td>
						</tr>
				</c:forEach>
		</table>
		<a href="<c:url value="/board/write" />">새글</a>
		

</body>
</html>