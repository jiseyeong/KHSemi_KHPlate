package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.MembersDTO;

public class MembersDAO {

	private MembersDAO() {
		super();
	}

	private static MembersDAO instance = null;

	public synchronized static MembersDAO getInstance() {
		if (instance == null) {
			instance = new MembersDAO();
		}
		return instance;
	}

	private Connection getConnection() throws Exception {
		Context iContext = new InitialContext();
		DataSource ds = (DataSource) iContext.lookup("java:/comp/env/jdbc/ora");
		return ds.getConnection();
	}

	public String getIDByNo(int userNo) throws Exception {
		String sql = "select userID from MEMBERS where USERNO = ?";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setInt(1, userNo);
			try (ResultSet rs = pstat.executeQuery();) {
				rs.next();
				return rs.getString(1);
			}
		}
	}


	public int insert(MembersDTO dto) throws Exception { // 회占쏙옙占쏙옙占쏙옙

		String sql = "insert into members values(members_userno_seq.nextval,?,?,?,?,?,?,?,?,?,default,?,?,?);";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {

			pstat.setString(1, dto.getUserID());
			pstat.setString(2, dto.getPw());
			pstat.setString(3, dto.getNickname());
			pstat.setString(4, dto.getName());
			pstat.setString(5, dto.getEmail());
			pstat.setString(6, dto.getPhone());
			pstat.setString(7, dto.getClasses());
			pstat.setString(8, dto.getSelfcomment());
			pstat.setString(9, dto.getFavoriteFood());
			pstat.setString(10, dto.getKakao());
			pstat.setString(11, dto.getNaver());
			pstat.setString(12, dto.getGoogle());

			int result = pstat.executeUpdate();

			con.commit();

			return result;
		}

	}
	public MembersDTO selectById(String userID) throws Exception { // 占쏙옙占쏙옙占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙 占쏙옙占�


		String sql = "select * from members where userid=?";

		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {

			pstat.setString(1, userID);

			ResultSet rs = pstat.executeQuery();
			rs.next();
			String userID2 = rs.getString("userid");
			String pw = rs.getString("pw");
			String nickname = rs.getString("nickname");
			String name = rs.getString("name");
			String email = rs.getString("email");
			String phone = rs.getString("phone");
			String classes = rs.getString("classes");
			String selfcomment = rs.getString("selfcomment");
			String favoritefood = rs.getString("favoritefood");

			MembersDTO result = new MembersDTO(userID2, pw, nickname, name, email, phone, classes, selfcomment,
					favoritefood);

			return result;
		}
	}
	public int update(MembersDTO dto) throws Exception { // 회占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙

		String sql = "update members set pw=?, nickname=?, email=?, phone=?, selfcomment=?, favoritefood=?, where userid=?";

		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {

			pstat.setString(1, dto.getPw());
			pstat.setString(2, dto.getNickname());
			pstat.setString(3, dto.getEmail());
			pstat.setString(4, dto.getPhone());
			pstat.setString(5, dto.getSelfcomment());
			pstat.setString(6, dto.getFavoriteFood());
			pstat.setString(7, dto.getUserID());

			int result = pstat.executeUpdate();

			con.commit();

			return result;
		}
	}

	public int delete(String userId, String pw) throws Exception { // 회占쏙옙 탈占쏙옙

		String sql = "delete from members where userid=? and pw=?";

		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {

			pstat.setString(1, userId);
			pstat.setString(2, pw);

			int result = pstat.executeUpdate();

			con.commit();

			return result;
		}
	}

	public boolean idPwOk(String userId, String pw) throws Exception { // 占싸깍옙占쏙옙

		String sql = "select * from members where userid=? and pw=?";

		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {

			pstat.setString(1, userId);
			pstat.setString(2, pw);

			ResultSet rs = pstat.executeQuery();

			con.commit();

			return rs.next();
		}
	}

	public int join(String id, String pw, String name, String email, String classes) throws Exception {
		String sql = "insert into members (userno,userid,pw,name,email,classes) values (members_userno_seq.nextval,?,?,?,?,?)";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, id);
			pstat.setString(2, pw);
			pstat.setString(3, name);
			pstat.setString(4, email);
			pstat.setString(5, classes);

			int result = pstat.executeUpdate();
			return result;
		}

	}

	public boolean isIdExist(String id) throws Exception {
		String sql = "select id from members where id = ?";
		try (Connection con = this.getConnection(); PreparedStatement ppst = con.prepareStatement(sql);) {
			ppst.setString(1, id);
			try (ResultSet rs = ppst.executeQuery()) {
				return rs.next();
			}
		}

	}
}
