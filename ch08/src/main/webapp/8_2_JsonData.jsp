<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="ch08.MemberBean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page contentType="application/json;charset=UTF-8" pageEncoding="UTF-8"%>
<% 
	//데이터베이스 처리 1~6단계
	String host = "jdbc:mysql://192.168.10.114:3306/ljh";
	String user = "ljh";
	String pass = "1234";

	//1단계 - JDBC 드라이버 로드
	Class.forName("com.mysql.jdbc.Driver");
	
	//2단계 - 데이터베이스 접속
	Connection conn = DriverManager.getConnection(host,user,pass);
		
	//3단계 - SQL 실행 객체 생성
	Statement stmt = conn.createStatement();
		
	//4단계 - SQL 실행
	String sql = "SELECT * FROM `MEMBER`;";
	ResultSet rs = stmt.executeQuery(sql);
	
	//5단계 - 실행결과 처리(SELECT일 경우)
	List<MemberBean> members = new ArrayList<>();
	
	while(rs.next()){
		MemberBean mb = new MemberBean();
		
		mb.setUid(rs.getString(1));
		mb.setName(rs.getString(2));
		mb.setHp(rs.getString(3));
		mb.setPos(rs.getString(4));
		mb.setDep(rs.getInt(5));
		mb.setRdate(rs.getString(6));
		
		members.add(mb);
	}
	
	//6단계 - 데이터베이스 종료
	rs.close();
	stmt.close();
	conn.close();
	
	//JSON데이터 출력(Gson 라이브러리 사용)
	Gson gson = new Gson();
	String json = gson.toJson(members);
	
	//JSON 출력
	out.print(json);
	
%>