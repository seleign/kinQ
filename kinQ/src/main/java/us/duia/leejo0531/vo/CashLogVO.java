package us.duia.leejo0531.vo;

import java.util.Date;

// 현금으로 충전한 캐쉬
public class CashLogVO {
	
	private int cashLogNum; // 시퀀스
	private int userNum; // 사용자
	private int cCharged; // 캐쉬 충전 금액
	private String cChargedDate; // 캐쉬 충전일
	private int cUsed; // 캐쉬 사용금액
	private String cUsedDate; // 캐쉬 사용일
	private int cChange; // 잔액
	
	public CashLogVO(){}

	public CashLogVO(int cashLogNum, int userNum, int cCharged, String cChargedDate, int cUsed, String cUsedDate,
			int cChange) {
		super();
		this.cashLogNum = cashLogNum;
		this.userNum = userNum;
		this.cCharged = cCharged;
		this.cChargedDate = cChargedDate;
		this.cUsed = cUsed;
		this.cUsedDate = cUsedDate;
		this.cChange = cChange;
	}

	public int getCashLogNum() {
		return cashLogNum;
	}

	public void setCashLogNum(int cashLogNum) {
		this.cashLogNum = cashLogNum;
	}

	public int getUserNum() {
		return userNum;
	}

	public void setUserNum(int userNum) {
		this.userNum = userNum;
	}

	public int getcCharged() {
		return cCharged;
	}

	public void setcCharged(int cCharged) {
		this.cCharged = cCharged;
	}

	public String getcChargedDate() {
		return cChargedDate;
	}

	public void setcChargedDate(String cChargedDate) {
		this.cChargedDate = cChargedDate;
	}

	public int getcUsed() {
		return cUsed;
	}

	public void setcUsed(int cUsed) {
		this.cUsed = cUsed;
	}

	public String getcUsedDate() {
		return cUsedDate;
	}

	public void setcUsedDate(String cUsedDate) {
		this.cUsedDate = cUsedDate;
	}

	public int getcChange() {
		return cChange;
	}

	public void setcChange(int cChange) {
		this.cChange = cChange;
	}

	@Override
	public String toString() {
		return "CashLogVO [cashLogNum=" + cashLogNum + ", userNum=" + userNum + ", cCharged=" + cCharged
				+ ", cChargedDate=" + cChargedDate + ", cUsed=" + cUsed + ", cUsedDate=" + cUsedDate + ", cChange="
				+ cChange + "]";
	}


	
}