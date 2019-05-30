package com.chenheng.service.impl;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import com.sun.org.glassfish.gmbal.Description;

import com.chenheng.common.bean.User;
import com.chenheng.common.bean.Weibo;
import com.chenheng.common.bean.WeiboCollect;
import com.chenheng.common.bean.WeiboComm;
import com.chenheng.common.bean.WeiboLike;
import com.chenheng.common.bean.WeiboTrans;
import com.chenheng.common.exception.DataAccessException;
import com.chenheng.common.exception.WeiboServiceException;
import com.chenheng.common.util.CommPage;
import com.chenheng.common.util.Constant;
import com.chenheng.common.util.PageBean;
import com.chenheng.common.util.TimeFormat;
import com.chenheng.dao.IFriendDao;
import com.chenheng.dao.IUserDao;
import com.chenheng.dao.IWeiboDao;
import com.chenheng.service.IWeiboService;
import org.springframework.stereotype.Service;

@Service
public class IWeiboServiceImpl implements IWeiboService{
	/**
	 * 微博发布
	 * 
	 */
	@Resource
	private IWeiboDao dao;
	public void setDao(IWeiboDao dao) {
		this.dao = dao;
	}
	
	@Resource
	private IUserDao userDao;
	public void setUserDao(IUserDao userDao) {
		this.userDao = userDao;
	}
	
	@Resource
	private IFriendDao friendDao;
	public void setFriendDao(IFriendDao friendDao) {
		this.friendDao = friendDao;
	}

	public void publishWeibo(Weibo weibo) throws WeiboServiceException {
		//weibo.setPubTime(nowDate());
		try {
			dao.publishWeibo(weibo);
		} catch (DataAccessException e) {
			//throw new WeiboServiceException("发布失败，请重试！");
			e.getStackTrace();
		}
	}

	/***
	 * 获取当前时间
	 * @return	sql包下的Date
	 */
	public Date nowDate(){
		return new Date(new java.util.Date().getTime());
	}


