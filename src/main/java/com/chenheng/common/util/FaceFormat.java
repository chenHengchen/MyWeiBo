package com.chenheng.common.util;

import java.util.List;

import com.chenheng.common.bean.Conch;
import com.chenheng.common.bean.Message;
import com.chenheng.common.bean.Weibo;
import com.chenheng.common.bean.WeiboComm;

public class FaceFormat {
	public static List<Weibo> formt(List<Weibo> list){
		if(list!=null){
			for(int i=0;i<list.size();i++){
				String body = list.get(i).getBody();
				String replaceAll = body.replaceAll("\\[@", "<img src=\"gif/");
				String all = replaceAll.replaceAll("@\\]", ".gif\""+">");
				list.get(i).setBody(all);
			}
		}
		return list;
	}
	
	public static List<WeiboComm> commFormt(List<WeiboComm> list){
		if(list!=null){
			for(int i=0;i<list.size();i++){
				String body = list.get(i).getCommentBody();
				String replaceAll = body.replaceAll("\\[@", "<img src=\"gif/");
				String all = replaceAll.replaceAll("@\\]", ".gif\""+">");
				list.get(i).setCommentBody(all);
			}
		}
		return list;
	}
	public static List<Message> messageFormt(List<Message> list){
		if(list!=null){
			for(int i=0;i<list.size();i++){
				String body = list.get(i).getMessage();
				String replaceAll = body.replaceAll("\\[@", "<img src=\"gif/");
				String all = replaceAll.replaceAll("@\\]", ".gif\""+">");
				list.get(i).setMessage(all);
			}
		}
		return list;
	}
	
	public static List<Conch> conchFormt(List<Conch> list){
		if(list!=null){
			for(int i=0;i<list.size();i++){
				String body = list.get(i).getConchBody();
				String replaceAll = body.replaceAll("\\[@", "<img src=\"gif/");
				String all = replaceAll.replaceAll("@\\]", ".gif\""+">");
				list.get(i).setConchBody(all);
			}
		}
		return list;
	}
	
	public static String conchFormt(String str){
		String toTrans = "";
		if(str!=null){
				String replaceAll = str.replaceAll("\\[@", "<img src=\"gif/");
				String all = replaceAll.replaceAll("@\\]", ".gif\""+">");
				toTrans = all;
		}
		return toTrans;
	}
	
	public static String keyFormt(String str,String key){
		String toTrans = "";
		if(str!=null){
				String replaceAll = str.replaceAll(key, "<span style='color:red'>"+key+"</span>");
				toTrans = replaceAll;
		}
		return toTrans;
	}
	public static void main(String[] args) {
		String string = FaceFormat.keyFormt("<img src='gif/F_51.gif'>傻孩砸", "傻孩砸");
		
		System.out.println(string);
	}
}
