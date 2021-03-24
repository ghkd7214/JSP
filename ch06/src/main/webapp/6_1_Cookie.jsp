<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>6_1_Cookie</title>
</head>
<body>
	<!-- 
		날짜 : 2021/03/24
		이름 : 이지황
		내용 : JSP Cookie 실습하기
		
		Cookie 
		 - 클라이언트와 서버간의 식별을 위해 사용하는 조각파일
		 - 서버에서 쿠키를 생성하고 클라이언트으로 전달
		 - 클라이언트로 전달된 쿠키를 보관, 해당 서버로 가시 요청할때 보관된 쿠키를 전송
	
	 -->
	<h3>1.쿠키</h3>
	<% 
		Cookie c1 = new Cookie("name","홍길동");
		Cookie c2 = new Cookie("uid","hong");
		
		c1.setMaxAge(60 * 3);
		c2.setMaxAge(60 * 3);
		
		//응답 객체에 실어서 클라이언트로 전송
		
		response.addCookie(c1);
		response.addCookie(c2);
		
	%>

	<h4>쿠키 생성후 클라이언트 전송완료</h4>

	<a href="./6_2_CookieReceive.jsp">클라이언트 쿠키 확인</a>
	
</body>
</html>