<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//uid 중복 방지
	String over = "1";  //1이면 정상

	//전송데이터 인코딩
	request.setCharacterEncoding("UTF-8");

	// 수정할 전송 데이터 수신
	String uid  = request.getParameter("uid");
	String name = request.getParameter("name");
	String hp   = request.getParameter("hp");
	over = request.getParameter("over");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>직원등록</title>
<script>
	var result = "<%= over %>";
	
	if(result == "0"){
		alert("uid는 중복 될 수 없습니다!");
	}
</script>
</head>
<body>
	<h3>직원등록</h3>
	
	<form action="./proc/regisetProc.jsp" method="post">
		<table border="1">
			<tr>
				<td>아이디</td>
				<td><input type="text" name="uid" placeholder="아이디 입력"/></td>			
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" placeholder="이름 입력"/></td>			
			</tr>
			<tr>
				<td>휴대폰</td>
				<td><input type="tel" name="hp" placeholder="휴대폰 입력"/></td>			
			</tr>
			<tr>
				<td>직급</td>
				<td>
					<select name="pos">
						<option>사원</option>
						<option>대리</option>
						<option>과장</option>
						<option>차장</option>
						<option>부장</option>
					</select>
				</td>			
			</tr>
			<tr>
				<td>부서</td>
				<td>
					<select name="dep">
						<option value="101">영업1부</option>
						<option value="102">영업2부</option>
						<option value="103">영업3부</option>
						<option value="104">영업4부</option>
						<option value="105">영업5부</option>
						<option value="106">영업지원부</option>
						<option value="107">인사부</option>
					</select>
				</td>			
			</tr>
			<tr>
				<td colspan="2" align="right">
					<input type="submit" value="직원등록"/>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>