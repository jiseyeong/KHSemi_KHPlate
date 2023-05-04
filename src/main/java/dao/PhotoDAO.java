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
	
	public int insertByStoreID(String oriName, String sysName, int storeID) throws Exception{
		String sql = "insert into PHOTO(IMAGEID, ORINAME, SYSNAME, STOREID)"
				+ " values(PHOTO_IMAGEID_SEQ.nextval, ?, ?, ?)";
		try(	Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setString(1, oriName);
			pstat.setString(2, sysName);
			pstat.setInt(3, storeID);
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	
	public int insertByConsultID(String oriName, String sysName, int consultID) throws Exception{
		String sql = "insert into PHOTO(IMAGEID, ORINAME, SYSNAME, CONSULTID)"
				+ " values(PHOTO_IMAGEID_SEQ.nextval, ?, ?, ?)";
		try(	Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setString(1, oriName);
			pstat.setString(2, sysName);
			pstat.setInt(3, consultID);
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	
	public PhotoDTO selectByImageID(int photoID) throws Exception{
		String sql = "select IMAGEID, ORINAME, SYSNAME from PHOTO where IMAGEID = ?";
		try(	Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setInt(1, photoID);
			try(ResultSet rs = pstat.executeQuery();){
				return this.transAllRsToList(rs).get(0);
			}
		}
	}
	
	public ArrayList<PhotoDTO> selectByStoreID(int storeID) throws Exception{
		String sql = "select IMAGEID, ORINAME, SYSNAME from PHOTO where STOREID = ?";
		try(	Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setInt(1, storeID);
			try(ResultSet rs = pstat.executeQuery();){
				return this.transAllRsToList(rs);
			}
		}
	}
	
	public PhotoDTO selectByConsultID(int consultID) throws Exception{
		String sql = "select IMAGEID, ORINAME, SYSNAME from PHOTO where CONSULTID = ?";
		try(	Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setInt(1, consultID);
			try(ResultSet rs = pstat.executeQuery();){
				ArrayList<PhotoDTO> temp = this.transAllRsToList(rs);
				if(temp.size() > 0) {
					return temp.get(0);
				}
				return null;
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
	
	
	public int insertByFullReviewId(String oriName, String sysName, int storeid) throws Exception{
		String sql = "insert into PHOTO(IMAGEID, ORINAME, SYSNAME, storeid)"
				+ " values(PHOTO_IMAGEID_SEQ.nextval, ?, ?, ?)";
		try(	Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setString(1, oriName);
			pstat.setString(2, sysName);
			pstat.setInt(3, storeid);
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	
}
