<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<c:if test="${msg!=null}">
	<script type="text/javascript">
	var msg="${msg}"
	alert(msg);
	</script>
</c:if>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link rel="stylesheet" type="text/css" href="css/global.css" />
<link rel="stylesheet" type="text/css" href="css/friend.css" />
<title>微博 - 别来碰我的关注</title>

</head>
<body>
<!-- header开始-->
	<%@include file="../header.jsp" %>
<!-- header结束-->
<!-- container 开始-->
<table border="0" align="center" cellpadding="0" cellspacing="0" id="container" >
  <tr>
    <td width="670" height="600" valign="top">
    <table border="0" align="center" cellpadding="5" cellspacing="0" id="guanzhu">
      <tr>
        <td>我共关注了 ${loginUser.attention} 人</td><td align="right"></td>
      </tr>
    </table>
    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" id="menu">
          <tr>
            <td width="33%" align="center"><table width="165" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td align="center"><a href="friend_index">微博</a></td>
                <td align="center"><a href="atten_index">关注</a></td>
                <td align="center"><a href="fans_index">粉丝</a></td>
                <td align="center"><a href="blank_index">黑名单</a></td>
              </tr>
            </table></td>
            <td width="18%" align="right">&nbsp;</td>
            <td width="49%" align="center">&nbsp;</td>
          </tr>
      </table>
        <!-- weibo 开始-->
        
   	<c:forEach items="${weiboList}" var="weibo">
		<table id="weibo" width="90%" border="0" align="center" cellpadding="3" cellspacing="0" style="background-color: #F8F8F8">
          <tr>
            <td rowspan="3" align="center" valign="top"><img src="${weibo.user.images}" width="50" height="50" /></td>
            <td width="88%" class="content"><a href="user_index?userId=${weibo.user.id}">${weibo.user.nickName}</a><img src="icon/v.gif" width="11" height="10" align="middle" /><br> ${weibo.body}</td>
          </tr>
          <c:if test="${weibo.image != 'null'}">
          	<tr>
            	<td><img src="${weibo.image}" id="${weibo.id}" width="89" height="120" onclick="imgAct(${weibo.id})"/></td>
         	</tr>
          </c:if>
          <c:if test="${weibo.image == 'null'}">
          	<tr>
            	<td></td>
         	</tr>
          </c:if>
          <tr>
            <td height="25"><table width="100%" border="0" cellpadding="0" cellspacing="0" id="weibo_status">
              <tr>
                <td>${weibo.str_pubTime}</td>
                <td align="right">
                	<span id="like${weibo.id}" onclick="like(${weibo.id})" style="cursor:pointer">
                		<c:if test="${weibo.b==false}">赞(${weibo.likeN})</c:if>
                		<c:if test="${weibo.b==true}">已赞(${weibo.likeN})</c:if>
                	</span>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
                	<span id="trans${weibo.id}" onclick="trans(${weibo.id})" style="cursor:pointer">转发(${weibo.tranum})</span>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
                	<span id="comm${weibo.id}" onclick="comm(0,${weibo.id})" style="cursor:pointer">评论(${weibo.comnum})</span>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
                	<span id="coll${weibo.id}" onclick="coll(${weibo.id})" style="cursor:pointer">收藏</span>
                </td>
              </tr>
            </table></td>
          </tr>
			
	<tr >
           <td rowspan="3" align="center" valign="top" ></td>
            <td style="width: 386px; ">
       <!-- 评论开始 -->     
		<%@include file="../comment.jsp" %>
       <!-- 评论结束 -->
            </td>
          </tr>
          <tr ></tr>
    </table>   	
   	</c:forEach>
    
    
    
    
    
    <table align="center" id="page">
        <tr>
        <td align="right">
        	<c:if test="${pageBean.page!=1}">
   				<a href="F_pageUpAndDown?operation=Up&pageId=${pageBean.page}" style="text-decoration:none">上一页</a>&nbsp; &nbsp;     
        	</c:if>
        	第&nbsp; ${pageBean.page} &nbsp;页 &nbsp;&nbsp;
        	<c:if test="${pageBean.page != pageBean.totalPage}">
          		<a href="F_pageUpAndDown?operation=Down&pageId=${pageBean.page}" style="text-decoration:none">下一页</a>
        	</c:if> 
          	&nbsp;&nbsp;&nbsp;&nbsp;
        	共 &nbsp; ${pageBean.totalPage} &nbsp;页 
        </td>
      </tr>
    </table>
    <!-- weibo 结束-->
    </td>
	    <td width="280" align="center" valign="top" class="pageright">
        <!-- userinfo 开始-->
      		<%@include file="../userinfo.jsp" %>>
        <!-- userinfo 结束--></td>
  </tr>
	</table>
<!-- container 结束-->


<!--footer开始-->
	<%@include file="../footer.jsp" %>
<!--footer结束-->
</body>
</html>
</html>