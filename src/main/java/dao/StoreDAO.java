package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.StoreDTO;

public class StoreDAO {
	private static StoreDAO instance;
	public synchronized static StoreDAO getInstance() {
		if(instance == null) {
			instance = new StoreDAO();
		}
		return instance;
	}
	
	private Connection getConnection() throws Exception {
		Context iContext = new InitialContext();
		DataSource ds = (DataSource)iContext.lookup("java:/comp/env/jdbc/ora");
		return ds.getConnection();
	}
	
	public int insert(StoreDTO dto) throws Exception {
		String sql = "insert into store(StoreID, distance, name, lat, lng, address, avgScore, introduction) "
				+ "values(store_seq.nextval, ?, ?, ?, ?, ?, 0, ?)";
		try(	Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setInt(1, dto.getDistance());
			pstat.setString(2, dto.getName());
			pstat.setDouble(3, dto.getLat());
			pstat.setDouble(4, dto.getLng());
			pstat.setString(5, dto.getAddress());
			pstat.setString(6, dto.getIntroduction());
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
}
