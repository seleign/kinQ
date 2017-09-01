package us.duia.leejo0531.vo;

public class FieldVO {
	private int fieldNum;
	private int userNum;
	private int majorNum;
	private int minorNum;
	
	public FieldVO(){}

	public FieldVO(int fieldNum, int userNum, int majorNum, int minorNum) {
		super();
		this.fieldNum = fieldNum;
		this.userNum = userNum;
		this.majorNum = majorNum;
		this.minorNum = minorNum;
	}

	public int getFieldNum() {
		return fieldNum;
	}

	public void setFieldNum(int fieldNum) {
		this.fieldNum = fieldNum;
	}

	public int getUserNum() {
		return userNum;
	}

	public void setUserNum(int userNum) {
		this.userNum = userNum;
	}

	public int getMajorNum() {
		return majorNum;
	}

	public void setMajorNum(int majorNum) {
		this.majorNum = majorNum;
	}

	public int getMinorNum() {
		return minorNum;
	}

	public void setMinorNum(int minorNum) {
		this.minorNum = minorNum;
	}

	@Override
	public String toString() {
		return "FieldVo [fieldNum=" + fieldNum + ", userNum=" + userNum + ", majorNum=" + majorNum + ", minorNum="
				+ minorNum + "]";
	};
	
	
}
