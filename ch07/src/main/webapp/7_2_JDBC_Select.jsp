<%@page import="java.util.ArrayList"%>
<%@page import="sub1.UserBean"%>
<%@page import="java.sql.Array"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Driver"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//데이터베이스 처리 6단계
	String host ="jdbc:mysql://192.168.10.114:3306/ljh";
	String user ="ljh";
	String pass ="1234";
	
	//1단계 - JBDC 드라이버 로드
	Class.forName("com.mysql.jdbc.Driver"); //mysql connector j 필요(mysql 홈페이지에 있음)
	
	//2단계 - 데이터베이스 접속
	Connection conn = DriverManager.getConnection(host, user, pass);
	
	//3단계 - SQL 실행 객체 생성
	Statement stmt = conn.createStatement();
	
	//4단계 - SQL 실행
	String sql = "SELECT * FROM `USER1`;";
	ResultSet rs = stmt.executeQuery(sql);
	
	//5단계 - 실행결과 처리(SELECT일 경우)
	List<UserBean> ubList = new ArrayList<>();
	
	while(rs.next()){
		UserBean ub = new UserBean();
		
		ub.setUid(rs.getString(1));
		ub.setName(rs.getString(2));
		ub.setHp(rs.getString(3));
		ub.setAge(rs.getInt(4));
		
		ubList.add(ub);
		
	}
	
	//6단계 - 데이터베이스 종료
	rs.close();
	stmt.close();
	conn.close();
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>7_2_JDBC_Select</title>
</head>
<body>
	<h2>2.JDBC Select 실습</h2>
	<a href="./7_1_JDBC_Insert.jsp">등록하기</a>
	<table border="1">
		<tr>
			<td>아이디</td>
			<td>이름</td>
			<td>휴대폰</td>
			<td>나이</td>
			<td>수정/삭제</td>
		</tr>
		<% for(UserBean ub :ubList){ %>
		<tr>
			<td><%= ub.getUid() %></td>
			<td><%= ub.getName() %></td>
			<td><%= ub.getHp() %></td>
			<td><%= ub.getAge() %></td>
			<td>
				<a href="#">수정</a>
				<a href="#">삭제</a>
			</td>
		</tr>
		<% } %>
	</table>

</body>
</html>