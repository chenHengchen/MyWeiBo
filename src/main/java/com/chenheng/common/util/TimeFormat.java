package com.chenheng.common.util;

import java.sql.Date;

/**
 * 日期转换类
 */
public class TimeFormat {
	
	/**
	 * 将sql类型的日期转换为字符串输入
	 * 如果不是本年还要加上对应的年份
	 * @param sqlDate
	 * @return
	 */
	@SuppressWarnings("deprecation")
	public static String timeFormat(Date date){
		String timeDate = "";
		java.util.Date nowDate = new java.util.Date();	//系统当前时间
		java.util.Date sqlDate = utilDate(date);		//参数日期
		
		int nowYear = nowDate.getYear();
		int sqlYear = sqlDate.getYear();
		
		int nowMonth = nowDate.getMonth()+1;
		int sqlMonth = sqlDate.getMonth()+1;
		
		int nowDay = nowDate.getDate();
		int sqlDay = sqlDate.getDate();
		
		int sqlHours = sqlDate.getHours();
		int sqlMinutes = sqlDate.getMinutes();
		
		if(nowYear != sqlYear){
			timeDate += 1900+sqlYear;	//不同年
		}
		if(nowYear == sqlYear && nowMonth == sqlMonth && nowDay == sqlDay){
			timeDate += "今天 "+sqlHours+":"+sqlMinutes;
		}else if(nowYear == sqlYear && nowMonth == sqlMonth && nowDay-1 == sqlDay){
			timeDate += "昨天 "+sqlHours+":"+sqlMinutes;
		}else{
			timeDate = sqlMonth+"月"+sqlDay+"日   "+sqlHours+":"+sqlMinutes;
		}
			
		return timeDate;
	}
	
	/**
	 * 将util类型的Date转化为sql类型
	 * @param utilDate
	 * @return
	 */
	public static Date transDateToSql(java.util.Date utilDate){
		Date date = new Date(utilDate.getTime());
		return date;
	}
	
	/**
	 * 获取当前sql格式日期
	 * @param utilDate
	 * @return
	 */
	public static Date nowDate(){
		Date date = new Date(new java.util.Date().getTime());
		return date;
	}
	
	/**
	 * 将sql类型的date转换为util类型的日期
	 * @param date
	 * @return
	 */
	public static java.util.Date utilDate(Date date){
		return new java.util.Date(date.getTime());
	}
	
	public static String dateToString(String date){
		String targetTime = "";
		java.util.Date nowDate = new java.util.Date();
		int nowYear = nowDate.getYear()+1900;
		int nowMonth = nowDate.getMonth()+1;
		int nowDay = nowDate.getDate();
		//获取当前年月日
		
		String[] split = date.split("-");
		int year = Integer.parseInt(split[0]);
		int month = Integer.parseInt(split[1]);
		int day = Integer.parseInt(split[2].split(" ")[0]);
		String[] sp2 = date.split(":");
		int hours = Integer.parseInt(sp2[0].split(" ")[1]);
		String minutes = sp2[1];
		
		
		if(nowYear != year){
			targetTime += year;
		}
		if(nowYear == year && nowMonth == month && nowDay == day){
			targetTime = "今天 "+hours+":"+minutes;
		}else if(nowYear == year && nowMonth == month && nowDay-1 == day){
			targetTime = "昨天 "+hours+":"+minutes;
		}else{
			targetTime += month+"月"+day+"日  "+hours+":"+minutes;
		}
			
		return targetTime;
	}
	
	public static void main(String[] args) {
		String s = dateToString("2017-03-20 17:09:20");
		System.out.println(s);
	}
	
}
