package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

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
	
	public int writeFullReview(String reviewbody, int score, int storeId, int userNo) throws Exception {
		String sql = "insert into FullReview values (fullreview_reviewid.nexval,?,?,?,?,sysdate)";
		try(Connection con = this.getConnection();
		PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setString(1, reviewbody);
			pstat.setInt(2, score);
			pstat.setInt(3, storeId);
			pstat.setInt(4, userNo);
			
			int result = pstat.executeUpdate();
			return result;
		}
	}
	
	
	
}
