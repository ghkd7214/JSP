<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//UID 중복 처리 
	int over = 1;

	//전송데이터 인코딩
	request.setCharacterEncoding("UTF-8");

	//전송 데이터 수신
	String uid  = request.getParameter("uid");
	String name = request.getParameter("name");
	String hp   = request.getParameter("hp");
	String pos  = request.getParameter("pos");
	String dep  = request.getParameter("dep");
	
	//데이터베이스 처리 1 ~ 6단계
	String host ="jdbc:mysql://192.168.10.114:3306/ljh";
	String user ="ljh";
	String pass ="1234";
	
	//1단계 - JDBC 드라이버 로드
	Class.forName("com.mysql.jdbc.Driver"); 
	
	//2단계 - 데이터베이스 접속
	Connection conn = DriverManager.getConnection(host,user,pass);
	
	//3단계 - SQL 실행 객체 생성
	Statement stmt = conn.createStatement();
	
	//4단계 - SQL 실행
	String sql  = "INSERT INTO `MEMBER` (uid, name, hp, pos, dep) VALUES(";
		   sql += "'"+uid+"', '"+name+"', '"+hp+"', '"+pos+"', "+dep+");";
	
	try{
		stmt.executeUpdate(sql);
	}catch(SQLException e){
		over = 0;
	}
	//5단계 - 실행결과 처리(SELECT일 경우)
		
	//6단계 - 데이터베이스 종료
	stmt.close();
	conn.close();
	
	// 리다이렉트 
	if (over == 1 ){
		response.sendRedirect("../list.jsp");
	}else{
		response.sendRedirect("../register.jsp?over=0");
	}
%>