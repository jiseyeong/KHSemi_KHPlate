package dto;

import java.sql.Timestamp;

public class FullReviewDTO {
	
	private int revireID;
	private String reviewBody;
	private int score;
	private int storeID;
	private int userNO;
	private Timestamp writedate;
	
	public FullReviewDTO() {
		super();
	}

	public FullReviewDTO(int revireID, String reviewBody, int score, int storeID, int userNO, Timestamp writedate) {
		super();
		this.revireID = revireID;
		this.reviewBody = reviewBody;
		this.score = score;
		this.storeID = storeID;
		this.userNO = userNO;
		this.writedate = writedate;
	}

	public int getRevireID() {
		return revireID;
	}

	public void setRevireID(int revireID) {
		this.revireID = revireID;
	}

	public String getReviewBody() {
		return reviewBody;
	}

	public void setReviewBody(String reviewBody) {
		this.reviewBody = reviewBody;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public int getStoreID() {
		return storeID;
	}

	public void setStoreID(int storeID) {
		this.storeID = storeID;
	}

	public int getUserNO() {
		return userNO;
	}

	public void setUserNO(int userNO) {
		this.userNO = userNO;
	}

	public Timestamp getWritedate() {
		return writedate;
	}

	public void setWritedate(Timestamp writedate) {
		this.writedate = writedate;
	}
	
	
	
	
}
