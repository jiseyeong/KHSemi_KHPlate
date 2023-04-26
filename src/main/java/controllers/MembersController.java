package controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MembersDAO;
import dto.MembersDTO;
import sha.EncryptionUtils;


@WebServlet("*.Members")
public class MembersController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf8"); 
		String cmd = request.getRequestURI();

		try {
			
			if(cmd.equals("/join.members")) { //회원가입

			}else if(cmd.equals("/update.members")) { //회원수정

				String pw = request.getParameter("pw");
				String pw2 = EncryptionUtils.sha512(pw); //비밀번호 암호화
				String nickname = request.getParameter("nickname");
				String phone = request.getParameter("phone");
				String email = request.getParameter("email");
				int zipCode = Integer.parseInt(request.getParameter("zipCode"));
				String address1 = request.getParameter("address1");
				String address2 = request.getParameter("address2");
				String selfcomment = request.getParameter("selfcomment");
				String favoriteFood = request.getParameter("favoriteFood");
				
				MembersDAO dao = MembersDAO.getInstance();
				int result = dao.update(new MembersDTO(pw2,nickname,phone,email,zipCode,address1,address2,selfcomment,favoriteFood));
				
				response.sendRedirect("/mypage.members");
				
			}else if(cmd.equals("/memberout.members")) { //회원탈퇴
				
				

			}else if(cmd.equals("/mypage.members")) { //마이페이지 정보 출력

				String userId = (String)request.getSession().getAttribute("loginID");
				MembersDTO my = MembersDAO.getInstance().selectById(userId);

				request.setAttribute("my",my);
				request.getRequestDispatcher("/mypage/mypage.jsp").forward(request, response);
				
			}else if(cmd.equals("/login.members")) { //로그인

			}else if(cmd.equals("/logout.members")) { //로그아웃

			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
