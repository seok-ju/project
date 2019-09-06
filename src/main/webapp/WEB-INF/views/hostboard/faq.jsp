<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
	<title>FAQ</title>
</head>

<body>
<table border="1">
	<tr>
		<th>FAQ</th>
		<th>번 호</th>
		<th>제 목</th>
	</tr>
	<c:forEach var="board" items="${hostBoardList}" varStatus="loop">
		<tr>
			<td>FAQ</td>
			<td>${loop.index + 1}</td>
 			<td onclick="javascript:view(${loop.index})">
 			${board.hotitle}
 			</td>
 		</tr>
 		<tr id="${loop.index}" style="display:none">
 			<td colspan="3">
 			${board.hocontent}
 			<button onClick="remove(${board.honum})">삭제</button>
 			</td>
 		</tr>
 	</c:forEach>
 </table>
 <button type="button" onClick="location.href='<c:url value="/hostboard/write?hoclass=1"/>'">글쓰기</button>
 <div>
 	<c:if test="${pagination.curRange ne 1}">
    	<a href="<c:url value='/hostboard/faq'/>">[처음]</a> 
  	</c:if>
  	
    <c:if test="${pagination.curPage ne 1}">
    	<a href="<c:url value='/hostboard/faq?curPage=${pagination.prevPage}'/>">[이전]</a> 
    </c:if>
    
   	<c:forEach var="pageNum" begin="${pagination.startPage }" end="${pagination.endPage }">
    	<c:choose>
        	<c:when test="${pageNum eq pagination.curPage}">
            	<span style="font-weight: bold;"><a href="<c:url value='/hostboard/faq?curPage=${pageNum}'/>">${pageNum }</a></span> 
            </c:when>
            <c:otherwise>
            	<a href="<c:url value='/hostboard/faq?curPage=${pageNum}'/>">${pageNum}</a> 
            </c:otherwise>
      	</c:choose>
    </c:forEach>
    
    <c:if test="${pagination.curPage ne pagination.pageCnt && pagination.pageCnt > 0}">
    	<a href="<c:url value='/hostboard/faq?curPage=${pagination.nextPage}'/>">[다음]</a> 
    </c:if>
    
    <c:if test="${pagination.curRange ne pagination.rangeCnt && pagination.rangeCnt > 0}">
    	<a href="<c:url value='/hostboard/faq?curPage=${pagination.pageCnt}'/>">[끝]</a> 
    </c:if>
 </div>
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