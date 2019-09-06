<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
		<script>
    		function check() {
				var form = document.authform;
				var authNum = ${authNum}
				
				if (!form.authnum.value) {
					alert("인증번호를 입력하세요.")
					return false;
				}
				if (form.authnum.value != authNum) {
					alert("틀린 번호입니다. 다시 인증번호를 입력하세요.")
					return false;
				}
				if (form.authnum.value != authNum) {
					alert("인증되었습니다.")
					opener.document.userinput.mailCheck.value="인증완료"
					self.close();
				}
			}
    	</script>
<center>
	<br>
	<h5>인증 번호를 입력해주세요.</h5>
	<div class="container">
		<form action="post" name="authForm" onSubmit="return check();">
			<input type="text" neme="authnum"><br>
			<input type="submit" class="" value="확인">
		</form>
	</div>
</center>
