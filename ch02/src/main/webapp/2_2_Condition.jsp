<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2_2_Condition</title>
</head>
<body>
	<!--
		날짜 : 2021/03/22
		이름 : 이지황
		내용 : JSP 조건문 실습
	
	-->
	<h3>조건문</h3>
	<%
	int num1 = 1;
	int num2 = 2;
	int num3 = 3;
	int num4 = 4;
	
	if(num1 > 0){
		out.print("<h4>num1은 0보다 크다</h4>");
	}
	%>
	
	<hr>
	
	<% if(num1 > num2){ %>
		<h4>num1이 num2 보다 크다</h4>
	<% }else{ %>
		<h4>num1이 num2 보다 작다</h4>
	<% } %>	
		
	<hr>
	
	<% if (num1 > num2){ %>
		<h4>num1은 num2 보다 크다.</h4>
	<% }else if (num2 > num3){ %>
		<h4>num2은 num3 보다 크다.</h4>
	<% }else if (num3 > num4){ %>
		<h4>num3은 num4 보다 크다.</h4>
	<% }else {%>
		<h4>num4가 가장 크다.</h4>
	<% } %>
	
</body>
</html>