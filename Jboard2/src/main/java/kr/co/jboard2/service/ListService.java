package kr.co.jboard2.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.jboard2.dao.ArticleDao;
import kr.co.jboard2.vo.ArticleVo;

public class ListService implements CommonService {

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {
		
		String pg = req.getParameter("pg");

		int currentPage = getCurrentPage(pg);
		int start = getLimitStart(currentPage);

		ArticleDao dao = ArticleDao.getInstance();

		int total = dao.selectCountArticle();
		int listStartNum = getPageStartNum(total, start);

		int lastPageNum = getLastPageNum(total);
		int groups[] = getPageGroup(currentPage, lastPageNum);

		List<ArticleVo> articles = dao.selectArticles(start);

		// Controller, Service, View에서 공통으로 공유하는 request객체를 이용한 데이터 참조
		req.setAttribute("articles", articles);
		req.setAttribute("listStartNum", listStartNum);
		req.setAttribute("lastPageNum", lastPageNum);
		req.setAttribute("groups", groups);
		
		return "/list.jsp";
	}
	
	// 게시판 리스트 페이지 번호 처리관련 메서드
		public int getPageStartNum(int total, int start) {
			return total - start;
		}
		// 게시판 리스트 페이지 처리관련 메서드
		public int[] getPageGroup(int currentPage, int lastPageNum) {

			int groupCurrent = (int) Math.ceil(currentPage / 10.0);
			int groupStart   = (groupCurrent - 1) * 10 + 1;
			int groupEnd     = groupCurrent * 10;

			if(groupEnd > lastPageNum) {
				groupEnd = lastPageNum;
			}

			int[] groups = {groupStart, groupEnd};

			return groups;
		}
		// 게시판 리스트 페이지 처리관련 메서드
		public int getCurrentPage(String pg) {
			int currentPage = 1;

			if(pg != null) {
				currentPage = Integer.parseInt(pg);
			}
			return currentPage;
		}
		// 게시판 리스트 페이지 처리관련 메서드
		public int getLimitStart(int currentPage) {
			return (currentPage - 1) * 10;
		}
		// 게시판 리스트 페이지 처리관련 메서드
		public int getLastPageNum(int total) {

			int lastPageNum = 0;

			if(total % 10 == 0) {
				lastPageNum = total / 10;
			}else {
				lastPageNum = total / 10 + 1;
			}

			return lastPageNum;
		}

}