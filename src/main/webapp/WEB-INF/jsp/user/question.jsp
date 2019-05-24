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
<script type="text/javascript" src="script/question.js"></script>
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
      <form action="updateQuestion" method="post" onsubmit="return checkquestion()">
      <table border="0" align="center" cellpadding="0" cellspacing="0" id="userinfo">
        <tr>
          <td class="title">个人资料</td>
          </tr>
        <tr>
          <td class="menu"><a href="userinfo_index">基本资料</a> | <a href="pwd_index">修改密码</a> | <a href="face_index">修改头像</a> | 修改密保</td>
        </tr>
        <tr>
          <td align="center"><table width="90%" border="0" cellpadding="5" cellspacing="0" id="userinfo_content">
            <tr>
              <td width="20%" align="right">密保问题：</td>
              <td width="45%" align="left">${loginUser.pwdQuestion}</td>
              <td width="27%">密保问题可以在你忘记密码时找回账号密码</td>
            </tr>
            <tr>
              <td align="right">密保答案：</td>
              <td align="left"><input name="oldAnswer" type="text" class="input1" id="oldAnswer" onblur="checkoldAnswer()"/></td>
              <td width="27%"><span id="oldAMsg"></span></td>
              </tr>
            <tr>
              <td align="right">新密保问题：</td>
              <td align="left"><input name="newQuestion" type="text" class="input1" id="newQuestion" onblur="checknewQuestion()"/></td>
              <td width="27%"><span id="newQMsg"></span></td>
              </tr>
            <tr>
             <tr>
              <td align="right">密保答案：</td>
              <td align="left"><input name="newAnswer" type="text" class="input1" id="newAnswer" onblur="checknewAnswer()"/></td>
            <td width="27%"><span id="newAMsg"></span></td>
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