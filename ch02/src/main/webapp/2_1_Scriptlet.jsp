<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>2_1_Scriptlet</title>
</head>
<body>
	<!--
		날짜 : 2021/03/22
		이름 : 이지황
		내용 : 1.jsp 구성요소 Scriptlet 실습하기
	-->
	<h3>스크립트릿</h3>
	<%
		int 	var1 = 1;
		boolean var2 = true;
		double	var3 = 3.14;
		String 	var4 = "hello";
			
		
		//출력
		out.print("<h4>var1 : "+var1+"</h4>");
		out.print("<h4>var2 : "+var2+"</h4>");
	
	%>
		
		<!-- 표현식으로 출력 -->
		<h4>var3 : <%= var3 %></h4>
		<h4>var4 : <%= var4 %></h4>

</body>
</html>