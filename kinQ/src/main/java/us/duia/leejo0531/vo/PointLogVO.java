package us.duia.leejo0531.vo;

import java.util.Date;

// 답변 다는 것을 통해 얻은 포인트 및 캐쉬를 포인트화한 금액
// 포인트로 질문을 할 수 있고, 포인트샵의 물건 구매 가능
public class PointLogVO {
	
	private int pointLogNum;
	private int pUserNum;
	private int pCharged;
	private Date pChargedDate;
	private int pUsed;
	private Date pUsedDate;
	private int pChanged;
	
	public PointLogVO(){}

	public PointLogVO(int pointLogNum, int pUserNum, int pCharged, Date pChargedDate, int pUsed, Date pUsedDate,
			int pChanged) {
		super();
		this.pointLogNum = pointLogNum;
		this.pUserNum = pUserNum;
		this.pCharged = pCharged;
		this.pChargedDate = pChargedDate;
		this.pUsed = pUsed;
		this.pUsedDate = pUsedDate;
		this.pChanged = pChanged;
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

	public Date getpChargedDate() {
		return pChargedDate;
	}

	public void setpChargedDate(Date pChargedDate) {
		this.pChargedDate = pChargedDate;
	}

	public int getpUsed() {
		return pUsed;
	}

	public void setpUsed(int pUsed) {
		this.pUsed = pUsed;
	}

	public Date getpUsedDate() {
		return pUsedDate;
	}

	public void setpUsedDate(Date pUsedDate) {
		this.pUsedDate = pUsedDate;
	}

	public int getpChanged() {
		return pChanged;
	}

	public void setpChanged(int pChanged) {
		this.pChanged = pChanged;
	}

	@Override
	public String toString() {
		return "PointLogVO [pointLogNum=" + pointLogNum + ", pUserNum=" + pUserNum + ", pCharged=" + pCharged
				+ ", pChargedDate=" + pChargedDate + ", pUsed=" + pUsed + ", pUsedDate=" + pUsedDate + ", pChanged="
				+ pChanged + "]";
	}
	
	
}
