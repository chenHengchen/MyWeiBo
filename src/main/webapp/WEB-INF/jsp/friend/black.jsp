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
<title>我的黑名单</title>
<script type="text/javascript" src="script/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="script/friend.js"></script>
</head>
<body>
<!-- header开始-->
	<%@include file="../header.jsp" %>
<!-- header结束-->
<!-- container 开始-->
<table border="0" align="center" cellpadding="0" cellspacing="0" id="container">
  <tr>
    <td width="670" height="600" valign="top">
    <table border="0" align="center" cellpadding="5" cellspacing="0" id="guanzhu">
      <tr>
        <td>黑名单</td><td align="right"></td>
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
 <c:forEach items="${black}" var="attUser">
	<table id="weibo" width="90%" border="0" align="center" cellpadding="3" cellspacing="0">  
	   
	   	
	   <tr style="background-color: #F0F0F0;font-size: 13px" >
        <td width="76%" valign="top">
	        <table width="100%" border="0" cellpadding="0" cellspacing="0" id="curruserdetail">
	          
	         <tr>
			    <td rowspan="4" width="90"><img src="${attUser.images}" width="80" height="80" /></td>
			    <td><a href="user_index?userId=${attUser.id}" style="text-decoration:none">${attUser.nickName}</a></td>
			    <td >&nbsp;</td>
			  </tr>
			  <tr>
			    <td align="left"><a href="user_index?userId=${attUser.id}" style="text-decoration:none">关注(${attUser.attention})&nbsp;|&nbsp;粉丝(${attUser.fans})&nbsp;|&nbsp;微博(${attUser.blogNumber})</a></td>
			    <td><a href="friendOperation?operation=QXLH&nPage=black&uId=${attUser.id}" style="text-decoration:none">取消拉黑</a></td>
			  </tr>
			  <tr>
			    <c:if test="${attUser.sex==1}">
				    <td>男</td>
			    </c:if>
			     <c:if test="${attUser.sex==0}">
				    <td>女</td>
			    </c:if>
			    <td></td>
			  </tr>
			  <tr>
			    <td>${attUser.sign}</td>
			    <td></td>
			  </tr>
	        </table>
	    </td>
	   </tr>
	   <tr></tr>
		</table>		
	   
	</c:forEach>
	   
    <!-- weibo 结束-->

    <!-- 分页开始 -->
		<table align="center" id="page">
        <tr>
        <td align="right">
        	<c:if test="${pageBean.page!=1}">
   				<a href="blank_index?p=${pageBean.page-1}" style="text-decoration:none">上一页</a>&nbsp; &nbsp;     
        	</c:if>
        	第&nbsp; ${pageBean.page} &nbsp;页 &nbsp;&nbsp;
        	<c:if test="${pageBean.page != pageBean.totalPage}">
          		<a href="blank_index?p=${pageBean.page+1}" style="text-decoration:none">下一页</a>
        	</c:if> 
          	&nbsp;&nbsp;&nbsp;&nbsp;
        	共 &nbsp; ${pageBean.totalPage} &nbsp;页 
        </td>
      </tr>
    </table>
    <!-- 分页结束 -->

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