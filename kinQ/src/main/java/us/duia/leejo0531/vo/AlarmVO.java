package us.duia.leejo0531.vo;

public class AlarmVO {
	private int alarmNum;
	private int userNum;
	private String alarmType; //reply,realtime,interest
	private int alarmAdress;
	private int readcheck;

	public AlarmVO() {
	}

	public AlarmVO(int alarmNum, int userNum, String alarmType, int alarmAdress, int readcheck) {
		super();
		this.alarmNum = alarmNum;
		this.userNum = userNum;
		this.alarmType = alarmType;
		this.alarmAdress = alarmAdress;
		this.readcheck = readcheck;
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

	public int getReadcheck() {
		return readcheck;
	}

	public void setReadcheck(int readcheck) {
		this.readcheck = readcheck;
	}

	@Override
	public String toString() {
		return "AlarmVO [alarmNum=" + alarmNum + ", userNum=" + userNum + ", alarmType=" + alarmType + ", alarmAdress="
				+ alarmAdress + ", readcheck=" + readcheck + "]";
	}
	
	
}
