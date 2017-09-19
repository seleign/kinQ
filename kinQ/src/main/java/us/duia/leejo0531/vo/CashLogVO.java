package us.duia.leejo0531.vo;

import java.util.Date;

// 현금으로 충전한 캐쉬
public class CashLogVO {
	
	private int cashLogNum; // 시퀀스
	private int userNum; // 사용자
	private int cChanged; // 캐쉬 충전 금액
	private Date cChargedDate; // 캐쉬 충전일
	private int cUsed; // 캐쉬 사용금액
	private Date cUsedDate; // 캐쉬 사용일
	private int cChange; // 잔액
	
	public CashLogVO(){}

	public CashLogVO(int cashLogNum, int userNum, int cChanged, Date cChargedDate, int cUsed, Date cUsedDate,
			int cChange) {
		super();
		this.cashLogNum = cashLogNum;
		this.userNum = userNum;
		this.cChanged = cChanged;
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

	public int getcChanged() {
		return cChanged;
	}

	public void setcChanged(int cChanged) {
		this.cChanged = cChanged;
	}

	public Date getcChargedDate() {
		return cChargedDate;
	}

	public void setcChargedDate(Date cChargedDate) {
		this.cChargedDate = cChargedDate;
	}

	public int getcUsed() {
		return cUsed;
	}

	public void setcUsed(int cUsed) {
		this.cUsed = cUsed;
	}

	public Date getcUsedDate() {
		return cUsedDate;
	}

	public void setcUsedDate(Date cUsedDate) {
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
		return "CashLogVO [cashLogNum=" + cashLogNum + ", userNum=" + userNum + ", cChanged=" + cChanged
				+ ", cChargedDate=" + cChargedDate + ", cUsed=" + cUsed + ", cUsedDate=" + cUsedDate + ", cChange="
				+ cChange + "]";
	}
	
}
