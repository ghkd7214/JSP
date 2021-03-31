<%@page import="kr.co.jboard.dao.ArticleDao"%>
<%@page import="java.sql.Statement"%>
<%@page import="kr.co.jboard.bean.ArticleBean"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.co.jboard.config.DBConfig"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.co.jboard.bean.UserBean"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//세션 사용자 정보 가져오기
	UserBean user = (UserBean) session.getAttribute("suser");
	
	if(user == null){
		//로그인안하고 게시판 목록을 요청했을경우
		response.sendRedirect("/Jboard1/user/Proc/login.jsp?result=2");
		return;	//프로그램 종료
	}
	
	//전송데이터 인코딩
	request.setCharacterEncoding("UTF-8");
	
	//페이지 관련 변수
	
	ArticleDao dao = ArticleDao.getInstance();
	
	int total = dao.selectCountArticle();
	int lastPageNum = dao.getLastPageNum(total);
	int start = 0;
	
	//데이터베이스 처리
	List<ArticleBean> articles = ArticleDao.getInstance().selectArticles(start);
	
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>글목록</title>
    <link rel="stylesheet" href="/Jboard1/css/style.css">    
</head>
<body>
    <div id="wrapper">
        <section id="board" class="list">
            <h3>글목록</h3>
            <article>
                <p>
                    <%= user.getNick() %>님 반갑습니다.
                    <a href="/Jboard1/user/Proc/logout.jsp" class="logout">[로그아웃]</a>
                </p>
                <table>
                    <tr>
                        <th>번호</th>
                        <th>제목</th>
                        <th>글쓴이</th>
                        <th>날짜</th>
                        <th>조회</th>
                    </tr>
                    <% for(ArticleBean ab : articles){ %>
                    <tr>
                        <td><%= ab.getSeq() %></td>
                        <td><a href="/Jboard1/view.jsp"><%=ab.getTitle() %></a>&nbsp;[<%=ab.getComment() %>]</td>
                        <td><%= ab.getNick() %></td>
                        <td><%= ab.getRdate().substring(2,10) %></td>
                        <td><%= ab.getHit() %></td>
                    </tr>
                    <% } %>
                </table>
            </article>

            <!-- 페이지 네비게이션 -->
            <div class="paging">
                <a href="#" class="prev">이전</a>
                <% for(int i=1;i<lastPageNum ; i++){ %>
                	<a href="#" class="num"><%= i %></a>                
                <% } %>               
                <a href="#" class="next">다음</a>
            </div>

            <!-- 글쓰기 버튼 -->
            <a href="/Jboard1/write.jsp" class="btnWrite">글쓰기</a>

        </section>
    </div>    
</body>
</html>