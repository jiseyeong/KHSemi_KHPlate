package controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import commons.SecurityUtils;
import dao.MembersDAO;
import dto.MembersDTO;


@WebServlet("*.members")
public class MembersController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf8"); 
		String cmd = request.getRequestURI();
		System.out.println(cmd);

		try {
			MembersDAO dao = MembersDAO.getInstance();
			if(cmd.equals("/join.members")) { //ȸ������
				System.out.println("회원가입 시도 확인");
				String id = request.getParameter("id");
				String pw = request.getParameter("pw");
				String sha512pw = SecurityUtils.sha512(pw);
				String name = request.getParameter("name");
				String email = request.getParameter("email");
				String classes = request.getParameter("classes");

				System.out.println(pw);

				int result = dao.join(id,pw,name,email,classes);

				if(result>0) {
					System.out.println(id +" 회원가입 완료");
					response.sendRedirect("/main.jsp");
				}else {
					System.out.println(id +" 회원가입 실패");
				}
			}else if(cmd.equals("/update.members")) { //ȸ������

			}if(cmd.equals("/join.members")) { 

			}else if(cmd.equals("/update.members")) {

				String pw = request.getParameter("pw");
				String pw2 = SecurityUtils.sha512(pw); 
				String nickname = request.getParameter("nickname");
				String phone = request.getParameter("phone");
				String email = request.getParameter("email");
				String selfcomment = request.getParameter("selfcomment");
				String favoriteFood = request.getParameter("favoriteFood");


				int result = dao.update(new MembersDTO(pw2,nickname,phone,email,selfcomment,favoriteFood));

				response.sendRedirect("/mypage.members");

			}else if(cmd.equals("/memberout.members")) { 

				String userId = request.getParameter("userId");
				String userPw = SecurityUtils.sha512(request.getParameter("loginPw"));
				
				int result = dao.delete(userId, userPw);
				
				response.sendRedirect("/page/main.jsp");

			}else if(cmd.equals("/mypage.members")) { 

				String userId = (String)request.getSession().getAttribute("loginID");
				MembersDTO my = MembersDAO.getInstance().selectById(userId);

				request.setAttribute("my",my);
				request.getRequestDispatcher("/mypage/mypage.jsp").forward(request, response);

			}else if(cmd.equals("/login.members")) { 

			}else if(cmd.equals("/logout.members")) {

			}else if(cmd.equals("/IdCheck.members")) {
				String id = request.getParameter("id");
				System.out.println("입력 id = " + id);

				boolean result = dao.isIdExist(id);

				request.setAttribute("result", result);
				request.getRequestDispatcher("/joinform/isIdExist.jsp").forward(request, response);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
