<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
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
<link rel="stylesheet" type="text/css" href="css/userinfo.css" />
<title>微博管理</title>
</head>
<body>
<!-- header开始-->
	<%@include file="header.jsp" %>
<!-- header结束-->
<!-- container 开始-->
<table border="0" align="center" cellpadding="0" cellspacing="0" id="container">
  <tr>
    <td width="670" height="500" valign="top">
      <table border="0" align="center" cellpadding="0" cellspacing="0" id="userinfo">
        <tr>
        	<td colspan="2">微博管理</td>
        	<td align="right" colspan="4">
        		<form id="form1" name="form1" method="post" action="weiboManage?page=1">
              		<input name="key" type="text"  id="textfield"  placeholder="输入微博内容。。。"/>
             	 	<input name="button" type="submit" class="btnsearch" id="button" value="搜索" />
            	</form>
            </td>
        </tr>
        <tr><td>&nbsp;</td></tr>
		<tr>
			<td>微博编号</td>
			<td>发布人名称</td>
			<td>微博内容</td>
			<td>发布日期</td>
			<td>微博状态</td>
			<td>操作</td>
		</tr>
		<c:forEach items="${weiboList}" var="weibo">
			<tr>
				<td>${weibo.id}</td>
				<td>${weibo.user.nickName}</td>
				<td>${weibo.body}</td>
				<td>${weibo.str_pubTime}</td>
				<td>
					<c:if test="${weibo.state == 0}">正常</c:if>
					<c:if test="${weibo.state == 1}">被删除</c:if>
				</td>
				<td>
					<c:if test="${weibo.state == 0}"><input onclick="scwb(${weibo.id})" type="button" class="btnsearch" id="button" value="删除" /></c:if>
					<c:if test="${weibo.state == 1}"><input onclick="hfwb(${weibo.id})" type="button" class="btnsearch" id="button" value="恢复" /></c:if>
				</td>
			</tr>
			<tr><td>&nbsp;</td></tr>
		</c:forEach>
      </table>
      <form action="upWeibo" id="forma1" method="post"></form>
    </td>
  </tr>
  <tr>
  	<td>
  	<table align="center" id="page">
        <tr>
        <td align="right">
        	<c:if test="${pageBean.page!=1}">
   				<a href="weiboManage?page=${pageBean.page-1}" style="text-decoration:none">上一页</a>&nbsp; &nbsp;     
        	</c:if>
        	第&nbsp; ${pageBean.page}&nbsp;页 &nbsp;&nbsp;
        	<c:if test="${pageBean.page != pageBean.totalPage}">
          		<a href="weiboManage?page=${pageBean.page+1}" style="text-decoration:none">下一页</a>
        	</c:if> 
          	&nbsp;&nbsp;&nbsp;&nbsp;
        	共 &nbsp; ${pageBean.totalPage} &nbsp;页 
        </td>
      </tr>
    </table>
  	</td>
  </tr>
	</table>
<!-- container 结束-->

	<script type="text/javascript">
		function scwb(id){
			document.getElementById("forma1").action="upWeibo?wId="+id+"&ac=sc";
			document.getElementById("forma1").submit();
		}
		function hfwb(id){
			document.getElementById("forma1").action="upWeibo?wId="+id+"&ac=hf";
			document.getElementById("forma1").submit();
		}
	</script>
	
<!--footer开始-->
	<%@include file="../footer.jsp" %>
<!--footer结束-->
</body>
</html>