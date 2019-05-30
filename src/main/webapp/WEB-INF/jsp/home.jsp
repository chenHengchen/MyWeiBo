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
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="css/global.css" />
<link rel="stylesheet" type="text/css" href="css/home.css" />
<title>微博 - ${loginUser.nickName}的主页</title>
<script type="text/javascript" src="script/home.js"></script>
<script type="text/javascript" src="script/jquery-1.8.3.min.js"></script>
 <script type="text/javascript" src="script/face.js"></script>
 <script type="text/javascript" src="script/friend.js"></script>
 <script>
	function Ashow(){
		new Face("inputbox").show()
	}
 </script>
</head>
<body>
<!-- header开始-->
	<%@include file="header.jsp" %>
<!-- header结束-->
<!-- container 开始-->
<table border="0" align="center" cellpadding="0" cellspacing="0" id="container">
  <tr>
    <td width="670" height="600" valign="top">
        <form action="publishWeibo" method="post" enctype="multipart/form-data" onsubmit="return checkWeibo()">
        <table width="100%" border="0" cellpadding="0" cellspacing="0" id="input">
      <tr>
        <td width="160" height="48">&nbsp;</td>
        <td width="479">&nbsp;</td>
        <td width="31">&nbsp;</td>
      </tr>
      <tr>
        <td height="84">&nbsp;</td>
        <td><textarea id="inputbox" name="inputbox" cols="45" rows="5" maxlength="140" placeholder="说点什么吧。。。"></textarea></td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td align="right" valign="top"><div id="faces"></div><a href="javascript:void(0)"><image src="icon/biaoqing.png" width="47" height="22" align="absmiddle" onclick="Ashow()" /></a> 
        <input type="file" name="pic" id="pic"/>	
        <input type="image" src="images/btn_input.png" width="100" height="26" align="absmiddle" /></td>
        <td>&nbsp;</td>
      </tr>
    </table></form>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" id="menu">
          <tr>
            <td width="33%" align="center"><table width="165" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td><a href="">热门</a></td>
                <!-- <td align="center"><a href="friend.html">关注</a></td>
                <td align="center"><a href="friend.html">昨天</a></td> -->
              </tr>
            </table></td>
            <td width="18%" align="right">&nbsp;</td>
            <td width="49%" align="center">
            <form id="form1" name="form1" method="post" action="seach?ac=weibo&pag=1">
              <input name="key" type="text" class="input" id="textfield"  placeholder="输入微博关键字。。。"/>
              <input name="button" type="submit" class="btnsearch" id="button" value="搜索" />
            </form></td>
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
		<%@include file="comment.jsp" %>
       <!-- 评论结束 -->
            
            </td>
          </tr>
          <tr></tr>
    </table>
   	</c:forEach>
    
    
    
    
    
    <table align="center" id="page">
        <tr>
        <td align="right">
        	<c:if test="${pageBean.page!=1}">
   				<a href="home_index?p=${pageBean.page-1}" style="text-decoration:none">上一页</a>&nbsp; &nbsp;     
        	</c:if>
        	第&nbsp; ${pageBean.page} &nbsp;页 &nbsp;&nbsp;
        	<c:if test="${pageBean.page != pageBean.totalPage}">
          		<a href="home_index?p=${pageBean.page+1}" style="text-decoration:none">下一页</a>
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
        <table align="center" id="userinfo">
          <tr>
            <td width="25%" rowspan="2"><img src="${loginUser.images}" width="50" height="50" /></td>
            <td width="75%"><a href="profile_index?action=all">${loginUser.nickName}</a></td>
          </tr>
          <tr>
            <td valign="top">${loginUser.position}</td>
          </tr>
          <tr>
            <td colspan="2" align="left">
            <%@include file="userinfo.jsp" %>
          
        </table>
        <!-- userinfo 结束--></td>
  </tr>
	</table>
<!-- container 结束-->
<!--footer开始-->
	<%@include file="footer.jsp" %>
<!--footer结束-->
</body>
</html>
</html>