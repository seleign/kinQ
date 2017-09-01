package us.duia.leejo0531.vo;

import java.util.Date;

public class QuestionVO {
	private int userNum;
	private String id;
	private String password;
	private String userName;
	private int aga;
	private Date birth;
	private String phone;
	private String eMail;
	
	public QuestionVO(int userNum, String id, String password, String userName, int aga, Date birth, String phone,
			String eMail) {
		super();
		this.userNum = userNum;
		this.id = id;
		this.password = password;
		this.userName = userName;
		this.aga = aga;
		this.birth = birth;
		this.phone = phone;
		this.eMail = eMail;
	}
	public QuestionVO() {
		super();
	}
	public int getUserNum() {
		return userNum;
	}
	public void setUserNum(int userNum) {
		this.userNum = userNum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public int getAga() {
		return aga;
	}
	public void setAga(int aga) {
		this.aga = aga;
	}
	public Date getBirth() {
		return birth;
	}
	public void setBirth(Date birth) {
		this.birth = birth;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String geteMail() {
		return eMail;
	}
	public void seteMail(String eMail) {
		this.eMail = eMail;
	}
	@Override
	public String toString() {
		return "QuestionVO [userNum=" + userNum + ", id=" + id + ", password=" + password + ", userName=" + userName
				+ ", aga=" + aga + ", birth=" + birth + ", phone=" + phone + ", eMail=" + eMail + "]";
	}
	
	
	
}
