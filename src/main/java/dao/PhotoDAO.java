package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.PhotoDTO;

public class PhotoDAO {
	private static PhotoDAO instance = null;
	public synchronized static PhotoDAO getInstance() {
		if(instance == null) {
			instance = new PhotoDAO();
		}
		return instance;
	}
	private PhotoDAO() {
		super();
	}
	private Connection getConnection() throws Exception {
		Context iContext = new InitialContext();
		DataSource ds = (DataSource)iContext.lookup("java:/comp/env/jdbc/ora");
		return ds.getConnection();
	}
	
	public int delete(int imageID) throws Exception{
		String sql = "delete from PHOTO where IMAGEID = ?";
		try(	Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setInt(1, imageID);
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	
	public int deleteByCReviewID(int cReviewID) throws Exception{
		String sql = "delete from PHOTO where cReviewID = ?";
		try(	Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setInt(1, cReviewID);
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	
	public int deleteByStoreID(int storeID) throws Exception{
		String sql = "delete from PHOTO where STOREID = ?";
		try(	Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setInt(1, storeID);
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	
	public int insertByStoreID(String sysName, String oriName, int storeID) throws Exception{
		String sql = "insert into PHOTO(IMAGEID, ORINAME, SYSNAME, STOREID)"
				+ " values(PHOTO_IMAGEID_SEQ.nextval, ?, ?, ?)";
		try(	Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setString(1, sysName);
			pstat.setString(2, oriName);
			pstat.setInt(3, storeID);
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	
	public int insertByCReviewID(String sysName, String oriName, int cReviewID) throws Exception{
		String sql = "insert into PHOTO(IMAGEID, ORINAME, SYSNAME, cReviewID)"
				+ " values(PHOTO_IMAGEID_SEQ.nextval, ?, ?, ?)";
		try(	Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setString(1, sysName);
			pstat.setString(2, oriName);
			pstat.setInt(3, cReviewID);
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	
	public ArrayList<PhotoDTO> selectPhotoByStoreID(int storeID) throws Exception{
		String sql = "select IMAGEID, ORINAME, SYSNAME from PHOTO where STOREID = ?";
		try(	Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setInt(1, storeID);
			try(ResultSet rs = pstat.executeQuery();){
				return this.transAllRsToList(rs);
			}
		}
	}
	
	public ArrayList<PhotoDTO> selectByCReviewID(int cReviewID) throws Exception{
		String sql = "select IMAGEID, ORINAME, SYSNAME from PHOTO where CREVIEWID = ?";
		try(	Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setInt(1, cReviewID);
			try(ResultSet rs = pstat.executeQuery();){
				return this.transAllRsToList(rs);
			}
		}
	}
	
	private ArrayList<PhotoDTO> transAllRsToList(ResultSet rs) throws Exception{
		ArrayList<PhotoDTO> result = new ArrayList<>();
		while(rs.next()) {
			int imageID = rs.getInt("IMAGEID");
			String oriName = rs.getString("ORINAME");
			String sysName = rs.getString("SYSNAME");
			result.add(new PhotoDTO(imageID, oriName, sysName));
		}
		return result;
	}
}
