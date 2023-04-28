package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

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
}
