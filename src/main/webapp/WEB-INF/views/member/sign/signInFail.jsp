<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<meta http-equiv="refresh" content="3; url=<c:url value="/member/sign/signIn" />"> <!-- 인덱스 이동 컨트롤러 필요 -->
		<style type="text/css">
			#line {
				margin:auto;
				text-align:center;
				border:2px solid #c9a383;
				color: #c9a383;
			}
		</style>
	</head>
	<body>
		<div id="line">
	        <p>로그인에 실패하셨습니다.</p>
	        다시한번 로그인 해주세요.
	    </div>
	</body>
</html>