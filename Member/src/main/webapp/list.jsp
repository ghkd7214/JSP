<%@page import="java.util.ArrayList"%>
<%@page import="sub1.UserBean"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//전송데이터 인코딩
	request.setCharacterEncoding("UTF-8");

	//전송데이터 수신
	String uid = request.getParameter("uid");
	String name = request.getParameter("name");
	String hp = request.getParameter("hp");
	String Pos = request.getParameter("pos");
	String Dep = request.getParameter("dep");


	// 데이터베이스 처리 1 ~ 6단계
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
	String sql = "SELECT * FROM `MEMBER`;";
	ResultSet rs = stmt.executeQuery(sql);
		
	//5단계 - 실행결과 처리(SELECT일 경우)
	List<UserBean> ubList = new ArrayList<>();
		
	while(rs.next()){
		UserBean ub = new UserBean();
		
		ub.setUid(rs.getString(1));
		ub.setName(rs.getString(2));
		ub.setHp(rs.getString(3));
		ub.setPos(rs.getString(4));
		ub.setDep(rs.getString(5));
		
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
	<title>직원목록</title>
</head>
<body>
	<h3>직원목록</h3>
	<a href="./register.jsp">등록하기</a>
	<table border="1">
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>휴대폰</th>
			<th>직급</th>
			<th>부서</th>
			<th>관리</th>
		</tr>
		<% for(UserBean ub :ubList){ %>
		<tr>
			<td><%= ub.getUid() %></td>
			<td><%= ub.getName() %></td>
			<td><%= ub.getHp() %></td>
			<td><%= ub.getPos() %></td>
			<td><%= ub.getDep() %></td>
			<td>
				<a href="./modify.jsp?uid=<%= ub.getUid() %>&name=<%= ub.getName() %>&hp=<%= ub.getHp() %>">수정</a>
				<a href="./proc/deleteProc.jsp?uid=<%= ub.getUid() %>">삭제</a>
			</td>
		</tr>
		<% } %>
	</table>
</body>
</html>