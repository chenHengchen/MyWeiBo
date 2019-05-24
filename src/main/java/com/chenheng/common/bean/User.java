package com.chenheng.common.bean;

import java.io.Serializable;
import java.util.Date;

/*
 * 用户类
 */

public class User implements Serializable{
	
	private static final long serialVersionUID = 3275176147824704556L;
	private long id;	//id
	private String name;	//用户名
	private String password;	//密码
	private String email;	//邮箱，作为唯一标识
	private String nickName;	//昵称
	private String sex;		//性别
	private String position;	//居住地
	private String images;	//头像
	private String sign;	//个性签名
	private Date registerTime;	//注册时间
	private Date lastLogin;		//上次登录时间
	private int attention;	//关注数
	private int fans;	//粉丝数
	private int collect;	//收藏数
	private int integral;	//积分
	private int conchIntegral;	//海螺积分
	private int blogNumber;		//微博数量
	private String pwdQuestion;		//密保问题
	private String pwdAnswer;		//密保答案
	private String birthday;		//生日
	
	private int unReadMessage;	//未读私信数
	private String conchTitle;
	private int state;
	private String banTime;
	
	public User() {
	}
	

	public User(long id, String name, String password, String email, String nickName, String sex, String position,
			String images, String sign, Date registerTime, Date lastLogin, int attention, int fans, int collect,
			int integral, int conchIntegral, int blogNumber, String pwdQuestion, String pwdAnswer, String birthday) {
		this.id = id;
		this.name = name;
		this.password = password;
		this.email = email;
		this.nickName = nickName;
		this.sex = sex;
		this.position = position;
		this.images = images;
		this.sign = sign;
		this.registerTime = registerTime;
		this.lastLogin = lastLogin;
		this.attention = attention;
		this.fans = fans;
		this.collect = collect;
		this.integral = integral;
		this.conchIntegral = conchIntegral;
		this.blogNumber = blogNumber;
		this.pwdQuestion = pwdQuestion;
		this.pwdAnswer = pwdAnswer;
		this.birthday = birthday;
	}
	
	
	
	public int getState() {
		return state;
	}


	public void setState(int state) {
		this.state = state;
	}


	public String getBanTime() {
		return banTime;
	}


	public void setBanTime(String banTime) {
		this.banTime = banTime;
	}


	public String getConchTitle() {
		return conchTitle;
	}

	public void setConchTitle(String conchTitle) {
		this.conchTitle = conchTitle;
	}

	public int getUnReadMessage() {
		return unReadMessage;
	}

	public void setUnReadMessage(int unReadMessage) {
		this.unReadMessage = unReadMessage;
	}

	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public String getImages() {
		return images;
	}
	public void setImages(String images) {
		this.images = images;
	}
	public String getSign() {
		return sign;
	}
	public void setSign(String sign) {
		this.sign = sign;
	}
	public Date getRegisterTime() {
		return registerTime;
	}
	public void setRegisterTime(Date registerTime) {
		this.registerTime = registerTime;
	}
	public int getAttention() {
		return attention;
	}
	public void setAttention(int attention) {
		this.attention = attention;
	}
	public int getFans() {
		return fans;
	}
	public void setFans(int fans) {
		this.fans = fans;
	}
	public int getCollect() {
		return collect;
	}
	public void setCollect(int collect) {
		this.collect = collect;
	}
	public int getIntegral() {
		return integral;
	}
	public void setIntegral(int integral) {
		this.integral = integral;
	}
	public int getConchIntegral() {
		return conchIntegral;
	}
	public void setConchIntegral(int conchIntegral) {
		this.conchIntegral = conchIntegral;
	}
	public int getBlogNumber() {
		return blogNumber;
	}
	public void setBlogNumber(int blogNumber) {
		this.blogNumber = blogNumber;
	}
	public String getPwdQuestion() {
		return pwdQuestion;
	}
	public void setPwdQuestion(String pwdQuestion) {
		this.pwdQuestion = pwdQuestion;
	}
	public String getPwdAnswer() {
		return pwdAnswer;
	}
	public void setPwdAnswer(String pwdAnswer) {
		this.pwdAnswer = pwdAnswer;
	}

	public Date getLastLogin() {
		return lastLogin;
	}

	public void setLastLogin(Date lastLogin) {
		this.lastLogin = lastLogin;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}



	@Override
	public String toString() {
		return "User [id=" + id + ", name=" + name + ", password=" + password + ", email=" + email + ", nickName="
				+ nickName + ", sex=" + sex + ", position=" + position + ", images=" + images + ", sign=" + sign
				+ ", registerTime=" + registerTime + ", lastLogin=" + lastLogin + ", attention=" + attention + ", fans="
				+ fans + ", collect=" + collect + ", integral=" + integral + ", conchIntegral=" + conchIntegral
				+ ", blogNumber=" + blogNumber + ", pwdQuestion=" + pwdQuestion + ", pwdAnswer=" + pwdAnswer + "]";
	}

	

}
