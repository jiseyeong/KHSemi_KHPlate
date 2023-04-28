package controllers;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import commons.SecurityUtils;
import dao.CommentReviewDAO;
import dao.MembersDAO;
import dao.StoreDAO;
import dao.StoreMenuDAO;
import dto.CommentReviewDTO;
import dto.PhotoDTO;
import dto.StoreDTO;
import statics.Settings;
import dto.StoreMenuDTO;

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
				ArrayList<String> userIDList = new ArrayList<>();
				for(int i = 0; i < commentList.size(); i++) {
					userIDList.add(MembersDAO.getInstance().getIDByNo(commentList.get(i).getUserNo()));
				}
				ArrayList<StoreMenuDTO> menuList = StoreMenuDAO.getInstance().selectAllByStoreID(storeID);
				ArrayList<String> imgPathList = new ArrayList<>();
				ArrayList<PhotoDTO> imgList = StoreDAO.getInstance().selectPhoto(storeID);
				for(PhotoDTO i : imgList) {
					imgPathList.add("/store/" + i.getSysName());
				}
				
				request.setAttribute("dto", dto);
				request.setAttribute("commentList", commentList);
				request.setAttribute("userIDList", userIDList);
				request.setAttribute("menuList", menuList);
				request.setAttribute("imgPathList", imgPathList);
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
				storeName = SecurityUtils.XSSCheck(storeName);
				String storeAddress = multi.getParameter("storeAddress");
				storeAddress = SecurityUtils.XSSCheck(storeAddress);
				String storeIntroduction = multi.getParameter("storeIntroduction");
				storeIntroduction = SecurityUtils.XSSCheck(storeIntroduction);
				String storeCategory = multi.getParameter("storeCategory");
				
				int result = StoreDAO.getInstance().insert(new StoreDTO(0, mapDistance, storeName, mapLat, mapLng, storeAddress, 0, storeIntroduction, storeCategory));
				int currval = StoreDAO.getInstance().getCurrval();
				
