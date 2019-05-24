package com.chenheng.web.controller;

import java.io.File;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.util.DigestUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.chenheng.common.bean.Conch;
import com.chenheng.common.bean.User;
import com.chenheng.common.bean.Weibo;
import com.chenheng.common.bean.WeiboComm;
import com.chenheng.common.exception.UserServiceException;
import com.chenheng.common.exception.WeiboServiceException;
import com.chenheng.common.util.CommPage;
import com.chenheng.common.util.FaceFormat;
import com.chenheng.common.util.PageBean;
import com.chenheng.service.IUserService;
import com.chenheng.service.IWeiboService;

/**
 * 控制器 
 */
@Controller
public class MainController {
	
	private ModelAndView mav = new ModelAndView();
	@Resource
	private IUserService userService;
	
	@Resource
	private IWeiboService weiboService;
	
	PageBean page = new PageBean();
	CommPage commPage = new CommPage();
	String conchOperation = null;
	String skey = "";
	
	/**
	 * 跳转至注册页面
	 * @return
	 */
	@RequestMapping("register_index")	//跳转到登录页面
	public ModelAndView register(){
		ModelAndView mav = new ModelAndView("register");
		return mav;
	}
	
	/**
	 * 功能：实现注册功能，在emailServlet方法中已经对用户输入的邮箱地址做了验证
	 * 因此不必在该方法中做验证，直接调用service层中的register方法将用户信息保
	 * 存到数据库中
	 * @param user SpringMVC中如果参数的名称跟控制器方法参数中声明的类中的属
	 * 性对应，就可以自动实例
	 * @return
	 */
	@RequestMapping("register_action")
	public ModelAndView registerUser(User user){
		mav.clear();
		try {
			if(user.getSex().equals("1")){
				//用户性别为男，修改初始化头像
				user.setImages("face/boy.png");
			}else if(user.getSex().equals("0")){
				//用户性别为女时
				user.setImages("face/gril.png");
			}
			userService.register(user);
			mav.setViewName("register");
			mav.addObject("msg", "注册成功");
		} catch (UserServiceException e) {
			mav.setViewName("register");
			mav.addObject("msg", e.getMessage());
		}
		return mav;
	}
	
