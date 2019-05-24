package com.chenheng.common.bean;
/** 
 * @author :
 * @version 1.0 
 * @parameter 
 * @return 
 */
public class Message {
	
	private long id;
	private long userAId;
	private long userBId;
	private String messageDate;
	private String message;
	private int state;	//0已发送未读，1已读
	
	private User userA;
	private User userB;

	public Message() {
	}

	public Message(long id, long userAId, long userBId, String messageDate, String message, int state, User userA,
			User userB) {
		this.id = id;
		this.userAId = userAId;
		this.userBId = userBId;
		this.messageDate = messageDate;
		this.message = message;
		this.state = state;
		this.userA = userA;
		this.userB = userB;
	}

	public Message(long userAId, long userBId, String messageDate, String message, int state, User userA, User userB) {
		this.userAId = userAId;
		this.userBId = userBId;
		this.messageDate = messageDate;
		this.message = message;
		this.state = state;
		this.userA = userA;
		this.userB = userB;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public long getUserAId() {
		return userAId;
	}

	public void setUserAId(long userAId) {
		this.userAId = userAId;
	}

	public long getUserBId() {
		return userBId;
	}

	public void setUserBId(long userBId) {
		this.userBId = userBId;
	}

	public String getMessageDate() {
		return messageDate;
	}

	public void setMessageDate(String messageDate) {
		this.messageDate = messageDate;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public User getUserA() {
		return userA;
	}

	public void setUserA(User userA) {
		this.userA = userA;
	}

	public User getUserB() {
		return userB;
	}

	public void setUserB(User userB) {
		this.userB = userB;
	}

	@Override
	public String toString() {
		return "Message [id=" + id + ", userAId=" + userAId + ", userBId=" + userBId + ", messageDate=" + messageDate
				+ ", message=" + message + ", state=" + state + ", userA=" + userA + ", userB=" + userB + "]";
	}
	
}
