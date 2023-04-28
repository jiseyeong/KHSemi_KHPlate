package controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.StoreMenuDAO;
import dto.StoreMenuDTO;

@WebServlet("*.storeMenu")
public class StoreMenuController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf8");
		String cmd = request.getRequestURI();
		
		try {
			if(cmd.equals("/add.storeMenu")) {
				int storeID = Integer.parseInt(request.getParameter("storeID"));
				String menuName = request.getParameter("menuName");
				int menuPrice = Integer.parseInt(request.getParameter("menuPrice"));
				
				int result = StoreMenuDAO.getInstance().insert(new StoreMenuDTO(0, menuName, menuPrice, storeID));
				
				response.sendRedirect("/view.store?storeID="+storeID);
			}else if(cmd.equals("/delete.storeMenu")) {
				int menuID = Integer.parseInt(request.getParameter("menuID"));
				int storeID = Integer.parseInt(request.getParameter("storeID"));
				
				int result = StoreMenuDAO.getInstance().deleteByID(menuID);
				
				response.sendRedirect("/view.store?storeID="+storeID);
			}else if(cmd.equals("/update.storeMenu")) {
				int storeID = Integer.parseInt(request.getParameter("storeID"));
				int menuID = Integer.parseInt(request.getParameter("menuID"));
				String menuName = request.getParameter("updateMenuName");
				int menuPrice = Integer.parseInt(request.getParameter("updateMenuPrice"));
				
				int result = StoreMenuDAO.getInstance().update(new StoreMenuDTO(menuID, menuName, menuPrice, storeID));
				
				response.sendRedirect("/view.store?storeID="+storeID);
			}
		}catch(Exception e){
			e.printStackTrace();
			response.sendRedirect("/error.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
