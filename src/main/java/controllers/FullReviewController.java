package controllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import dao.FullReviewDAO;
import dao.FullReviewReplyDAO;
import dto.FullReviewDTO;
import dto.FullReviewUserDTO;
import dto.ReplyWithUserIdDTO;
import statics.Settings;

@WebServlet("*.fullreview")
public class FullReviewController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String cmd = request.getRequestURI();
		System.out.println(cmd);
		FullReviewDAO frdao = FullReviewDAO.getInstance();

		try {

			if(cmd.equals("/write.fullreview")) {

				String title = request.getParameter("title");
				String reviewbody = request.getParameter("reviewBody");
				int score = Integer.parseInt(request.getParameter("score"));
				int storeId = Integer.parseInt(request.getParameter("storeId"));
				int userNo= Integer.parseInt(request.getParameter("userNo"));

				int result = frdao.writeFullReview(title,reviewbody,score,storeId,userNo);

				if (result>0) {
					System.out.println("진심리뷰 작성완료");
					response.sendRedirect("/select.fullreview");
				}else {
					response.sendRedirect("error.jsp");
				}

			}else if (cmd.equals("/update.fullreview")){

				String title = request.getParameter("title");
				String reviewbody = request.getParameter("reviewbody");
				int score = Integer.parseInt(request.getParameter("score"));
				int storeId = Integer.parseInt(request.getParameter("storeId"));
				int reviewid= Integer.parseInt(request.getParameter("reviewid"));

				int result = frdao.update(title, reviewbody, score, storeId, reviewid);

				if (result>0) {
					System.out.println("진심리뷰 수정완료");
					response.sendRedirect("content.fullreview?reviewid="+reviewid);
				}else {
					response.sendRedirect("error.jsp");
				}

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

				List<FullReviewUserDTO> fullReviewList = frdao.selectFullReview(searchUserno, searchFullReviewTitle,start_Record_Row_Num,end_Record_Row_Num);
				String fullReviewNavi = frdao.getFullReviewNavi(currentpage, searchUserno, searchFullReviewTitle);

				System.out.println("리스트 사이즈 : "+fullReviewList.size());

				request.setAttribute("FullReviewList", fullReviewList);
				request.setAttribute("FullReviewNavi", fullReviewNavi);

				request.getRequestDispatcher("/FullReview/FullReviewList.jsp").forward(request, response);



				// 마이페이지에 표시할 fullReviewList 출력
			}else if (cmd.equals("/selectBymypage.fullreview")) {

				int userno = (int) request.getSession().getAttribute("userno");
				int currentpage = 1;

				if(request.getParameter("cpage")!=null) {
					currentpage = Integer.parseInt(request.getParameter("cpage"));
				}

				System.out.println("현재 페이지 : "+currentpage);

				int end_Record_Row_Num = currentpage * Settings.MYPAGE_LIST_RECORD_COUNT_PER_PAGE;
				int start_Record_Row_Num = end_Record_Row_Num - (Settings.MYPAGE_LIST_RECORD_COUNT_PER_PAGE-1);

				System.out.println("시작 번호 : "+start_Record_Row_Num);
				System.out.println("끝 번호 : "+end_Record_Row_Num);

				List<FullReviewUserDTO> fullReviewListBeforeChange = frdao.selectFullReview(userno, "", start_Record_Row_Num, end_Record_Row_Num);
				String writeFullReviewList = frdao.selectFullReviewListToJSP(fullReviewListBeforeChange);
				String writeFullReviewNavi = frdao.getFullReviewNaviToJSP(currentpage, userno, "");

				System.out.println("리스트 사이즈 : "+fullReviewListBeforeChange.size());

				Gson g = new Gson();

				writeFullReviewList = g.toJson(writeFullReviewList);
				writeFullReviewNavi = g.toJson(writeFullReviewNavi);

				JsonObject resp = new JsonObject();
				resp.addProperty("writeFullReviewList", writeFullReviewList);
				resp.addProperty("writeFullReviewNavi", writeFullReviewNavi);

				response.getWriter().append(resp.toString());



			}else if(cmd.equals("/content.fullreview")) {

				int reviewid = Integer.parseInt(request.getParameter("reviewid"));
				System.out.println("선택한 리뷰는 "+reviewid);

				FullReviewDTO contents = frdao.contentByReviewId(reviewid);

				List<ReplyWithUserIdDTO> replyList = FullReviewReplyDAO.getInstance().listReplyByreviewid(reviewid);

				request.setAttribute("contents", contents);
				request.setAttribute("replyList", replyList);

				request.getRequestDispatcher("/FullReview/FullReviewContent.jsp").forward(request, response);

				
				// 마이페이지에 표시할 내가 스크랩한 리스트 출력
			} else if (cmd.equals("/selectScrapListBymypage.fullreview")) {

				int userno = (int) request.getSession().getAttribute("userno");
				int currentpage = 1;

				if(request.getParameter("cpage")!=null) {
					currentpage = Integer.parseInt(request.getParameter("cpage"));
				}

				System.out.println("현재 페이지 : "+currentpage);

				int end_Record_Row_Num = currentpage * Settings.MYPAGE_LIST_RECORD_COUNT_PER_PAGE;
				int start_Record_Row_Num = end_Record_Row_Num - (Settings.MYPAGE_LIST_RECORD_COUNT_PER_PAGE-1);

				System.out.println("시작 번호 : "+start_Record_Row_Num);
				System.out.println("끝 번호 : "+end_Record_Row_Num);

				String myFullReviewScrapList = frdao.selectMyFullReviewScrapList(userno, start_Record_Row_Num, end_Record_Row_Num);
				String myFullReviewScrapNavi = frdao.selectMyFullReviewScrapNaviToJSP(currentpage, userno);

				Gson g = new Gson();
				
				myFullReviewScrapList = g.toJson(myFullReviewScrapList);
				myFullReviewScrapNavi = g.toJson(myFullReviewScrapNavi);

				JsonObject resp = new JsonObject();
				resp.addProperty("myFullReviewScrapList", myFullReviewScrapList);
				resp.addProperty("myFullReviewScrapNavi", myFullReviewScrapNavi);

				response.getWriter().append(resp.toString());

			}

		}catch(Exception e) {
			e.printStackTrace();
			//			response.sendRedirect("/error.jsp");
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
