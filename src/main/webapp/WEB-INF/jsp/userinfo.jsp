<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>
	        <table align="center" id="userinfo">
          <tr>
            <td width="75%" align="left"><table width="80%" border="0" align="left" cellpadding="3" cellspacing="0">
              <tr>
                <td align="center" class="split2"><a href="atten_index">关注</a><br>${loginUser.attention}</td>
                <td align="center" class="split2"><a href="3">粉丝</a><br>${loginUser.fans}</td>
                <td align="center"><a href="profile_index?action=all">微博</a><br>${loginUser.blogNumber}</td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td class="split1"><a href="userinfo_index">个人账户设置</a>&nbsp;&nbsp;&nbsp;<a href="message?userBId=-1">未读私信(${alerts.unRMNum})</a></td>
          </tr>
        </table>
        <table border="0" align="center" cellpadding="0" cellspacing="0" id="userlist">
          <tr>
            <td class="title" height="29">可能感兴趣的人</td>
            <td align="right" class="title"></td>
          </tr>
         
          <c:forEach items="${tuijian}" var="tj">
          	 <tr> 
            	<td colspan="2">
	            	<table border="0" cellpadding="0" cellspacing="0" class="userdetail">
		             	 <tr>
		               	 	<td width="26%"><a href="user_index?userId=${tj.id}"><img src="${tj.images}" width="50" height="50" border="0" /></a></td>
		                	<td width="74%"><a href="user_index?userId=${tj.id}">${tj.nickName}</a> 
		                		<input name="${tj.id}" type="button" class="btnguanzhu" id="${tj.id}" value="+关注"  onclick="attention(${tj.id})"/>
		               		<br />签名：${tj.sign}<br /></td>
		              	</tr>
	            	</table>
            	</td>
          </tr>
          </c:forEach>
          
        </table>
</body>
</html>