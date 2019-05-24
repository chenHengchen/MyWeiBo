package com.chenheng.common.bean;
/** 
 * @author :
 * @version 1.0 
 * @parameter 
 * @return 
 */
public class Conch {
	private long id;
	private long userId;
	private long adoptId;
	private int cNumber;	//悬赏积分数
	private String conchBody;	//问题内容
	private String conchTime;
	private int state;	//状态 0未解决	1解决
	
	private User chUser;
	
	public Conch() {
	}

	public Conch(long id, long userId, int cNumber, String conchBody, String conchTime, int state) {
		this.id = id;
		this.userId = userId;
		this.cNumber = cNumber;
		this.conchBody = conchBody;
		this.conchTime = conchTime;
		this.state = state;
	}

	public Conch(long userId, long adoptId, int cNumber, String conchBody, String conchTime, int state, User chUser) {
		this.userId = userId;
		this.adoptId = adoptId;
		this.cNumber = cNumber;
		this.conchBody = conchBody;
		this.conchTime = conchTime;
		this.state = state;
		this.chUser = chUser;
	}

	
	
	public long getAdoptId() {
		return adoptId;
	}

	public void setAdoptId(long adoptId) {
		this.adoptId = adoptId;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public long getUserId() {
		return userId;
	}

	public void setUserId(long userId) {
		this.userId = userId;
	}

	public int getcNumber() {
		return cNumber;
	}

	public void setcNumber(int cNumber) {
		this.cNumber = cNumber;
	}

	public String getConchBody() {
		return conchBody;
	}

	public void setConchBody(String conchBody) {
		this.conchBody = conchBody;
	}

	public String getConchTime() {
		return conchTime;
	}

	public void setConchTime(String conchTime) {
		this.conchTime = conchTime;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public User getChUser() {
		return chUser;
	}

	public void setChUser(User chUser) {
		this.chUser = chUser;
	}

	@Override
	public String toString() {
		return "Conch [id=" + id + ", userId=" + userId + ", cNumber=" + cNumber + ", conchBody=" + conchBody
				+ ", conchTime=" + conchTime + ", state=" + state + ", chUser=" + chUser + "]";
	}
	
}
