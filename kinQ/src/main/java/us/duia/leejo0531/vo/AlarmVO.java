package us.duia.leejo0531.vo;

public class AlarmVO {
	private int alarmNum;
	private int userNum;
	private String alarmType; //reply,realtime,interest
	private int alarmAdress;

	public AlarmVO() {
	}
	
	public AlarmVO(int alarmNum, int userNum, String alarmType, int alarmAdress) {
		this.alarmNum = alarmNum;
		this.userNum = userNum;
		this.alarmType = alarmType;
		this.alarmAdress = alarmAdress;
	}

	public int getAlarmNum() {
		return alarmNum;
	}
	public void setAlarmNum(int alarmNum) {
		this.alarmNum = alarmNum;
	}
	public int getUserNum() {
		return userNum;
	}
	public void setUserNum(int userNum) {
		this.userNum = userNum;
	}
	public String getAlarmType() {
		return alarmType;
	}
	public void setAlarmType(String alarmType) {
		this.alarmType = alarmType;
	}
	public int getAlarmAdress() {
		return alarmAdress;
	}
	public void setAlarmAdress(int alarmAdress) {
		this.alarmAdress = alarmAdress;
	}

	@Override
	public String toString() {
		return "AlarmVo [alarmNum=" + alarmNum + ", userNum=" + userNum + ", alarmType=" + alarmType + ", alarmAdress="
				+ alarmAdress + "]";
	}
	
	
}
