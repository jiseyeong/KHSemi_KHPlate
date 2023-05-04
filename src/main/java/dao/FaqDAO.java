package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.FaqDTO;

public class FaqDAO {
	private static FaqDAO instance = null;
	public synchronized static FaqDAO getInstance() {
		if(instance == null) {
			instance = new FaqDAO();
		}
		return instance;
	}
	
	private FaqDAO() {
		super();
	}
	
	private Connection getConnection() throws Exception {
		Context iContext = new InitialContext();
		DataSource ds = (DataSource)iContext.lookup("java:/comp/env/jdbc/ora");
		return ds.getConnection();
	}
	
	public int insert(FaqDTO dto) throws Exception {
		String sql = "insert into FAQ(QAID, TITLE, BODY)"
				+ " values(FAQ_QAID_SEQ.nextval, ?, ?)";
		try(	Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setString(1, dto.getTitle());
			pstat.setString(2, dto.getBody());
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	
	public ArrayList<FaqDTO> selectAll() throws Exception{
		String sql = "select * from FAQ";
		try(	Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();){
			return this.transAllRsToList(rs);
		}
	}
	
	public int delete(int qaID) throws Exception{
		String sql = "delete from FAQ where QAID=?";
		try(	Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setInt(1, qaID);
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	
	private ArrayList<FaqDTO> transAllRsToList(ResultSet rs) throws Exception{
		ArrayList<FaqDTO> result = new ArrayList<>();
		while(rs.next()) {
			int qaID = rs.getInt("qaID");
			String title = rs.getString("title");
			String body = rs.getString("body");
			
			result.add(new FaqDTO(qaID, title, body));
		}
		return result;
	}
}
