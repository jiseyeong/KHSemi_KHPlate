package controllers;

import java.io.File;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.CommentReviewDAO;
import dao.MembersDAO;
import dao.StoreDAO;
import dto.CommentReviewDTO;
import dto.StoreDTO;

@WebServlet("*.store")
public class StoreController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf8");
		String cmd = request.getRequestURI();
		
		try {
			if(cmd.equals("/list.store")) {
				
			}else if(cmd.equals("/view.store")) {
				int storeID = Integer.parseInt(request.getParameter("storeID"));
				StoreDTO dto = StoreDAO.getInstance().selectOne(storeID);
				ArrayList<CommentReviewDTO> commentList = CommentReviewDAO.getInstance().selectByStoreID(storeID);
				ArrayList<String> userNameList = new ArrayList<>();
				for(int i = 0; i < commentList.size(); i++) {
					userNameList.add(MembersDAO.getInstance().getNameByNo(commentList.get(i).getUserNo()));
				}
				
				request.setAttribute("dto", dto);
				request.setAttribute("commentList", commentList);
				request.setAttribute("userNameList", userNameList);
				request.getRequestDispatcher("/store/view.jsp").forward(request, response);
				
			}else if(cmd.equals("/register.store")) {
				String realPath = request.getServletContext().getRealPath("store");
				int maxSize = 1024 * 1024 * 10; //10Mb
				System.out.println(realPath);
				File realPathFile = new File(realPath);
				if(!realPathFile.exists()) {
					realPathFile.mkdir();
				}
				MultipartRequest multi = new MultipartRequest(request, realPath, maxSize, "utf8", new DefaultFileRenamePolicy());
				
				double mapLat = Double.parseDouble(multi.getParameter("mapLat"));
				double mapLng = Double.parseDouble(multi.getParameter("mapLng"));
				int mapDistance = Integer.parseInt(multi.getParameter("mapDistance"));
				String storeName = multi.getParameter("storeName");
				String storeAddress = multi.getParameter("storeAddress");
				String storeIntroduction = multi.getParameter("storeIntroduction");
				String storeCategory = multi.getParameter("storeCategory");
				
				int result = StoreDAO.getInstance().insert(new StoreDTO(0, mapDistance, storeName, mapLat, mapLng, storeAddress, 0, storeIntroduction, storeCategory));
				int currval = StoreDAO.getInstance().getCurrval();
				
				int imgLength = Integer.parseInt(multi.getParameter("imgLength"));
				ArrayList<String> oriNames = new ArrayList<>();
				ArrayList<String> sysNames = new ArrayList<>();
				for(int i = 0; i < imgLength; i++) {
					oriNames.add(multi.getOriginalFileName("image"+i));
					sysNames.add(multi.getFilesystemName("image"+i));
					//imgsDAO~ (imgsDTO()) 추가해줘야 함
				}
				
				response.sendRedirect("/view.store?storeID="+currval);
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
