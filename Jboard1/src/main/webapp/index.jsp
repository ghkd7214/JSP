<%@page import="kr.co.jboard.bean.UserBean"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//세션 사용자 정보 가져오기
	UserBean user = (UserBean) session.getAttribute("suser");


	if(user != null){
		
		//로그인 상태이면
		pageContext.forward("./user/list.jsp");
		
	}else{
		
		//로그인 상태가 아니면
		pageContext.forward("./user/Proc/login.jsp");	
		
	}
	

%>