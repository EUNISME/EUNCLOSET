<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../nav.jsp" %>   


<div class="contenttitle">
  <h3>&emsp;&emsp;&emsp;회 원 목 록</h3>
</div>
<div class="content">
<!-- 
 1. 페이지사이즈: ${m.pagesize} &emsp;  
 2. 페이지ListSize: ${m.pagelistsize} &emsp;
 3. 총레코드 수: ${m.totalrecord}&emsp; 
 4. 총 페이지수:${m.totalpage}<br>
 5. 현재 레코드:${m.idx}&emsp;
 6. 현재페이지:${m.nowpage} &emsp;   
 7. 하단가로 시작페이지:${m.list_start_page}&emsp; 
 8. 하단가로 마지막페이지: ${m.list_end_page}<br><br>
 -->
<form action="selectMemberAll.do">
&emsp;&emsp;<select name="ch1">
<option value="cno">번호</option>
<option value="regdate">가입일</option>
</select>
<input type="text" name="ch2">
<input type="submit" value="검색">
</form>
<br>
<table class="table01">
<tr>
<th width=70px>번호</th>
<th width=100px>아이디</th>
<th width=100px>이름</th>
<th width=430px>주소</th>
<th width=200px>연락처</th>
<th width=200px>이메일</th>
<th width=120px>가입일</th>
<th width=80px>수정</th></tr>
<c:forEach items="${memberlist}" var="li">
<tr>
<td>${li.cno}</td>
<td>${li.id}</td>
<td>${li.name}</td>
<td>${li.address}</td>
<td>${li.phone}</td>
<td>${li.email}</td>
<td><fmt:formatDate value="${li.regdate}" pattern="yy-MM-dd" type="date"/></td>
<td><a href = "selectMemberOne.do?cno=${li.cno}">편집</a></td>
</tr>
</c:forEach>
</table>
</div>
<div id="page1">
<c:url  value="selectMemberAll.do"  var ="url">
  <c:param name="idxstr" value="${m.startpage}"></c:param>
  <c:param name="ch1" value="${m.ch1}"></c:param>
  <c:param name="ch2" value="${m.ch2}"></c:param>
</c:url>
<a href="${url}">◀◀</a>&emsp;&emsp;

<c:if test="${m.idx > m.pagesize * m.pagelistsize }">
	<c:url  value="selectMemberAll.do"  var ="url">
	  <c:param name="idxstr" value="${(m.list_start_page - m.pagelistsize) * m.pagesize - m.pagesize + 1}"></c:param>
  	  <c:param name="ch1"  value="${m.ch1}"></c:param>
  	  <c:param name="ch2"  value="${m.ch2}"></c:param>
    </c:url>
    <a href="${url}">◀</a>&emsp;&emsp;
</c:if>

<c:if test="${m.idx <= m.pagesize * m.pagelistsize}">
	◀  &emsp;&emsp;
</c:if>

<c:forEach  var="i"  begin="${m.list_start_page}"  end="${m.list_end_page}" >
   <c:if test="${ i <= m.totalpage}">
	    <c:url  value="selectMemberAll.do"  var ="url">
			  <c:param name="idxstr" value="${(i-1)*m.pagesize + 1 }" ></c:param>
		  	  <c:param name="ch1"  value="${m.ch1}" ></c:param>
		  	  <c:param name="ch2"  value="${m.ch2}" ></c:param>
	    </c:url>
	    <a href="${url}">[${i}]</a> &emsp;&emsp;
   </c:if>
</c:forEach>

<c:if test="${m.list_end_page >= m.totalpage}">
▶ &emsp;&emsp;
</c:if>

<c:if test="${m.list_end_page < m.totalpage}" >
	<c:url  value="selectMemberAll.do"  var ="url">
	  <c:param name="idxstr" value="${ m.pagesize * m.list_end_page + 1}" ></c:param>
  	  <c:param name="ch1"  value="${m.ch1}" ></c:param>
  	  <c:param name="ch2"  value="${m.ch2}" ></c:param>
    </c:url>
    <a href="${url}">▶</a> &emsp;&emsp;
</c:if>

<c:url  value="selectMemberAll.do"  var ="url">
	 <c:param name="idxstr" value="${ m.endpage }" ></c:param>
  	 <c:param name="ch1"  value="${m.ch1}" ></c:param>
  	 <c:param name="ch2"  value="${m.ch2}" ></c:param>
</c:url>
<a href="${url}">▶▶</a>
</div>

</body>
</html>
