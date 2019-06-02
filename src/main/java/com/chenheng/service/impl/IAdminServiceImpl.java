package com.chenheng.service.impl;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import com.chenheng.common.bean.Conch;
import com.chenheng.common.bean.User;
import com.chenheng.common.bean.Weibo;
import com.chenheng.common.exception.DataAccessException;
import com.chenheng.common.exception.UserServiceException;
import com.chenheng.common.util.FaceFormat;
import com.chenheng.common.util.PageBean;
import com.chenheng.common.util.TimeFormat;
import com.chenheng.dao.IAdminDao;
import com.chenheng.dao.IUserDao;
import com.chenheng.dao.IWeiboDao;
import com.chenheng.service.IAdminService;
import org.springframework.stereotype.Service;

/** 
 * @author :
 * @version 1.0 
 * @parameter 
 * @return 
 */
@Service
public class IAdminServiceImpl implements IAdminService{

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

	public User adminlogin(String name, String password)
			throws UserServiceException {
		User user = null;
		try {
			user = adminDao.findAdminUser(name, password);
			if(user == null){
				throw new UserServiceException("用户名或密码错误！");
			}
		} catch (DataAccessException e) {
			e.printStackTrace();
		}
		return user;
	}

	public Map<String, Object> indexDate() throws UserServiceException {
		Map<String,Object> map = new HashMap<>();
		
		try {
			//用户数
			int u1 = adminDao.finTargetNum("user_tab", "u_state = 0", "REGISTERTIME");
			int u2 = adminDao.findAllUserNum();
			//微博数
			int w1 = adminDao.finTargetNum("weibo_tab", "1=1", "M_DATE");
			int w2 = adminDao.findAllWeiboNum();
			//海螺数
			int c1 = adminDao.finTargetNum("conch_tab", "1=1", "CONCHTIME");
			int c2 = adminDao.findAllConchNum();
			//评论数
			int p1 = adminDao.finTargetNum("comm_tab", "1=1", "C_DATE");
			int p2 = adminDao.findAllCommNum();
			//回复数
			int h1 = adminDao.finTargetNum("comm_tab", "C_STATE = 100 or C_STATE = 101 ", "C_DATE");
			int h2 = adminDao.findAllAnwerNum();
			
			
			//统计最近一周七天的微博数和海螺数
			String week1 = adminDao.findWeek(6);
			String week2 = adminDao.findWeek(5);
			String week3 = adminDao.findWeek(4);
			String week4 = adminDao.findWeek(3);
			String week5 = adminDao.findWeek(2);
			String week6 = adminDao.findWeek(1);
			String week7 = adminDao.findWeek(0);
			
			//查询最近七天的微博和海螺数目
			int ww7 = adminDao.finWeiboOrConchDay("weibo_tab", "M_DATE", 0);
			int ww6 = adminDao.finWeiboOrConchDay("weibo_tab", "M_DATE", 1);
			int ww5 = adminDao.finWeiboOrConchDay("weibo_tab", "M_DATE", 2);
			int ww4 = adminDao.finWeiboOrConchDay("weibo_tab", "M_DATE", 3);
			int ww3 = adminDao.finWeiboOrConchDay("weibo_tab", "M_DATE", 4);
			int ww2 = adminDao.finWeiboOrConchDay("weibo_tab", "M_DATE", 5);
			int ww1 = adminDao.finWeiboOrConchDay("weibo_tab", "M_DATE", 6);
			
			int wc1 = adminDao.finWeiboOrConchDay("conch_tab", "CONCHTIME", 6);
			int wc2 = adminDao.finWeiboOrConchDay("conch_tab", "CONCHTIME", 5);
			int wc3 = adminDao.finWeiboOrConchDay("conch_tab", "CONCHTIME", 4);
			int wc4 = adminDao.finWeiboOrConchDay("conch_tab", "CONCHTIME", 3);
			int wc5 = adminDao.finWeiboOrConchDay("conch_tab", "CONCHTIME", 2);
			int wc6 = adminDao.finWeiboOrConchDay("conch_tab", "CONCHTIME", 1);
			int wc7 = adminDao.finWeiboOrConchDay("conch_tab", "CONCHTIME", 0);
			
			map.put("u1", u1);
			map.put("u2", u2);
			map.put("w1", w1);
			map.put("w2", w2);
			map.put("c1", c1);
			map.put("c2", c2);
			map.put("p1", p1);
			map.put("p2", p2);
			map.put("h1", h1);
			map.put("h2", h2);
			map.put("week1", week1);
			map.put("week2", week2);
			map.put("week3", week3);
			map.put("week4", week4);
			map.put("week5", week5);
			map.put("week6", week6);
			map.put("week7", week7);
			map.put("ww1", ww1);
			map.put("ww2", ww2);
			map.put("ww3", ww3);
			map.put("ww4", ww4);
			map.put("ww5", ww5);
			map.put("ww6", ww6);
			map.put("ww7", ww7);
			map.put("wc7", wc7);
			map.put("wc6", wc6);
			map.put("wc5", wc5);
			map.put("wc4", wc4);
			map.put("wc3", wc3);
			map.put("wc2", wc2);
			map.put("wc1", wc1);
		} catch (DataAccessException e) {
			e.printStackTrace();
		}
		return map;
	}

