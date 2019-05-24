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
<link rel="stylesheet" type="text/css" href="css/register.css" />
<title>找回密码</title>
<script type="text/javascript" src="script/register.js"></script>
<script type="text/javascript" src="script/ajax.js"></script>
</head>
<body >
<!-- header开始-->
<table id="header" align="center" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="20%" align="center"><img src="images/logo.png" width="178" height="62" /></td>
    <td width="55%" align="left">用户注册</td>
    <td width="25%" align="right">&nbsp;</td>
  </tr>
</table>
<!-- header结束-->
<!-- container 开始-->
<table border="0" align="center" cellpadding="0" cellspacing="0" id="container" >
  <tr>
    <td width="670" valign="top">
      <form action="up_forget?email=${fUser.email}" id="forgetForm" method="post">
        <table border="0" align="center" cellpadding="0" cellspacing="0" id="register">
          <tr>
            <td class="title">找回登录密码</td>
          </tr>
          <tr>
            <td><table width="90%" border="0" cellpadding="5" cellspacing="0" id="register_content">
              <tr>
                <td width="20%" align="right">我的邮箱：</td>
                <td width="53%">${fUser.email}</td>
                <td width="27%"></td>
              </tr>
              <tr>
                <td align="right">密保问题：</td>
                <td>${fUser.pwdQuestion}</td>
                <td width="27%"></td>
              </tr>
              <tr>
                <td align="right">答案：</td>
                <td><input name="pwdAnswer" type="text" class="input1" id="pwdAnswer" onblur="checkQ()"/></td>
                <td width="27%"><span id="answermsg"></span></td>
              </tr>
              <tr>
                <td align="right">新密码：</td>
                <td><input name="password" type="password" class="input1" id="password" onblur="checkpwd()"/></td>
                <td width="27%"><span id="pwdmsg"></span></td>
              </tr>
              <tr>
                <td align="right">确认密码：</td>
                <td><input name="rpassword" type="password" class="input1" id="rpassword" onblur="checkrepwd()"/></td>
                <td width="27%"><span id="repwdmsg"></span></td>
              </tr>
              <tr>
                <td align="center">&nbsp;</td>
                <td align="left"><input type="submit" value="修改"></input>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="重置"></input>
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="register_index">返回登录</a>
                </td>
                <td></td>
                </tr>
            </table></td>
          </tr>
        </table>
    </form>
     
    </td>
  </tr>
	<script type=""></script>
<!-- container 结束-->

<!--footer开始-->
	<%@include file="footer.jsp" %>
<!--footer结束-->
<script type="text/javascript">
	function checkForget(){
		
		
	}
	function checkQ(){
		var oldAnswer = document.getElementById("pwdAnswer").value;
		var oldAMsg = document.getElementById("answermsg");
		var url="forgetAnswer?answer="+oldAnswer+"&email=${fUser.email}";
		var xhr=createXMLHttpRequest();
		xhr.open("GET",url,true);
		xhr.onreadystatechange = seekCallBake;
		xhr.send(null);
		function seekCallBake(){
			if(xhr.readyState==4 && xhr.status==200){
				oldAMsg.innerHTML = xhr.responseText;
			}
		}
	}
</script>
</body>
</html>