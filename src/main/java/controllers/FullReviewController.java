package controllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.FullReviewDAO;
import dao.FullReviewReplyDAO;
import dao.MembersDAO;
import dto.FullReviewDTO;
import dto.MembersDTO;
import dto.ReplyWithUserIdDTO;
import statics.Settings;

@WebServlet("*.fullreview")
public class FullReviewController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String cmd = request.getRequestURI();
		FullReviewDAO frdao = FullReviewDAO.getInstance();

		try {

			if(cmd.equals("/write.fullreview")) {
				System.out.println(cmd);

				String writer = request.getParameter("writer");
				String title = request.getParameter("title");


				String reviewbody = request.getParameter("reviewbody");
				int score = Integer.parseInt(request.getParameter("score"));
				int storeId = Integer.parseInt(request.getParameter("storeId"));
				int userNo= Integer.parseInt(request.getParameter("userNo"));

				int result = frdao.writeFullReview(title,reviewbody,score,storeId,userNo);

				if (result>0) {
					System.out.println("진심리뷰 작성완료");
					response.sendRedirect("/FullReview/FullReviewList.jsp");
				}else {
					response.sendRedirect("error.jsp");
				}

			}else if (cmd.equals("/update.fullreview")){
				System.out.println(cmd);


				// 리뷰 글 목록 조회 + 검색 조회
			}else if (cmd.equals("/select.fullreview")) {
				int searchUserno = 0;
				String searchFullReviewTitle = "";
				
				if(request.getParameter("searchUserno")!=null) {
					searchUserno = Integer.parseInt(request.getParameter("searchUserno"));
				}
				if(request.getParameter("search")!=null) {
					searchFullReviewTitle = request.getParameter("search");
				}
				
				System.out.println("검색 유저 : "+searchUserno);
				System.out.println("검색 제목 : "+searchFullReviewTitle);
				
				int currentpage = 1;
				
				if(request.getParameter("cpage")!=null) {
					currentpage = Integer.parseInt(request.getParameter("cpage"));
				}
				
				System.out.println("현재 페이지 : "+currentpage);
				
				int end_Record_Row_Num = currentpage * Settings.SEARCH_FULLREVIEW_RECORD_COUNT_PER_PAGE;
				int start_Record_Row_Num = end_Record_Row_Num - (Settings.SEARCH_FULLREVIEW_RECORD_COUNT_PER_PAGE-1);
				
				System.out.println("시작 번호 : "+start_Record_Row_Num);
				System.out.println("끝 번호 : "+end_Record_Row_Num);
				
				List<FullReviewDTO> fullReviewList = frdao.selectFullReview(searchUserno, searchFullReviewTitle,start_Record_Row_Num,end_Record_Row_Num);
				String fullReviewNavi = frdao.getFullReviewNavi(searchUserno, searchUserno, searchFullReviewTitle, searchFullReviewTitle);
				List<MembersDTO> fullReviewUserList = MembersDAO.getInstance().selectfullReviewUserList(fullReviewList);
				
				System.out.println("리스트 사이즈 : "+fullReviewList.size());
				
				request.setAttribute("FullReviewList", fullReviewList);
				request.setAttribute("FullReviewNavi", fullReviewNavi);
				request.setAttribute("fullReviewUserList", fullReviewUserList);
				request.getRequestDispatcher("/FullReview/FullReviewList.jsp").forward(request, response);
			
			}else if(cmd.equals("/content.fullreview")) {
				
				int reviewid = Integer.parseInt(request.getParameter("reviewid"));
				
				FullReviewDTO contents = frdao.contentByReviewId(reviewid);
				
				List<ReplyWithUserIdDTO> replyList = FullReviewReplyDAO.getInstance().listReplyByreviewid(reviewid);
				
				
				request.setAttribute("contents", contents);
				request.setAttribute("replyList", replyList);
				
				
				request.getRequestDispatcher("/FullReview/content.jsp").forward(request, response);
				
				
			}


		}catch(Exception e) {
			e.printStackTrace();
			response.sendRedirect("error.jsp");
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
