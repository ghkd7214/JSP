<%@page import="kr.co.jboard.bean.UserBean"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.co.jboard.config.DBConfig"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//전송데이터 인코딩
	request.setCharacterEncoding("UTF-8");
	
	//전송데이터 수신
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String regip = request.getRemoteAddr();
	
	
	//세션 사용자 정보 가져오기
	UserBean user = (UserBean) session.getAttribute("suser");
	
	//1~2단계
	Connection conn = DBConfig.getInstance().getConnection();
	
	//3단계
	String sql  = "INSERT INTO `JBOARD_ARTICLE` SET ";
		   sql += "`title`=?,";
		   sql += "`content`=?,";
		   sql += "`uid`=?,";
		   sql += "`regip`=?,";
		   sql += "`rdate`=NOW();";
	
	PreparedStatement psmt =conn.prepareStatement(sql); 
	psmt.setString(1, title);
	psmt.setString(2, content);
	psmt.setString(3, user.getUid());
	psmt.setString(4, regip);
	
	//4단계
	psmt.executeUpdate();
	//5단계
	//셀랙트아니라서 생략됨
	
	//6단계
	psmt.close();
	conn.close();

	//리다이렉트
	response.sendRedirect("/Jboard1/list.jsp");
	
%>

