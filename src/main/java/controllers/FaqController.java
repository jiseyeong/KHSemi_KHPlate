package controllers;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import commons.SecurityUtils;
import dao.FaqDAO;
import dto.FaqDTO;

@WebServlet("*.faq")
public class FaqController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf8");
		String cmd = request.getRequestURI();
		
		try {
			if(cmd.equals("/register.faq")) {
				String title = request.getParameter("title");
				title = SecurityUtils.XSSCheck(title);
				String body = request.getParameter("body");
				body = SecurityUtils.XSSCheck(body);
				
				int result = FaqDAO.getInstance().insert(new FaqDTO(0, title, body));
				response.sendRedirect("/adminPage/FAQRegister.jsp");
			}else if(cmd.equals("/view.faq")) {
				ArrayList<FaqDTO> list = FaqDAO.getInstance().selectAll();
				
				request.setAttribute("list", list);
				request.getRequestDispatcher("/adminPage/FAQView.jsp").forward(request, response);
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
