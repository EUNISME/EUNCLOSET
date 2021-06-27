<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../nav.jsp" %>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.0.min.js" ></script>
<script>
$(document).ready(function(){
	$("#login_btn").click(function(){
	        var data = {
	        	"id" : $("#custid").val(),
	        	"pwd" : $("#custpwd").val()
	        };
	        $.ajax({
	            type : "POST",
	            data : data,
	        	url : "${pageContext.request.contextPath}/login.do", 
	            success : function(result) {
	                if (result>0) {
	                    alert("아이디 또는 비밀번호가 일치하지 않습니다.");
	                    $("#id").focus();                
	                } else if(result==0){
			              location.href="finish.do";	                    
	                }
	            },
	            error : function(request, error) {
	                alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);

	            }
	        });
	    });
	    
	});


function ch1(){
	  location.href="account_form.do";
 }
</script>

<div class="contenttitle">
  <h3>&emsp;&emsp;&emsp;LOGIN</h3>
</div>
<div class="content_login">
<br><br>
<form id="login">
<table class="table01">
<tr><td>I&emsp;&emsp;D</td><td width=300px height = 70px><input type="text" id="custid" size=15></td>
<tr><td>PASSWORD</td><td width=300px height = 70px><input type="password" id="custpwd" size=17></td></tr>
<tr><td colspan=3>
<input type=button id="login_btn" value = "LOGIN"> &emsp;
<input type=button value="회원가입" onClick="ch1()">
</td></tr>
</table>
</form>
</div>
</body>
</html>
