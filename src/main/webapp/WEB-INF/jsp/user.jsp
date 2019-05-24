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
<link rel="stylesheet" type="text/css" href="css/user.css" />
<title>微博 - ${user.nickName}的微博</title>
<script type="text/javascript" src="script/user.js"></script>
</head>
<body>
<!-- header开始-->
	<%@include file="header.jsp" %>
<!-- header结束-->
<!-- container 开始-->
<table border="0" align="center" cellpadding="0" cellspacing="0" id="container">
  <tr>
    <td width="670" height="600" valign="top">
    <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" id="curruser" background="${user.images}">
      <tr>
        <td width="24%"><img src="${user.images}" width="120" height="120" class="userphoto" /></td>
        <td width="76%" valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0" id="curruserdetail">
          <tr>
            <td class="title">${user.nickName}</td>
          </tr>
          <tr>
            <td><p><a href="#">${user.email}<br />
              </a>积分：${user.integral}<br />
            签名：${user.sign}<br />
            <a href="#">+添加关注</a></p></td>
          </tr>
        </table></td>
      </tr>
    </table>
      
   <!-- weibo 开始-->
     	<c:forEach items="${list}" var="weibo">
    	<table id="weibo" width="90%" border="0" align="center" cellpadding="3" cellspacing="0">
          <tr>
            <td width="88%" class="content">${weibo.body}</td>
          </tr>
          <c:if test="${weibo.image != 'null'}">
          	<tr>
            	<td><img src="${weibo.image}" id="${weibo.id}" width="89" height="120" onclick="imgAct(${weibo.id})"/></td>
         	</tr>
          </c:if>
          <tr>
            <td height="25"><table width="100%" border="0" cellpadding="0" cellspacing="0" id="weibo_status">
              <tr>
                <td>${weibo.pubTime}</td>
                <td align="right">&nbsp;&nbsp;&nbsp;赞(${weibo.likeN})&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;转发(${weibo.tranum})&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;评论(${weibo.comnum})&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;收藏</td>
              </tr>
            </table></td>
          </tr>
    </table>
    </c:forEach>
     <table align="center" id="page">
        <tr>
        <td align="right">
        	<c:if test="${pageBean.page!=1}">
   				<a href="user_index?p=${pageBean.page-1}&userId=${user.id}" style="text-decoration:none">上一页</a>&nbsp; &nbsp;     
        	</c:if>
        	第&nbsp; ${pageBean.page} &nbsp;页 &nbsp;&nbsp;
        	<c:if test="${pageBean.page != pageBean.totalPage}">
          		<a href="user_index?p=${pageBean.page+1}&userId=${user.id}" style="text-decoration:none">下一页</a>
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
        
        <%@include file="userinfo.jsp" %>
        
        </td>
          </tr>
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