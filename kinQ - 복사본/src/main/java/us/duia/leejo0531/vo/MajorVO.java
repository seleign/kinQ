package us.duia.leejo0531.vo;

public class MajorVO {
	private int majorNum;
	private String majorName;
	
	public MajorVO(){}

	public MajorVO(int majorNum, String majorName) {
		super();
		this.majorNum = majorNum;
		this.majorName = majorName;
	}

	public int getMajorNum() {
		return majorNum;
	}

	public void setMajorNum(int majorNum) {
		this.majorNum = majorNum;
	}

	public String getMajorName() {
		return majorName;
	}

	public void setMajorName(String majorName) {
		this.majorName = majorName;
	}

	@Override
	public String toString() {
		return "MajorVo [majorNum=" + majorNum + ", majorName=" + majorName + "]";
	}
	
}