	public List<User> userManage(PageBean page) throws UserServiceException {
		List<User> list = null;
		try {
			list = adminDao.findAllUser(page.getMinPage(),page.getMaxPage());
		} catch (DataAccessException e) {
			e.printStackTrace();
		}
		return list;
	}

	public void FJUser(long uId, int day) throws UserServiceException {
		System.out.println(day);
		try {
			adminDao.FJUserByDay(uId, day);
		} catch (DataAccessException e) {
			e.printStackTrace();
		}
	}

	public void JFUser(long uId) throws UserServiceException {
		try {
			adminDao.JFUser(uId);
		} catch (DataAccessException e) {
			e.printStackTrace();
		}
	}

	public int findUserNum() throws UserServiceException {
		int num = 0;
		try {
			num = adminDao.findAllUserNum();
		} catch (DataAccessException e) {
			e.printStackTrace();
		}
		return num;
	}

	public List<User> userManageByKey(PageBean page, String key) throws UserServiceException {
		List<User> list = null;
		try {
 			list = adminDao.findAllUserByKey(key,page.getMinPage(),page.getMaxPage());
			for(int i=0;i<list.size();i++){
				list.get(i).setNickName(FaceFormat.keyFormt(list.get(i).getNickName(), key));
			}
		} catch (DataAccessException e) {
			e.printStackTrace();
		}
		return list;
	}

	public int findUserNum(String key) throws UserServiceException {
		int num = 0;
		try {
			num = adminDao.findAllUserNumByKey(key);
		} catch (DataAccessException e) {
			e.printStackTrace();
		}
		return num;
	}

	public int findWeiboNum(String key) throws UserServiceException {
		int num = 0;
		try {
			if(key == null){
				num = adminDao.findAllWeiboNum();
			}else{
				num = adminDao.findWeiboNumByKey(key);
			}
		} catch (DataAccessException e) {
			e.printStackTrace();
		}
		return num;
	}

	public List<Weibo> findWeibo(PageBean pageBean, String key) throws UserServiceException {
		List<Weibo> list = null;
		try {
			String nkey = "";
			if(key == null){
				nkey = "1=1";
			}else{
				nkey = "m_body like '%"+key+"%'";
			}
			list = adminDao.findWeiboByKey(nkey, pageBean.getMinPage(), pageBean.getMaxPage());
			list = FaceFormat.formt(list);
			for(int i=0;i<list.size();i++){
//				list.get(i).setStr_pubTime(TimeFormat.timeFormat(list.get(i).getPubTime()));

//				String dateStr = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(list.get(i).getPubTime());
//				list.get(i).setStr_pubTime(list.get(i).getPubTime().toLocaleString());
				list.get(i).setUser(userDao.findUserById(list.get(i).getU_id()));
				if(key != null){
					list.get(i).setBody(FaceFormat.keyFormt(list.get(i).getBody(), key));
				}
			}
		} catch (DataAccessException e) {
			e.printStackTrace();  
		}
		return list;
	}

	public void UpWeibo(long wId, String ac) throws UserServiceException {
		try {
			if("sc".equals(ac)){
				adminDao.upWeiboWithState(wId, 1);
			}else if("hf".equals(ac)){
				adminDao.upWeiboWithState(wId, 0);
			}
		} catch (DataAccessException e) {
			e.printStackTrace();
		}
	}
	
	public int findConchNum(String key) throws UserServiceException {
		int num = 0;
		try {
			if(key == null){
				num = adminDao.findAllConchNum();
			}else{
				num = adminDao.findConchNumByKey(key);
			}
		} catch (DataAccessException e) {
			e.printStackTrace();
		}
		return num;
	}
	
	public List<Conch> findConch(PageBean pageBean, String key) throws UserServiceException {
		List<Conch> list = null;
		try {
			String nkey = "";
			if(key == null){
				nkey = "1=1";
			}else{
				nkey = "CONCHBODY like '%"+key+"%'";
			}
			System.out.println(nkey);
			list = adminDao.findConchByKey(nkey, pageBean.getMinPage(), pageBean.getMaxPage());
			list = FaceFormat.conchFormt(list);
			for(int i=0;i<list.size();i++){
				list.get(i).setChUser(userDao.findUserById(list.get(i).getUserId()));
				if(key != null){
					list.get(i).setConchBody(FaceFormat.keyFormt(list.get(i).getConchBody(), key));
				}
			}
		} catch (DataAccessException e) {
			e.printStackTrace();  
		}
		return list;
	}

	public void UpConch(long cId, String ac) throws UserServiceException {
		try {
			int state = adminDao.findConchState(cId);
			int n = 0;
			if(state == 0){
				n = 2;
			}else if(state == 1){
				n = 3;
			}else if(state == 2){
				n = 0;
			}else if(state == 3){
				n = 1;
			}
			if("sc".equals(ac)){
				adminDao.upConchState(cId, n);
			}else if("hf".equals(ac)){
				adminDao.upConchState(cId, n);
			}
		} catch (DataAccessException e) {
			e.printStackTrace();
		}
	}
}
