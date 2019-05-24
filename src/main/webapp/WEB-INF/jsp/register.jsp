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
<title>微博注册</title>
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
        <form action="register_action" method="post" onsubmit="return chechUser()">
          <table border="0" align="center" cellpadding="0" cellspacing="0" id="register">
            <tr>
              <td class="title">开通微博账号</td>
            </tr>
            <tr>
              <td>
                  <table width="90%" border="0" cellpadding="5" cellspacing="0" id="register_content">
                    <tr>
                      <td width="20%" align="right">我的邮箱：</td>
                      <td width="53%"><input name="email" type="text" class="input1" id="email" onblur="checkemail()"/></td>
                      <td width="27%"><span id="emailmsg"><a href="http://reg.email.163.com/unireg/call.do?cmd=register.entrance">还没有邮箱</a></span></td>
                    </tr>
                    <tr>
                      <td align="right">创建密码：</td>
                      <td><input name="password" type="password" class="input1" id="password" onblur="checkpwd()"/></td>
                        <td width="27%"><span id="pwdmsg"></span></td>
                    </tr>
                    <tr>
                      <td align="right">确认密码：</td>
                      <td><input name="rpassword" type="password" class="input1" id="rpassword" onblur="checkrepwd()"/></td>
                      <td width="27%"><span id="repwdmsg"></span></td>
                    </tr>
                    <tr>
                      <td align="right">昵称：</td>
                      <td><input name="nickName" type="text" class="input1" id="nickname" onblur="checknickname()" /></td>
                      <td width="27%"><span id="nicknamemsg"></span></td>
                    </tr>
                    <tr>
                      <td align="right">性别：</td>
                      <td><input type="radio" name="sex" id="radio" value="1" checked="checked"/>
                        男
                          &nbsp; &nbsp; &nbsp; &nbsp; <input type="radio" name="sex" id="radio2" value="0" />
                          女</td>
                      <td>&nbsp;</td>
                    </tr>
                    <tr>
                      <td align="right">密保问题：</td>
                      <td><input name="pwdQuestion" type="text" class="input1" id="pwdQuestion" onblur="checkquestion()"/></td>
                      <td width="27%"><span id="questionmsg"></span></td>
                    </tr>
                    <tr>
                      <td align="right">答案：</td>
                      <td><input name="pwdAnswer" type="text" class="input1" id="pwdAnswer" onblur="checkanswer()"/></td>
                      <td width="27%"><span id="answermsg"></span></td>
                    </tr>
                    <tr>
                      <td align="right">验证码：</td>
                      <td><input name="yzm" type="text" class="input2" id="authcode" onmouseout="checkauthcode()" onblur="checkauthcode()"/>
                       <img alt="authCode" src="authImg.do" style="height: 20px; "> </td>
                      <td width="27%"><span id="authcodemsg"></span></td>
                    </tr>
                    <tr>
                      <td align="center">&nbsp;</td>
                     <!--  <td align="left"><img src="images/regbtn1.png" width="150" height="37" /></td> -->
                      <td align="left"><input id="Submit" style="CURSOR: hand"  type=image height=37 width=150  src="images/regbtn1.png" border=0  name="Submit"></input></td>
                      <td align="center">&nbsp;</td>
                      </tr>
                    <tr>
                      <td align="center">&nbsp;</td>
                      <td align="left">《微博网络使用协议》</td>
                      <td align="center">&nbsp;</td>
                    </tr>
                  </table>
              </td>
        </tr>
      </table>
    </form>
     
    </td>
	    <td width="280" align="center" valign="top" class="pageright">
        <!-- userlogin 开始-->
        <form id="form1" name="form1" method="post" action="login_action" onsubmit="return checkForm()">
        <table id="login" width="220" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td colspan="2" class="title">已有微博登录账号？</td>
          </tr>
          <tr>
            <td colspan="2" align="left">邮箱地址：<br />
              <input name="userid" type="text" class="logininput" id="userid" onmouseover="this.focus()" />
            </td>
          </tr>
          <tr>
            <td colspan="2" align="left">输入你的登录密码：<br />
              <input name="password" type="password" class="logininput" id="password" onmouseover="this.focus()"/>
            </td>
          </tr>
          <tr>
            <td width="120"><input name="save" type="checkbox" id="save" value="yes" />下次自动登录</td>
            <td width="100"><a href="javaScript:void(0)" style="text-decoration:none" onclick="forgetmima()"><font color="#0066CC">找回登录密码</font></a></td>
          </tr>
          <tr>
            <td colspan="2" align="center"><input name="Submit" type="submit" class="loginbtn" id="Submit" value="  登录微博  " /></td>
          </tr>
        </table>
        </form>
    	<!-- userlogin 结束-->
        <table id="msnlogin">
         <tr>
          <td align="center"><a href="admin_login" style="text-decoration:none"><font color="#0066CC">管理员登录</font></a><!-- <img src="images/msnlogin.png" width="143" height="32" /> --></td></tr>
        </table>
    </td>
  </tr>
	</table>
<!-- container 结束-->
<form action="forget" id="forgetForm1" method="post"></form>
<script type="text/javascript">
	function forgetmima(){
		var email = prompt("请输入注册邮箱账号：", "");
		if(email != null){
			console.log(email);
			document.getElementById("forgetForm1").action="forget?email="+email;
		 	document.getElementById("forgetForm1").submit();
		}
	}
</script>
<!--footer开始-->
	<%@include file="footer.jsp" %>
<!--footer结束-->
</body>
</html>