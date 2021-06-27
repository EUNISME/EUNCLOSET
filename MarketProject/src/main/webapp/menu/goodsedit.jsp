<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../nav.jsp" %>   
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.0.min.js"></script>
<script>
$(document).ready(function() {
    $("#basket_btn").click(function() {
    	if(f1.id.value==""){
			alert("로그인하세요.");
			return false;
		}else{
			var query ={
				"cno" : $("#cno").val(),
				"id" : $("#id").val(),
				"name" : $("#name").val(), 	
				"goodstype" : $("#goodstype").val(), 	
				"goodsname" : $("#goodsname").val(),
				"goodssize" : $('input[name="goodssize"]:checked').val(),
				"filename" : $("#filename").val(), 	
				"price" : $("#price").val(),
				"buydate" : $("#buydate").val()
			};
			$.ajax({		
			  type: "GET",
			  data: query,
			  url: "${pageContext.request.contextPath}/insertBasket.do",
			  success : function(data){
				 alert("장바구니에 담았습니다");
				 if (!confirm("장바구니로 이동하시겠습니까?")) {
				  	 return false;
				 } else {
				  	 location.href="basketlist.do?id=${login.id}";
				 }  
			  },
			  error : function(request, error) {
	              alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);	
	          	  }
			  });
		}
	});	  
});

$(document).ready(function() {
    $("#com_btn").click(function() {
    	if(f1.id.value==""){
			  alert("로그인하세요.");
			  return false;
		}else{
			var query ={
					"mno" : $("#mno").val(),
					"gno" : $("#gno").val(),
					"id" : $("#id").val(),
					"com" : $("#contents").val() 	
			};
			$.ajax({		
				 type: "GET",
				 data: query,
				 url: "${pageContext.request.contextPath}/insertComments.do",
				 success : function(data){
						if(f2.contents.value==""){
							alert("후기 내용이 없습니다.");
							return false;
						}else{						  
							alert("후기를 등록하였습니다.");
							document.location.reload();
							location.href("${pageContext.request.contextPath}/selectComments.do?gno=${goodslist.gno}");
	
						}				  	    	
				},
			  	error : function(request, error) {
	              	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);	
	          	}
			}); 
		}
   	});	  
});


function ch1() {
	if (!confirm("해당상품을 구매하시겠습니까?")) {
 	 return false;
	} else {
 	 location.href="${pageContext.request.contextPath}/buy_end.jsp";
	}  
}

</script>


<div class="contenttitle">
  <h3>&emsp;&emsp;&emsp;${fn:toUpperCase(goodstype)}</h3>
</div>
<div class="content">
<form name= f1 >
<table class="table03">
<tr><td rowspan = 4>
<input type=hidden id = "gno" name="gno" value="${goodslist.gno}">
<input type=hidden id = "goodstype" name="goodstype" value="${goodslist.goodstype}">
<input type=hidden id = "filename" name="uploadFile" value="${goodslist.filename}">
<input type=hidden id = "cno" name="cno" value="${login.cno}">
<input type=hidden id = "id" name="id" value="${login.id}">
<img style="width: 300px;" id="preview-image" src="${realPath}${goodslist.filename}" onerror="${realPath}space.jpg">
</td>
	<td width=500px> <input type=hidden id = "goodsname" name="goodsname" value="${goodslist.goodsname}">${goodslist.goodsname}</td></tr>
<tr><td width=500px> <input type=hidden id = "price" name="price" value="${goodslist.price}">${goodslist.price}&emsp;won</td></tr>
<tr><td width=500px>
	<input type=radio id = "goodssize" name="goodssize" value="S" checked="checked">S&emsp;
	<input type=radio id = "goodssize" name="goodssize" value="M">M&emsp;
	<input type=radio id = "goodssize" name="goodssize" value="L">L&emsp;
	<input type=radio id = "goodssize" name="goodssize" value="XL">XL&emsp;</td></tr>
<tr><td colspan = 2><input type = button id ="basket_btn" value = "장바구니"> &emsp; 
<input type = button onClick = "ch1()" value = "BUY">
</td></tr>
</table>
</form>

<form name = f2>
<table class="table03">
<tr><th width = 80%>COMMENTS</th><tr>
<tr><td>
<textarea cols="130" rows="2" id = "contents" name="contents"></textarea><hr>
<input type = button id = com_btn value = "등록">
<input type=hidden id = "mno" name="mno" value="${mno.max}">
</td></tr>
</table>
</form>

<table class="table03">
<c:forEach items="${commentslist}" var="c">
<tr><td>${c.com}</td></tr>
</c:forEach>
</table>

</div>
</body>
</html>
