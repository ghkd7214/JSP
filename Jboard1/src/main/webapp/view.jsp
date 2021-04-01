<%@page import="kr.co.jboard.bean.ArticleBean"%>
<%@page import="kr.co.jboard.dao.ArticleDao"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//전송데이터 수신
	String seq = request.getParameter("seq");
	
	//전송데이터 인코딩
	request.setCharacterEncoding("UTF-8");
	
	//데이터베이스 처리 - 조회수 업데이트
	ArticleDao dao = ArticleDao.getInstance();
	dao.updateArticleHit(seq);
	
	// 데이터베이스 처리 - 게시물 가져오기
	ArticleBean ab = dao.selectArticle(seq);
	
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>글보기</title>
    <link rel="stylesheet" href="/Jboard1/css/style.css"/>
</head>
<body>
    <div id="wrapper">
        <section id="board" class="view">
            <h3>글보기</h3>
            <table>
                <tr>
                    <td>제목</td>
                    <td><input type="text" name="title" value="<%= ab.getTitle() %>" readonly/></td>
                </tr>
                <% if(ab.getFile() > 0){ %>
                <tr>
                    <td>첨부파일</td>
                    <td>
                        <a href="#">2020년 상반기 매출자료.xls</a>
                        <span>7회 다운로드</span>
                    </td>
                </tr>
                <% } %>
                <tr>
                    <td>내용</td>
                    <td>
                        <textarea name="content" readonly><%= ab.getContent() %></textarea>
                    </td>
                </tr>
            </table>
            <div>
                <a href="/Jboard1/delete.jsp" class="btnDelete">삭제</a>
                <a href="/Jboard1/modify.html" class="btnModify">수정</a>
                <a href="/Jboard1/list.html" class="btnList">목록</a>
            </div>  
            
            <!-- 댓글리스트 -->
            <section class="commentList">
                <h3>댓글목록</h3>
                <article class="comment">
                    <span>
                        <span>길동이</span>
                        <span>20-05-13</span>
                    </span>
                    <textarea name="comment" readonly>댓글 샘플입니다.</textarea>
                    <div>
                        <a href="#">삭제</a>
                        <a href="#">수정</a>
                    </div>
                </article>
                <p class="empty">
                    등록된 댓글이 없습니다.
                </p>
            </section>

            <!-- 댓글입력폼 -->
            <section class="commentForm">
                <h3>댓글쓰기</h3>
                <form action="/Jboard1/Proc/comment.jsp" method="post">
                	<input type="hidden" name="seq" value="<%=ab.getSeq() %>" />
                    <textarea name="comment" required></textarea>
                    <div>
                        <a href="#" class="btnCancel">취소</a>
                        <input type="submit" class="btnWrite" value="작성완료"/>
                    </div>
                </form>
            </section>

        </section>
    </div>    
</body>
</html>