package com.chenheng.common.bean;

import java.io.Serializable;

/*
 * 积分操作类
 * 通过什么样的方式可以获得多少积分
 */
public class PointAction implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -2099063679070673113L;
	private long id;
	private String actionName;		//获取积分方式名称
	private int point;		//积分数
	private String description;		//描述
	
	public PointAction(){
	}
	
	public PointAction(long id,String actionName,int point,String description){
		this.id = id;
		this.actionName = actionName;
		this.point = point;
		this.description = description;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getActionName() {
		return actionName;
	}

	public void setActionName(String actionName) {
		this.actionName = actionName;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Override
	public String toString() {
		return "PointAction [id=" + id + ", actionName=" + actionName + ", point=" + point + ", description="
				+ description + "]";
	}
	
	
}
