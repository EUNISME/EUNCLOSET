<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../nav.jsp" %>   


<div class="contenttitle">
  <h3>&emsp;&emsp;&emsp;상 품 목 록</h3>
</div>

<div class="content">
<table class="table01">
<tr><th width=100px>번호</th><th width=100px>상품코드</th><th width=500px>상품이름</th><th width=500px>이미지파일이름</th><th width=100px>가격</th><th width=200px>등록일</th><th width=100px>상세정보</th></tr>
<c:forEach items="${goodslist}" var="g">
<tr>
<td>${g.gno}</td>
<td>${g.gno}${g.goodstype}</td>
<td>${g.goodsname}</td>
<td>${g.filename}</td>
<td>${g.price}</td>
<td><fmt:formatDate value="${g.g_regdate}" pattern="yy-MM-dd" type="date"/></td>
<td><a href = "selectOne.do?gno=${g.gno}">편집</a></td>
</tr>
</c:forEach>
</table>
</div>
<div id="page1">
<c:url  value="selectAll.do"  var ="url">
  <c:param name="idxstr" value="${m.startpage}"></c:param>
</c:url>
<a href="${url}">◀◀</a>&emsp;&emsp;

<c:if test="${m.idx > m.pagesize * m.pagelistsize }">
	<c:url  value="selectAll.do"  var ="url">
	  <c:param name="idxstr" value="${(m.list_start_page - m.pagelistsize) * m.pagesize - m.pagesize + 1}"></c:param>
    </c:url>
    <a href="${url}">◀</a>&emsp;&emsp;
</c:if>

<c:if test="${m.idx <= m.pagesize * m.pagelistsize}">
	◀  &emsp;&emsp;
</c:if>

<c:forEach  var="i"  begin="${m.list_start_page}"  end="${m.list_end_page}" >
   <c:if test="${ i <= m.totalpage}">
	    <c:url  value="selectAll.do"  var ="url">
			  <c:param name="idxstr" value="${(i-1)*m.pagesize + 1 }" ></c:param>
	    </c:url>
	    <a href="${url}">[${i}]</a> &emsp;&emsp;
   </c:if>
</c:forEach>

<c:if test="${m.list_end_page >= m.totalpage}">
▶ &emsp;&emsp;
</c:if>

<c:if test="${m.list_end_page < m.totalpage}" >
	<c:url  value="selectAll.do"  var ="url">
	  <c:param name="idxstr" value="${ m.pagesize * m.list_end_page + 1}" ></c:param>
    </c:url>
    <a href="${url}">▶</a> &emsp;&emsp;
</c:if>

<c:url  value="selectAll.do"  var ="url">
	 <c:param name="idxstr" value="${ m.endpage }" ></c:param>
</c:url>
<a href="${url}">▶▶</a>
</div>
</body>
</html>
