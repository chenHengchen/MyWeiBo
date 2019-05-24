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
<title>用户管理</title>
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
        	<td colspan="2">微博用户管理</td>
        	<td align="right" colspan="4">
        		<form id="form1" name="form1" method="post" action="userManage?page=1">
              		<input name="key" type="text"  id="textfield"  placeholder="输入用户昵称。。。"/>
             	 	<input name="button" type="submit" class="btnsearch" id="button" value="搜索" />
            	</form>
            </td>
        </tr>
        <tr><td>&nbsp;</td></tr>
		<tr>
			<td>编号</td>
			<td>邮箱</td>
			<td>昵称</td>
			<td>注册日期</td>
			<td>上次登录日期</td>
			<td>账号状态</td>
			<td>操作</td>
		</tr>
		<c:forEach items="${userList}" var="user">
			<tr>
				<td>${user.id}</td>
				<td>${user.email}</td>
				<td>${user.nickName}</td>
				<td>${user.pwdQuestion}</td>
				<td>${user.pwdAnswer}</td>
				<td>
					<c:if test="${user.state == 0}">正常</c:if>
					<c:if test="${user.state == 1}">${user.banTime}解封</c:if>
				</td>
				<td>
					<c:if test="${user.state == 0}"><input onclick="fj(${user.id})" type="button" class="btnsearch" id="button" value="封禁" /></c:if>
					<c:if test="${user.state == 1}"><input onclick="jf(${user.id})" type="button" class="btnsearch" id="button" value="解封" /></c:if>
				</td>
			</tr>
			<tr><td>&nbsp;</td></tr>
		</c:forEach>
      </table>
      <form action="fjUser" id="formac" method="post"></form>
      <form action="fjUser" id="formjf" method="post"></form>
    </td>
  </tr>
  <tr>
  	<td>
  	<table align="center" id="page">
        <tr>
        <td align="right">
        	<c:if test="${pageBean.page!=1}">
   				<a href="userManage?page=${pageBean.page-1}" style="text-decoration:none">上一页</a>&nbsp; &nbsp;     
        	</c:if>
        	第&nbsp; ${pageBean.page}&nbsp;页 &nbsp;&nbsp;
        	<c:if test="${pageBean.page != pageBean.totalPage}">
          		<a href="userManage?page=${pageBean.page+1}" style="text-decoration:none">下一页</a>
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
		function fj(id){
			var dnum = prompt("请输入封禁天数", "");
			var n = Number(dnum);
			if(dnum == "" || !(dnum.indexOf(" ")==-1)){
				 alert("请输入正确的天数！");
			 }
			if(!isNaN(n)){
				 document.getElementById("formac").action="fjUser?uId="+id+"&day="+n;
				 document.getElementById("formac").submit();
			 }
			 else{
				 alert("请输入正确的天数！");
			 }
		}
		function jf(id){
			document.getElementById("formjf").action="jfUser?uId="+id;
			document.getElementById("formjf").submit();
		} 
	</script>
	
<!--footer开始-->
	<%@include file="../footer.jsp" %>
<!--footer结束-->
</body>
</html>