	/**
	 * 功能 : 判断用户输入的邮箱是否已被注册，使用邮箱作为用户的唯一标识
	 * 		作为接受前端发来异步请求接受的方法，查询数据库中邮箱地址为
	 * 		用户输入的email的用户，如果存在，就返回显示错误的图片和
	 * 		邮箱已被注册的文字，如果该email不存在，则返回正确的图片和
	 * @param resp HttpServletResponse响应
	 * @param email	异步请求所携带的用户输入的邮箱
	 * @return
	 */
	@RequestMapping("RegisterServlet")		//判断用户输入的邮箱是否已被注册
	public ModelAndView emailServlet(HttpServletResponse resp,String email){
		mav.clear();
		try {
			User user = userService.findUserByEmail(email);
			resp.setContentType("text");
			PrintWriter pw = null;
			pw = resp.getWriter();
			if(user==null){
				pw.print("<img src='icon/ok.png' align='absmiddle'> ");
			}else{
				pw.print("<img src='icon/err.png' align='absmiddle'> <font color='red'>邮箱已被注册</font>");
			}
			pw.flush();
			pw.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 功能:判断用户输入的验证码是否正确，前端采用ajax异步交互，接受发来的请求与session中保存的验证码
	 * 作比较，如果正确，返回显示正确的图片，如果错误，返回验证码有误的文字和错误的图片，使用ajax实现异步交
	 * 互，局部刷新
	 * @param yzm 验证码，在前端js中发来的异步请求所携带用户填写的验证码 
	 */
	@RequestMapping("AuthCodeServlet")	//局部刷新返回用户输入的验证码是否正确
	public String authCodeServlet(HttpSession session,HttpServletResponse resp,String yzm){
		mav.clear();
		try {
			String ac = (String) session.getAttribute("authCode");
			resp.setContentType("text");
			PrintWriter pw = resp.getWriter();
			if(ac.equals(yzm)){
				//验证码正确
				pw.print("<img src='icon/ok.png' align='absmiddle'> ");
			}else{
				//验证码错误
				pw.print("<img src='icon/err.png' align='absmiddle'> <font color='red'>验证码错误</font>");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 跳转至登录页面
	 * @return
	 */
	@RequestMapping("weibo_index")
	public String weibo_index(){
		return "index";
	}

	/***
	 * 验证用户名和密码是否正确
	 * 判断sava是否为yes，将用户名和密码保存在cookie中
	 * 判断用户上次登录时间与本次登录是否在同一天，如果不是，则为用户增加积分，并保存增加积分的记录信息
	 * @param userid 用户输入的用户名
	 * @param password 用户输入的密码
	 * @param save	是否自动登录
	 * @param session
	 * @return
	 */
	@RequestMapping("login_action")
	public ModelAndView loginAction(String userid,String password,String save,HttpSession session,HttpServletResponse resp){
		mav.clear();
		try {
			User loginUser = userService.login(userid, password);
			session.setAttribute("loginUser", loginUser);		//将登录用户信息保存在session中
			
			List<User> userTuiJian = weiboService.findUserTuiJian(loginUser.getId());
			mav.addObject("tuijian", userTuiJian);
			
			mav.setViewName("redirect:home_index");
			mav.addObject("p",1);
			if(save!=null){
				Cookie emailCookie = new Cookie("weibo_email", userid);
				emailCookie.setMaxAge(24*60*60*7);	//设置cookie过期时间为7天
				//对密码进行md5加密
				password = DigestUtils.md5DigestAsHex(password.getBytes());
				Cookie pwdCookie = new Cookie("weibo_password", password);
				pwdCookie.setMaxAge(24*60*60*7);
				resp.addCookie(pwdCookie);
				resp.addCookie(emailCookie);
			}
			
			Map<String, Object> alerts = userService.alerts(loginUser.getId());
			session.setAttribute("alerts", alerts);
			
		} catch (UserServiceException | WeiboServiceException e) {
			mav.setViewName("forward:register_index");
			mav.addObject("msg", e.getMessage());
		}
		return mav;
	}

	/**
	 * 跳转至用户个人首页
	 */
	@RequestMapping("home_index")
	public ModelAndView home_index(Integer p,HttpSession session){
		mav.clear();
		mav.setViewName("home");
		if( p == null){
			p = 1;
		}
		User user = (User)session.getAttribute("loginUser");
		try {
			int num = weiboService.findHomeWeiboNum(0);	//state为0的微博数量
			if(num%10 == 0){
				page.setTotalPage(num/10);
			}else{
				page.setTotalPage(num/10+1);
			}
			page.setPage(p);	//微博分页为第一页
			page.setMinPage(p*10-9);
			page.setMaxPage(p*10);
			
			commPage.setPage(1);	//评论分页
			commPage.setMinPage(1);
			commPage.setMaxPage(5);
		
			List<Weibo> list = weiboService.findHomeWeibo(0, page, null);
			list = FaceFormat.formt(list);
			for(int i=0;i<list.size();i++){
				long uId = list.get(i).getU_id();	//获取用户id
				User weibo_user = userService.findUserById(uId);
				list.get(i).setUser(weibo_user); 	//将user信息组装到weibo类中
				boolean b = weiboService.userLikeWeibo(list.get(i).getId(), user.getId());
				list.get(i).setB(b);
				//重新查找未读私信数目
				Map<String, Object> alerts = userService.alerts(user.getId());
				session.setAttribute("alerts", alerts);
			}
			List<User> userTuiJian = weiboService.findUserTuiJian(user.getId());
			mav.addObject("tuijian", userTuiJian);
			mav.addObject("pageBean", page);
			mav.addObject("weiboList", list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return mav;
	}
	
	/**
	 * 跳转至修改用户基本信息页面
	 */
	@RequestMapping("userinfo_index")
	public ModelAndView userinfo_index(){
		mav.clear();
		mav.setViewName("user/userinfo");
		return mav;
	}

	/**
	 * 功能:修改用户基本信息
	 * 获取用户输入的信息，将生日拼接为xxxx-xx-xx的格式
	 * 获取session中的登录用户
	 * 修改session中用户的属性值
	 * 调用service层中修改用户
	 */
	@RequestMapping("userinfo_action")
	public ModelAndView userinfo_action(HttpSession session,User user,String year,String month,String day){
		mav.clear();
		String birthday = year+"-"+month+"-"+day;		//拼接生日
		User loginUser = (User) session.getAttribute("loginUser");		//获取登录用户
		loginUser.setNickName(user.getNickName());
		loginUser.setName(user.getName());
		loginUser.setSex(user.getSex());
		loginUser.setSign(user.getSign());
		loginUser.setPosition(user.getPosition());
		loginUser.setBirthday(birthday);
		session.setAttribute("loginUser", loginUser);
		try {
			userService.updateUser(loginUser);
			mav.addObject("msg", "修改成功！");
		} catch (UserServiceException e) {
			mav.addObject("msg", e.getMessage());
		}
		mav.setViewName("forward:userinfo_index");
		return mav;
	}

	/**
	 * 跳转至用户密码页面
	 */
	@RequestMapping("pwd_index")
	public String pwd_index(){
		return "user/password";
	}

	/**
	 * 跳转至用户头像页面
	 */
	@RequestMapping("face_index")
	public String face_index(){
		return "user/face";
	}
	
	/**
	 * Ajax验证用户旧密码
	 */
	@RequestMapping("PWDServlet")
	public String pwd(HttpSession session,HttpServletResponse   resp,String pwd){
		mav.clear();
		try {
			User user = (User) session.getAttribute("loginUser");
			resp.setContentType("text");
			PrintWriter pw = null;
			pw = resp.getWriter();
			//对密码进行md5加密
			pwd = DigestUtils.md5DigestAsHex(pwd.getBytes());
			if(user.getPassword().equals(pwd)){
				pw.print("<img src='icon/ok.png' align='absmiddle'> ");
			}else{
				pw.print("<img src='icon/err.png' align='absmiddle'> <font color='red'>密码错误</font>");
			}
			pw.flush();
			pw.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 保存用户新密码
	 */
	@RequestMapping("updatePwd")
	public ModelAndView updatePwd(String newpwd,HttpSession session){
		mav.clear();
		mav.setViewName("user/password");
		User user = (User)session.getAttribute("loginUser");
		try {
			//对密码进行md5加密
			newpwd = DigestUtils.md5DigestAsHex(newpwd.getBytes());
			user.setPassword(newpwd);
			userService.updateUser(user); 
			session.setAttribute("loginUser", user);
			mav.addObject("msg", "修改成功");
		} catch (UserServiceException e) {
			e.printStackTrace();
		}
		return mav;
	}
	
	/**
	 * 跳转至修改用户密保页面
	 */
	@RequestMapping("question_index")
	public String question(){
		return "user/question";
	}
	
	/**
	 * Ajax验证用户输入的密保问题是否正确
	 */
	@RequestMapping("QAServlet")
	public String QAServlet(HttpSession session,String answer,HttpServletResponse resp){
		mav.clear();
		User user = (User)session.getAttribute("loginUser");
		try {
			resp.setContentType("text");
			PrintWriter pw = resp.getWriter();
			if(user.getPwdAnswer().equals(answer)){
				pw.print("<img src='icon/ok.png' align='absmiddle'> ");
			}else{
				pw.print("<img src='icon/err.png' align='absmiddle'> <font color='red'>答案错误</font>");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 修改密保问题和答案
	 */
	@RequestMapping("updateQuestion")
	public ModelAndView updateQuestion(HttpSession session,String newQuestion,String newAnswer){
		mav.clear();
		User user = (User)session.getAttribute("loginUser");
		user.setPwdQuestion(newQuestion);
		user.setPwdAnswer(newAnswer);
		try {
			userService.updateUser(user);
			session.setAttribute("loginUser", user);
			mav.setViewName("forward:question_index");
			mav.addObject("msg", "修改成功!");
		} catch (UserServiceException e) {
			e.printStackTrace();
		}
		return mav;
	}

	/**
	 * 保存用户头像 
	 */
	@RequestMapping("updateFace")
	public ModelAndView updateFace(@RequestParam("icon") MultipartFile icon,HttpSession session,HttpServletRequest req){
		mav.clear();
		mav.setViewName("user/face");
		User user = (User)session.getAttribute("loginUser");
		if(!(icon.isEmpty())){	//如果文件存在，isEmpty文件为空
			//保存文件目录
			String path = req.getSession().getServletContext().getRealPath("/") + "WEB-INF/jsp/face/" + user.getId() + icon.getOriginalFilename();
			System.out.println("path:"+path);
			//			String path = req.getServletContext().getRealPath("/")+"WEB-INF/jsp/face/"+user.getId()+icon.getOriginalFilename();
			File newFile = new File(path);
			//判断文件目录存在不存在，如果不存在就创建目录
			if(!(newFile.getParentFile().exists())){
				newFile.getParentFile().mkdirs();
			}
			try {
				icon.transferTo(newFile);	//转存文件
				
				File oldIcon = new File(req.getServletPath()+"WEB-INF/jsp/"+user.getImages());	//删除之前的头像
				if(!(user.getImages().equals("face/boy.png") || user.getImages().equals("face/girl.png"))){
					//先判断用户之前的头像不是系统默认的头像，然后删除用户之前的头像
					if(oldIcon.exists()){
						oldIcon.delete();
					}
				}
				user.setImages("face/"+user.getId()+icon.getOriginalFilename());
				userService.updateUser(user);	//保存用户头像
				session.setAttribute("loginUser", user);	//将保存后的用户头像信息保存在用户session中
			} catch (Exception e) {	
				e.printStackTrace();
			}
		}else{
			mav.addObject("msg", "图片不存在");
		}
		return mav;
	}
	
	@RequestMapping("conch_index")
	public ModelAndView conchIndex(HttpSession session,String operation,int nPage){
		mav.clear();
		mav.setViewName("user/conch");
		User user = (User) session.getAttribute("loginUser");
		if(operation != null){
			conchOperation = operation;
		}
		try {
			//海螺分页
			//获取海螺总数
			int num = userService.conchNum(user.getId(), conchOperation);
			if(num%5 == 0){
				if(num == 0){
					page.setTotalPage(1);
				}else{
					page.setTotalPage(num/5);
				}
			}else{
				page.setTotalPage(num/5+1);
			}
			page.setPage(nPage);	//每5页一分页
			page.setMinPage(nPage*5-4);
			page.setMaxPage(nPage*5);
			
			//查找海螺显示
			Map<String, Object> map = userService.conchIndex(user.getId(), conchOperation ,page);
			
			List<User> userTuiJian = weiboService.findUserTuiJian(user.getId());
			mav.addObject("tuijian", userTuiJian);
			mav.addObject("conch", map);
			mav.addObject("pageBean", page);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
	
	@RequestMapping("publishConch")
	public ModelAndView publishConch(HttpSession session,String inputbox,int cNumber){
		mav.clear();
		mav.setViewName("user/conch");
		User user = (User) session.getAttribute("loginUser");

		Conch conch = new Conch();
		conch.setcNumber(cNumber);
		conch.setConchBody(inputbox);
		conch.setUserId(user.getId());
		
		try {
			userService.publishConch(conch);
			mav.addObject("msg", "发布成功！");
			
			//海螺分页
			//获取海螺总数
			int num = userService.conchNum(user.getId(), conchOperation);
			if(num%5 == 0){
				page.setTotalPage(num/5);
			}else{
				page.setTotalPage(num/5+1);
			}
			page.setPage(1);	//每5页一分页
			page.setMinPage(1*5-4);
			page.setMaxPage(1*5);
			
			//查找海螺显示
			Map<String, Object> map = userService.conchIndex(user.getId(), conchOperation ,page);
			
			List<User> userTuiJian = weiboService.findUserTuiJian(user.getId());
			mav.addObject("tuijian", userTuiJian);
			mav.addObject("conch", map);
			mav.addObject("pageBean", page);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
	
	/**
	 * 海螺详细问题页面
	 * conchDetail?conchId=
	 * @return 
	 */
	@RequestMapping("conchDetail")
	public ModelAndView conchDetail(HttpSession session,long conchId){
		mav.clear();
		mav.setViewName("user/conchDetail");
		User user = (User) session.getAttribute("loginUser");
		
		try {
			Map<String, Object> map = userService.conchDetail(conchId);
			List<User> userTuiJian = weiboService.findUserTuiJian(user.getId());
			mav.addObject("tuijian", userTuiJian);
			mav.addObject("detailMap", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
	
	@RequestMapping("conchComm")
	public ModelAndView createCommtoConch(long userId,long conchId,String inputbox){
		mav.clear();
		mav.setViewName("redirect:conchDetail");
		WeiboComm comm = new WeiboComm();	//使用微博评论实体作为海螺评论实体
		comm.setCommentId(userId);
		comm.setWeiboId(conchId);	//将微博id属性作为海螺id
		comm.setCommentBody(inputbox);
		try {
			userService.conchComm(comm);
			mav.addObject("conchId", conchId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
	
	/**
	 * adoptComm?conchId=${detailMap.conch.id}&comm=${comm.id}
	 * @return
	 */
	@RequestMapping("adoptComm")
	public ModelAndView adoptComm(long conchId,long comm){
		mav.clear();
		mav.setViewName("redirect:conchDetail");
		try {
			userService.adoptComm(conchId, comm);
		} catch (UserServiceException e) {
			e.printStackTrace();
		}
		mav.addObject("conchId", conchId);
		return mav;
	}
	
	/**
	 * 搜索
	 */
	@RequestMapping("seach")
	public ModelAndView seach(String key,String ac,int pag,HttpSession session){
		mav.clear();
		if(key != null){
			skey = key;
		}
		User user = (User) session.getAttribute("loginUser");
		if("weibo".equals(ac)){
			mav.setViewName("seachWeiboPage");
		}else if("user".equals(ac)){
			mav.setViewName("seachUserPage");
		}
		try {
			Map<String, Object> map = userService.seachWeiboAndUser(skey,pag,ac);
			mav.addObject("map", map);
			List<User> userTuiJian = weiboService.findUserTuiJian(user.getId());
			mav.addObject("tuijian", userTuiJian);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
	
	@RequestMapping("forget")
	public ModelAndView forget(String email){
		mav.clear();
		try {
			User user = userService.findUserByEmail(email);
			if(user == null){
				//用户不存在的
				mav.setViewName("register");
				mav.addObject("msg", "该用户不存在！");
			}else{
				//用户存在
				mav.setViewName("forget");
				mav.addObject("fUser", user);
			}
		} catch (UserServiceException e) {
			e.printStackTrace();
		}
		
		return mav;
	}
	
	@RequestMapping("forgetAnswer")
	public ModelAndView forgetAnswer(String email,String answer,HttpServletResponse resp){
		mav.clear();
		try {
			User user = userService.findUserByEmail(email);
			resp.setContentType("text");
			PrintWriter pw = resp.getWriter();
			if(user.getPwdAnswer().equals(answer)){
				pw.print("<img src='icon/ok.png' align='absmiddle'> ");
			}else{
				pw.print("<img src='icon/err.png' align='absmiddle'> <font color='red'>答案错误</font>");
			}
			pw.flush();
			pw.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	@RequestMapping("up_forget")
	public ModelAndView up_forget(String email,User bUser){
		mav.clear();
		try {
			User auser = userService.findUserByEmail(email);
			String password = DigestUtils.md5DigestAsHex(bUser.getPassword().getBytes());
			bUser.setPassword(password);
			if(auser.getPwdAnswer().equals(bUser.getPwdAnswer())){
				//修改用户登录密码
				auser.setPassword(bUser.getPassword());
				userService.updateUser(auser);
				mav.setViewName("register");
				mav.addObject("msg","密码重置成功！");
			}else{
				mav.setViewName("redirect:forget");
				mav.addObject("email",email);
			}
		} catch (UserServiceException e) {
			e.printStackTrace();
		}
		return mav;
	}
	
	@RequestMapping("exit")
	public String exit(HttpSession session){
		session.removeAttribute("loginUser");
		session.removeAttribute("alerts");
		return "register";
	}
}
