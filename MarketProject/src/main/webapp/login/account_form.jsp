<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../nav.jsp" %>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.0.min.js" ></script>
<script>
var idck = 0;
$(document).ready(function() {
    $("#idck").click(function() {
        var id =  $("#id").val();
        $.ajax({
            type : "POST",
            data : id,
            url : "${pageContext.request.contextPath}/memberIdCheck.do", 
            contentType : "application/json; charset=utf-8",
            success : function(result) {
                if (result>0) {
                    alert("중복된 아이디가 존재합니다");
                    $("#id").focus();                
                } else if(result==0){
                	if(id==""){
                		alert("아이디를 입력하세요");
                	}else{
                        $("#id").focus();
                        idck = 1;
                        alert("사용가능한 아이디입니다");
                	}
                    
                }
            },
            error : function(request, error) {
                alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);

            }
        });
    });
    
});

$(document).ready(function(){
	$('#ok').click(function(){
		if(f1.id.value==""){
			alert("아이디를 입력하세요");
		  	f1.id.focus();
		  	return false;
		}
		if(f1.pwd.value==""){
			alert("비밀번호를 입력하세요");
		  	f1.pwd.focus();
		  	return false;
		}
		if(f1.pwd.value!=f1.pwd_chk.value){
			alert("비밀번호를 확인하세요");
		  	f1.pwd_chk.focus();
		  	return false;
		}
		if(f1.name.value==""){
			alert("이름을 입력하세요");
		  	f1.name.focus();
		  	return false;
		}
		if(f1.address0.value==""){
			alert("주소를 입력하세요");
		  	f1.address0.focus();
		  	return false;
		}
		if(f1.phone1.value==""||f1.phone2.value==""||f1.phone3.value==""){
			alert("연락처를 입력하세요");
		  	f1.phone1.focus();
		  	return false;
		}
		if(f1.email1.value==""||f1.email2.value==""){
			alert("이메일을 입력하세요");
		  	f1.email1.focus();
		  	return false;
		}
		if(idck==0){
		    alert("아이디 중복체크를 해주세요");
		    return false;
		}
	});
});






</script>

<div class="contenttitle">
  <h3>&emsp;&emsp;&emsp;회 원 가 입</h3>
</div>
<div class="content">
<br><br>
<form name="f1" action="memberInsert.do">
<div>
<table class="table01">

<tr>
	<td>아이디</td>
	<td width=500px>
		<input type="text" id="id" size=20 name="id" maxlength="50">
		&emsp;
		<input type="button" id="idck" value="중복확인" >
		<input type="hidden" name="cno" value="${cno.max}">
	</td>

</tr>

<tr>
	<td>비밀번호</td>
	<td width=500px>
		<input type="password" id="pwd" size="30" name="pwd" >
	</td>
</tr>
<tr>
	<td>비밀번호 확인</td>
	<td width=500px>
		<input type="password" id="pwd_chk" size=30 name="pwd_chk">
	</td>
</tr>
<tr>
	<td>이름</td>
	<td width=500px>
		<input type="text" id="name" size=30 name="name">
	</td>
</tr>
<tr>
	<td>주소</td>
	<td width=500px>
		<input type="text" id="postcode" placeholder="우편번호" name="address0">
		<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
		<input type="text" id="address" size=46 placeholder="주소" name="address1"><br>
		<input type="text" id="detailAddress" placeholder="상세주소" name="address2">
		<input type="text" id="extraAddress" placeholder="참고항목" name="address3">
	</td>
</tr>
<tr>
	<td>연락처</td>
	<td width=500px>
		<input type="text" id="phone1" size=5 name="phone1">&emsp;-&emsp;
		<input type=text id="phone2" size=5 name="phone2">&emsp;-&emsp;
		<input type=text id="phone3" size=5 name="phone3">
	</td>
</tr>
<tr>
	<td>이메일</td>
	<td width=500px>
		<input type="text" id="email1" size=30 name="email1">&emsp;@&emsp;
		<input type=text id="email2" size=30 name="email2">
	</td>
</tr>
<tr>
	<td colspan=2>
		<input type="submit" id="ok" value = "회원가입">
	</td>
</tr>
</table>
</div>

</form>
</div>
</body>
</html>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("detailAddress").focus();
            }
        }).open();
    }
</script>