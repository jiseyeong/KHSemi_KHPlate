package controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.FullReviewReplyDAO;

@WebServlet("*.fullreviewreply")
public class FullReviewReplyController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String cmd = request.getRequestURI();
		FullReviewReplyDAO frrdao = FullReviewReplyDAO.getInstance();

		try {
			if (cmd.equals("/write.fullreviewreply")) {

				String body = request.getParameter("body");
				int userno = Integer.parseInt(request.getParameter("userno"));
				int reviewid = Integer.parseInt(request.getParameter("reviewid"));

				frrdao.addReply(body, userno, reviewid);

				response.sendRedirect("/select.fullreview");

			} else if (cmd.equals("delete.fullreviewreply")) {

				int reviewid = Integer.parseInt(request.getParameter("reviewid"));

				int result = frrdao.deleteReply(reviewid);

				if (result == 0) {
					System.out.println(reviewid + "댓글 삭제 실패");
				} else {
					System.out.println(reviewid + "댓글 삭제 성공");
				}

				response.sendRedirect("/select.fullreview");

			} else if (cmd.equals("update.fullreviewreply")) {
				String body = request.getParameter("body");
				int reviewid = Integer.parseInt(request.getParameter("reviewid"));

				int result = frrdao.updateReply(body, reviewid);

				if (result == 0) {
					System.out.println(reviewid + "댓글 수정 실패");
				} else {
					System.out.println(reviewid + "댓글 수정 성공");
				}

			}

		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("error.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
