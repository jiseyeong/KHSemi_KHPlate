package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import commons.SecurityUtils;
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
			con.commit();
			return result;
		}

	}

	// 아이디 검사
	// 일치하지 않을 경우 ID가 틀렸다고 사용자에게 표시
	public boolean isIdExist(String id) throws Exception {
		String sql = "select userid from members where userid = ?";
		try (Connection con = this.getConnection(); PreparedStatement ppst = con.prepareStatement(sql);) {
			ppst.setString(1, id);
			try (ResultSet rs = ppst.executeQuery()) {
				return rs.next();
			}
		}

	}
	
	// 비밀번호 검사 후 로그인 적용
	// 일치하지 않을 경우 PW가 틀렸다고 사용자에게 표시
	public boolean isPwExist(String id, String pw) throws Exception {
		String sql = "select userid from members where userid = ? and pw = ?";
		try (Connection con = this.getConnection(); PreparedStatement ppst = con.prepareStatement(sql);) {
			ppst.setString(1, id);
			ppst.setString(2, pw);
			try (ResultSet rs = ppst.executeQuery()) {
				return rs.next();
			}
		}
	}
	
	// 이메일 인증 확인
	public boolean emailVerify(String id) throws Exception {
		String sql = "select * from members where userid = ? and userEmailChecked = 't'";
		try (Connection con = this.getConnection(); PreparedStatement ppst = con.prepareStatement(sql);) {
			ppst.setString(1, id);
			try (ResultSet rs = ppst.executeQuery()) {
				return rs.next();
			}
		}
	}
	
	
	
	
	public int getUserno(String id) throws Exception {
		String sql = "select userno from members where userid = ?";
		try (Connection con = this.getConnection(); PreparedStatement ppst = con.prepareStatement(sql);) {
			ppst.setString(1, id);
			try (ResultSet rs = ppst.executeQuery()) {
				rs.next();
				return rs.getInt("userno");
			}
		}
	}
	
	
	// 이메일 인증 부분입니다.
	// 이메일 인증 시 해당 유저가 있는 지 검사
	public String getUserEmailVerified(String code) throws Exception{
		String sql = "select * from members";
		try
		(Connection con = this.getConnection();
		PreparedStatement pstat= con.prepareStatement(sql);
		ResultSet rs = pstat.executeQuery();){
			while(rs.next()) {
				String email = rs.getString("email");
				if(SecurityUtils.sha512(email).equals(code)) {
					return rs.getString("userid");
				}
			}
			return "";
		}
	}
	
	// 이메일 인증 후 해당 유저의 userEmailChecked 를 t값으로 변경
	public int updateuserEmailChecked(String userid) throws Exception{
		String sql = "update members set userEmailChecked = 't' where userid = ?";
		try
		(Connection con = this.getConnection();
		PreparedStatement pstat= con.prepareStatement(sql);){
			pstat.setString(1, userid);
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
}
