package com.chenheng.service;

import java.util.List;

import com.chenheng.common.bean.User;
import com.chenheng.common.bean.Weibo;
import com.chenheng.common.bean.WeiboComm;
import com.chenheng.common.exception.WeiboServiceException;
import com.chenheng.common.util.CommPage;
import com.chenheng.common.util.PageBean;

public interface IWeiboService {
	
	//发布微博
	void publishWeibo(Weibo weibo) throws WeiboServiceException;
	
	//通过用户id查找用户微博
	List<Weibo> findWeiboByUserId(long id, PageBean page) throws WeiboServiceException;
	
	//查找感兴趣的人
	List<User> findUserTuiJian(long id) throws WeiboServiceException;
	
	//用户对用户操作：关注/取消关注/拉黑/私信
	User operationUser(String operation, User aUser, User bUser) throws WeiboServiceException;
	
	//查找用户的微博总数
	//int findUserWeiboNumber(long id) throws WeiboServiceException;
	int findUserWeiboNumber(long id, String action) throws WeiboServiceException;
	
	//翻页
	List<Weibo> paging(long uId, int minPage, int maxPage, String action) throws WeiboServiceException;

	//微博点赞
	int weiboLike(long weiboId, long likeId) throws WeiboServiceException;
	
	//判断用户是否对该微博点过赞
	boolean userLikeWeibo(long wId, long uId) throws WeiboServiceException;
	
	//微博转发功能
	int weiboTrans(long wId, long uId) throws WeiboServiceException;
	
	//微博评论功能
	int weiboComment(WeiboComm comm) throws WeiboServiceException;
	
	//查找微博评论
	List<WeiboComm> findWeiboComm(long wId, CommPage commPage) throws WeiboServiceException;
	
	//删除微博
	void deleteWeibo(String operation, long wId) throws WeiboServiceException;
	
	//查找首页微博信息
	List<Weibo> findHomeWeibo(int tag, PageBean page, String weiboTime) throws WeiboServiceException;
	
	//查找state为0的所有微博的数量
	int findHomeWeiboNum(int state) throws WeiboServiceException;
	
	//微博收藏功能
	void weiboCollect(User user, long wId) throws WeiboServiceException;
	
	//查找评论次数
	int findCommNum(long wId) throws WeiboServiceException;
	
	
}
