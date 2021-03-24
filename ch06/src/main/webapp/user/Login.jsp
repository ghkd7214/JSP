<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//로그인 처리 실패시 
	String result = request.getParameter("result");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<script>
	var result = "<%= result %>";
	
	if(result == "fail"){
		alert("로그인에 실패했습니다.\n다시 확인해주세요.");
	
	}else if(result == "logout"){
		alert("로그아웃 하셨습니다.")
	}


</script>

</head>
<body>

	<h4>로그인</h4>
	<form action="./LoginProc.jsp" method="post">
		<table border="1">
			<tr>
				<td>아이디</td>
				<td><input type="text" name="uid"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="text" name="pass"></td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<input type="submit" value="로그인">
				</td>
			</tr>
		</table>
	</form>
	



</body>
</html>