package com.chenheng.common.bean;

import java.io.Serializable;
/**
 *用户获取积分记录 
 */
import java.util.Date;
public class PointRecord implements Serializable{
	
	private static final long serialVersionUID = -5486027495328217465L;
	private long id;
	private PointAction action;		//获取积分方式
	private String email;	//获取积分的用户
	private Date recordDate;	//获取积分时间
	
	public PointRecord(){
	}

	public PointRecord(long id, PointAction action, String email, Date recordDate) {
		this.id = id;
		this.action = action;
		this.email = email;
		this.recordDate = recordDate;
	}

	public PointRecord(PointAction action, String email, Date recordDate) {
		this.action = action;
		this.email = email;
		this.recordDate = recordDate;
	}
	
	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public PointAction getAction() {
		return action;
	}

	public void setAction(PointAction action) {
		this.action = action;
	}

	public String getNickName() {
		return email;
	}

	public void setNickName(String nickName) {
		this.email = nickName;
	}

	public Date getRecordDate() {
		return recordDate;
	}

	public void setRecordDate(Date recordDate) {
		this.recordDate = recordDate;
	}

	@Override
	public String toString() {
		return "PointRecord [id=" + id + ", action=" + action + ", email=" + email + ", recordDate=" + recordDate + "]";
	}
	
	
	
}
