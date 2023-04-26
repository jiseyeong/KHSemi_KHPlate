package controllers;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.ConsultDAO;
import dao.MembersDAO;
import dto.ConsultDTO;

@WebServlet("*.consult")
public class ConsultController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf8");
		String cmd = request.getRequestURI();
		
		try {
			if(cmd.equals("/register.consult")) {
				String realPath = request.getServletContext().getRealPath("consult");
				int maxSize = 1024 * 1024 * 10; //10Mb
				System.out.println(realPath);
				File realPathFile = new File(realPath);
				if(!realPathFile.exists()) {
					realPathFile.mkdir();
				}
				MultipartRequest multi = new MultipartRequest(request, realPath, maxSize, "utf8", new DefaultFileRenamePolicy());
				
				String category = multi.getParameter("category");
				String title = multi.getParameter("title");
				Integer userNo = Integer.parseInt(multi.getParameter("writer"));
				String body = multi.getParameter("body");
				
				int result = ConsultDAO.getInstance().insert(new ConsultDTO(0, title, body, userNo, null, category));
				
				Enumeration<String> names = multi.getFileNames();
				while(names.hasMoreElements()) {
					String fileName = names.nextElement();
					if(multi.getFile(fileName) != null){
						String oriName = multi.getOriginalFileName(fileName);
						String sysName = multi.getFilesystemName(fileName);
						//imgsDAO ~ (new imgsDTO()) 추가해줘야 함.
					}
				}
				
				response.sendRedirect("/list.consult");
			}else if(cmd.equals("/list.consult")) {
				ArrayList<ConsultDTO> list = ConsultDAO.getInstance().selectAll();
				ArrayList<String> writerList = new ArrayList<>();
				for(ConsultDTO i : list) {
					writerList.add(MembersDAO.getInstance().getIDByNo(i.getUserNO()));
				}
				request.setAttribute("list", list);
				request.setAttribute("writerList", writerList);
				request.getRequestDispatcher("/adminPage/consultList.jsp").forward(request, response);
			}else if(cmd.equals("/view.consult")) {
				int consultID = Integer.parseInt(request.getParameter("consultID"));
				ConsultDTO dto = ConsultDAO.getInstance().selectOne(consultID);
				String writer = MembersDAO.getInstance().getIDByNo(dto.getUserNO());
				
				request.setAttribute("dto", dto);
				request.setAttribute("writer", writer);
				//이미지 추가해야 함.
				request.getRequestDispatcher("/adminPage/consultView.jsp").forward(request, response);
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
