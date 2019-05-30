package com.chenheng.web.controller;

import java.io.File;
import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.chenheng.common.bean.User;
import com.chenheng.common.bean.Weibo;
import com.chenheng.common.bean.WeiboComm;
import com.chenheng.common.exception.WeiboServiceException;
import com.chenheng.common.util.CommPage;
import com.chenheng.common.util.Constant;
import com.chenheng.common.util.FaceFormat;
import com.chenheng.common.util.PageBean;
import com.chenheng.common.util.TimeFormat;
import com.chenheng.service.IUserService;
import com.chenheng.service.IWeiboService;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
import net.sf.json.util.CycleDetectionStrategy;
@Controller
public class WeiboController {
	
	@Resource
	private IUserService userService;
	@Resource
	private IWeiboService weiboService;
	
	private ModelAndView mav = new ModelAndView();
	private User user = new User();
	
	PageBean page = new PageBean();
	CommPage commPage = new CommPage();
	/**
	 * 发布微博
	 * 将前段传来的微博文本保存在weibo对象中
	 * 从session中获取登录对象
	 * 判断用户输入的图片是否为空，为空则将weibo对象中的图片属性设置为null
	 * 保存用户上传的图片到upload/pic中，并在图片开头加上用户id
	 * 设置weibo对象中方的图片地址
	 * 保存微博信息
	 * 将用户微博数+1
	 * 保存更改后的用户信息
	 */
	@RequestMapping("publishWeibo")
	public ModelAndView publishWeibo(String inputbox,@RequestParam("pic") MultipartFile pic,HttpSession session,HttpServletRequest req){
		mav.clear();
		mav.setViewName("forward:home_index");
		Weibo weibo = new Weibo();
		weibo.setBody(inputbox);
		user = (User)session.getAttribute("loginUser");
		
		if(!(pic.isEmpty())){	//如果文件存在，isEmpty文件为空
			//保存文件目录
			String path = req.getSession().getServletContext().getRealPath("/") +"WEB-inf/jsp/upload/pic/"+user.getId()+pic.getOriginalFilename();
//			String path = req.getServletContext().getRealPath("/")+"WEB-inf/jsp/upload/pic/"+user.getId()+pic.getOriginalFilename();
			File newFile = new File(path);
			//判断文件目录存在不存在，如果不存在就创建目录
			if(!(newFile.getParentFile().exists())){
				newFile.getParentFile().mkdirs();
			}
			try {
				pic.transferTo(newFile); //转存文件
				weibo.setImage("upload/pic/"+user.getId()+pic.getOriginalFilename());
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else{
			//没有带图片
			weibo.setImage("null");
		}
		try {
			//保存微博信息
			weibo.setUser(user);
			weibo.settState(0);//0代表为原创微博，1代表转发微博
			weiboService.publishWeibo(weibo);	//保存微博信息
			user.setBlogNumber(user.getBlogNumber()+1);		//将用户的微博数+1
			userService.updateUser(user);		//保存更改后的用户信息
			session.setAttribute("loginUser", user);	
			mav.addObject("msg", "发布成功！");
		} catch (Exception e) {	
			e.printStackTrace();
			mav.addObject("msg", e.getMessage());
		}
		return mav;
	}

	/**
	 * 跳转到用户页面
	 * 通过用户id查找用户微博
	 * action=trans
	 * 根据acion的不同来选择显示不同的微博，例如转发和收藏微博
	 */
	@RequestMapping("profile_index")
	public ModelAndView profile_index(HttpSession session,String action){
		mav.clear();
		mav.setViewName("user/profile");
		user = (User)session.getAttribute("loginUser");
		try {
			List<Weibo> list = weiboService.paging(user.getId(), 1, 10,action);
			list = FaceFormat.formt(list);
			page.setPage(1);	//设置分页当前页数
			page.setTotalPage((weiboService.findUserWeiboNumber(user.getId(),action))/10+1);	//设置总页数
			mav.addObject("pageBean", page);
			for(int i=0;i<list.size();i++){
				list.get(i).setStr_pubTime(TimeFormat.dateToString(list.get(i).getStr_pubTime()));
			}
			List<User> userTuiJian = weiboService.findUserTuiJian(user.getId());
			mav.addObject("tuijian", userTuiJian);
			mav.addObject("weiboList", list);
			mav.addObject("logonUser",user);
			session.setAttribute("action", action);
		} catch (WeiboServiceException e) {
			e.printStackTrace();
		}
		
		return mav;
	}


	/**
	 * 微博关注用户
	 * ajx中url:attention?operation=gz&attId=
	 * aId:被关注用户id
	 * uId:session中的用户id
	 */
	@RequestMapping("attention")
	public ModelAndView attentionServi(String operation,String attId,HttpSession session){
		mav.clear();
		try {
			User user = (User)session.getAttribute("loginUser");
			long bId = Long.parseLong(attId);
			User bUser = userService.findUserById(bId);	
			weiboService.operationUser(operation, user, bUser);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
	
	
	/**
	 * 跳转至用户个人主页面
	 * url user_index?userId=${tj.id}
	 * 通过传来的id查找用户信息和用户微博信息
	 * 将查找到的信息保存在mav中
	 */
	@RequestMapping("user_index")
	public ModelAndView user_index(String p,HttpSession session,String userId){
		mav.clear();
		mav.setViewName("user");
		User loginuser = (User) session.getAttribute("loginUser");
		
		try {
			long uId = Long.parseLong(userId);
			User user = userService.findUserById(uId);
			int number = weiboService.findUserWeiboNumber(uId, "all");
			//用户首页微博分页
			if(number%10==0){
				if(number == 0){
					page.setTotalPage(1);
				}else{
					page.setTotalPage(number/10);
				}
			}else{
				page.setTotalPage(number/10+1);
			}
			if(p == null){
				page.setPage(1);
			}else{
				page.setPage(Integer.parseInt(p));
			}
			page.setMinPage(1);
			page.setMaxPage(10);
			
			List<Weibo> list = weiboService.findWeiboByUserId(uId,page);
			mav.addObject("user", user);	//用户个人信息
			list = FaceFormat.formt(list);
			mav.addObject("list", list);	//用户微博信息
			List<User> userTuiJian = weiboService.findUserTuiJian(loginuser.getId());
			mav.addObject("tuijian", userTuiJian);
			mav.addObject("pageBean", page);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
		
	}
	
	

	/**
	 * 分页
	 */
	@RequestMapping("pageUpAndDown")
	public ModelAndView pageUpAndDown(HttpSession session,String pageId,String operation,String action){
		mav.clear();
		int pageNumber = Integer.parseInt(pageId);
		int minPage = 0;
		int maxPage = 0;
		try {
			User user = (User)session.getAttribute("loginUser");
			if("Up".equals(operation)){
				page.setPage(page.getPage()-1); 	//上一页，当前页数-1
				minPage=pageNumber*10-10-9;
				maxPage=pageNumber*10-10;
			}else if("Down".equals(operation)){
				page.setPage(page.getPage()+1); 	//下一页，当前页数+1
				minPage=pageNumber*10+10-9;  		//sql中分页查询的最小值
				maxPage=pageNumber*10+10;			//sql中分页查询的最大值
			}
			List<Weibo> list = weiboService.paging(user.getId(), minPage, maxPage , action);
			list = FaceFormat.formt(list);
			List<User> userTuiJian = weiboService.findUserTuiJian(user.getId());
			
			
			
			mav.addObject("pageBean", page);
			mav.addObject("tuijian", userTuiJian);
			mav.addObject("weiboList", list);
			if("collect".equals(action)){
				mav.setViewName("user/collect");
			}else{
				mav.setViewName("user/profile");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
	
	/**
	 * 微博点赞功能
	 * ajax
	 */
	@RequestMapping("WeiboLike")
	public ModelAndView weiboLike(HttpSession session,String weiboId,HttpServletResponse resp,String spanMsg){
		User user = (User)session.getAttribute("loginUser");
		long wId = Long.parseLong(weiboId);
		resp.setContentType("text/html;charset=utf-8");
		
		try {
			PrintWriter pw = resp.getWriter();
			int likeNum = weiboService.weiboLike(wId, user.getId());
			
			
			 if(spanMsg.startsWith("已")){
				 pw.println("赞("+likeNum+")");
			 }else{
				 pw.println("已赞("+likeNum+")");
			 }
			
			pw.flush();
			pw.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	/**
	 * 微博转发功能
	 * ajax
	 */
	@RequestMapping("WeiboTrans")
	public ModelAndView WeiboTrans(HttpSession session,String weiboId,HttpServletResponse resp){
		User user = (User)session.getAttribute("loginUser");

		long wId = Long.parseLong(weiboId);
		
		resp.setContentType("text/html;charset=utf-8");
		try {
			user.setBlogNumber(user.getBlogNumber()+1);		//将用户的微博数+1
			userService.updateUser(user);		//保存更改后的用户信息
			PrintWriter pw = resp.getWriter();
			int transNum = weiboService.weiboTrans(wId, user.getId());
			pw.println("转发("+transNum+")");
			pw.flush();
			pw.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 微博评论
	 * url="pubComment?weiboId="+id+"comment="+msg.value;
	 * weiboId : 微博编号
	 * comment : 评论内容
	 */
	@RequestMapping("pubComment")
	public String pubComment(String weiboId,String comment,HttpSession session,HttpServletResponse resp){
		long id = Long.parseLong(weiboId);		//获取微博id
		User loginUser = (User)session.getAttribute("loginUser");	//评论人
		
		WeiboComm comm = new WeiboComm();
		//组装数据源
		comm.setWeiboId(id);	//微博id
		comm.setCommentId(loginUser.getId()); 	//评论人id
		comm.setCommentBody(comment);
		comm.setCommentState(1); 	//评论状态 1代表正常 2代表被删除 3代表被举报
		
		try {
			resp.setContentType("text");
			PrintWriter pw = resp.getWriter();
			int commNum = weiboService.weiboComment(comm);
			pw.print("评论("+commNum+")");
			
			pw.flush();
			pw.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

	/**
	 * 删除微博，不直接删除，而是将微博状态更新为1，被删除
	 * deleteWeibo?weiboId"+id
	 */
	@RequestMapping("deleteWeibo")
	@ResponseBody
	public String deleteWeibo(String weiboId){
		long wId = Long.parseLong(weiboId);
		try {
			weiboService.deleteWeibo(Constant.DELETE, wId);
		} catch (WeiboServiceException e) {
			e.printStackTrace();
		}
		return "1";
	}
	
	/**
	 * @deprecated 微博收藏，接受Ajax传值
	 * @param weiboId 微博Id
	 * @param session
	 * @return
	 */
	@RequestMapping("weiboCollect")
	@ResponseBody
	public String collect(String weiboId,HttpSession session){
		
		Long wId = Long.parseLong(weiboId);
		User user = (User)session.getAttribute("loginUser");
		try {
			weiboService.weiboCollect(user,wId);
		} catch (WeiboServiceException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 获取评论
	 * @param weiboId
	 * @param p
	 * @param fy
	 * @param session
	 * @param resp
	 * @return
	 */
	@RequestMapping(value= "/getComm")
	public String getComm(String weiboId,String p,String fy,HttpSession session,HttpServletResponse resp){
		mav.clear();
		long wId = Long.parseLong(weiboId);
		int page = Integer.parseInt(p);
		int zt = Integer.parseInt(fy);
		commPage.setPage(page);
		commPage.setMinPage(page*5-4);
		commPage.setMaxPage(page*5);
		if(zt == 1){
			//上一页
			commPage.setPage(page-1);
			commPage.setMinPage((page-1)*5-4);
			commPage.setMaxPage((page-1)*5);
		}else if(zt == 2){
			//下一页
			commPage.setPage(page+1);
			commPage.setMinPage((page+1)*5-4);
			commPage.setMaxPage((page+1)*5);
		}
		
		List<WeiboComm> comm = null;
		JSONArray json = null;
		try {
			int cNum = weiboService.findCommNum(wId);
			commPage.setTotalPage(cNum/5+1);
		
			comm = weiboService.findWeiboComm(wId,commPage);
			comm = FaceFormat.commFormt(comm);
			
			json = JSONArray.fromObject(comm);
			json.add(commPage);
			PrintWriter pw = resp.getWriter();  
	        resp.setContentType("application/json"); 
			pw.print(json.toString());
	        pw.flush();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@RequestMapping("collect_index")
	public ModelAndView collectIndex(HttpSession session){
		mav.clear();
		mav.setViewName("user/collect");
		user = (User)session.getAttribute("loginUser");
		
		
		try {
			List<Weibo> list = weiboService.paging(user.getId(), 1, 10,"collect");
			list = FaceFormat.formt(list);
			
			page.setPage(1);	//设置分页当前页数
			page.setTotalPage((weiboService.findUserWeiboNumber(user.getId(),"collect"))/10+1);	//设置总页数
			mav.addObject("pageBean", page);
			
			for(int i=0;i<list.size();i++){
				list.get(i).setStr_pubTime(TimeFormat.dateToString(list.get(i).getStr_pubTime()));
			}
			
			List<User> userTuiJian = weiboService.findUserTuiJian(user.getId());
			mav.addObject("tuijian", userTuiJian);
			mav.addObject("weiboList", list);
			mav.addObject("collectNum",list.size());
			mav.addObject("logonUser",user);
			session.setAttribute("action", "collect");
			
		} catch (WeiboServiceException e) {
			e.printStackTrace();
		}
		
		
		return mav;
	}
}
