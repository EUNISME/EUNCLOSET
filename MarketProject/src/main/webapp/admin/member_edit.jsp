<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../nav.jsp" %>   
<script>
function ch1(){
	  location.href="selectMemberAll.do";
 }
function ch2(){
	  location.href="memberDelete.do?cno=${memberlist.cno}";
} 
</script>

<div class="contenttitle">
  <h3>&emsp;&emsp;&emsp;회 원 정 보 수 정</h3>
</div>
<div class="content">
<br><br>
<form action="updateMember.do" method="post"  enctype="multipart/form-data">
<table class="table01">
<tr><td>번호</td><td width=500px><input type=hidden size=30 name="cno" value="${memberlist.cno}">${memberlist.cno}</td></tr>
<tr><td>아이디</td><td width=500px><input type=hidden size=30 name="id" value="${memberlist.id}">${memberlist.id}</td>
<tr><td>이름</td><td width=500px><input type=text size=50 name="name" value="${memberlist.name}"></td></tr>
<tr><td>주소</td><td width=500px>
		<input type="text" id="postcode" placeholder="우편번호" name="${memberlist.address0}">
		<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
		<input type="text" id="address" size=46 placeholder="주소" name="${memberlist.address1}"><br>
		<input type="text" id="detailAddress" placeholder="상세주소" name="${memberlist.address2}">
		<input type="text" id="extraAddress" placeholder="참고항목" name="${memberlist.address3}">
	</td>
<tr><td>연락처</td><td width=500px>
<input type=text size=10 name="phone1" size=5 value="${memberlist.phone1}">&emsp;-&emsp;
<input type=text size=10 name="phone2" size=5 value="${memberlist.phone2}">&emsp;-&emsp;
<input type=text size=10 name="phone3" size=5 value="${memberlist.phone3}"></td></tr>

<tr><td>이메일</td><td width=500px>
<input type=text size=10 name="email1" size=30 value="${memberlist.email1}">&emsp;@&emsp;
<input type=text size=10 name="email2" size=30 value="${memberlist.email2}"></td></tr>


<tr><td colspan=3><input type = submit value = "수정"> &emsp; 
<input type = button onClick = "ch1()" value = "조회"> &emsp; 
<input type = button onClick = "ch2()" value = "삭제">
</table>
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
