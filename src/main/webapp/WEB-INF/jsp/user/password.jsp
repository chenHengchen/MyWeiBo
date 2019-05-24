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
<link rel="stylesheet" type="text/css" href="css/mypassword.css" />
<title>微博 - 账号管理</title>
<script type="text/javascript" src="script/mypassword.js"></script>
<script type="text/javascript" src="script/ajax.js"></script>
</head>
<body>
<!-- header开始-->
	<%@include file="../header.jsp" %>
<!-- header结束-->
<!-- container 开始-->
<table border="0" align="center" cellpadding="0" cellspacing="0" id="container">
  <tr>
    <td width="670" valign="top">
      <form action="updatePwd" method="post" onsubmit="return checkUpdatUser()">
      <table border="0" align="center" cellpadding="0" cellspacing="0" id="userinfo">
        <tr>
          <td class="title">个人资料</td>
          </tr>
        <tr>
          <td class="menu"><a href="userinfo_index">基本资料</a> | 修改密码 | <a href="face_index">修改头像</a> | <a href="question_index">修改密保</a></td>
        </tr>
        <tr>
          <td align="center"><table width="90%" border="0" cellpadding="5" cellspacing="0" id="userinfo_content">
            <tr>
              <td width="20%" align="right">当前密码：</td>
              <td width="53%" align="left"><input name="pwd" type="password" class="input1" id="pwd" onblur="checkoldpwd()"/></td>
              <td width="10%"><span id="pwdmsg"></span></td>
            </tr>
            <tr>
              <td align="right">新密码：</td>
              <td align="left"><input name="newpwd" type="password" class="input1" id="newpwd" onblur="checkpwd()"/></td>
              <td width="27%"><span id="newpwdmsg"></span></td>
              </tr>
            <tr>
              <td align="right">确认密码：</td>
              <td align="left"><input name="renewpwd" type="password" class="input1" id="renewpwd" onblur="checkrepwd()"/></td>
              <td width="27%"><span id="renewpwdmsg"></span></td>
              </tr>
            <tr>
              <td align="right">&nbsp;</td>
              <td align="left"><input id=Submit style="CURSOR: hand"  type=image height=37 width=150  src="images/editbtn.png" border=0  name=Submit /></td>
            </tr>
            </table></td>
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