<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<% 
	//전송데이터 인코딩
	request.setCharacterEncoding("UTF-8");
	

	//전송데이터 수신
	String uid = request.getParameter("uid");
	String pass = request.getParameter("pass");

	//데이터베이스 로직 생략
	
	if(uid.equals("abcd") && pass.equals("1234")){
		//회원 맞음
		session.setAttribute("uid", uid);
		session.setAttribute("pass", pass);
		
		response.sendRedirect("./LoginSuccess.jsp");
		
	}else{
		//회원 아님
		response.sendRedirect("./Login.jsp?result=fail");
	}
	
	
	
%>