//				int imgLength = Integer.parseInt(multi.getParameter("imgLength"));
//				ArrayList<String> oriNames = new ArrayList<>();
//				ArrayList<String> sysNames = new ArrayList<>();
//				for(int i = 0; i < imgLength; i++) {
//					oriNames.add(multi.getOriginalFileName("image"+i));
//					sysNames.add(multi.getFilesystemName("image"+i));
//					//imgsDAO~ (imgsDTO()) 추가해줘야 함
//				}
				
				Enumeration<String> names = multi.getFileNames();
				while(names.hasMoreElements()) {
					String fileName = names.nextElement();
					if(multi.getFile(fileName) != null){
						String oriName = multi.getOriginalFileName(fileName);
						String sysName = multi.getFilesystemName(fileName);
						StoreDAO.getInstance().insertPhoto(sysName, oriName, currval);
					}
				}
				response.sendRedirect("/view.store?storeID="+currval);
			}
			
			
			
			// 검색 Controller추가 (main_searchResult.jsp 사용), 필터 미구현
			// 사진 출력 미구현
			else if(cmd.equals("/searchToMain.store")){
				int currentpage = 1 ;
				String search = request.getParameter("search");
				if(request.getParameter("cpage")!=null) {
					currentpage = Integer.parseInt(request.getParameter("cpage"));
				}
				request.getSession().setAttribute("cpage", currentpage);
				
				int end_Record_Row_Num = currentpage * Settings.SEARCH_STORE_RECORD_COUNT_PER_PAGE;
				int start_Record_Row_Num = end_Record_Row_Num - (Settings.SEARCH_STORE_RECORD_COUNT_PER_PAGE - 1);
						
				List<StoreDTO> search_store_list = StoreDAO.getInstance().searchStore(search, start_Record_Row_Num, end_Record_Row_Num);
				String search_store_list_navi = StoreDAO.getInstance().getNavi(currentpage,search);
				request.setAttribute("search_store_list", search_store_list);
				request.setAttribute("search_store_list_navi", search_store_list_navi);
				request.getRequestDispatcher("/common/main_storeSearchResult.jsp").forward(request, response);
				
				
			// 검색 Controller추가 (allstoreInquiry.jsp 사용), 간단한 필터 구현
			// 사진 출력 미구현
			} else if(cmd.equals("/searchToMap.store")){
				String sortMethod = "";
				String cost_range = "";
				String food_category_korean = "";
				String food_category_western = "";
				String food_category_chinese = "";
				String food_category_japanese = "";
				String food_category_asian = "";
				String food_category_fastfood = "";
				String food_category_dessert_drink = "";
				String food_category_etc = "";
				
				if(request.getParameter("sortMethod")!=null) {
					sortMethod = request.getParameter("sortMethod");
					request.getSession().setAttribute("sortMethod", sortMethod);
				}else {
					sortMethod = (String) request.getSession().getAttribute("sortMethod");
				}
				
				if(request.getParameter("cost_range")!=null) {
					cost_range = request.getParameter("cost_range");
					request.getSession().setAttribute("cost_range", cost_range);
				}else {
					cost_range = (String) request.getSession().getAttribute("cost_range");
				}
				
				if(request.getParameter("food_category_korean")!=null) {
					food_category_korean = request.getParameter("food_category_korean");
					request.getSession().setAttribute("food_category_korean", food_category_korean);
				}else {
					food_category_korean = (String) request.getSession().getAttribute("food_category_korean");
				}
				
				if(request.getParameter("food_category_western")!=null) {
					food_category_western = request.getParameter("food_category_western");
					request.getSession().setAttribute("food_category_western", food_category_western);
				}else {
					food_category_western = (String) request.getSession().getAttribute("food_category_western");
				}
				
				if(request.getParameter("food_category_chinese")!=null) {
					food_category_chinese = request.getParameter("food_category_chinese");
					request.getSession().setAttribute("food_category_chinese", food_category_chinese);
				}else {
					food_category_chinese = (String) request.getSession().getAttribute("food_category_chinese");
				}
				
				if(request.getParameter("food_category_japanese")!=null) {
					food_category_japanese = request.getParameter("food_category_japanese");
					request.getSession().setAttribute("food_category_japanese", food_category_japanese);
				}else {
					food_category_japanese = (String) request.getSession().getAttribute("food_category_japanese");
				}
				
				if(request.getParameter("food_category_asian")!=null) {
					food_category_asian = request.getParameter("food_category_asian");
					request.getSession().setAttribute("food_category_asian", food_category_asian);
				}else {
					food_category_asian = (String) request.getSession().getAttribute("food_category_asian");
				}
				
				if(request.getParameter("food_category_fastfood")!=null) {
					food_category_fastfood = request.getParameter("food_category_fastfood");
					request.getSession().setAttribute("food_category_fastfood", food_category_fastfood);
				}else {
					food_category_fastfood = (String) request.getSession().getAttribute("food_category_fastfood");
				}
				
				if(request.getParameter("food_category_dessert_drink")!=null) {
					food_category_dessert_drink = request.getParameter("food_category_dessert_drink");
					request.getSession().setAttribute("food_category_dessert_drink", food_category_dessert_drink);
				}else {
					food_category_dessert_drink = (String) request.getSession().getAttribute("food_category_dessert_drink");
				}
				
				if(request.getParameter("food_category_etc")!=null) {
					food_category_etc = request.getParameter("food_category_etc");
					request.getSession().setAttribute("food_category_etc", food_category_etc);
				}else {
					food_category_etc = (String) request.getSession().getAttribute("food_category_etc");
				}
				
//				System.out.println("정렬방식 : "+sortMethod);
//				System.out.println("가격 : "+cost_range);
//				System.out.println("한식 : "+food_category_korean);
//				System.out.println("양식 : "+food_category_western);
//				System.out.println("중식 : "+food_category_chinese);
//				System.out.println("일식 : "+food_category_japanese);
//				System.out.println("아시안 : "+food_category_asian);
//				System.out.println("패스트푸드 : "+food_category_fastfood);
//				System.out.println("디저트음료 : "+food_category_dessert_drwink);
//				System.out.println("기타 : "+food_category_etc);
				
				String search = request.getParameter("search");
				int currentpage = 1;
				if(request.getParameter("cpage")!=null) {
					currentpage = Integer.parseInt(request.getParameter("cpage"));
				}
				request.getSession().setAttribute("cpage", currentpage);
				int end_Record_Row_Num = currentpage * Settings.SEARCH_STORE_TO_MAP_RECORD_COUNT_PER_PAGE;
				int start_Record_Row_Num = end_Record_Row_Num - (Settings.SEARCH_STORE_TO_MAP_RECORD_COUNT_PER_PAGE-1);
				List<StoreDTO> search_filtered_store_list = StoreDAO.getInstance().searchFilteredStore_toMap(search, start_Record_Row_Num, end_Record_Row_Num,
						sortMethod, cost_range, food_category_korean, food_category_western, food_category_chinese, food_category_japanese, food_category_asian,
						food_category_fastfood, food_category_dessert_drink, food_category_etc);
				String search_store_list_navi = StoreDAO.getInstance().getFilteredNavi_toMap(currentpage,search,sortMethod, cost_range, food_category_korean, 
						food_category_western, food_category_chinese, food_category_japanese, food_category_asian, food_category_fastfood, 
						food_category_dessert_drink, food_category_etc);
				
				request.setAttribute("search_store_list_toMap", search_filtered_store_list);
				request.setAttribute("search_store_list_navi_toMap", search_store_list_navi);
				request.getRequestDispatcher("/allstore_inquiry/allstore_inquiry.jsp").forward(request, response);
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