	/**
	 * 通过用户id查找用户微博
	 */
	public List<Weibo> findWeiboByUserId(long id,PageBean page) throws WeiboServiceException {
		List<Weibo> list = null;
		try {
			list = dao.findWeiboByUserId(id,page.getMinPage(),page.getMaxPage());
		} catch (DataAccessException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	/**
	 * 查找推荐人
	 */
	@Override
	public List<User> findUserTuiJian(long id) throws WeiboServiceException {
		List<User> list = null;
		try {
			list = dao.findUserByTuijian(id);
		} catch (DataAccessException e) {
			e.printStackTrace();
		}
		return list;
	}


	/**
	 * 用户对用户操作
	 * 包含用户对用户的操作，例如关注/取消关注/拉黑/私信操作
	 * 操作为A用户对B用户的操作
	 * 当用户被别的用户关注时获得积分，并将获得的积分保存在数据库中
	 *
	 *return : 返回更新后的用户，保存在session中
	 */
	public User operationUser(String operation, User aUser, User bUser) throws WeiboServiceException {
		User user = null;
		long aId = aUser.getId();
		long bId = bUser.getId();
		try {
			if(operation.equals("GZ") ){
				//关注用户操作
				dao.attUser(aId,bId);
				aUser.setAttention(aUser.getAttention()+1);		//a用户关注数+1
				bUser.setFans(bUser.getFans()+1);		//b用户粉丝数+1
			}else if(operation.equals("QXGZ")){
				//取消关注用户操作
				dao.canUser(aId,bId);
				aUser.setAttention(aUser.getAttention()-1);		//a用户关注数-1
				bUser.setFans(bUser.getFans()-1);		//b用户粉丝数-1
			}else if(operation.equals("LH")){
				//拉黑用户 不接收该用户的私信
				friendDao.updateFriendToBlack(aId, bId ,99);
				friendDao.updateFriendState(aId, bId, 99);
				friendDao.updateFriendToBlack(bId, aId ,99);
				friendDao.updateFriendState(bId, aId, 99);
			}else if(operation.equals("SX")){
				//私信用户
				//已实现
			}else if(operation.equals("QXLH")){
				//取消拉黑用户
				friendDao.updateFriendToBlack(aId, bId ,0);
				friendDao.updateFriendState(aId, bId, 0);
				friendDao.updateFriendToBlack(bId, aId ,0);
				friendDao.updateFriendState(bId, aId, 0);
			}
			userDao.updateUser(aUser);
			userDao.updateUser(bUser);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;
	}


	/**
	 * 查找用户微博数量
	 */
	public int findUserWeiboNumber(long id,String action) throws WeiboServiceException {
		int i=0;
		int state = 0;
		try {
			if("all".equals(action)){
				i = dao.findWeiboNumber(id);
			}else if("me".equals(action)){
				state=0;
				i = dao.findWeiboNumberAsTransOrMe(id,state);
			}else if("trans".equals(action)){
				state=1;
				i = dao.findWeiboNumberAsTransOrMe(id,state);
			}else if("collect".equals(action)){
				//查找用户收藏微博数
				i = dao.findCollectWeiboNum(id);
				
			}
		} catch (DataAccessException e) {
			e.printStackTrace();
		}
		return i;
	}


	/**
	 * 翻页
	 * 微博状态
	 */
	public List<Weibo> paging(long uId, int minPage, int maxPage,String action) throws WeiboServiceException {
		List<Weibo> list = null;
		int state = 0;
		try {
			if("all".equals(action)){
				list = dao.paging(uId, minPage, maxPage);
			}else if("me".equals(action)){
				state=0;
				list = dao.pagingAsTransOrMe(uId, minPage, maxPage, state);
			}else if("trans".equals(action)){
				state=1;
				list = dao.pagingAsTransOrMe(uId, minPage, maxPage, state);
			}else if("collect".equals(action)){
				//查找用户收藏微博
				list = dao.findCollectWeibo(uId, minPage, maxPage);
				for(int i=0;i<list.size();i++){
					list.get(i).setUser(userDao.findUserById(list.get(i).getU_id()));
				}
				
				
			}
		} catch (DataAccessException e) {
			e.printStackTrace();
		}
		return list;
	}

	
	/**
	 * 微博点赞
	 * 返回改微博的点赞数
	 * 组装weibolike的数据源
	 * 在数据库中查找用户是否对该微博点赞
	 */
	public int weiboLike(long weiboId, long likeId) throws WeiboServiceException {
		int likeNum = 0;
		WeiboLike weiboLike = new WeiboLike();
		weiboLike.setWeiboId(weiboId);
		weiboLike.setLikeUserId(likeId);
		weiboLike.setLikeDate(nowDate());
		try {
			WeiboLike wLike = dao.findweiboLike(weiboId, likeId);	//wLike 用来判断用户是否对该微博点过赞
			weiboLike.setBeLikeId(dao.findUserIdbyWId(weiboId));
			if(wLike ==null){
				//没有赞过该微博
				dao.likeWeibo(weiboLike);
			}else if(wLike != null){
				//赞过该微博，再次点赞取消点赞
				dao.disLikeWeibo(weiboLike);
			}
			//查找微博点赞数
			likeNum = dao.findWeiboLikeNumber(weiboId);
			//更新微博点赞数
			Weibo weibo = dao.findWeiboBywId(weiboId);
			weibo.setLikeN(likeNum);
			dao.updateWeibo(weibo);
		} catch (DataAccessException e) {
			e.printStackTrace();
		}
		return likeNum;
	}


	
	/**
	 * 判断用户是否对该微博点过赞
	 */
	public boolean userLikeWeibo(long weiboId,long likeId) throws WeiboServiceException {
		boolean flag = false;
		try {
			WeiboLike wLike = dao.findweiboLike(weiboId, likeId);
			if(wLike == null){
				flag = false;
			}else{
				flag = true; 
			}
		} catch (DataAccessException e) {
			e.printStackTrace();
		}	
		return flag;
	}


	/**
	 * 微博转发功能
	 * 组装用户要转发的微博信息，转发就是将旧微博的信息加工后，以转发者的身份重新发布一次微博
	 * 设置转发微博的时间，图片，文本，等等，在转发的文本中加入字符串 @用户名 +微博内容
	 * 以转发者的用户id来发布这个微博
	 * 组装转发信息，将转发信息保存在数据库中
	 * 获取该微博的转发数
	 * uodate微博数据
	 * @return 返回微博数，用ajax方式显示在页面
	 * 
	 */
	public int weiboTrans(long wId, long uId) throws WeiboServiceException {
		int transNum = 0;
		try {
			Weibo weibo = dao.findWeiboBywId(wId);		//要转发的微博
			Weibo transWeibo = new Weibo();			//用户转发的微博
			WeiboTrans trans = new WeiboTrans();
			
			User user = userDao.findUserById(weibo.getU_id());		//微博的第一个转发者
			User transUser = userDao.findUserById(uId);		 //要转发的用户


			transWeibo.setUser(transUser);
			//transWeibo.setPubTime(nowDate()); 	//设置转发时间
			transWeibo.setU_id(uId);	//转发用户
			transWeibo.setImage(weibo.getImage());		//转发微博图片
			transWeibo.setBody("转发<a href=\"user_index?userId="+
					user.getId()+"\" style='text-decoration:none' \">"+"@"+user.getNickName()+"</a> "+weibo.getBody());	//用户转发微博内容
			transWeibo.settState(1);//代表此微博为转发微博
			dao.publishWeibo(transWeibo);
			
			//组装trans数据源
			trans.setWeiboId(wId);
			trans.setTransUserId(uId);
			trans.setBeTransUserId(user.getId());
			trans.setTransDate(nowDate());
			
			//保存转发信息
			dao.saveTrans(trans);

			transNum = dao.findWeibotransNumber(weibo.getId());		//获取微博转发数
			weibo.setTranum(transNum);
			//更新微博信息
			dao.updateWeibo(weibo);
			
		} catch (DataAccessException e) {
			e.printStackTrace();
		}
		return transNum;
	}


	/**
	 * 微博评论功能，参数返回为评论后微博的评论数
	 */
	public int weiboComment(WeiboComm comm) throws WeiboServiceException {
		int commNum = 0;
		try {
			//comm.setCommentDate(nowDate());
			comm.setBeCommentId(dao.findUserIdbyWId(comm.getWeiboId()));
			comm.setCommentLike(0); 	//默认点赞数为0
			//保存评论信息
			dao.saveWeiboComm(comm);
			Weibo weibo = dao.findWeiboBywId(comm.getWeiboId());
			//查找微博评论数
			commNum = dao.findCommNum(comm.getWeiboId());
			weibo.setComnum(commNum);
			//更新微博评论数目
			dao.updateWeibo(weibo);
			
		} catch (DataAccessException e) {
			e.printStackTrace();
		}
		return commNum;
	}

	/**
	 * 通过微博id查找对应评论信息
	 */
	public List<WeiboComm> findWeiboComm(long wId,CommPage commPage) throws WeiboServiceException {
		List<WeiboComm> list = new ArrayList<>();
		User user = null;
		try {
			list = dao.findWeiboComm(wId,commPage.getMinPage(),commPage.getMaxPage());
			for(int i=0;i<list.size();i++){
				user = userDao.findUserById(list.get(i).getCommentId());
				list.get(i).setCommentDate(TimeFormat.dateToString(list.get(i).getCommentDate()));
				list.get(i).setCommUser(user);		//微博评论人信息
			}
		} catch (DataAccessException e) {
			e.printStackTrace();
		}
		return list;
	}

	
	/**
	 * 删除或清除微博
	 * 根据参数operation来判断是删除微博，即放进回收站还是在回收站中清除
	 * 根据参数的不同，操纵不同的数据库sql
	 */
	public void deleteWeibo(String operation, long wId) throws WeiboServiceException {
		try {
			if(Constant.DELETE.equals(operation)){
				dao.deleteWeibo(wId);
			}else if(Constant.CLEAR.equals(operation)){
				dao.clearWeibo(wId);
			} else if (Constant.RECOVERDELETE.equals(operation)) {
				dao.recoverDeleteWeibo(wId);
			}
		} catch (DataAccessException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 查找用户首页显示的微博信息
	 */
	public List<Weibo> findHomeWeibo(int tag, PageBean page,String weiboTime) throws WeiboServiceException {
		List<Weibo> list = null;
		try {
			list = dao.findWeiboOfHome(0, page.getMinPage(), page.getMaxPage(), weiboTime);
		} catch (DataAccessException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	/**
	 * 微博收藏功能
	 * 增加收藏记录
	 * 修改用户收藏表数据
	 * 修改微博被收藏数
	 */
	@Description("微博收藏功能")
	public void weiboCollect(User user,long wId)throws WeiboServiceException {
		try {
			Weibo w = dao.findWeiboBywId(wId);
			WeiboCollect collect = new WeiboCollect(w, user.getId());
			dao.weiboCollect(collect);
			w.setColnum(w.getColnum()+1);
			user.setCollect(user.getCollect()+1);
			userDao.updateUserForNum(user);
		} catch (DataAccessException e) {
			e.printStackTrace();
		}
	}

	/**
	* @Title: findCommNum
	* @Description: TODO
	* @param 
	* @return 
	* @throws
	*/
	public int findCommNum(long wId) throws WeiboServiceException {
		int commNum = 0;
		try {
			commNum = dao.findCommNum(wId);
		} catch (DataAccessException e) {
			e.printStackTrace();
		}
		return commNum;
	
	}

	public int findHomeWeiboNum(int state) throws WeiboServiceException {
		int num = 0;
		try {
			num = dao.findWeiboOfHomeNum(state);
		} catch (DataAccessException e) {
			e.printStackTrace();
		}
		return num;
	}


	
	
	
}
