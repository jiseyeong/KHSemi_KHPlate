package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.ConsultDTO;

public class ConsultDAO {
	private static ConsultDAO instance = null;
	public synchronized static ConsultDAO getInstance() {
		if(instance == null) {
			instance = new ConsultDAO();
		}
		return instance;
	}
	private ConsultDAO() {
		super();
	}
	private Connection getConnection() throws Exception {
		Context iContext = new InitialContext();
		DataSource ds = (DataSource)iContext.lookup("java:/comp/env/jdbc/ora");
		return ds.getConnection();
	}
	public int insert(ConsultDTO dto) throws Exception{
		String sql = "insert into CONSULT(CONSULTID, TITLE, BODY, USERNO, WRITEDATE, CATEGORY, REPLY)"
				+ " values(CONSULT_CONSULTID_SEQ.nextval, ?, ?, ?, sysdate, ?, 'N')";
		try(	Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setString(1, dto.getTitle());
			pstat.setString(2, dto.getBody());
			pstat.setInt(3, dto.getUserNO());
			pstat.setString(4, dto.getCategory());
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	
	public ArrayList<ConsultDTO> selectAll() throws Exception{
		String sql = "select * from CONSULT";
		try(	Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();){
			return this.transAllRsToList(rs);
		}
	}
	
	public ConsultDTO selectOne(int consultID) throws Exception{
		String sql = "select * from CONSULT where CONSULTID = ?";
		try(	Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setInt(1, consultID);
			try(ResultSet rs = pstat.executeQuery();){
				return this.transAllRsToList(rs).get(0);
			}
		}
	}
	
	public int updateReply(int consultID, String reply) throws Exception{
		String sql = "update CONSULT set REPLY = ? where CONSULTID = ?";
		try(	Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setString(1, reply);
			pstat.setInt(2, consultID);
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	
	private ArrayList<ConsultDTO> transAllRsToList(ResultSet rs) throws Exception{
		ArrayList<ConsultDTO> result = new ArrayList<>();
		while(rs.next()) {
			int consultID = rs.getInt("CONSULTID");
			String title = rs.getString("TITLE");
			String body = rs.getString("BODY");
			int number = rs.getInt("USERNO");
			Timestamp writeDate = rs.getTimestamp("WRITEDATE");
			String category = rs.getString("CATEGORY");
			String reply = rs.getString("REPLY");
			
			result.add(new ConsultDTO(consultID, title, body, number, writeDate, category, reply));
		}
		return result;
	}
}
