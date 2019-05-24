package com.chenheng.common.util;

import java.io.Serializable;
/**
 * 评论分页bean2.0
 */
public class CommPage implements Serializable{
	
	private static final long serialVersionUID = 8889027836149101391L;
	private int page;	//当前页
	private int totalPage;	//总页
	private int minPage;	//分页最小值
	private int maxPage;	//分页最大值
	
	public CommPage() {
	}

	public CommPage(int page, int totalPage, int minPage, int maxPage) {
		this.page = page;
		this.totalPage = totalPage;
		this.minPage = minPage;
		this.maxPage = maxPage;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getMinPage() {
		return minPage;
	}

	public void setMinPage(int minPage) {
		this.minPage = minPage;
	}

	public int getMaxPage() {
		return maxPage;
	}

	public void setMaxPage(int maxPage) {
		this.maxPage = maxPage;
	}
	
	
}
