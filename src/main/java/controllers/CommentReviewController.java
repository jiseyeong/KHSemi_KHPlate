package controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CommentReviewDAO;
import dto.CommentReviewDTO;

@WebServlet("*.commentReview")
public class CommentReviewController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf8");
		String cmd = request.getRequestURI();
		
		try {
			if(cmd.equals("/create.commentReview")) {
				int score = Integer.parseInt(request.getParameter("score"));
				String body = request.getParameter("body");
				int storeID = Integer.parseInt(request.getParameter("storeID"));
				int userNo = 0;			
				int result = CommentReviewDAO.getInstance().insert(new CommentReviewDTO(0, body, score, storeID, userNo, null, 0));
				
				response.sendRedirect("/view.store?storeID="+storeID);
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
