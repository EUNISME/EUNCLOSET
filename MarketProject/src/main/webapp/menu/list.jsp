<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../nav.jsp" %>   


<div class="contenttitle">
  <h3>&emsp;&emsp;&emsp;${fn:toUpperCase(goodstype)}</h3>
</div>

<div class="content">
<c:forEach items="${goodslist}" var="g">
<table class="table02">
<tr><td height= 300px><img width= 170px id="preview-image" src="${realPath}${g.filename}" onerror="${realPath}space.jpg"></td></tr>
<tr><td><a href = "goodsEdit.do?gno=${g.gno}">${g.goodsname}</a></td></tr>
<tr><td>${g.price}&emsp;won</td></tr>
</table>
</c:forEach>
</div>

<div id="page">
<c:if test="${m.startpage != m.nowpage}">
<c:url value="goodsSelect.do?goodstype=${goodstype}" var ="url">
  <c:param name="idxstr" value="1"></c:param>
</c:url>
<a href="${url}">◀◀</a>&emsp;&emsp;
</c:if>

<c:if test="${m.startpage == m.nowpage}">
◀◀&emsp;&emsp;
</c:if>

<c:if test="${m.idx > m.pagesize * m.pagelistsize }">
	<c:url  value="goodsSelect.do?goodstype=${goodstype}"  var ="url">
	  <c:param name="idxstr" value="${(m.list_start_page - m.pagelistsize) * m.pagesize - m.pagesize + 1}"></c:param>
    </c:url>
    <a href="${url}">◀</a>&emsp;&emsp;
</c:if>

<c:if test="${m.idx <= m.pagesize * m.pagelistsize}">
◀ &emsp;&emsp;
</c:if>

<c:forEach  var="i"  begin="${m.list_start_page}"  end="${m.list_end_page}" >
   <c:if test="${ i <= m.totalpage}">
	    <c:url  value="goodsSelect.do?goodstype=${goodstype}"  var ="url">
			  <c:param name="idxstr" value="${(i-1)*m.pagesize + 1 }" ></c:param>
	    </c:url>
	    <a href="${url}">[${i}]</a> &emsp;&emsp;
   </c:if>
</c:forEach>

<c:if test="${m.list_end_page >= m.totalpage}">
▶ &emsp;&emsp;
</c:if>

<c:if test="${m.list_end_page < m.totalpage}" >
	<c:url  value="goodsSelect.do?goodstype=${goodstype}"  var ="url">
	  <c:param name="idxstr" value="${ m.pagesize * m.list_end_page + 1}" ></c:param>
    </c:url>
    <a href="${url}">▶</a> &emsp;&emsp;
</c:if>

<c:if test="${m.endpage != m.nowpage}">
<c:url value="goodsSelect.do?goodstype=${goodstype}" var ="url">
	 <c:param name="idxstr" value="${m.endpage}" ></c:param>
</c:url>
<a href="${url}">▶▶</a>
</c:if>
<c:if test="${m.endpage == m.nowpage}">
▶▶
</c:if>
</div>

</body>
</html>
