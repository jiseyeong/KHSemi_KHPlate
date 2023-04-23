package dto;

public class MembersDTO {
	
	private int userNO;
	private String userID;
	private String pw;
	private String nickname;
	private String name;
	private String email;
	private String phone;
	private String classes;
	private String selfcomment;
	private String favoriteFood;
	private String isAdmin;
	private int zipCode;
	private String address1;
	private String address2;
	private String kakao;
	private String naver;
	private String google;
	
	public MembersDTO() {
		super();
	}

	public MembersDTO(int userNO, String userID, String pw, String nickname, String name, String email, String phone,
			String classes, String selfcomment, String favoriteFood, String isAdmin, int zipCode, String address1,
			String address2, String kakao, String naver, String google) {
		super();
		this.userNO = userNO;
		this.userID = userID;
		this.pw = pw;
		this.nickname = nickname;
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.classes = classes;
		this.selfcomment = selfcomment;
		this.favoriteFood = favoriteFood;
		this.isAdmin = isAdmin;
		this.zipCode = zipCode;
		this.address1 = address1;
		this.address2 = address2;
		this.kakao = kakao;
		this.naver = naver;
		this.google = google;
	}

	public int getUserNO() {
		return userNO;
	}

	public void setUserNO(int userNO) {
		this.userNO = userNO;
	}

	public String getUserID() {
		return userID;
	}

	public void setUserID(String userID) {
		this.userID = userID;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getClasses() {
		return classes;
	}

	public void setClasses(String classes) {
		this.classes = classes;
	}

	public String getSelfcomment() {
		return selfcomment;
	}

	public void setSelfcomment(String selfcomment) {
		this.selfcomment = selfcomment;
	}

	public String getFavoriteFood() {
		return favoriteFood;
	}

	public void setFavoriteFood(String favoriteFood) {
		this.favoriteFood = favoriteFood;
	}

	public String getIsAdmin() {
		return isAdmin;
	}

	public void setIsAdmin(String isAdmin) {
		this.isAdmin = isAdmin;
	}

	public int getZipCode() {
		return zipCode;
	}

	public void setZipCode(int zipCode) {
		this.zipCode = zipCode;
	}

	public String getAddress1() {
		return address1;
	}

	public void setAddress1(String address1) {
		this.address1 = address1;
	}

	public String getAddress2() {
		return address2;
	}

	public void setAddress2(String address2) {
		this.address2 = address2;
	}

	public String getKakao() {
		return kakao;
	}

	public void setKakao(String kakao) {
		this.kakao = kakao;
	}

	public String getNaver() {
		return naver;
	}

	public void setNaver(String naver) {
		this.naver = naver;
	}

	public String getGoogle() {
		return google;
	}

	public void setGoogle(String google) {
		this.google = google;
	}
	
	
	
	
	
}
