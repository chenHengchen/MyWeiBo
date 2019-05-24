package com.chenheng.common.bean;

import java.io.Serializable;
import java.sql.Date;

public class WeiboCollect implements Serializable{
	
	private static final long serialVersionUID = -8500926783617342532L;
	private long id;
	private Weibo weibo;
	private long collectUserId;
	private Date collectDate;
	
	public WeiboCollect() {
	}

	public WeiboCollect(long id, Weibo weibo, long collectUserId, Date collectDate) {
		this.id = id;
		this.weibo = weibo;
		this.collectUserId = collectUserId;
		this.collectDate = collectDate;
	}

	public WeiboCollect(Weibo weibo, long collectUserId, Date collectDate) {
		this.weibo = weibo;
		this.collectUserId = collectUserId;
		this.collectDate = collectDate;
	}
	
	public WeiboCollect(Weibo weibo, long collectUserId) {
		this.weibo = weibo;
		this.collectUserId = collectUserId;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public Weibo getWeibo() {
		return weibo;
	}

	public void setWeibo(Weibo weibo) {
		this.weibo = weibo;
	}

	public long getCollectUserId() {
		return collectUserId;
	}

	public void setCollectUserId(long collectUserId) {
		this.collectUserId = collectUserId;
	}

	public Date getCollectDate() {
		return collectDate;
	}

	public void setCollectDate(Date collectDate) {
		this.collectDate = collectDate;
	}

	@Override
	public String toString() {
		return "WeiboCollect [id=" + id + ", weibo=" + weibo + ", collectUserId=" + collectUserId + ", collectDate="
				+ collectDate + "]";
	}
	
	
}
