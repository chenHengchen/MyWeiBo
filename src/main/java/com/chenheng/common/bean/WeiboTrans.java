package com.chenheng.common.bean;

import java.io.Serializable;
import java.sql.Date;

/**
 * 微博转发bean
 *
 */
public class WeiboTrans implements Serializable{
	
	private static final long serialVersionUID = 8139112862553053989L;
	
	private long id;	//转发id
	private long weiboId;	//微博id
	private long transUserId;	//转发用户id
	private long beTransUserId;		//被转发微博用户id
	private Date transDate;		//转发时间
	
	public WeiboTrans() {}

	public WeiboTrans(long id, long weiboId, long transUserId, long beTransUserId, Date transDate) {
		this.id = id;
		this.weiboId = weiboId;
		this.transUserId = transUserId;
		this.beTransUserId = beTransUserId;
		this.transDate = transDate;
	}

	public WeiboTrans(long weiboId, long transUserId, long beTransUserId, Date transDate) {
		super();
		this.weiboId = weiboId;
		this.transUserId = transUserId;
		this.beTransUserId = beTransUserId;
		this.transDate = transDate;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public long getWeiboId() {
		return weiboId;
	}

	public void setWeiboId(long weiboId) {
		this.weiboId = weiboId;
	}

	public long getTransUserId() {
		return transUserId;
	}

	public void setTransUserId(long transUserId) {
		this.transUserId = transUserId;
	}

	public long getBeTransUserId() {
		return beTransUserId;
	}

	public void setBeTransUserId(long beTransUserId) {
		this.beTransUserId = beTransUserId;
	}

	public Date getTransDate() {
		return transDate;
	}

	public void setTransDate(Date transDate) {
		this.transDate = transDate;
	}

	@Override
	public String toString() {
		return "WeiboTrans [id=" + id + ", weiboId=" + weiboId + ", transUserId=" + transUserId + ", beTransUserId="
				+ beTransUserId + ", transDate=" + transDate + "]";
	}
	
	
	
}
