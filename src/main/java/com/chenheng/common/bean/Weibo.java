package com.chenheng.common.bean;

import java.io.Serializable;
/**
 * 微博类
 */
import java.sql.Date;
import java.util.List;

public class Weibo implements Serializable{
	
	private static final long serialVersionUID = 2112400850487003217L;
	private long id;	//微博编号
	private User user;		//用户
	private int tranum;		//转发次数
	private int comnum;		//被评论次数
	private int colnum;		//被收藏次数
	private int likeN;		//被赞数
	private Date pubTime;		//发布时间
	private String body;	//微博内容
	private String image;	//微博图片
	private long u_id;		//用户id
	private boolean b;
	private List<WeiboComm> comm;
	private String str_pubTime;		//加工后的date类型
	private int state;
	
	public Weibo(){}

	public Weibo(long id, User user, int tranum, int comnum, int colnum, int likeN, Date pubTime, String body,
			String image) {
		this.id = id;
		this.user = user;
		this.tranum = tranum;
		this.comnum = comnum;
		this.colnum = colnum;
		this.likeN = likeN;
		this.pubTime = pubTime;
		this.body = body;
		this.image = image;
	}

	public Weibo(User user, int tranum, int comnum, int colnum, int likeN, Date pubTime, String body, String image) {
		this.user = user;
		this.tranum = tranum;
		this.comnum = comnum;
		this.colnum = colnum;
		this.likeN = likeN;
		this.pubTime = pubTime;
		this.body = body;
		this.image = image;
	}

	
	
	

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public String getStr_pubTime() {
		return str_pubTime;
	}

	public void setStr_pubTime(String str_pubTime) {
		this.str_pubTime = str_pubTime;
	}

	public List<WeiboComm> getComm() {
		return comm;
	}

	public void setComm(List<WeiboComm> comm) {
		this.comm = comm;
	}

	public boolean isB() {
		return b;
	}

	public void setB(boolean b) {
		this.b = b;
	}

	public Weibo(long id, User user, int tranum, int comnum, int colnum, int likeN, Date pubTime, String body,
			String image, long u_id) {
		super();
		this.id = id;
		this.user = user;
		this.tranum = tranum;
		this.comnum = comnum;
		this.colnum = colnum;
		this.likeN = likeN;
		this.pubTime = pubTime;
		this.body = body;
		this.image = image;
		this.u_id = u_id;
	}

	
	
	public long getU_id() {
		return u_id;
	}

	public void setU_id(long u_id) {
		this.u_id = u_id;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public int getTranum() {
		return tranum;
	}

	public void setTranum(int tranum) {
		this.tranum = tranum;
	}

	public int getComnum() {
		return comnum;
	}

	public void setComnum(int comnum) {
		this.comnum = comnum;
	}

	public int getColnum() {
		return colnum;
	}

	public void setColnum(int colnum) {
		this.colnum = colnum;
	}

	public int getLikeN() {
		return likeN;
	}

	public void setLikeN(int likeN) {
		this.likeN = likeN;
	}

	

	public Date getPubTime() {
		return pubTime;
	}

	public void setPubTime(Date pubTime) {
		this.pubTime = pubTime;
	}

	public String getBody() {
		return body;
	}

	public void setBody(String body) {
		this.body = body;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	@Override
	public String toString() {
		return "Weibo [id=" + id + ", user=" + user + ", tranum=" + tranum + ", comnum=" + comnum + ", colnum=" + colnum
				+ ", likeN=" + likeN + ", pubTime=" + pubTime + ", body=" + body + ", image=" + image + ", u_id=" + u_id
				+ "]";
	}

	
	
	
}
