package com.chenheng.common.bean;

import java.io.Serializable;

public class Friend implements Serializable{

	private static final long serialVersionUID = 6004607048005816278L;
	/**
	 * 关注与粉丝
	 */
	
	private long id;
	private User aUser;
	private User bUser;
	
	
	
	public Friend() {}
	
	
	public Friend(long id, User aUser, User bUser) {
		this.id = id;
		this.aUser = aUser;
		this.bUser = bUser;
	}


	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public User getaUser() {
		return aUser;
	}
	public void setaUser(User aUser) {
		this.aUser = aUser;
	}
	public User getbUser() {
		return bUser;
	}
	public void setbUser(User bUser) {
		this.bUser = bUser;
	}


	@Override
	public String toString() {
		return "Friend [id=" + id + ", aUser=" + aUser + ", bUser=" + bUser + "]";
	}
	
	
}
