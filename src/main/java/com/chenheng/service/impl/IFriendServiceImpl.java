package com.chenheng.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import com.chenheng.common.bean.Friend;
import com.chenheng.common.bean.Message;
import com.chenheng.common.bean.User;
import com.chenheng.common.bean.Weibo;
import com.chenheng.common.exception.DataAccessException;
import com.chenheng.common.exception.FriendServiceException;
import com.chenheng.common.util.FaceFormat;
import com.chenheng.common.util.PageBean;
import com.chenheng.common.util.TimeFormat;
import com.chenheng.dao.IFriendDao;
import com.chenheng.dao.IUserDao;
import com.chenheng.service.IFriendService;
import org.springframework.stereotype.Service;

@Service
public class IFriendServiceImpl implements IFriendService{

	@Resource
	private IFriendDao dao;
	public void setDao(IFriendDao dao) {
		this.dao = dao;
	}

	@Resource
	private IUserDao userDao;
	public void setUserDao(IUserDao userDao) {
		this.userDao = userDao;
	}
	/**
	 * 查找用户关注用户最近更新的微博
	 */
	public List<Weibo> findFriendWeibo(long uId,PageBean page) throws FriendServiceException {
		List<Weibo> list = null;
		try {
			list = dao.findFriendWeibo(uId, page.getMinPage(), page.getMaxPage());
		} catch (DataAccessException e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<User> findAttUser(long uId,PageBean page) throws FriendServiceException {
		List<User> attUser = null;
		try {
			attUser = dao.findAttUser(uId, page.getMinPage(), page.getMaxPage());
		} catch (DataAccessException e) {
			e.printStackTrace();
		}
		return attUser;
	}

	public List<User> findFansUser(long uId,PageBean page) throws FriendServiceException {
		List<User> list = null;
		try {
			list = dao.findFansUser(uId, page.getMinPage(),page.getMaxPage());
			for(int i=0;i<list.size();i++){
				Friend f = dao.findHXGZ(uId, list.get(i).getId());
				if(f != null){
					list.get(i).setState(1);
				}else{
					list.get(i).setState(0);
				}
			}
		} catch (DataAccessException e) {
			e.printStackTrace();
		}
		return list;
	}

	/**
	 * 查找用户关注微博数量
	 */
	public int findWeiboNumber(long uId) throws FriendServiceException {
		int number = 0;
		try {
			number = dao.findWeiboNumber(uId);
		} catch (DataAccessException e) {
			e.printStackTrace();
		}
		return number;
	}

	/**
	 * 查找用户关注数
	 */
	public int findAttUserNum(long uId) throws FriendServiceException {
		int attUser = 0;
		try {
			attUser = dao.findAttNum(uId);
		} catch (DataAccessException e) {
			e.printStackTrace();
		}
		return attUser;
	}

	/**
	 * aId bId,私信双方用户id
	 */
	public Map<String, Object> findMessageById(long aId, long bId) throws FriendServiceException {
		Map<String,Object> map = new HashMap<>();
		try {
			List<User> userList = dao.findUserByMessage(aId);
			if(bId == -1 && userList.size()!=0){
				//通过点击私信进入
				bId = userList.get(0).getId();
			}
			List<Message> list = dao.findMessageById(aId, bId);
			for(int i=0;i<list.size();i++){
				list.get(i).setUserA(userDao.findUserById(list.get(i).getUserAId()));
				list.get(i).setUserB(userDao.findUserById(list.get(i).getUserBId()));
				list.get(i).setMessageDate(TimeFormat.dateToString(list.get(i).getMessageDate()));
			}
			list = FaceFormat.messageFormt(list);
			User user = userDao.findUserById(bId);
			
			for(int i=0;i<userList.size();i++){
				//查找来自该用户的未读私信
				userList.get(i).setUnReadMessage(dao.findURMNByUID(aId, userList.get(i).getId()));
			}
			map.put("list",list);
			map.put("bUser",user);
			map.put("attUsers",userList);
			
			//设置私信信息为已读
			dao.setMessageRead(aId, bId);
		} catch (DataAccessException e) {
			
		}
		
		return map;
	}
	
	public void sendMessage(Message message) throws FriendServiceException {
		try {
			//查看用户a是否被用户b拉黑
			int state = dao.findFriendState(message.getUserAId(), message.getUserBId());
			if(state == 99){
				message.setState(99);	//被用户被拉黑时设置用户所发私信状态为99
			}
			dao.sendMessage(message);
		} catch (DataAccessException e) {
			e.printStackTrace();
		}
	}
	
	public int findFansNum(long uId) throws FriendServiceException {
		int num = 0;
		try {
			num = dao.finFansNum(uId);
		} catch (DataAccessException e) {
			e.printStackTrace();
		}
		return num;
	}
	
	public List<User> findBlackUser(long uId,PageBean page) throws FriendServiceException {
		List<User> attUser = null;
		try {
			attUser = dao.findBlacksUser(uId, page.getMinPage(), page.getMaxPage());
		} catch (DataAccessException e) {
			e.printStackTrace();
		}
		return attUser;
	}
	
	public int findBlackNum(long uId) throws FriendServiceException {
		int num = 0;
		try {
			num = dao.findBlackNum(uId);
		} catch (DataAccessException e) {
			e.printStackTrace();
		}
		return num;
	}
	
}
