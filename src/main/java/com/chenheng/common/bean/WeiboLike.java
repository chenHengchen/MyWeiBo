package com.chenheng.common.bean;

import java.io.Serializable;
import java.sql.Date;

public class WeiboLike implements Serializable{
	
	/**
	 * 微博点赞bean
	 */
	
	private static final long serialVersionUID = -7370231331872649387L;
	
	private long id;
	private long weiboId;
	private long likeUserId;
	private long beLikeId;
	private Date likeDate;
	
	public WeiboLike() {}

	public WeiboLike(long weiboId, long likeUserId, long beLikeId, Date likeDate) {
		this.weiboId = weiboId;
		this.likeUserId = likeUserId;
		this.beLikeId = beLikeId;
		this.likeDate = likeDate;
	}

	public WeiboLike(long id, long weiboId, long likeUserId, long beLikeId, Date likeDate) {
		this.id = id;
		this.weiboId = weiboId;
		this.likeUserId = likeUserId;
		this.beLikeId = beLikeId;
		this.likeDate = likeDate;
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

	public long getLikeUserId() {
		return likeUserId;
	}

	public void setLikeUserId(long likeUserId) {
		this.likeUserId = likeUserId;
	}

	public long getBeLikeId() {
		return beLikeId;
	}

	public void setBeLikeId(long beLikeId) {
		this.beLikeId = beLikeId;
	}

	public Date getLikeDate() {
		return likeDate;
	}

	public void setLikeDate(Date likeDate) {
		this.likeDate = likeDate;
	}

	@Override
	public String toString() {
		return "WeiboLike [id=" + id + ", weiboId=" + weiboId + ", likeUserId=" + likeUserId + ", beLikeId=" + beLikeId
				+ ", likeDate=" + likeDate + "]";
	}
	
	
	
}
