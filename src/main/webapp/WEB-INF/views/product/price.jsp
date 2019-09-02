<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가격수정</title>
</head>
<body>
<form action="<c:url value="/product/price/${proNum}"/>" method="post">
	변경할 금액 : <input type=text name=price> <input type=submit value="가격변경">
</form>
</body>
</html>