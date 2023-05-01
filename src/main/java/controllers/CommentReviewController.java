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

import com.google.gson.Gson;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import commons.SecurityUtils;
import dao.CommentReviewDAO;
import dao.PhotoDAO;
import dto.CommentReviewDTO;
import dto.PhotoDTO;

@WebServlet("*.commentReview")
public class CommentReviewController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf8");
		String cmd = request.getRequestURI();
		Gson g = new Gson();
		
		try {
			if(cmd.equals("/create.commentReview")) {
				String realPath = request.getServletContext().getRealPath("CommentReview");
				int maxSize = 1024 * 1024 * 10; //10Mb
				System.out.println(realPath);
				File realPathFile = new File(realPath);
				if(!realPathFile.exists()) {
					realPathFile.mkdir();
				}
				MultipartRequest multi = new MultipartRequest(request, realPath, maxSize, "utf8", new DefaultFileRenamePolicy());
				
				int score = Integer.parseInt(multi.getParameter("score"));
				String body = multi.getParameter("body");
				body = SecurityUtils.XSSCheck(body);
				int storeID = Integer.parseInt(multi.getParameter("storeID"));
				int userNo = Integer.parseInt(multi.getParameter("userNo"));	
				int result = CommentReviewDAO.getInstance().insert(new CommentReviewDTO(0, body, score, storeID, userNo, null, 0));
				int currval = CommentReviewDAO.getInstance().getCurrval();
				
				Enumeration<String> names = multi.getFileNames();
				while(names.hasMoreElements()) {
					String fileName = names.nextElement();
					if(multi.getFile(fileName) != null){
						String oriName = multi.getOriginalFileName(fileName);
						String sysName = multi.getFilesystemName(fileName);
						CommentReviewDAO.getInstance().insertPhoto(sysName, oriName, currval);
					}
				}
				
				response.sendRedirect("/view.store?storeID="+storeID);
			}else if(cmd.equals("/getPhotoList.commentReview")) {
				int reviewID = Integer.parseInt(request.getParameter("reviewID"));
				ArrayList<PhotoDTO> imgList = CommentReviewDAO.getInstance().selectPhoto(reviewID);
				
				String resp = g.toJson(imgList);
				
				response.getWriter().append(resp);
			}else if(cmd.equals("/photoDelete.commentReview")) {
				int imageID = Integer.parseInt(request.getParameter("imageID"));
				int storeID = Integer.parseInt(request.getParameter("storeID"));

				int result = PhotoDAO.getInstance().delete(imageID);

				response.sendRedirect("/view.store?storeID="+storeID);
			}else if(cmd.equals("/update.commentReview")) {
				String realPath = request.getServletContext().getRealPath("CommentReview");
				int maxSize = 1024 * 1024 * 10; //10Mb
				System.out.println(realPath);
				File realPathFile = new File(realPath);
				if(!realPathFile.exists()) {
					realPathFile.mkdir();
				}
				MultipartRequest multi = new MultipartRequest(request, realPath, maxSize, "utf8", new DefaultFileRenamePolicy());
				
				int score = Integer.parseInt(multi.getParameter("modifyScore"));
				String body = multi.getParameter("modifyBody");
				body = SecurityUtils.XSSCheck(body);
				int reviewID = Integer.parseInt(multi.getParameter("reviewID"));	
				int storeID = Integer.parseInt(multi.getParameter("storeID"));
				int result = CommentReviewDAO.getInstance().update(reviewID, body, score);
				
				Enumeration<String> names = multi.getFileNames();
				while(names.hasMoreElements()) {
					String fileName = names.nextElement();
					if(multi.getFile(fileName) != null){
						String oriName = multi.getOriginalFileName(fileName);
						String sysName = multi.getFilesystemName(fileName);
						CommentReviewDAO.getInstance().insertPhoto(sysName, oriName, reviewID);
					}
				}
				
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
