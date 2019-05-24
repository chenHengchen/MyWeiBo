package com.chenheng.web.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.chenheng.common.bean.Message;
import com.chenheng.common.bean.User;
import com.chenheng.common.bean.Weibo;
import com.chenheng.common.bean.WeiboComm;
import com.chenheng.common.util.CommPage;
import com.chenheng.common.util.FaceFormat;
import com.chenheng.common.util.PageBean;
import com.chenheng.common.util.TimeFormat;
import com.chenheng.service.IFriendService;
import com.chenheng.service.IUserService;
import com.chenheng.service.IWeiboService;

@Controller
public class FriendController {
	@Resource
	private IFriendService friendService;
	
	@Resource
	private IUserService userService;
	
	@Resource
	private IWeiboService weiboService;
	
	ModelAndView mav = new ModelAndView();
	PageBean page = new PageBean();
	CommPage commPage = new CommPage();
	PageBean af_page = new PageBean();

	
	/**
	 * 跳转至用户关注页面friend/friend.jsp
	 * 第一次进入页面时候，默认微博分页为第一页
	 * @return
	 */
	@RequestMapping("friend_index")
	public ModelAndView friend_index(HttpSession session){
		mav.clear();
		mav.setViewName("friend/friend");
		List<WeiboComm> comm = null;
		User user = (User)session.getAttribute("loginUser");
		
		page.setPage(1);	//微博分页为第一页
		page.setMinPage(1);
		page.setMaxPage(10);
		
		commPage.setPage(1);	//评论分页
		commPage.setMinPage(1);
		commPage.setMaxPage(5);
		
		try {
			List<Weibo> list = friendService.findFriendWeibo(user.getId(), page);
			list = FaceFormat.formt(list);
			for(int i=0;i<list.size();i++){
				long uId = list.get(i).getU_id();	//获取用户id
				User weibo_user = userService.findUserById(uId);
				list.get(i).setUser(weibo_user); 	//将user信息组装到weibo类中
				boolean b = weiboService.userLikeWeibo(list.get(i).getId(), user.getId());
				list.get(i).setB(b);
				comm = FaceFormat.commFormt(comm);
				list.get(i).setComm(comm);
				list.get(i).setStr_pubTime(TimeFormat.dateToString(list.get(i).getStr_pubTime()));
			}
			int pageNumber = friendService.findWeiboNumber(user.getId());
			page.setTotalPage(pageNumber/10+1); 	//确定所有的微博共有多少页
			List<User> userTuiJian = weiboService.findUserTuiJian(user.getId());
			
			//String ss = "<c:forEach items=\"${weibo.comm}\" var=\"comm\"><tr><td><img src=\"face/10DE89D172157033BCF353C027B2E493A.jpg\" border=\"0\" width=\"21\" height=\"20\" /><a href = \"\" style=\"text-decoration:none\">${comm.commUser.nickName} ：</a>${comm.commentBody}&nbsp;&nbsp;&nbsp;</td><td></td><td>${comm.commentDate}</td><td><span style=\"cursor:pointer\">&nbsp;&nbsp;|&nbsp;&nbsp;赞(${comm.commentLike})</span></td></tr></c:forEach>";
			//mav.addObject("ss",ss);
			mav.addObject("tuijian", userTuiJian);
			mav.addObject("pageBean", page);
			mav.addObject("weiboList", list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return mav;
	}

	
	/**
	 * 用户关注微博分页
	 */
	@RequestMapping("F_pageUpAndDown")
	public ModelAndView pageUpAndDown(HttpSession session,String pageId,String operation){
		mav.clear();
		int pageNumber = Integer.parseInt(pageId);
		try {
			User user = (User)session.getAttribute("loginUser");
			if("Up".equals(operation)){
				page.setPage(page.getPage()-1); 	//上一页，当前页数-1
				page.setMinPage(pageNumber*10-10-9);
				page.setMaxPage(pageNumber*10-10);
			}else if("Down".equals(operation)){
				page.setPage(page.getPage()+1); 	//下一页，当前页数+1
				page.setMinPage(pageNumber*10+10-9);  		//sql中分页查询的最小值
				page.setMaxPage(pageNumber*10+10);			//sql中分页查询的最大值
			}
			
			List<Weibo> list = friendService.findFriendWeibo(user.getId(), page);
			list = FaceFormat.formt(list);
			List<User> userTuiJian = weiboService.findUserTuiJian(user.getId());
			
			for(int i=0;i<list.size();i++){
				long uId = list.get(i).getU_id();	//获取用户id
				User weibo_user = userService.findUserById(uId);
				list.get(i).setUser(weibo_user); 	//将user信息组装到weibo类中
			
				list.get(i).setStr_pubTime(TimeFormat.dateToString(list.get(i).getStr_pubTime()));
				
			}
			
			mav.addObject("pageBean", page);
			mav.addObject("tuijian", userTuiJian);
			mav.addObject("weiboList", list);
			mav.setViewName("friend/friend");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

	/**
	 * 用户关注好友
	 */
	@RequestMapping("atten_index")
	public ModelAndView attenFriend(HttpSession session,String msg){
		mav.clear();
		mav.setViewName("friend/attenFriend");
		
		af_page.setMinPage(1);
		af_page.setMaxPage(11);
		af_page.setPage(1);
		
		try{
			User user = (User)session.getAttribute("loginUser");
			
			int num = friendService.findAttUserNum(user.getId());
			if(num%10 == 0){
				if(num == 0){
					af_page.setTotalPage(1);
				}else{
					af_page.setTotalPage(num/10);
				}
			}else{
				af_page.setTotalPage(num/10+1);
			}
			List<User> attUser = friendService.findAttUser(user.getId(),af_page);
			List<User> userTuiJian = weiboService.findUserTuiJian(user.getId());
			mav.addObject("tuijian", userTuiJian);
			mav.addObject("attUsers", attUser);
			mav.addObject("pageBean", af_page);
			mav.addObject("msg", msg);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return mav;
	}
	
	
	/**
	 * 关注好友列表翻页
	 * AF_pageUpAndDown?operation=Down&pageId=${pageBean.page}
	 */
	@RequestMapping("AF_pageUpAndDown")
	public ModelAndView af_page(HttpSession session,String operation,String pageId){
		mav.clear();
		mav.setViewName("friend/attenFriend");
		
		int pageNumber = Integer.parseInt(pageId);
		try {
			User user = (User)session.getAttribute("loginUser");
			if("Up".equals(operation)){
				af_page.setPage(af_page.getPage()-1);	//上一页，当前页数-1
				af_page.setMinPage(pageNumber*11-21);
				af_page.setMaxPage(pageNumber*11-11);
			}else if("Down".equals(operation)){
				af_page.setPage(af_page.getPage()+1); 	//下一页，当前页数+1
				af_page.setMinPage(pageNumber*11+1);  		//sql中分页查询的最小值
				af_page.setMaxPage(pageNumber*11+11);			//sql中分页查询的最大值
			}
			
			int num = friendService.findAttUserNum(user.getId());
			if(num%10 == 0){
				if(num == 0){
					af_page.setTotalPage(1);
				}else{
					af_page.setTotalPage(num/10);
				}
			}else{
				af_page.setTotalPage(num/10+1);
			}
			
			List<User> attUser = friendService.findAttUser(user.getId(),af_page);
			List<User> userTuiJian = weiboService.findUserTuiJian(user.getId());
			mav.addObject("tuijian", userTuiJian);
			mav.addObject("attUsers", attUser);
			mav.addObject("pageBean", af_page);
			} catch (Exception e) {
				e.printStackTrace();
			}	
		return mav;
	}
	
	/**
	 * 用户关注好友
	 */
	@RequestMapping("fans_index")
	public ModelAndView fansFriend(Integer p,HttpSession session,String msg){
		mav.clear();
		mav.setViewName("friend/fans");
		if(p == null){
			p=1;
		}
		page.setMinPage(p*10-9);
		page.setMaxPage(p*10);
		page.setPage(p);
		
		try{
			User user = (User)session.getAttribute("loginUser");
			int num = friendService.findFansNum(user.getId());
			if(num%10 == 0){
				if(num == 0){
					page.setTotalPage(1);
				}else{
					page.setTotalPage(num/10);
				}
			}else{
				page.setTotalPage(num/10+1);
			}
			List<User> fans = friendService.findFansUser(user.getId(), page);
			List<User> userTuiJian = weiboService.findUserTuiJian(user.getId());
			mav.addObject("tuijian", userTuiJian);
			mav.addObject("fans", fans);
			mav.addObject("pageBean", page);
			mav.addObject("msg", msg);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return mav;
	}
	
	
	/**
	 * 
	 * @param session
	 * @param userBId	要私信的用户id
	 * @return
	 */
	@RequestMapping("message")
	public ModelAndView message(HttpSession session,long userBId){
		mav.clear();
		mav.setViewName("friend/message");
		User user = (User)session.getAttribute("loginUser");
		try {
			List<User> userTuiJian = weiboService.findUserTuiJian(user.getId());
			mav.addObject("tuijian", userTuiJian);
			//查找用户有私信的记录
			Map<String, Object> map = friendService.findMessageById(user.getId(), userBId);
			@SuppressWarnings("unchecked")
			List<Message> Messagelist = (List<Message>) map.get("list");
			User bUser = (User) map.get("bUser");
			@SuppressWarnings("unchecked")
			List<User> attUser = (List<User>)map.get("attUsers");
			mav.addObject("attUsers", attUser);
			mav.addObject("messageList", Messagelist);
			mav.addObject("bUser", bUser);
			
			//重新查找未读私信数目
			Map<String, Object> alerts = userService.alerts(user.getId());
			session.setAttribute("alerts", alerts);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
	
	@RequestMapping("sendMessage")
	public ModelAndView sendMessage(HttpSession session,long userBId,String inputbox){
		mav.clear();
		mav.setViewName("friend/message");
		User user = (User)session.getAttribute("loginUser");
		try {
			//处理发布私信
			Message message = new Message();
			message.setMessage(inputbox);
			message.setUserAId(user.getId());
			message.setUserBId(userBId);
			
			friendService.sendMessage(message);
			List<User> userTuiJian = weiboService.findUserTuiJian(user.getId());
			mav.addObject("tuijian", userTuiJian);
			//查找用户有私信的记录
			Map<String, Object> map = friendService.findMessageById(user.getId(), userBId);
			@SuppressWarnings("unchecked")
			List<Message> Messagelist = (List<Message>) map.get("list");
			User bUser = (User) map.get("bUser");
			@SuppressWarnings("unchecked")
			List<User> attUser = (List<User>)map.get("attUsers");
			mav.addObject("attUsers", attUser);
			mav.addObject("messageList", Messagelist);
			mav.addObject("bUser", bUser);
			//重新查找未读私信数目
			Map<String, Object> alerts = userService.alerts(user.getId());
			session.setAttribute("alerts", alerts);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return mav; 
	}
	
	@RequestMapping("toBlackOrQXGZ")
	public ModelAndView friendToBlackOrQXGZ(HttpSession session,long bId,String operation){
		mav.clear();
		mav.setViewName("redirect:atten_index");
		User auser = (User)session.getAttribute("loginUser");
		try {
			User bUser = userService.findUserById(bId);
			weiboService.operationUser(operation, auser, bUser);
			if("QXGZ".equals(operation)){
				mav.addObject("msg", "已取消关注该用户！");
			}else if("LH".equals(operation)){
				mav.addObject("msg", "已成功拉黑该用户！");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
	
	
	/**
	 * 用户关注黑名单
	 */
	@RequestMapping("blank_index")
	public ModelAndView blackFriend(Integer p,HttpSession session,String msg){
		mav.clear();
		mav.setViewName("friend/black");
		if(p == null){
			p=1;
		}
		page.setMinPage(p*10-9);
		page.setMaxPage(p*10);
		page.setPage(p);
		
		try{
			User user = (User)session.getAttribute("loginUser");
			int num = friendService.findBlackNum(user.getId());
			if(num%10 == 0){
				if(num == 0){
					page.setTotalPage(1);
				}else{
					page.setTotalPage(num/10);
				}
			}else{
				page.setTotalPage(num/10+1);
			}
			List<User> black = friendService.findBlackUser(user.getId(), page);
			List<User> userTuiJian = weiboService.findUserTuiJian(user.getId());
			mav.addObject("tuijian", userTuiJian);
			mav.addObject("black", black);
			mav.addObject("pageBean", page);
			mav.addObject("msg", msg);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return mav;
	}
	
	/**
	 * friendOperation?operation=QXLH&nPage=black&uId=
	 */
	@RequestMapping("friendOperation")
	public ModelAndView friendOPeration(String operation,HttpSession session,long uId,String nPage){
		mav.clear();
		User aUser = (User) session.getAttribute("loginUser");
		try {
			User bUser = userService.findUserById(uId);
			weiboService.operationUser(operation, aUser, bUser);
			if("GZ".equals(operation)){
				mav.addObject("msg", "关注成功！");
			}else if("GXGZ".equals(operation)){
				mav.addObject("msg", "取消关注成功！");
			}else if("LH".equals(operation)){
				mav.addObject("msg", "拉黑成功！");
			}if("QXLH".equals(operation)){
				mav.addObject("msg", "取消拉黑成功！");
			}
			if("black".equals(nPage)){
				mav.setViewName("redirect:blank_index");
			}else if("fans".equals(nPage)){
				mav.setViewName("redirect:fans_index");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
}