<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../nav.jsp" %>
 <script type="text/javascript" src="http://code.jquery.com/jquery-2.1.0.min.js"></script>
<script>
function ch2(){
	  location.href="selectGoods.do";
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
  <h3>&emsp;&emsp;&emsp;상 품 등 록</h3>
</div>
<div class="content">
<br><br>
<form action="insertGoods.do" method="post"  enctype="multipart/form-data">
<table class="table01">

<tr><td>상품번호</td><td width=500px><input type=hidden size=30 name="gno" value=${gno.max}>${gno.max}</td>
<td rowspan = 6><img style="width: 300px;" id="preview-image" src="${realPath}${goodslist.filename}" onerror="${realPath}space.jpg"></td></tr>
<tr><td>상품종류</td><td width=500px>
	<label><input type=radio name=goodstype value=outer>아우터</label>&emsp;
	<label><input type=radio name=goodstype value=shirts>셔츠</label>&emsp;
	<label><input type=radio name=goodstype value=pants>바지</label>&emsp;
	<label><input type=radio name=goodstype value=skirt>스커트</label>&emsp;
	</td></tr>
<tr><td>상품이름</td><td width=500px><input type=text size=50 name="goodsname"></td></tr>
<tr><td>상품가격</td><td width=500px><input type=text size=10 name="price">원</td></tr>
<tr><td>상품이미지</td><td width=500px><input type = file  id="input-image" size=30 name="uploadFile">&emsp;</td></tr>
<tr><td>상품설명</td><td width=500px><textarea cols="50" rows="10" name="contents"></textarea></tr>
<tr><td colspan=3><input type = submit value = "등록"> &emsp;
<input type=button value="조회" onClick="ch2()" ></td></tr>
</table>
</form>
</div>
</body>
</html>
