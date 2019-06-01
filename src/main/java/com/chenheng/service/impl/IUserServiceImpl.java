package com.chenheng.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import com.chenheng.common.bean.Conch;
import com.chenheng.common.bean.PointAction;
import com.chenheng.common.bean.PointRecord;
import com.chenheng.common.bean.User;
import com.chenheng.common.bean.Weibo;
import com.chenheng.common.bean.WeiboComm;
import com.chenheng.common.exception.DataAccessException;
import com.chenheng.common.exception.UserServiceException;
import com.chenheng.common.util.Constant;
import com.chenheng.common.util.FaceFormat;
import com.chenheng.common.util.PageBean;
import com.chenheng.common.util.TimeFormat;
import com.chenheng.dao.IAdminDao;
import com.chenheng.dao.IFriendDao;
import com.chenheng.dao.IUserDao;
import com.chenheng.dao.IWeiboDao;
import com.chenheng.service.IUserService;
import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;

@Service
public class IUserServiceImpl implements IUserService{

	private PointAction action;
	private PointRecord record;
	
	@Resource
	private IUserDao userDao;
	public void setUserDao(IUserDao userDao) {
		this.userDao = userDao;
	}
	
	@Resource
	private IWeiboDao weiboDao;
	public void setWeiboDao(IWeiboDao weiboDao) {
		this.weiboDao = weiboDao;
	}

	@Resource
	private IAdminDao adminDao;
	public void setAdminDao(IAdminDao adminDao) {
		this.adminDao = adminDao;
	}
	
	@Resource
	private IFriendDao dao;
	public void setDao(IFriendDao dao) {
		this.dao = dao;
	}

