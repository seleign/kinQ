package us.duia.leejo0531.vo;

public class UserVo {
	private int userNum;
	private String id;
	private String pw;
	private String userName;
	private int age;
	private String birth;
	private String phone;
	private String email;
	
	// Constructor
	public UserVo(){};
	
	public UserVo(int userNum, String id, String pw, String userName, int age, String birth, String phone,
			String email) {
		super();
		this.userNum = userNum;
		this.id = id;
		this.pw = pw;
		this.userName = userName;
		this.age = age;
		this.birth = birth;
		this.phone = phone;
		this.email = email;
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

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Override
	public String toString() {
		return "UserVo [userNum=" + userNum + ", id=" + id + ", pw=" + pw + ", userName=" + userName + ", age=" + age
				+ ", birth=" + birth + ", phone=" + phone + ", email=" + email + "]";
	}
	
	
	
}
