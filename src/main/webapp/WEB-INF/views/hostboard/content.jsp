<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
	<title>공지사항</title>
</head>

<body>
	<h2>공지사항</h2>
	<table border="1">
	<c:forEach var="board" items="${hostBoardList}" varStatus="loop">
		<tr>
			<th>작성날짜</th>
			<td>
			<fmt:formatDate value="${board.hodate}" pattern="yyyy-MM-dd HH:mm" />
			</td>
			<th>작성자</th>
			<td>관리자</td>
		</tr>
		<tr>
			<th>제목</th>
			<td colspan="3">${board.hotitle}</td>
		</tr>
		<tr>
			<td colspan="4">${board.hocontent}</td>
		</tr>
		<tr>
			<td colspan="4">
			<button type="button" onClick="location.href='<c:url value="/hostboard/modify?honum=${board.honum}"/>'">수정</button>
 			<button onClick="remove(${board.honum})">삭제</button>
			<button type="button" onClick="location.href='<c:url value="/hostboard/notice"/>'">목록</button>
			</td>
		</tr>
 	</c:forEach>
 	</table>
 	<script>
		function remove(honum){
 			if(confirm("정말 삭제하시겠습니까?") == true){
 				window.location.href="../hostboard/delete?honum=" + honum
 			}else{
 				return;
 			}
 		}
</script>
</body>
</html>