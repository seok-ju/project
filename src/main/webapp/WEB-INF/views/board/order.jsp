<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript">
function doDisplay(){
	var con = document.getElementById("myDiv");
	if(con.style.display == 'none'){
		con.style.display = 'block';
	} else{
		con.style.display = 'none';
	}
}

</script>
<script>
function sample4(asd){
var IMP = window.IMP;
IMP.init('imp36101907');
IMP.request_pay({
    pg : 'html5_inicis',
    pay_method : 'card',
    merchant_uid : 'merchant_' + new Date().getTime(),
    name : '주문명:결제테스트',
    amount : asd,
    buyer_email : 'iamport@siot.do',
    buyer_name : '구매자이름',
    buyer_tel : '010-1234-5678',
    buyer_addr : '서울특별시 강남구 삼성동',
    buyer_postcode : '123-456',
    //m_redirect_url : 'https://www.yourdomain.com/payments/complete'
}, function(rsp) {
    if ( rsp.success ) {
        var msg = '결제가 완료되었습니다.';
        msg += '고유ID : ' + rsp.imp_uid;
        msg += '상점 거래ID : ' + rsp.merchant_uid;
        msg += '결제 금액 : ' + rsp.paid_amount;
        msg += '카드 승인번호 : ' + rsp.apply_num;
    } else {
        var msg = '결제에 실패하였습니다.';
        msg += '에러내용 : ' + rsp.error_msg;
    }

    alert(msg);
});
}
</script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
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
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;

                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
</script>
<script type="text/javascript">

function transfer(num){
if(num == 1){
var name = document.getElementById('name').value;
var num = document.getElementById('num').value;
var mail = document.getElementById('mail').value;
var postcode = document.getElementById('sample4_postcode').value;
var roadAddress = document.getElementById('sample4_roadAddress').value;
var detailAddress = document.getElementById('sample4_detailAddress').value;
var extraAddress = document.getElementById('sample4_extraAddress').value;

document.add.name1.value =name;
document.add.num1.value =num;
document.add.mail1.value =mail;
document.add.postcode.value =postcode;
document.add.roadAddress.value =roadAddress;
document.add.detailAddress.value =detailAddress;
document.add.extraAddress.value =extraAddress;
}else if(num==0){
	document.add.name1.value ="";
	document.add.num1.value ="";
	document.add.mail1.value ="";
	document.add.postcode.value ="";
	document.add.roadAddress.value ="";
	document.add.detailAddress.value ="";
	document.add.extraAddress.value ="";
	}
}
</script>
<head>
		<meta charset="UTF-8">
		<title>meiB</title>
		<link href="${pageContext.request.contextPath}/resources/css/main_style.css" rel="stylesheet" type="text/css">
		
	</head>
	<body>
		<div id="wrap">
			<div class='ribbon'>
				<a href='index'><span>product</span></a>
				<a href='<c:url value="/product/cart"/>'><span>cart</span></a>
				<a href='#'><span>myPage</span></a>
				<a href='#'><span>support</span></a>
			</div>
<c:if test="${user eq null }"> 
			<form action='<c:url value="/member/sign/signIn"/>' method="post" id="loginForm">
				<div class="left-box" style="text-align: left;">	
					<input type="text" id="id" name="id" placeholder="ID"> <input type="password" id="pw" name="pw" placeholder="Password">
					<input type="submit" disabled="disabled" value="Sign In" />	<input type="button" disabled="disabled" value="Sign up" />
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
				<div id="content">
					<form action="<c:url value="/board/writeme"/>" method="post" name="add">
						<table>
<c:forEach var="order" items="${orderList}" varStatus="loop">
							<tr>			
								<td rowspan="4"><img src="${pageContext.request.contextPath}${order.proImg}" width="200"></td>
								<th>상품이름 :</th>
								<td>${order.proName}</td>
							</tr>
							<tr>
								<th>상품번호 :</th>
								<td>${order.proNum}</td>
							</tr>
							<tr>
								<th>상품 수 :</th>
								<td>1</td>
							</tr>
							<tr>
								<th>가격 :</th>
								<td>${order.proViewPrice}</td>
							</tr>
</c:forEach>
							<tr>
								<td><b>가격 ${totalPrice}원 배송료 0원  총가격 = ${totalPrice}원</b></td>
							</tr>
						</table>
						<br>
						<table>
							<tr>
								<th>주문정보</th>
							</tr>
							<tr>
								<th>주문하시는분</th>
								<td><input type="text" id="name" name="name" width="100" value = "${member.name}"></td>
							</tr>
							<tr>
								<th>휴대전화</th>
								<td><input type="number" id="num"name="num" width="100" value = "${member.phone}"></td>
							</tr>
							<tr>
								<th>이메일</th>
								<td><input type="email"  id="mail"name="mail" width="100" value = "${member.email}"></td>
							</tr>
							<tr>
								<th>주소</th>
								<td><input type="text" id="sample4_postcode" placeholder="우편번호" value = "${addr1}"></td>
								<td><input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br></td>
							</tr>
							<tr>
								<td><span id="guide" style="color:#999;display:none"></span></td>
								<td><input type="text" id="sample4_roadAddress" placeholder="도로명주소" value = "${addr2}"></td>
								<td><input type="text" id="sample4_detailAddress" placeholder="상세주소" value="${addr3}"></td>
								<td><input type="text" id="sample4_extraAddress" placeholder="참고항목"></td>
							</tr>
						</table>
						<br>
						<table>
							<tr>
								<th>배송정보</th>
							</tr>
							<tr>
								<th>배송지선택</th>
								<td><input type="radio" name="ch1"  value="기본" onclick="transfer(1);">주문자 정보와 동일
									<input type="radio" name="ch1"  value="기본" checked="checked" onclick="transfer(0);">새로운 배송지</td>
							</tr>
							<tr>
								<th>주문하시는분</th>
								<td><input type="text" id="name1" name="name" width="100"></td>
							</tr>
							<tr>	
								<th>휴대전화</th>
								<td><input type="number"id="num1" name="num" width="100"></td>
							</tr>
							<tr>
								<th>이메일</th>
								<td><input type="email"id="mail1" name="mail" width="100"></td>
							</tr>
							<tr>
								<th>주소</th>
								<td><input type="text" id="postcode" placeholder="우편번호"></td>
								<td><input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br></td>
							</tr>
							<tr>
								<td><span id="guide" style="color:#999;display:none"></span></td>
								<td><input type="text" id="roadAddress" placeholder="도로명주소"></td>
								<td><input type="text" id="detailAddress" placeholder="상세주소"></td>
							</tr>
						</table>
						<br>
						<table>
							<tr><th>적립금 사용</th><td><input type="text" name="ad" id="point" width="100" placeholder="0" onkeyup='call(${member.point})'></td><td><input type="text" class="form-control" id="uName" name="uName" value= "현재적립금 ${member.point}원" readonly></td></tr>
						</table>
						<br>
						<br>
						<h4>결제예정금액</h4>
						<table>
							<tr><th>결제예정금액-</th><th>적립금 사용-</th><th>총 결제 금액</th><tr>
      						<tr><td><input type="text" name="mo" id="mo" value= "${p}" readonly></td>
      							<td><input type="text" id =money name="mo" value ="0" readonly></td>
        						<td><input type="text" id=summoney name="mo" value= "${p}" readonly></td>
      						<tr><td><input type="button" onclick="sample4()" value="결제하기"><br></td>
   						</table>
					</form>
				</div>
			</div>
			<div id="footer">
				<p>Copyright 2019. Connect. all rights reserved.</p>
			</div>
		</div>
	</body>
</html>