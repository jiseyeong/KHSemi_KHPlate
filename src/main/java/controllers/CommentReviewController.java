package controllers;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import commons.SecurityUtils;
import dao.CommentReviewDAO;
import dao.PhotoDAO;
import dto.CommentReviewDTO;
import dto.NaviDTO;
import dto.PhotoDTO;
import statics.Settings;

@WebServlet("*.commentReview")
public class CommentReviewController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf8");
		response.setContentType("text/html; charset=utf8");
		String cmd = request.getRequestURI();
		Gson g = new Gson();
		
		try {
			if(cmd.equals("/create.commentReview")) {
				int score = Integer.parseInt(request.getParameter("score"));
				String body = request.getParameter("body");
				body = SecurityUtils.XSSCheck(body);
				int storeID = Integer.parseInt(request.getParameter("storeID"));
				int userNo = Integer.parseInt(request.getParameter("userNo"));	
				int result = CommentReviewDAO.getInstance().insert(new CommentReviewDTO(0, body, score, storeID, userNo, null, 0));
				int currval = CommentReviewDAO.getInstance().getCurrval();
				
				response.sendRedirect("/view.store?storeID="+storeID);
			}else if(cmd.equals("/update.commentReview")) {		
				int score = Integer.parseInt(request.getParameter("modifyScore"));
				String body = request.getParameter("modifyBody");
				body = SecurityUtils.XSSCheck(body);
				int reviewID = Integer.parseInt(request.getParameter("reviewID"));	
				int storeID = Integer.parseInt(request.getParameter("storeID"));
				int result = CommentReviewDAO.getInstance().update(reviewID, body, score);
				
				response.sendRedirect("/view.store?storeID="+storeID);
			}else if(cmd.equals("/delete.commentReview")) {
				int reviewID = Integer.parseInt(request.getParameter("reviewID"));
				int storeID = Integer.parseInt(request.getParameter("storeID"));
				
				String realPath = request.getServletContext().getRealPath("CommentReview");
				for(PhotoDTO i : PhotoDAO.getInstance().selectByCReviewID(reviewID)) {
					File realPathFile = new File(realPath+"/"+i.getOriName());
					realPathFile.delete();
				}
				
				int result1 = PhotoDAO.getInstance().deleteByCReviewID(reviewID);
				int result2 = CommentReviewDAO.getInstance().delete(reviewID);
				
				response.sendRedirect("/view.store?storeID="+storeID);
				
				// 마이 페이지에 사용할 내가 쓴 댓글 리스트 출력
			}else if (cmd.equals("/selectBymypage.commentReview")) {
				
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
				
				String writeMyCommentList = CommentReviewDAO.getInstance().selectwriteCommentListToJSP(userno, start_Record_Row_Num, end_Record_Row_Num);
				String writeMyCommentNavi = CommentReviewDAO.getInstance().selectwriteCommentNaviToJSP(currentpage, userno);
				
				writeMyCommentList = g.toJson(writeMyCommentList);
				writeMyCommentNavi = g.toJson(writeMyCommentNavi);
				
				JsonObject resp = new JsonObject();
				resp.addProperty("writeMyCommentList", writeMyCommentList);
				resp.addProperty("writeMyCommentNavi", writeMyCommentNavi);
				
				response.getWriter().append(resp.toString());
			}else if(cmd.equals("/selectCurrentPage.commentReview")) {
				int storeID = Integer.parseInt(request.getParameter("storeID"));
				int currentPage = Integer.parseInt(request.getParameter("cpage"));
				int start = currentPage * Settings.COMMENTREVIEW_RECORD_COUNT_PER_PAGE - (Settings.COMMENTREVIEW_NAVI_COUNT_PER_PAGE-1);
				int end = currentPage * Settings.COMMENTREVIEW_RECORD_COUNT_PER_PAGE;
				ArrayList<CommentReviewDTO> list = CommentReviewDAO.getInstance().selectBound(storeID, start, end);
				NaviDTO pageNavi = CommentReviewDAO.getInstance().getReviewNavi(currentPage);
				
				JsonObject jsonObject = new JsonObject();
				jsonObject.add("list", g.toJsonTree(list));
				jsonObject.add("navi", g.toJsonTree(pageNavi));
				
				response.getWriter().append(g.toJson(jsonObject));
			}
		}catch(Exception e) {
			e.printStackTrace();
			response.sendRedirect("/error.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
