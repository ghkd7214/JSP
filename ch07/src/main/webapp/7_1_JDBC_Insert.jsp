<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>7_1_JDBC_Insert</title>
</head>
<body>
	<!-- 
		날짜 : 2021/03/25
		이름 : 이지황
		내용 : JSP JDBC Insert 실습
	
	 -->
	<h3>1.JSP JDBC Insert 실습</h3>
	<a href="./7_2_JDBC_Select.jsp">목록보기</a>
	<form action="./proc/insertProc.jsp" method="get">
		<table border="1">
			<tr>
				<td>아이디</td>
				<td><input type="text" name="uid"/></td>
			</tr>		
			<tr>
				<td>이름</td>
				<td><input type="text" name="name"/></td>
			</tr>		
			<tr>
				<td>휴대전화</td>
				<td><input type="text" name="hp"/></td>
			</tr>		
			<tr>
				<td>나이</td>
				<td><input type="text" name="age"/></td>
			</tr>		
			<tr>
				<td colspan="2" align="right">
					<input type="submit" value="등록하기"/>
				</td>
			</tr>		
		</table>	
	</form>
</body>
</html>