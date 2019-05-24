<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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
<link rel="stylesheet" type="text/css" href="css/register.css" />
<title>管理员登录</title>
</head>
<body >
<!-- header开始-->
<table id="header" align="center" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="20%" align="center"><img src="images/logo.png" width="178" height="62" /></td>
    <td width="55%" align="left">管理员登录</td>
    <td width="25%" align="right">&nbsp;</td>
  </tr>
</table>
<!-- header结束-->
<!-- container 开始-->
<table border="0" align="center" cellpadding="0" cellspacing="0" id="container" >
  <tr>
	<td width="280" align="center" valign="top">
        <!-- userlogin 开始-->
        <form id="form1" name="form1" method="post" action="adminlogin">
        <table id="login" width="220" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td colspan="2" class="title">微博管理员登录</td>
          </tr>
          <tr>
            <td colspan="2" >用户名
              <input name="name" type="text"  />
            </td>
          </tr>
          <tr>
            <td colspan="2" >密&nbsp;&nbsp;&nbsp;&nbsp;码
              <input name="password" type="password" />
            </td>
          </tr>
          <tr>
            <td><input name="Submit" type="submit" class="loginbtn" id="Submit" value="登录 " /></td>
            <td><input name="reset" type="reset" class="loginbtn" id="reset" value="重置 " /></td>
          </tr>
        </table>
        </form>
    </td>
  </tr>
	</table>
<!-- container 结束-->

<!--footer开始-->
	<%@include file="../footer.jsp" %>
<!--footer结束-->
</body>
</html>