package com.chenheng.web.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.chenheng.common.bean.Conch;
import com.chenheng.common.bean.User;
import com.chenheng.common.bean.Weibo;
import com.chenheng.common.exception.UserServiceException;
import com.chenheng.common.util.PageBean;
import com.chenheng.service.IAdminService;

/** 
 * @author : 
 * @date
 * @version 1.0 
 * @parameter 
 * @return 
 */
@Controller
public class AdminController {
	
	ModelAndView mav = new ModelAndView();
	PageBean pageBean = new PageBean();
	private String ukey;
	private String wkey;
	private String ckey;
	@Resource
	private IAdminService adminService;
	
	@RequestMapping("admin_login")
	public String adminIndex(){
		return "admin/adminlogin";
	}
	
	@RequestMapping("adminIndex")
	public ModelAndView admin_index(){
		mav.clear();
		mav.setViewName("admin/index");
		//首页展示数据
		try {
			Map<String, Object> map = adminService.indexDate();
			mav.addObject("map", map);
		} catch (UserServiceException e) {
			e.printStackTrace();
		}
		return mav;
	}
	
	
	/**
	 * 管理员登录adminlogin
	 */
	@RequestMapping("adminlogin")
	public ModelAndView adminlogin(String name,String password,HttpSession session){
		mav.clear();
		mav.setViewName("redirect:adminIndex");
		try {
			User adminlogin = adminService.adminlogin(name, password);
			session.setAttribute("admin", adminlogin);
		} catch (UserServiceException e) {
			mav.setViewName("admin/adminlogin");
			mav.addObject("msg", "用户名或密码错误！");
		}
		return mav;
	}
	
	@RequestMapping("userManage")
	public ModelAndView userManage(int page,String key){
		mav.clear();
		mav.setViewName("admin/user");
		if("all".equals(key)){
			ukey = null;
		}else{
			ukey = key;
		}
		try {
			int num = 0;
			if(ukey == null){
				num =  adminService.findUserNum();
			}else{
				num = adminService.findUserNum(ukey);
			}
			if(num%10 == 0){
				if(num == 0){
					pageBean.setTotalPage(1);
				}else{
					pageBean.setTotalPage(num/10);
				}
			}else{
				pageBean.setTotalPage(num/10+1);
			}
			pageBean.setPage(page);
			pageBean.setMinPage(page*10-9);
			pageBean.setMaxPage(page*10);
			List<User> list = null;
			if(ukey == null){
				list =  adminService.userManage(pageBean);
			}else{
				list = adminService.userManageByKey(pageBean, ukey);
			}
			mav.addObject("userList", list);
			mav.addObject("pageBean",pageBean);
		} catch (UserServiceException e) {
			e.printStackTrace();
		}
		return mav;
	}
	
	@RequestMapping("fjUser")
	public ModelAndView fjUser(long uId,int day){
		mav.clear();
		mav.setViewName("redirect:userManage");
		try {
			adminService.FJUser(uId, day);	//uId封禁用户编号，day封禁天数
		} catch (UserServiceException e) {
			e.printStackTrace();
		}
		mav.addObject("page", 1);
		return mav;
	}
	
	@RequestMapping("jfUser")
	public ModelAndView jfUser(long uId){
		mav.clear();
		mav.setViewName("redirect:userManage");
		try {
			adminService.JFUser(uId);
		} catch (UserServiceException e) {
			e.printStackTrace();
		}
		mav.addObject("page", 1);
		return mav;
	}
	
	@RequestMapping("weiboManage")
	public ModelAndView weiboManage(int page,String key){
		mav.clear();
		mav.setViewName("admin/weibo");
		if("all".equals(key)){
			wkey = null;
		}else{
			wkey = key;
		}
		try {
			int num = adminService.findWeiboNum(wkey);
			if(num%10 == 0){
				if(num == 0){
					pageBean.setTotalPage(1);
				}else{
					pageBean.setTotalPage(num/10);
				}
			}else{
				pageBean.setTotalPage(num/10+1);
			}
			pageBean.setPage(page);
			pageBean.setMinPage(page*10-9);
			pageBean.setMaxPage(page*10);
			List<Weibo> list = adminService.findWeibo(pageBean, wkey);
			mav.addObject("weiboList", list);
			mav.addObject("pageBean",pageBean);
		} catch (UserServiceException e) {
			e.printStackTrace();
		}
		return mav;
	}
	
	@RequestMapping("upWeibo")
	public ModelAndView upWeibo(long wId,String ac){
		mav.clear();
		mav.setViewName("redirect:weiboManage");
		try {
			adminService.UpWeibo(wId, ac);
			mav.addObject("page", 1);
		} catch (UserServiceException e) {
			e.printStackTrace();
		}
		return mav;
	}
	
	/**
	 * conchManage?page=1
	 */
	@RequestMapping("conchManage")
	public ModelAndView conchManage(int page,String key){
		mav.clear();
		mav.setViewName("admin/conch");
		if("all".equals(key)){
			ckey = null;
		}else{
			ckey = key;
		}
		try {
			int num = adminService.findConchNum(ckey);
			if(num%10 == 0){
				if(num == 0){
					pageBean.setTotalPage(1);
				}else{
					pageBean.setTotalPage(num/10);
				}
			}else{
				pageBean.setTotalPage(num/10+1);
			}
			pageBean.setPage(page);
			pageBean.setMinPage(page*10-9);
			pageBean.setMaxPage(page*10);
			List<Conch> list = adminService.findConch(pageBean, ckey);
			mav.addObject("conchList", list);
			mav.addObject("pageBean",pageBean);
		} catch (UserServiceException e) {
			e.printStackTrace();
		}
		return mav;
	}
	
	@RequestMapping("upConch")
	public ModelAndView upConch(long cId,String ac){
		mav.clear();
		mav.setViewName("redirect:conchManage");
		
		try {
			adminService.UpConch(cId, ac);
		} catch (UserServiceException e) {
			e.printStackTrace();
		}
		
		mav.addObject("page",1);
		return mav;
	}
	
	@RequestMapping("adminExit")
	public String adminExit(HttpSession session){
		session.removeAttribute("admin");
		return "admin/adminlogin";
	}
}
