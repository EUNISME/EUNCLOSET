<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../nav.jsp" %>   
<script>
function ch1(){
	  location.href="selectAll.do";
 }
function ch2(){
	  location.href="deleteGoods.do?gno=${goodslist.gno}";
} 
</script>

<script type="text/javascript">
$(function() {
    $("#input-image").on('change', function(){
        readURL(this);
    });
});
function readURL(input) {
    if (input.files && input.files[0]) {
       var reader = new FileReader();
       reader.onload = function (e) {
          $('#preview-image').attr('src', e.target.result);
       }
       reader.readAsDataURL(input.files[0]);
    }
}
</script>

<div class="contenttitle">
  <h3>&emsp;&emsp;&emsp;상 품 수 정</h3>
</div>
<div class="content">
<br><br>
<form action="updateGoods.do" method="post"  enctype="multipart/form-data">
<table class="table01">
<tr><td>상품번호</td><td width=500px><input type=hidden size=30 name="gno" value="${goodslist.gno}">${goodslist.gno}</td>
<td rowspan = 6><img style="width: 300px;" id="preview-image" src="${realPath}${goodslist.filename}" onerror="${realPath}space.jpg"></td></tr>
<tr><td>상품종류</td><td width=500px><input type=hidden size=30 name="goodstype" value="${goodslist.goodstype}">${goodslist.goodstype}</td>
<tr><td>상품이름</td><td width=500px><input type=text size=50 name="goodsname" value="${goodslist.goodsname}"></td></tr>
<tr><td>상품가격</td><td width=500px><input type=text size=10 name="price" value="${goodslist.price}">원</td></tr>
<tr><td>상품이미지</td><td width=500px><input type = file  id="input-image" size=30 name = uploadFile>&emsp;</td></tr>
<tr><td>상품설명</td><td width=500px><textarea cols="50" rows="10" name="contents">${goodslist.contents}</textarea></td></tr>
<tr><td colspan=3><input type = submit value = "수정"> &emsp; 
<input type = button onClick = "ch1()" value = "조회"> &emsp; 
<input type = button onClick = "ch2()" value = "삭제">
</table>
</form>
</div>
</body>
</html>
