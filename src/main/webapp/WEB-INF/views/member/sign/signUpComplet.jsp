<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<meta http-equiv="refresh" content="3; url=<c:url value="/product/main" />"> <!-- 인덱스 이동 컨트롤러 필요 -->
		<style type="text/css">
			#line {
				margin:auto;
				text-align:center;
				border:2px solid #c9a383;
			}
		</style>
	</head>
	<body>
		<div id="line">
	        <p><font color="#c9a383">가입을 축하드립니다.</font></p>
	    </div>
	</body>
</html>