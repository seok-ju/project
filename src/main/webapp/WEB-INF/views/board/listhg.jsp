<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
         var oldView = "";
      function view(num){
         var mView = document.getElementById(num);
         if(oldView != mView){
            if(oldView != ""){
               oldView.style.display="none";
            }
            mView.style.display = "";
            oldView = mView;
         }else{
            mView.style.display="none";
            oldView = "";
         }
      }
   </script>


<meta charset=UTF-8>
<title>후기게시판</title>
</head>
<body>
		<table>
				<c:forEach var="board" items="${boardList}" varStatus="loop">		
						<tr>
							<c:choose>
								<c:when test="${board.boImg != null}">
								<td rowspan="5"><img src="${pageContext.request.contextPath}${board.boImg}" width="200"></td>
								</c:when>
								<c:otherwise> <td rowspan="5"></td> </c:otherwise>
							</c:choose>
							
								<td rowspan="5"><a href="javascript:view(${loop.index});">${board.boTitle}</a></td>
								<td> ${board.boId}</td>
						</tr>
						<tr>
							<td>${board.boDate}</td>
						</tr>
						<tr>
							<td><a href='<c:url value="/board/delete/${board.boNum}"/>'>삭제</a></td>
							
						</tr>	
						<tr>
							<td><a href='<c:url value="/board/edit/${board.boNum}"/>'>수정</a></td>
						<tr>
							<td>
							<%-- <c:if test="${name eq '관리자'}" > --%>
							<a href="<c:url value="/board/writehgRe/${board.boNum}"  />">답글쓰기</a>
							</td>
						</tr>
						<tr>
							<td colspan="4"><div id="${loop.index}" style="display:none">${board.boContent}</div></td>
						</tr>
				</c:forEach>
		</table>

		<a href="<c:url value="/board/writehg?boDiv=후기" />">새글</a>

</body>
</html>