	/**
	 * 注册功能
	 * 	1.设置用户的注册时间
	 * 	2.设置用户的上次登录时间
	 * 	3.更改用户积分
	 * 	4.将积分获取的流水记录保存
	 * 	5.保存用户注册信息
	 */
	public void register(User user) throws UserServiceException {
		try {
            //对密码进行md5加密
            String password = DigestUtils.md5DigestAsHex(user.getPassword().getBytes());
            user.setPassword(password);
			user.setRegisterTime(nowDate());		//使用当前时间作为用户注册时间
			user.setLastLogin(nowDate());
			user.setBirthday("2019-1-1");
			User addUser = addIntegral(user, Constant.REGISTER);		//增加用户积分
			action = userDao.findIntegral(Constant.REGISTER);		//查找注册操作得到的PointAction

			record = new PointRecord(action, addUser.getEmail(), nowDate());
			addIntegralRecord(record);	//保存积分操作
			userDao.saveUser(addUser); 	//保存用户注册信息
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 通过邮箱查找用户
	 */
	public User findUserByEmail(String email) throws UserServiceException {
		User user = null;
		try {
	 		user = userDao.findUserByEmail(email);
		} catch (DataAccessException e) {
			e.printStackTrace();
		}
		return user;
	}

	public User findUserByNickName(String nickName) throws UserServiceException {
		return null;
	}

	public User findUserById(long id) throws UserServiceException {
		User user = null;
		try {
			user = userDao.findUserById(id);
		} catch (DataAccessException e) {
			e.printStackTrace();
		}
		return user;
	}

	
	/**
	 * 增加用户的普通积分
	 */
	public User addIntegral(User user,String operation) throws UserServiceException {
		try {
			int oldIntegral = user.getIntegral();	//获取用户之前的积分
			int findIntegral = findIntegralByOperation(operation).getPoint();		//通过操作名称得到用户积分
			int newIntegral = oldIntegral+findIntegral;		//用户新的积分
			user.setIntegral(newIntegral);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;
	}
	/**
	 * 减少用户的普通积分
	 */
	public User subIntegral(User user,String operation) throws UserServiceException {
		try {
			int oldIntegral = user.getIntegral();	//获取用户之前的积分
			int findIntegral = findIntegralByOperation(operation).getPoint();		//通过操作名称得到用户积分
			int newIntegral = oldIntegral-findIntegral;		//用户新的积分
			user.setIntegral(newIntegral);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;
	}
	
	/**
	 * 增加用户的海螺积分
	 */
	public User addCIntegral(User user, String operation) throws UserServiceException {
		try {
			int oldIntegral = user.getConchIntegral();	//获取用户之前的海螺积分
			int findIntegral = findIntegralByOperation(operation).getPoint();		//通过操作名称得到用户海螺积分
			int newIntegral = oldIntegral+findIntegral;		//用户新的海螺积分
			user.setIntegral(newIntegral);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;
	}

	
	/**
	 * 通过积分操作查找积分
	 */
	public PointAction findIntegralByOperation(String operation) throws UserServiceException {
		PointAction findIntegral = null;
		try {
			findIntegral = userDao.findIntegral(operation);
		} catch (DataAccessException e) {
			e.printStackTrace();
		}
		return findIntegral;
	}
	
	/**
	 * 保存积分流水信息(旧)
	 */
	public void addIntegralRecord(PointRecord record) throws UserServiceException {
		try {
			userDao.savePointRecord(record);
		} catch (DataAccessException e) {
			e.printStackTrace();
		}
	}
	
	/***
	 * 获取当前时间
	 * @return	sql包下的Date
	 */
	public Date nowDate(){
		return new Date();
	}


	/***
	 * 用户登录
	 * 通过用户邮箱和密码查找用户,当存在用户时返回用户信息，如果不存在则抛出异常
	 * 获得用户上次登录的时间
	 * 判断用户上次登录时间和当前时间是不是同一天，如果是同一天则为用户增加积分并保存获取积分记录
	 */
	@SuppressWarnings("deprecation")
	public User login(String userId, String password) throws UserServiceException {
		User findUser = null;
		try {
            //对密码进行md5加密
            password = DigestUtils.md5DigestAsHex(password.getBytes());
			findUser = userDao.findUserByEmailAndPassword(userId, password);
			if(findUser == null){
				throw new UserServiceException("用户名或密码错误");
			}else{
				if(findUser.getBanTime() != null){
					User user = userDao.findFJUser(findUser.getId());
					if(user == null){
						//用户没有被封禁，设置用户状态和封禁时间
						adminDao.JFUser(findUser.getId());
					}else{
						throw new UserServiceException("账号被封至"+findUser.getBanTime());
					}
				}
				Date lastLogin = findUser.getLastLogin();	//上次登录时间
				Date now = nowDate();	//当前时间
				if(lastLogin.getYear()!=now.getYear() || lastLogin.getMonth()!=now.getMonth() || lastLogin.getDate()!=now.getDate()){
					//判断如果上次登录时间和这次登录时间(如果是同一天登录则不会增加积分)不一样，则为用户增加登录积分
					findUser=addIntegral(findUser, Constant.LOGIN);	//保存积分
					saveIRecord(findUser, Constant.LOGIN);	//保存积分记录
					findUser.setLastLogin(now);		//将上次登录时间改为当前时间
					userDao.updateUser(findUser);	//更改用户信息
				}
			}
		} catch (DataAccessException e) {
			e.printStackTrace();
		}
		return findUser;
	}
	
	/**
	 * 保存积分记录(新)
	 */
	public void saveIRecord(User user, String operator) throws UserServiceException {
		try {
			action = userDao.findIntegral(operator);	//获取对应操作的积分
			record = new PointRecord(action, user.getEmail(), nowDate());	
			userDao.savePointRecord(record);	//保存积分记录
		} catch (DataAccessException e) {
			e.printStackTrace();
		}
	}


	/**
	 * 更改用户信息
	 */
	public void updateUser(User user) throws UserServiceException {
		try {
			userDao.updateUser(user);
		} catch (DataAccessException e) {
			throw new UserServiceException("修改失败，请重试！");
		}
	}


	/**
	 * 首页微博显示
	 * 根据微博的点赞+转发+评论数量的大小来查找用户微博
	 */
	public List<Weibo> findWeiboByHome(PageBean page, String tag) throws UserServiceException {
		
		
		
		return null;
	}

	/**
	 * 消息通知，将用户的欸被评论，点赞，私信等消息通知给登录用户
	 */
	public Map<String, Object> alerts(long uId) throws UserServiceException {
		Map<String, Object> map = new HashMap<>();
		try {
			//未读私信
			int num = dao.findUnreadMNum(uId);
			map.put("unRMNum", num);
		} catch (DataAccessException e) {
			e.printStackTrace();
		}
		
		return map;
	}

	/**
	 * 用户发布神奇海螺模块
	 */
	public void publishConch(User user,Conch conch) throws UserServiceException {
		try {

			userDao.saveConch(conch);
			subIntegral(user,Constant.SUBMIT_Q);		//减少用户积分
			action = userDao.findIntegral(Constant.SUBMIT_Q);		//查找操作得到的PointAction

			record = new PointRecord(action, user.getEmail(), nowDate());
			addIntegralRecord(record);	//保存积分操作
			userDao.updateUser(user);//更新积分

		} catch (DataAccessException e) {
			e.printStackTrace();
		}
	}

	public Map<String, Object> conchIndex(long uId,String operation ,PageBean page) throws UserServiceException {
		Map<String, Object> map = new HashMap<>();
		List<Conch> list = null;
		try {
			if("NEWS".equals(operation)){
				list = userDao.findConchByNews(page.getMinPage(),page.getMaxPage());
			}else if("SOLVE".equals(operation)){
				list = userDao.findConchByState(1,page.getMinPage(),page.getMaxPage());
			}else if("UNSOLVE".equals(operation)){
				list = userDao.findConchByState(0,page.getMinPage(),page.getMaxPage());
			}else if("ME".equals(operation)){
				list = userDao.findConchByMe(uId,page.getMinPage(),page.getMaxPage());
			}
			
			for(int i=0;i<list.size();i++){
				list.get(i).setChUser(userDao.findUserById(list.get(i).getUserId()));
				list.get(i).setConchTime(TimeFormat.dateToString(list.get(i).getConchTime()));	//时间格式转换
			}
			list = FaceFormat.conchFormt(list);		//标签格式转换
			map.put("conchList", list);
		} catch (DataAccessException e) {
			e.printStackTrace();
		}
		
		return map;
	}

	public int conchNum(long uId, String operation) throws UserServiceException {
		int num = 0;
		try {
			if("NEWS".equals(operation)){
				num = userDao.findConchByNewsNum();
			}else if("SOLVE".equals(operation)){
				num = userDao.findConchByStateNum(1);
			}else if("UNSOLVE".equals(operation)){
				num = userDao.findConchByStateNum(0);
			}else if("ME".equals(operation)){
				num = userDao.findConchByMeNum(uId);
			}
		} catch (DataAccessException e){
			e.printStackTrace();
		}
		return num;
	}

	public Map<String, Object> conchDetail(long conchId) throws UserServiceException {
		Map<String, Object> map = new HashMap<>();
		try {
			Conch conch = userDao.findConchById(conchId);
			conch.setChUser(userDao.findUserById(conch.getUserId()));
			conch.setConchTime(TimeFormat.dateToString(conch.getConchTime()));
			conch.setConchBody(FaceFormat.conchFormt(conch.getConchBody()));
			map.put("conch", conch);
			
			//获取海螺问题的评论
			List<WeiboComm> list = weiboDao.findWeiboComm(conchId, 0, 20);
			list = FaceFormat.commFormt(list);
			for(int i=0;i<list.size();i++){
				list.get(i).setCommentDate(TimeFormat.dateToString(list.get(i).getCommentDate()));
				list.get(i).setCommUser(userDao.findUserById(list.get(i).getCommentId()));
			}
			map.put("conchComm", list);
		} catch (DataAccessException e) {
			e.printStackTrace();
		}
		return map;
	}

	public void conchComm(WeiboComm comm) throws UserServiceException {
		try {
			comm.setCommentState(100); //100回复正常未采纳 101回复正常被采纳
			weiboDao.saveWeiboComm(comm);
		} catch (DataAccessException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 采纳海螺答案，设置海螺评论状态为101，设置海螺状态为1
	 */
	public void adoptComm(long conchId, long commId) throws UserServiceException {
		try {
			//设置海螺状态为1
			userDao.setConchState(conchId);
			//设置海螺评论状态为101
			userDao.setConchComm(commId);
			//为用户增加海螺积分
			Conch conch = userDao.findConchById(conchId);
			User user = userDao.findUserById(userDao.findUserIdByCommId(commId));
			user.setConchIntegral(user.getConchIntegral()+conch.getcNumber());
			
			
		} catch (DataAccessException e) {
			e.printStackTrace();
		}
	}

	@Override
	public Map<String, Object> seachWeiboAndUser(String key ,int page,String ac) throws UserServiceException {
		Map<String,Object> map = new HashMap<>();
		PageBean bean = new PageBean();
		bean.setPage(page);
		try {
			int num = 0;
			if("weibo".equals(ac)){
				num = weiboDao.findWeiboBySeachNum("%"+key+"%");
				if(num%5 == 0){
					bean.setTotalPage(num/5);
				}else{
					bean.setTotalPage(num/5+1);
				}
				bean.setMinPage(bean.getPage()*5-4);
				bean.setMaxPage(bean.getPage()*5);
				//模糊搜索对应关键字的微博
			    List<Weibo> weiboList = weiboDao.findWeiboBySeach(key, bean.getMinPage(), bean.getMaxPage());
			    for(int i=0;i<weiboList.size();i++){
			    	weiboList.get(i).setUser(userDao.findUserById(weiboList.get(i).getU_id()));
			    	weiboList.get(i).setStr_pubTime(TimeFormat.dateToString(weiboList.get(i).getStr_pubTime()));
			    	weiboList.get(i).setBody(FaceFormat.keyFormt(weiboList.get(i).getBody(), key));
			    }
			    weiboList = FaceFormat.formt(weiboList);
			    map.put("num", num);
				map.put("weibo", weiboList);
			}else if("user".equals(ac)){
				num = weiboDao.findUserBySeachNum("%"+key+"%");
				if(num%5 == 0){
					bean.setTotalPage(num/5);
				}else{
					bean.setTotalPage(num/5+1);
				}
				bean.setMinPage(bean.getPage()*5-4);
				bean.setMaxPage(bean.getPage()*5);
				//模糊搜索对应关键字的用户
				List<User> userList = weiboDao.findUserBySeach(key, bean.getMinPage(), bean.getMaxPage());
				for(int i=0;i<userList.size();i++){
					userList.get(i).setNickName(FaceFormat.keyFormt(userList.get(i).getNickName(), key));
				}
				map.put("user", userList);
				map.put("num", num);
			}
			map.put("pageBean", bean);
		} catch (DataAccessException e) {
			e.printStackTrace();
		}
		return map;
	}
}
