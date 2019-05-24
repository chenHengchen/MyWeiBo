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
<title>搜索用户</title>

</head>
<body>
<!-- header开始-->
	<%@include file="header.jsp" %>
<!-- header结束-->
<!-- container 开始-->
<table border="0" align="center" cellpadding="0" cellspacing="0" id="container" >
  <tr>
    <td width="670" height="600" valign="top">
    <table border="0" align="center" cellpadding="5" cellspacing="0" id="guanzhu">
      <tr>
        <td>搜索到相关记录共${map.num}条</td><td align="right"></td>
      </tr>
    </table>
    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" id="menu">
          <tr>
            <td width="33%" align="center"><table width="165" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td align="center"><a href="seach?ac=weibo&pag=1">微博</a></td>
                <td align="center"><a href="seach?ac=user&pag=1">用户</a></td>
              </tr>
            </table></td>
            <td width="18%" align="right">&nbsp;</td>
            <td width="49%" align="center">
            <form id="form1" name="form1" method="post" action="seach?ac=user&pag=1">
              <input name="key" type="text" class="input" id="textfield"  placeholder="输入昵称。。。"/>
              <input name="button" type="submit" class="btnsearch" id="button" value="搜索" />
            </form></td>
          </tr>
      </table>
        <!-- weibo 开始-->
        
   <c:forEach items="${map.user}" var="attUser">
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
			    <td><a href="toBlackOrQXGZ?operation=QXGZ&bId=${attUser.id}" style="text-decoration:none">关注</a></td>
			  </tr>
			  <tr>
			    <c:if test="${attUser.sex==1}">
				    <td>男</td>
			    </c:if>
			     <c:if test="${attUser.sex==0}">
				    <td>女</td>
			    </c:if>
			    <td><%-- <a href="message?userBId=${attUser.id}" style="text-decoration:none">私信</a> --%></td>
			  </tr>
			  <tr>
			    <td>${attUser.sign}</td>
			    <td><%-- <a href="toBlackOrQXGZ?operation=LH&bId=${attUser.id}" style="text-decoration:none">拉黑</a> --%></td>
			  </tr>
	        </table>
	    </td>
	   </tr>
	   <tr></tr>
		</table>		
	</c:forEach>
    
    <table align="center" id="page">
        <tr>
        <td align="right">
        	<c:if test="${map.pageBean.page!=1}">
   				<a href="seach?ac=user&pag=${map.pageBean.page-1}" style="text-decoration:none">上一页</a>&nbsp; &nbsp;     
        	</c:if>
        	第&nbsp; ${map.pageBean.page} &nbsp;页 &nbsp;&nbsp;
        	<c:if test="${map.pageBean.page != map.pageBean.totalPage}">
          		<a href="seach?ac=user&pag=${map.pageBean.page+1}" style="text-decoration:none">下一页</a>
        	</c:if> 
          	&nbsp;&nbsp;&nbsp;&nbsp;
        	共 &nbsp; ${map.pageBean.totalPage} &nbsp;页 
        </td>
      </tr>
    </table>
    <!-- weibo 结束-->
    </td>
	    <td width="280" align="center" valign="top" class="pageright">
        <!-- userinfo 开始-->
      		<%@include file="userinfo.jsp" %>>
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