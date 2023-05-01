package controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.FullReviewDAO;

@WebServlet("*.fullreview")
public class FullReviewController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String cmd = request.getRequestURI();
		FullReviewDAO frdao = FullReviewDAO.getInstance();
		
		try {
		if(cmd.equals("/write.fullreview")) {
			System.out.println(cmd);
			
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
			
			int reviewId = Integer.parseInt(request.getParameter("reviewId"));
			String title = request.getParameter("title");
			String reviewbody = request.getParameter("reviewbody");
			int score = Integer.parseInt(request.getParameter("score"));
			
			int result = frdao.update(title,reviewbody,score,reviewId);
			
			if (result>0) {
				System.out.println("진심리뷰 수정완료");
				response.sendRedirect("/FullReview/FullReviewList.jsp");
			}else {
				response.sendRedirect("error.jsp");
			}
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
