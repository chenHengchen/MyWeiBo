package com.chenheng.dao;

import java.util.List;

import com.chenheng.common.bean.Conch;
import com.chenheng.common.bean.User;
import com.chenheng.common.bean.Weibo;
import com.chenheng.common.exception.DataAccessException;

/** 
 * @author :
 * @version 1.0 
 * @parameter 
 * @return 
 */

public interface IAdminDao {
	
	//通过用户名和密码查看
	User findAdminUser(String name, String password) throws DataAccessException;
	
	//查找数量
	int finTargetNum(String tName, String cState, String time) throws DataAccessException;
	
	//查找所有用户数
	int findAllUserNum() throws DataAccessException;
	
	int findAllUserNumByKey(String key) throws DataAccessException;
	
	//查找所有微博数
	int findAllWeiboNum() throws DataAccessException;
	
	//查找所有海螺数
	int findAllConchNum() throws DataAccessException;
	
	int findConchNumByKey(String key) throws DataAccessException;
	
	//查找所有评论数
	int findAllCommNum() throws DataAccessException;
	
	//查找所有回答数
	int findAllAnwerNum() throws DataAccessException;
	
	//获取今天星期几
	String findWeek(int i) throws DataAccessException;
	
	//获取当天的微博和海阔数目
	int finWeiboOrConchDay(String table, String time, int wday);
	
	//查找所用用户
	List<User> findAllUser(int min, int max) throws DataAccessException;
	
	List<User> findAllUserByKey(String key, int min, int max) throws DataAccessException;
	
	//封禁用户，设置用户状态为1，设置封禁时间
	void FJUserByDay(long id, int day) throws DataAccessException;
	
	//解封用户
	void JFUser(long id) throws DataAccessException;
	
	//查找搜索微博数通过关键字
	int findWeiboNumByKey(String key) throws DataAccessException;
	
	//查找微博
	List<Weibo> findWeiboByKey(String key, int min, int max) throws DataAccessException;
	
	List<Conch> findConchByKey(String key, int min, int max) throws DataAccessException;
	
	//设置微博状态
	void upWeiboWithState(long wId, int state) throws DataAccessException;
	
	int findConchState(long cId) throws DataAccessException;
	
	void upConchState(long cId, int state) throws DataAccessException;
}
