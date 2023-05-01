package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.FullReviewDTO;
import statics.Settings;

public class FullReviewDAO {
	
	private static FullReviewDAO instance = null;
	public synchronized static FullReviewDAO getInstance() {
		if(instance == null) {
			instance = new FullReviewDAO();
		}
		return instance;
	}
	private FullReviewDAO() {
		super();
	}
	private Connection getConnection() throws Exception {
		Context iContext = new InitialContext();
		DataSource ds = (DataSource)iContext.lookup("java:/comp/env/jdbc/ora");
		return ds.getConnection();
	}
	
	public int writeFullReview(String title,String reviewbody, int score, int storeId, int userNo) throws Exception {
		String sql = "insert into FullReview values (fullreview_reviewid.nexval,?,?,?,?,sysdate,?)";
		try(Connection con = this.getConnection();
		PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setString(1, reviewbody);
			pstat.setInt(2, score);
			pstat.setInt(3, storeId);
			pstat.setInt(4, userNo);
			pstat.setString(5, title);
			int result = pstat.executeUpdate();
			return result;
		}
	}
	
	
	public int deleteFullReview(int reviewId) throws Exception {
		String sql = "delete from fullreview where reviewid = ?";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setInt(1, reviewId);
			int result = pstat.executeUpdate();
			return result;
		}
	}
	
	public int update(String title, String reviewbody, int score,int reviewId) throws Exception {
		String sql = "update fullreview set title=?, reviewbody=?, score=? where reviewid = ?";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
		pstat.setString(1, title);
		pstat.setString(2, reviewbody);
		pstat.setInt(3, score);
		pstat.setInt(4, reviewId);
		int result = pstat.executeUpdate();
		return result;
		}
	}
	
	
	// 블로그 리뷰 조회
	public List<FullReviewDTO> selectFullReview(int searchUserno, String searchFullReviewTitle, int start_Record_Row_Num, int end_Record_Row_Num) throws Exception {
		String sql="";
		if(searchUserno==0) {
			sql = "select * from "
					+ "(select fullreview.*, row_number() over(order by reviewID desc) row_num from fullreview where title like ?)"
					+ "where row_num between ? and ?";
		}else {
			sql = "select * from fullreview where title like ? and userno = ?";
		}
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setString(1, "%"+searchFullReviewTitle+"%");
			if(searchUserno!=0) {
				pstat.setInt(2, searchUserno);
				pstat.setInt(3, start_Record_Row_Num);
				pstat.setInt(4, end_Record_Row_Num);
			}else {
				pstat.setInt(2, start_Record_Row_Num);
				pstat.setInt(3, end_Record_Row_Num);
			}
			
			try(ResultSet rs = pstat.executeQuery();){
				return transToList(rs);
			}
		}
	}
	
	public String getFullReviewNavi(int currentpage, int searchUserno, String searchFullReviewTitle, String food_category) throws Exception {

		int record_total_count = getSearchdFullReview_RecordCount(searchUserno,searchFullReviewTitle);
		int record_count_per_page = Settings.SEARCH_FULLREVIEW_RECORD_COUNT_PER_PAGE; // 15
		int navi_count_per_page = Settings.SEARCH_FULLREVIEW_NAVI_COUNT_PER_PAGE; // 10
		
		System.out.println("리스트 전체 글 개수 : "+record_total_count);

		int page_total_count = 0;

		// 총 페이지의 수
		if(record_total_count%record_count_per_page==0) {
			page_total_count = record_total_count/record_count_per_page;
		}else {	
			page_total_count = (record_total_count/record_count_per_page)+1;
		}

		// 페이지 범위 초과 시 자동 조정 (필수 x)
		if(currentpage<1)
			currentpage = 1;
		else if(currentpage > page_total_count)
			currentpage=page_total_count;

		int startNavi = ((currentpage - 1)/navi_count_per_page * navi_count_per_page)+1;
		int endNavi = startNavi + (navi_count_per_page - 1);

		if(startNavi<1)
			startNavi = 1;
		else if(endNavi>page_total_count)
			endNavi = page_total_count;

		StringBuilder sb = new StringBuilder();

		boolean needPrev = true;
		boolean needNext = true;

		if(startNavi == 1)
			needPrev = false;
		if(endNavi == page_total_count)
			needNext = false;

		if(needPrev) {
			sb.append("<li class='navigator_list_item'>"
					+ "		<div class='navigator_list_item_btn_layout'>"
					+ "			<a href='/select.fullreview?cpage="+(startNavi-1)+"&search="+searchFullReviewTitle+"'>"
					+ "				<button class='navigator_direction_btn'>"
					+ "					<i class='fa-solid fa-angle-left'></i>"
					+ "				</button>"
					+ "			</a>"
					+ "		</div>"
					+ "</li>");
		}
		for(int i = startNavi ; i <= endNavi ; i++) {
			sb.append("<li class='navigator_list_item'>"
					+ "		<div class='navigator_list_item_btn_layout'>"
					+ "			<a class='item' href='/select.fullreview?cpage="+i+"&search="+searchFullReviewTitle+"'>"+i+"</a>"
					+ "		</div>"
					+ "</li>");
		}
		if(needNext) {
			sb.append("<li class='navigator_list_item'>"
					+ "		<div class='navigator_list_item_btn_layout'>"
					+ "			<a href='/select.fullreview?cpage="+(endNavi+1)+"&search="+searchFullReviewTitle+"'>"
					+ "				<button class='navigator_direction_btn'>"
					+ "					<i class='fa-solid fa-angle-right'></i>"
					+ "				</button>"
					+ "			</a>"
					+ "		</div>"
					+ "</li>");
		}
		return sb.toString();

	}

	// 일반 검색 Record 수
	public int getSearchdFullReview_RecordCount(int searchUserno, String searchFullReviewTitle) throws Exception{
		String sql = "";
		if(searchUserno==0) {
			sql = "select count(*) from fullreview where title like ?";
		}else {
			sql = "select count(*) from fullreview where title like ? and userno = ?";
		}
		try(	Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1,"%"+searchFullReviewTitle+"%");
			if(searchUserno!=0) {
				pstat.setInt(2, searchUserno);
			}
			try(ResultSet rs = pstat.executeQuery();){
				rs.next();
				return rs.getInt(1);
			}
		}
	}
	
	
	
	
	
	private List<FullReviewDTO> transToList(ResultSet rs) throws Exception {
		List<FullReviewDTO> result = new ArrayList<>();
		while(rs.next()) {
			int reviewID = rs.getInt("reviewid");
			String title = rs.getString("title");
			String reviewBody = rs.getString("reviewbody");
			int score = rs.getInt("score");
			int storeID = rs.getInt("storeID");
			int userno = rs.getInt("userno");
			Timestamp writedate = rs.getTimestamp("writedate");
			result.add(new FullReviewDTO(reviewID,title,reviewBody,score,storeID,userno,writedate));
		}
		return result;
	}		
	
	public FullReviewDTO contentByReviewId(int reviewid) throws Exception {
		String sql = "select * from fullreview where reviewid = ?";
		try (Connection con = this.getConnection(); 
				PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setInt(1, reviewid);
			try (ResultSet rs = pstat.executeQuery()) {
				FullReviewDTO result = new FullReviewDTO();
				int rsreviewid = rs.getInt("reviewid");
				String rsreviewbody = rs.getString("reviewbody");
				int rsscore = rs.getInt("score");
				int rsstoreid = rs.getInt("storeid");
				int rsuserno = rs.getInt("userno");
				Timestamp writedate = rs.getTimestamp("writedate");
				
				rs.next();
				
				result.setReviewID(rsreviewid);
				result.setReviewBody(rsreviewbody);
				result.setScore(rsscore);
				result.setStoreID(rsstoreid);
				result.setUserNO(rsuserno);
				result.setWritedate(writedate);

				return result;
			}
		}
	};
	
	
	
	
}
