package com.chenheng.common.util;

import java.io.Serializable;
import java.util.List;

import com.chenheng.common.bean.Weibo;

/**
 * 分页bean
 */
public class PageBean implements Serializable{
	
	/**
	 * s
	 */
	private static final long serialVersionUID = 7950030073698906L;
	private int page; //当前页数
	private int totalCount;	 //总记录数
	private int totalPage;  //总页数
	private int limit;	//每页显示记录数
	private List<Weibo> list;	//每一页要显示的结果集
	
	private int minPage;
	private int maxPage;
	
	public PageBean(){}
	
	
	
	public PageBean(int page, int totalCount, int totalPage, int limit, List<Weibo> list) {
		this.page = page;
		this.totalCount = totalCount;
		this.totalPage = totalPage;
		this.limit = limit;
		this.list = list;
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



	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getLimit() {
		return limit;
	}
	public void setLimit(int limit) {
		this.limit = limit;
	}
	public List<Weibo> getList() {
		return list;
	}
	public void setList(List<Weibo> list) {
		this.list = list;
	}



	@Override
	public String toString() {
		return "PageBean [page=" + page + ", totalCount=" + totalCount + ", totalPage=" + totalPage + ", limit=" + limit
				+ ", list=" + list + ", minPage=" + minPage + ", maxPage=" + maxPage + "]";
	}
	
	
}
