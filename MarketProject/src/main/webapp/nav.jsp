<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri = "http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix = "fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>EUNCLOSET</title>

<style>
* {
  box-sizing: border-box;
}

body {
  font-family: Arial, Helvetica, sans-serif;
}

/* Style the side navigation */
.sidenav {
  height: 100%;
  width: 200px;
  position: fixed;
  z-index: 1;
  top: 0;
  left: 0;
  background-color: #236284;
  overflow-x: hidden;
  border: none;
  cursor: pointer;
}


/* Side navigation links */
.sidenav a {
  color: white;
  padding: 16px;
  text-decoration: none;
  display: block;
}

/* Change color on hover */
.sidenav a:hover {
  width: 200px;
}

/* Style the content */
.contenttitle {
  letter-spacing: 3px;
  font-family: "Times New Roman", Times, serif;
  margin-top: 50px;
  margin-left: 200px;

}

.contenttitle a {
  color: black;
  text-decoration: none;
  display: block;
}

.contenttitle a:hover {
  color: black;
}

.content {
  margin-left: 200px;
  padding-left: 20px;
  display: block;
}
.content a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}
.content_login {
  margin-left: 40%;
  padding-left: 20px;
  display: block;
}
.content_login a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}

.dropdown {
  position: relative;
  display: inline-block;
}

.dropdown-content {
  display: none;
  font-family: 맑은 고딕, malgun gothic;
  font-size: 15px;
  background-color: #f2f6ff;
  min-width: 200px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
}

.dropdown-content a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}

.dropdown:hover .dropdown-content {
  display: block;
}


table.table01 {
  margin-left: 3%;
  text-align: left;
  line-height: 1.5;

}
table.table01 thead th {
  padding: 5px;
  font-weight: bold;
  vertical-align: center;
  color: #369;
  border-bottom: 3px solid #036;
}
table.table01 th {
  text-align: center;
  padding: 5px;
  font-weight: bold;
  vertical-align: center;
  border-bottom: 1px solid #ccc;
  background: #f3f6f7;
}
table.table01 td {
  padding: 5px;
  vertical-align: center;
  border-bottom: 1px solid #ccc;
  text-align: center;
}

table.table02 {
  border-collapse: collapse;
  text-align: left;
  line-height: 1.5;
  border-top: 1px solid #ccc;
  border-left: 3px solid #369;
  margin : 20px 10px;
  width: 23%;  
  float: left;
}
table.table02 th {
  padding: 10px;
  font-weight: bold;
  vertical-align: top;
  color: #4169E1;
  border-right: 1px solid #ccc;
  border-bottom: 1px solid #ccc;

}
table.table02 td {
  text-align: center;
  padding: 5px;
  vertical-align: center;
  border-right: 1px solid #ccc;
  border-bottom: 1px solid #ccc;
  
}

table.table03 {
  border-collapse: collapse;
  text-align: left;
  line-height: 1.5;
  border-top: 1px solid #ccc;
  border-left: 3px solid #369;
  margin : 20px 10px;
  width: 80%;  
  float: left;
}
table.table03 th {
  padding: 10px;
  font-weight: bold;
  vertical-align: top;
  color: #4169E1;
  border-right: 1px solid #ccc;
  border-bottom: 1px solid #ccc;

}
table.table03 td {
  text-align: center;
  padding: 5px;
  vertical-align: center;
  border-right: 1px solid #ccc;
  border-bottom: 1px solid #ccc;
  
}
#page{
  margin-left: 50%;
  margin-top : 30%;
}
#page a {
  color: black;
  text-decoration: none;
  
}
#page1{
  margin-left: 40%;
  margin-top : 2%;
}

#page1 a {
  color: black;
  text-decoration: none;
  
}
#img{
  margin-left: 55%;
  margin-top : 2%;
}

</style>
</head>

<body>
<div class="sidenav">
<br>
<br>
<div class="dropdown">
 	<a href="#">TOP</a>
  	<div class="dropdown-content">
	  <a href="goodsSelect.do?goodstype=outer">OUTER</a>
	  <a href="goodsSelect.do?goodstype=shirts">SHIRTS</a>
  	</div>
</div>
<br>
<div class="dropdown">
	<a href="#">BOTTOM</a>
   	<div class="dropdown-content">
	  <a href="goodsSelect.do?goodstype=pants">PANTS</a>
	  <a href="goodsSelect.do?goodstype=skirt">SKIRT</a>
  	</div>
</div>
<br>
<br>
<br>
<c:if test = "${login.id!=null}">
<div class="dropdown">
	<a href="#">MY PAGE</a>
	<div class="dropdown-content">
	  <a href="mypage.do?cno=${login.cno}">MY PAGE</a>
	  	<c:if test = "${login.id.equals('admin')}">
		  <a href="form.do">상품 등록</a>
		  <a href="selectAll.do">상품 리스트</a>
		  <a href="selectMemberAll.do">회원 리스트</a>
		</c:if>
  		
  	</div>
</div>
</c:if>
<br><br>



<br><br>
<c:if test = "${login.id==null}">
<div class="dropdown">
  <a href="login_form.do">LOGIN</a>
</div>
</c:if>
<c:if test = "${login.id!=null}">
<div class="dropdown">
  <a href="logout.do">LOGOUT</a>
</div>
</c:if>
</div>



<div class="contenttitle">
  <h1><a href = "index.jsp">&emsp;&emsp;EUNCLOSET</a></h1>
 	<c:if test = "${login.id==null}">
 		<h3>&emsp;&emsp;&emsp;&emsp;회원만 상품 구매가 가능합니다.</h3>
	</c:if>
  	<c:if test = "${login.id!=null}">
 		<h3>&emsp;&emsp;&emsp;&emsp;${login.id}님이 로그인하셨습니다.</h3>
	</c:if>
  <p></p>
</div>
