package us.duia.leejo0531.vo;

public class MinorVO {
	private int minorNum;
	private int majorNum;
	private String minorName;

	public MinorVO(){}

	public MinorVO(int minorNum, int majorNum, String minorName) {
		super();
		this.minorNum = minorNum;
		this.majorNum = majorNum;
		this.minorName = minorName;
	}

	public int getMinorNum() {
		return minorNum;
	}

	public void setMinorNum(int minorNum) {
		this.minorNum = minorNum;
	}

	public int getMajorNum() {
		return majorNum;
	}

	public void setMajorNum(int majorNum) {
		this.majorNum = majorNum;
	}

	public String getMinorName() {
		return minorName;
	}

	public void setMinorName(String minorName) {
		this.minorName = minorName;
	}

	@Override
	public String toString() {
		return "MinorVo [minorNum=" + minorNum + ", majorNum=" + majorNum + ", minorName=" + minorName + "]";
	}
	
}
