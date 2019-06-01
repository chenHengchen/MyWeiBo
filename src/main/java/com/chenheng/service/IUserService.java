package com.chenheng.service;

import java.util.List;
import java.util.Map;

import com.chenheng.common.bean.Conch;
import com.chenheng.common.bean.PointAction;
import com.chenheng.common.bean.PointRecord;
import com.chenheng.common.bean.User;
import com.chenheng.common.bean.Weibo;
import com.chenheng.common.bean.WeiboComm;
import com.chenheng.common.exception.UserServiceException;
import com.chenheng.common.util.PageBean;

public interface IUserService {

	//用户注册
	void register(User user) throws UserServiceException;
	
	//通过邮箱查找用户
	User findUserByEmail(String email) throws UserServiceException;
	
	//通过昵称查找用户
	User findUserByNickName(String nickName) throws UserServiceException;
	
	//通过id查找用户
	User findUserById(long id) throws UserServiceException;
	
	//增加用户的普通积分
	User addIntegral(User user, String operation) throws UserServiceException;
	
	//增加用户的海螺积分
	User addCIntegral(User user, String operation) throws UserServiceException;
	
	//通过操作查找积分
	PointAction findIntegralByOperation(String operation) throws UserServiceException;
	
	//积分流水记录(旧)
	void addIntegralRecord(PointRecord record) throws UserServiceException;
	
	//积分流水记录(新)
	void saveIRecord(User user, String operator) throws UserServiceException;
	
	//用户登录
	public User login(String userId, String password) throws UserServiceException;
	
	//更改用户信息
	public void updateUser(User user) throws UserServiceException;
	
	//首页微博
	List<Weibo> findWeiboByHome(PageBean page, String tag) throws UserServiceException;	//tag:预留微博标签类型
	
	//消息通知
	Map<String, Object> alerts(long uId) throws UserServiceException;
	
	//用户发布神奇海螺
	void publishConch(User user,Conch conch) throws UserServiceException;
	
	//海螺首页      
	Map<String, Object> conchIndex(long uId, String operation, PageBean page) throws UserServiceException;
	
	//查看海螺的数量
	int conchNum(long uId, String operation) throws UserServiceException;
	
	//海螺详细页面
	Map<String, Object> conchDetail(long conchId) throws UserServiceException;
	
	//发表海螺回复
	void conchComm(WeiboComm comm) throws UserServiceException;
	
	//采纳海螺答案
	void adoptComm(long conchId, long commId) throws UserServiceException;
	
	//搜索功能
	Map<String, Object> seachWeiboAndUser(String key, int page, String ac) throws UserServiceException;
	
}
