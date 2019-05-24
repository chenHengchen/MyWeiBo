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
<link rel="stylesheet" type="text/css" href="css/profile.css" />
<title>微博 - ${logonUser.nickName}的微博</title>
<script type="text/javascript" src="script/ajax.js"></script>
<script type="text/javascript" src="script/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="script/profile.js"></script>
</head>
<body>
<!-- header开始-->
	<%@include file="../header.jsp" %>
<!-- header结束-->
<!-- container 开始-->
<table border="0" align="center" cellpadding="0" cellspacing="0" id="container">
  <tr>
    <td width="670" height="600" valign="top"><table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" id="curruser">
      <tr>
        <td width="24%"><img src="${loginUser.images}" width="120" height="120" class="userphoto" /></td>
        <td width="76%" valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0" id="curruserdetail">
          <tr>
            <td class="title">${logonUser.nickName}</td>
          </tr>
          <tr>
            <td><p><a href="#">${loginUser.email}<br />
              </a>${loginUser.position}<a href="#">
              </a><br />
            签名：${loginUser.sign}！<br />
            <a href="face_index">修改头像</a> | <a href="userinfo_index">修改签名</a></p></td>
          </tr>
        </table></td>
      </tr>
    </table>
      <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" id="menu">
          <tr>
            <td width="33%" align="center"><table width="165" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td align="center"><a href="profile_index?action=all">全部</a></td>
                <td align="center"><a href="profile_index?action=me">原创</a></td>
                <td align="center"><a href="profile_index?action=trans">转发</a></td>
              </tr>
            </table></td>
            <td width="18%" align="right">&nbsp;</td>
            <td width="49%" align="center"></td>
          </tr>
      </table>
        <!-- weibo 开始-->
    
    <c:forEach items="${weiboList}" var="weibo">
    	<table id="weibo${weibo.id}" width="90%" border="0" align="center" cellpadding="3" cellspacing="0" style="background-color: #F8F8F8">
          <tr>
            <td width="90%" class="content" style="font-size:14px">${weibo.body}</td>
          </tr>
          <c:if test="${weibo.image != 'null'}">
          	<tr>
            	<td><img src="${weibo.image}" id="${weibo.id}" width="89" height="120" onclick="imgAct(${weibo.id})"/></td>
         	</tr>
          </c:if>
          <tr>
            <td height="25" colspan="2"><table width="100%" border="0" cellpadding="0" cellspacing="0" id="weibo_status">
              <tr>
                <td>${weibo.str_pubTime}</td>
                <td align="right">
                	<span onclick="deleteWeibo(${weibo.id})" style="text-decoration:none">删除</span>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
                	<span id="like${weibo.id}" onclick="like(${weibo.id})" style="cursor:pointer">
                		<c:if test="${weibo.b==false}">赞(${weibo.likeN})</c:if>
                		<c:if test="${weibo.b==true}">已赞(${weibo.likeN})</c:if>
                	</span>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
                	<span id="trans${weibo.id}" onclick="trans(${weibo.id})" style="cursor:pointer">转发(${weibo.tranum})</span>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
                	<span id="comm${weibo.id}" onclick="comm(0,${weibo.id})" style="cursor:pointer">评论(${weibo.comnum})</span>
                </td>
              </tr>
            </table></td>
          </tr>
          
          <tr>
            <td style="width: 386px; ">
		<!-- 评论开始 -->     
		<%@include file="../comment.jsp" %>
       <!-- 评论结束 -->	
			</td>
          </tr>
          
    </table>
	&nbsp;
    </c:forEach>
        
    
    
      <!-- 分页。。。 -->
      <table align="center" id="page">
        <tr>
        <td align="right">
        	<c:if test="${pageBean.page!=1}">
   				<a href="pageUpAndDown?operation=Up&pageId=${pageBean.page}&action=${action}" style="text-decoration:none">上一页</a>&nbsp; &nbsp;     
        	</c:if>
        	第&nbsp; ${pageBean.page} &nbsp;页 &nbsp;&nbsp;
        	<c:if test="${pageBean.page != pageBean.totalPage}">
          		<a href="pageUpAndDown?operation=Down&pageId=${pageBean.page}&action=${action}" style="text-decoration:none">下一页</a>
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
			<%@include file="../userinfo.jsp" %>
        <!-- userinfo 结束--></td>
  </tr>
	</table>
<!-- container 结束-->

<!--footer开始-->
	<%@include file="../footer.jsp" %>
<!--footer结束-->
</body>
</html>