<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../nav.jsp" %>   

<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.0.min.js" ></script>
<script>
function ch1(){
	  location.href="basketlist.do?id=${login.id}";
 }
</script>
<div class="contenttitle">
<br>
  <h2>&emsp;&emsp;&emsp;About ${login.id}</h2>
</div>
<div class="content_login">
<br><br>
<form action="selectMemberOne_cust.do?cno=${login.cno}">
<table class="table01">
<tr><td>아이디</td><td width=500px><input type=hidden size=30 name="cno" value="${login.cno}">${memberlist.id}</td>
<tr><td>이름</td><td width=500px>${memberlist.name}</td></tr>
<tr><td>주소</td><td width=500px>
		${memberlist.address0}&emsp;${memberlist.address1}&emsp;${memberlist.address2}&emsp;${memberlist.address3}</td>
<tr><td>연락처</td><td width=500px>${memberlist.phone1}&emsp;-&emsp;${memberlist.phone2}&emsp;-&emsp;${memberlist.phone3}</td></tr>
<tr><td>이메일</td><td width=500px>${memberlist.email1}&emsp;@&emsp;${memberlist.email2}</td></tr>
<tr><td colspan=3><input type = submit value = "수정"> &emsp; <input type = button onClick="ch1()" value = "장바구니">
</table>
</form>
</div>
</body>
</html>