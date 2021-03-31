<%@page import="kr.co.jboard.config.DBConfig"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="application/json;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//전송데이터 인코딩
	request.setCharacterEncoding("UTF-8");

	//전송 데이터 수신
	String email = request.getParameter("email");

	//1~2단계
	Connection conn = DBConfig.getInstance().getConnection();
	
	// 3단계 - SQL 실행객체 생성
	Statement stmt = conn.createStatement();
	
	// 4단계 - SQL 실행
	String sql = "SELECT COUNT(`email`) FROM `JBOARD_USER` WHERE `email`='"+email+"';";
	ResultSet rs = stmt.executeQuery(sql);  		//결과값이 1이면 중복임
	
	//5단계 - 실행결과 처리(SELECT일 경우)
	int count = 0;
	
	if(rs.next()){
		count =rs.getInt(1); 			
		
	}
	
	//6단계
	rs.close();
	stmt.close();
	conn.close();

	//결과값 리턴
	JsonObject json = new JsonObject();
	json.addProperty("result", count);  //데이터를 제이슨데이터로 만듬 result : 1또는 0
										
	out.print(json);					//만들어진 제이슨데이터를 checkUser.js로 출력

%>