package us.duia.leejo0531.vo;

import java.util.Date;

// 답변 다는 것을 통해 얻은 포인트 및 캐쉬를 포인트화한 금액
// 포인트로 질문을 할 수 있고, 포인트샵의 물건 구매 가능
public class PointLogVO {
	
	private int pointLogNum;
	private int pUserNum;
	private int pCharged;
	private String pChargedDate;
	private int pUsed;
	private String pUsedDate;
	private int pChange;
	
	public PointLogVO(){}

	public PointLogVO(int pointLogNum, int pUserNum, int pCharged, String pChargedDate, int pUsed, String pUsedDate,
			int pChange) {
		super();
		this.pointLogNum = pointLogNum;
		this.pUserNum = pUserNum;
		this.pCharged = pCharged;
		this.pChargedDate = pChargedDate;
		this.pUsed = pUsed;
		this.pUsedDate = pUsedDate;
		this.pChange = pChange;
	}

	public int getPointLogNum() {
		return pointLogNum;
	}

	public void setPointLogNum(int pointLogNum) {
		this.pointLogNum = pointLogNum;
	}

	public int getpUserNum() {
		return pUserNum;
	}

	public void setpUserNum(int pUserNum) {
		this.pUserNum = pUserNum;
	}

	public int getpCharged() {
		return pCharged;
	}

	public void setpCharged(int pCharged) {
		this.pCharged = pCharged;
	}

	public String getpChargedDate() {
		return pChargedDate;
	}

	public void setpChargedDate(String pChargedDate) {
		this.pChargedDate = pChargedDate;
	}

	public int getpUsed() {
		return pUsed;
	}

	public void setpUsed(int pUsed) {
		this.pUsed = pUsed;
	}

	public String getpUsedDate() {
		return pUsedDate;
	}

	public void setpUsedDate(String pUsedDate) {
		this.pUsedDate = pUsedDate;
	}

	public int getpChange() {
		return pChange;
	}

	public void setpChange(int pChange) {
		this.pChange = pChange;
	}

	@Override
	public String toString() {
		return "PointLogVO [pointLogNum=" + pointLogNum + ", pUserNum=" + pUserNum + ", pCharged=" + pCharged
				+ ", pChargedDate=" + pChargedDate + ", pUsed=" + pUsed + ", pUsedDate=" + pUsedDate + ", pChange="
				+ pChange + "]";
	}

	
}
