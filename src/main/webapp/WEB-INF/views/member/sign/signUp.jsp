<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% if (session.getAttribute("user") != null) { %>
<c:redirect url="index" />
<% } %>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="UTF-8">
      <title>meiB</title>
      <link href="${pageContext.request.contextPath}/resources/css/main_style.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
       //idck 버튼을 클릭했을 때 
//          var id = $('#id').val();
          $("#idck").click(function() {
             $.ajax({
                url : '/idCheck',
                   type : 'POST',
                   data:{
                      "id":$('#id').val()
                  },
                   success : function(data) {
                      console.log("1 = 중복o / 0 = 중복x : "+ data);
                       if (data == 1) {
                          alert("중복된 아이디입니다.");
                            $('#id').val('');
                            $('#id').focus();
                       } else {
                          alert("사용가능한 아이디입니다.");
                       }
                   }, error : function() {
                  console.log("실패");
               }
                 });
             });
       function DosignUp() {
           
           var id = $("#id").val();
           var pw1 = $("#pw1").val();
           var pw2 = $("#pw2").val();
           var name = $("#name").val();
           var email1 = $("#email_1").val();
           var email2 = $("#email_2").val();
           var addr0 = $("#addr_0").val();
           var addr1 = $("#addr_1").val();
           var addr2 = $("#addr_2").val();
           
           if(id.length == 0){
               alert("아이디를 입력해 주세요"); 
               $("#id").focus();
               return false;
           }
           if(pw1.length == 0){
               alert("비밀번호를 입력해 주세요"); 
               $("#pw1").focus();
               return false;
           }
           if(pw1 != pw2){
               alert("비밀번호가 서로 다릅니다. 비밀번호를 확인해 주세요."); 
               $("#pw").focus();
               return false; 
           }
           if(name.length == 0){
               alert("이름을 입력해주세요");
               $("#name").focus();
               return false;
           }
           if(email1.length == 0 ){
               alert("이메일을 입력해주세요");
               $("#email1").focus();
               return false;
           }
           if(email2.length == 0){
               alert("이메일을 입력해주세요");
               $("#email2").focus();
               return false;
           }
           if(addr1.length == 0 || addr2.length == 0 || addr3.length == 0 ){
               alert("주소를 입력해주세요");
               $("#addr3").focus();
               return false;
           }
           if(confirm("회원가입을 하시겠습니까?")){
               if(idck==0){
                    alert('아이디 중복체크를 해주세요');
                    return false;
                }else{
                alert("회원가입을 축하합니다");
                $("#frm").submit();
                }
           }
       }
       function execDaumPostcode() {
          new daum.Postcode({
             oncomplete: function(data) {
                   // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
          
                   // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                      // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                      var roadAddr = data.roadAddress; // 도로명 주소 변수
                      var extraRoadAddr = ''; // 참고 항목 변수
                      // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                      // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                      if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                         extraRoadAddr += data.bname;
                      }
                      // 건물명이 있고, 공동주택일 경우 추가한다.
                      if(data.buildingName !== '' && data.apartment === 'Y'){
                         extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                      }
                      // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                      if(extraRoadAddr !== ''){
                         extraRoadAddr = ' (' + extraRoadAddr + ')';
                      }
                      // 우편번호와 주소 정보를 해당 필드에 넣는다.
                       document.getElementById("addr_0").value = data.zonecode;
                       document.getElementById("addr_1").value = roadAddr;
                       // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                       /* if(roadAddr !== ''){
                           document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                       } else {
                           document.getElementById("sample4_extraAddress").value = '';
                       } */
             }
           }).open();
       }
       </script>
   </head>
   <body>
      <div id="wrap">
         <div class='ribbon'>
            <a href='index'><span>product</span></a>
            <a href='<c:url value="/product/cart"/>'><span>cart</span></a>
            <a href='#'><span>myPage</span></a>
            <a href='support'><span>support</span></a>
         </div>
<c:if test="${user eq null }"> 
         <form action='<c:url value="/member/sign/signIn"/>' method="post" id="loginForm">
            <div class="left-box" style="text-align: left;">   
               <input type="text" id="id" name="id" placeholder="ID"> <input type="password" id="pw" name="pw" placeholder="Password">
               <input type="submit" disabled="disabled" value="Sign In" />   <input type="button" disabled="disabled" value="Sign up" />
            </div>
         </form>
</c:if>
<c:if test="${user ne null }">
         <div class="left-box" style="text-align: left;">
            <a href="/member/sign/signOut"><input type="button" value="sign Out"></a>
         </div>
</c:if>
         <form action="<c:url value="/product/main/search"/>" method="post" id="search">
            <div class="right-box" style="text-align: right;">   
               <input type="text" name="search" id="search" placeholder="검색하실 단어를 입력하세요.">
               <button type="submit" disabled="disabled">search</button>
            </div>
         </form>
         <br><br>
         <div id="header">
            <img alt="index" src="${pageContext.request.contextPath}/resources/image/logo.png" align="middle">
         </div>
         <div id="container">
            <div id="content" style="height: 300px;">
		      <!-- 왼쪽, 오른쪽 바깥여백을 auto로 주면 중앙정렬된다.  -->
		           <b><font size="6" color="#c9a383">회원가입</font></b>
		           <br><br>
		           <form method="post" action="<c:url value="/member/sign/signUp" />">
		               <table style="color: #000000; margin: auto;">
		                   <tr>
		                       <td id="title">아이디</td>
		                       <td>
		                           <input type="text" name="id" id="id" maxlength="20" placeholder="ID" required>
		                           <input type="button" value="중복확인" id="idck" name="idck">
		                       </td>
		                   </tr>
		                   <tr>
		                       <td id="title">비밀번호</td>
		                       <td>
		                           <input type="password" name="pw1" id="pw1" maxlength="15">
		                       </td>
		                   </tr>
		                   <tr>
		                       <td id="title">비밀번호 확인</td>
		                       <td>
		                           <input type="password" name="pw2" id="pw2" maxlength="15">
		                       </td>
		                   </tr>
		                   <tr>
		                       <td id="title">이름</td>
		                       <td>
		                           <input type="text" name="name" id="name" maxlength="40">
		                       </td>
		                   </tr>
		                   <tr>
		                       <td id="title">이메일</td>
		                       <td>
		                           <input type="text" name="email_1" id="email_1" maxlength="30">@
		                           <input type="text" name="email_2" id="email_2" maxlength="20">
		                           <a href="<c:url value="/emailAuth" />"><input type="button" value="메일인증" /></a>
		                       </td>
		                   </tr>
		                   <tr>
		                       <td id="title">휴대전화</td>
		                       <td>
		                           <input type="text" name="phone" id="phone" />
		                       </td>
		                   </tr>
		                   <tr>
		                       <td id="title">주소</td>
		                       <td>
		                          <span id="guide" style="color:#999;display:none"></span>
		                           <input type="text" size="10" name="addr_0" id="addr_0" placeholder="우편번호" /> <input type="text" size="20" name="addr_1" id="addr_1" placeholder="도로명 주소" />
		                           <br><input type="text" size="15" name="addr_2" id="addr_2" placeholder="상세주소" /> <input type="button" onclick="execDaumPostcode()" value="주소검색">
		                       </td>
		                   </tr>
		               </table>
		               <br>
		               <input type="submit" value="가입" onclick="DosignUp()"/>  <input type="reset" value="재작성"/>  <a href="index"><input type="button" value="뒤로가기"></a>
		           </form>
		   </div>
         </div>
         <div id="footer">
            <p>Copyright 2019. Connect. all rights reserved.</p>
      </div>
   </body>
</html>