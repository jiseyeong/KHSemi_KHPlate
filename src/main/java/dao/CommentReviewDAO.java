package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.CommentReviewDTO;

public class CommentReviewDAO {
	private static CommentReviewDAO instance = null;
	public synchronized static CommentReviewDAO getInstance() {
		if(instance == null) {
			instance = new CommentReviewDAO();
		}
		return instance;
	}
	
	private CommentReviewDAO() {
		super();
	}
	
	private Connection getConnection() throws Exception {
		Context iContext = new InitialContext();
		DataSource ds = (DataSource)iContext.lookup("java:/comp/env/jdbc/ora");
		return ds.getConnection();
	}
	
	public int insert(CommentReviewDTO dto) throws Exception{
		String sql = "insert into COMMENTREVIEW(REVIEWID, BODY, SCORE, STOREID, USERNO, WRITEDATE, TOTALLIKE)"
				+ " values(COMMENTREVIEW_REVIEWID_SEQ.nextval, ?, ?, ?, ?, sysdate, 0)";
		try(	Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setString(1, dto.getBody());
			pstat.setInt(2, dto.getScore());
			pstat.setInt(3, dto.getStoreID());
			pstat.setInt(4, dto.getUserNo());
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	
	public ArrayList<CommentReviewDTO> selectByStoreID(int storeID) throws Exception{
		String sql = "select * from COMMENTREVIEW where STOREID = ?";
		try(	Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setInt(1, storeID);
			try(ResultSet rs = pstat.executeQuery();){
				return this.transAllRsToList(rs);
			}
		}
	}
	
	public ArrayList<CommentReviewDTO> selectByUserNo(int userNo) throws Exception{
		String sql = "select * from COMMENTREVIEW where USERNO = ?";
		try(	Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setInt(1, userNo);
			try(ResultSet rs = pstat.executeQuery();){
				return this.transAllRsToList(rs);
			}
		}
	}
	
	private ArrayList<CommentReviewDTO> transAllRsToList(ResultSet rs) throws Exception{
		ArrayList<CommentReviewDTO> result = new ArrayList<>();
		while(rs.next()) {
			int reviewID = rs.getInt("REVIEWID");
			String body = rs.getString("BODY");
			int score = rs.getInt("SCORE");
			int storeID = rs.getInt("STOREID");
			int userNo = rs.getInt("USERNO");
			Timestamp writeDate = rs.getTimestamp("WRITEDATE");
			int totalLike = rs.getInt("TOTALLIKE");
			
			result.add(new CommentReviewDTO(reviewID, body, score, storeID, userNo, writeDate, totalLike));
		}
		return result;
	}
}
