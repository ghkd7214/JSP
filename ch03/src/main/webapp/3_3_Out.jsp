<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 
		날짜 : 2021/03/24
		이름 : 이지황
		내용 : JSP out 내장객체 실습하기
		
		out 내장객체
		 - JSP 출력객체
		 - response 응답 전송을 위해 HTML 및 데이터 출력
	
	 -->



	<h3>3.JSP out객체</h3>
	<%
		System.out.print("hello");
	
		out.print("<ul>");
		out.print("<il>서울</li>");
		out.print("<il>대전</li>");
		out.print("<il>대구</li>");
		out.print("<il>부산</li>");
		out.print("<il>광주</li>");
		out.print("</ul>");
		
		
		
		
		
	%>

</body>
</html>