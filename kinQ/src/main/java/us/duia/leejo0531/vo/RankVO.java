package us.duia.leejo0531.vo;

public class RankVO {
	private int ranking;
	private int userNum;
	private String userId;
	private int qCount;
	private int rCount;
	private int sCount;
	private int totalPoint;
	public RankVO() {
		super();
	}
	public RankVO(int ranking, int userNum, String userId, int qCount, int rCount, int sCount, int totalPoint) {
		super();
		this.ranking = ranking;
		this.userNum = userNum;
		this.userId = userId;
		this.qCount = qCount;
		this.rCount = rCount;
		this.sCount = sCount;
		this.totalPoint = totalPoint;
	}
	
	public int getRanking() {
		return ranking;
	}
	public void setRanking(int ranking) {
		this.ranking = ranking;
	}
	public int getUserNum() {
		return userNum;
	}
	public void setUserNum(int userNum) {
		this.userNum = userNum;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getqCount() {
		return qCount;
	}
	public void setqCount(int qCount) {
		this.qCount = qCount;
	}
	public int getrCount() {
		return rCount;
	}
	public void setrCount(int rCount) {
		this.rCount = rCount;
	}
	public int getsCount() {
		return sCount;
	}
	public void setsCount(int sCount) {
		this.sCount = sCount;
	}
	public int getTotalPoint() {
		return totalPoint;
	}
	public void setTotalPoint(int totalPoint) {
		this.totalPoint = totalPoint;
	}
	@Override
	public String toString() {
		return "RankVO [ranking=" + ranking + ", userNum=" + userNum + ", userId=" + userId + ", qCount=" + qCount
				+ ", rCount=" + rCount + ", sCount=" + sCount + ", totalPoint=" + totalPoint + "]";
	}
	
}
