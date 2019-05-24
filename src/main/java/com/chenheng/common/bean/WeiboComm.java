package com.chenheng.common.bean;

import java.io.Serializable;
/**
 * 修订 由于java.sql.Data类型在java对象转换成json对象时的异常
 * 由于不能修改User对象而引发的大改
 * @author hasee
 *
 */
public class WeiboComm implements Serializable{
	
	private static final long serialVersionUID = 6559587096337502792L;
	
	private long id;	//评论编号
	private long weiboId;	//微博编号
	private long commentId;		//评论人编号
	private long beCommentId;	//被评论人id
	//private Date commentDate;	//评论时间
	private String commentDate;
	private String commentBody;		//评论内容
	private int commentLike;	//评论点赞数
	private int commentState;	//评论状态
	private User commUser;	 //评论人
	
	
	public WeiboComm() {
	}

	

	public WeiboComm(long weiboId, long commentId, long beCommentId, String commentDate, String commentBody,
			int commentLike, int commentState, User commUser) {
		this.weiboId = weiboId;
		this.commentId = commentId;
		this.beCommentId = beCommentId;
		this.commentDate = commentDate;
		this.commentBody = commentBody;
		this.commentLike = commentLike;
		this.commentState = commentState;
		this.commUser = commUser;
	}

	public WeiboComm(long id, long weiboId, long commentId, long beCommentId, String commentDate, String commentBody,
			int commentLike, int commentState, User commUser) {
		this.id = id;
		this.weiboId = weiboId;
		this.commentId = commentId;
		this.beCommentId = beCommentId;
		this.commentDate = commentDate;
		this.commentBody = commentBody;
		this.commentLike = commentLike;
		this.commentState = commentState;
		this.commUser = commUser;
	}


	
	
	
	public User getCommUser() {
		return commUser;
	}



	public void setCommUser(User commUser) {
		this.commUser = commUser;
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

	public long getCommentId() {
		return commentId;
	}

	public void setCommentId(long commentId) {
		this.commentId = commentId;
	}

	public long getBeCommentId() {
		return beCommentId;
	}

	public void setBeCommentId(long beCommentId) {
		this.beCommentId = beCommentId;
	}

	public String getCommentDate() {
		return commentDate;
	}

	public void setCommentDate(String commentDate) {
		this.commentDate = commentDate;
	}

	public String getCommentBody() {
		return commentBody;
	}

	public void setCommentBody(String commentBody) {
		this.commentBody = commentBody;
	}

	public int getCommentLike() {
		return commentLike;
	}

	public void setCommentLike(int commentLike) {
		this.commentLike = commentLike;
	}

	public int getCommentState() {
		return commentState;
	}

	public void setCommentState(int commentState) {
		this.commentState = commentState;
	}

	@Override
	public String toString() {
		return "WeiboComm [id=" + id + ", weiboId=" + weiboId + ", commentId=" + commentId + ", beCommentId="
				+ beCommentId + ", commentDate=" + commentDate + ", commentBody=" + commentBody + ", commentLike="
				+ commentLike + ", commentState=" + commentState + "]";
	}
	
	
}
