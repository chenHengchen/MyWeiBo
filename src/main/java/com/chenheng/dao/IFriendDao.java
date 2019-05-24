package com.chenheng.dao;

import java.util.List;

import com.chenheng.common.bean.Friend;
import com.chenheng.common.bean.Message;
import com.chenheng.common.bean.User;
import com.chenheng.common.bean.Weibo;
import com.chenheng.common.exception.DataAccessException;

public interface IFriendDao {
	
	//查找用户关注用户微博
	List<Weibo> findFriendWeibo(long uId, int minPage, int maxPage) throws DataAccessException;
	
	//查找微博关注用户数量
	int findWeiboNumber(long id) throws DataAccessException;
	
	//查找关注用户集合
	List<User> findAttUser(long uId, int minPage, int maxPage) throws DataAccessException;
	
	//查找用户关注数
	int findAttNum(long uId) throws DataAccessException;
	
	//查找用户私信
	List<Message> findMessageById(long aId, long bId) throws DataAccessException;
	
	//用户发送私信
	void sendMessage(Message message) throws DataAccessException;
	
	//设置私信已读
	void setMessageRead(long aId, long bId) throws DataAccessException;
	
	//查看未读私信数目
	int findUnreadMNum(long aId) throws DataAccessException;
	
	//查找有过私信的好友对象
	List<User> findUserByMessage(long uId) throws DataAccessException;
	
	//查找对应用户的私信数目
	int findURMNByUID(long aId, long bId) throws DataAccessException;
	
	//拉黑好友
	void updateFriendToBlack(long aId, long bId, int state)throws DataAccessException;
	
	//设置关注好友状态为99
	void updateFriendState(long aId, long bId, int state) throws DataAccessException;
	
	//查看用户是否被拉黑
	int findFriendState(long aId, long bId) throws DataAccessException;
	
	//查找粉丝用户数
	int finFansNum(long uId) throws DataAccessException;
	
	//查找用户粉丝
	List<User> findFansUser(long uId, int min, int max) throws DataAccessException;
	
	//查找用户是否关注另一个用户
	Friend findHXGZ(long aId, long bId) throws DataAccessException;
	
	//查看拉黑用户
	List<User> findBlacksUser(long uId, int min, int max) throws DataAccessException;
	
	//查找拉黑用户数
	int findBlackNum(long uId) throws DataAccessException;
}
