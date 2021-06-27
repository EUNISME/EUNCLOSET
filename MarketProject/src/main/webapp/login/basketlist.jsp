<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../nav.jsp" %>   
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.0.min.js"></script>
<script>
$(function(){
	var chkObj = document.getElementsByName("rowChk");
	var rowCnt = chkObj.length;
		
	$("input[name='allCheck']").click(function(){
		var chk_listArr = $("input[name='rowChk']");
		for(var i=0; i<chk_listArr.length; i++){
			chk_listArr[i].checked=this.checked;
		}
	});
	$("input[name='rowChk']").click(function(){
		if($("input[name='rowChk']:checked").length ==rowCnt){
			$("input[name='allCheck']")[0].checked = true;		
		}
		else{
			$("input[name='allCheck']")[0].checked = false;
		}
	});
});
$(document).ready(function() {
    $("#delete_btn").click(function deleteValue(){
		var valueArr = new Array();
		var list = $("input[name='rowChk']");
		for(var i=0; i<list.length; i++){
			if(list[i].checked){
				valueArr.push(list[i].value);
			}
		}
		if (valueArr.length ==0){
			alert("선택된 상품이 없습니다");
		}
		else{
			$.ajax({
			  type : "POST",
			  traditional : true,
			  data : {
					valueArr : valueArr  
			  },
			  url : "${pageContext.request.contextPath}/deleteBasket.do",
			  success : function(data){
			    	alert("장바구니에서 선택하신 상품을 삭제하였습니다.");
			      location.href = "basketlist.do?id=${login.id}";
			  },
			  error : function(request, error) {
	              alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);

	          }
			});
		}
    });
});


$(document).ready(function() {
    $("#buy_btn").click(function buyValue(){
		var valueArr = new Array();
		var list = $("input[name='rowChk']");
		for(var i=0; i<list.length; i++){
			if(list[i].checked){
				valueArr.push(list[i].value);
			}
		}
		if (valueArr.length ==0){
			alert("선택된 상품이 없습니다");
		}
		else{
			if (!confirm("선택하신 물품을 구매하시겠습니까?")) {
			  	 return false;
			 } else {
					location.href = "${pageContext.request.contextPath}/buy_end.jsp";
			 }  

		}
    });
});

</script>

<div class="contenttitle">
  <h3>&emsp;&emsp;&emsp;BASKET</h3>
</div>

<div class="content">




<form>
<table class="table03">
<c:if test = "${not empty basketlist}">
<tr><td colspan = 4></td><td><input type = checkbox name = allCheck id = "allCheck"></td></tr>
<c:forEach items="${basketlist}" var="b">
<tr>
<td width=500px><img style="width: 100px;" src="${realPath}${b.filename}" onerror="${realPath}space.jpg"></td>
<td width=500px><input type = hidden name = "goodsname" value="${b.goodsname}">${b.goodsname}</td>
<td width=500px><input type = hidden name = "goodssize" value="${b.goodssize}">${b.goodssize}&emsp;</td>
<td width=500px><input type = hidden name = "price" value="${b.price}">${b.price}&emsp;won</td>
<td width=500px><input type = checkbox name = rowChk value="${b.goodsname}" id = "chk_box" >
</td>
</tr>
</c:forEach>
<tr><td colspan = 4></td><td><input type= button id="delete_btn" value="삭제">&emsp;<input type = button id="buy_btn" value = "BUY"></td></tr>
</c:if>
<c:if test = "${empty basketlist}">
<tr><td colspan = 5>장바구니가 비어있습니다.</td></tr>
</c:if>
</table>
</form>







</div>
</body>
</html>
