<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%

	//전송 데이터 인코딩
	request.setCharacterEncoding("UTF-8");
	

	//전송데이터(parameter)수신
	String uid = request.getParameter("uid");
	String pass = request.getParameter("pass");
	
	out.print("<h4>로그인 출력</h4>");
	out.print("<p>");
	out.print("아이디 : "+uid+"<br>");
	out.print("비밀번호 : "+pass+"<br>");
	
	out.print("</p>");

%>