<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<c:if test="${msg!=null}">
	<script type="text/javascript">
	var msg="${msg}"
	alert(msg);
	</script>
</c:if>
	<base href="<%=basePath%>" />
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link rel="stylesheet" type="text/css" href="css/global.css" />
<link rel="stylesheet" type="text/css" href="css/userinfo.css" />
<title>微博 - 账号管理</title>
<script type="text/javascript" src="script/userinfo.js"></script>
</head>
<body>
<!-- header开始-->
	<%@include file="../header.jsp" %>
<!-- header结束-->
<!-- container 开始-->
<table border="0" align="center" cellpadding="0" cellspacing="0" id="container">
  <tr>
    <td width="670" height="500" valign="top">
      <form action="userinfo_action" method="post">
        <table border="0" align="center" cellpadding="0" cellspacing="0" id="userinfo">
          <tr>
            <td class="title">个人资料</td>
            </tr>
          <tr>
            <td class="menu">基本资料 | <a href="pwd_index">修改密码</a> | <a href="face_index">修改头像</a> | <a href="question_index">修改密保</a></td>
          </tr>
          <tr>
            <td align="center"><table width="90%" border="0" cellpadding="5" cellspacing="0" id="userinfo_content">
              <tr>
                <td width="20%" align="right">登录账号：</td>
                <td width="53%" align="left">${loginUser.email}</td>
                </tr>
              <tr>
                <td align="right">昵称：</td>
                <td align="left"><input name="nickName" type="text" class="input1" id="nickName" value="${loginUser.nickName}"/></td>
                </tr>
              <tr>
                <td align="right">真实姓名：</td>
                <td align="left"><input name="name" type="text" class="input1" id="name" value="${loginUser.name}"/></td>
                </tr>
              <tr>
                <td align="right">所在地：</td>
                <td align="left"><input name="position" type="text" class="input1" id="position" value="${loginUser.position}"/></td>
                </tr>
              <tr>
                <td align="right">性别：</td>
                <td align="left"><input type="radio" name="sex" id="radio" value=1  checked="checked"/>
                  男
                  &nbsp; &nbsp; &nbsp; &nbsp; <input type="radio" name="sex" id="radio2" value=0 />
                  女</td>
                </tr>
              <tr>
                <td align="right">出生日期：</td>
                <td align="left"><select name="year" id="year" >
                  </select>
                  年
                  <select name="month" id="month">
                    </select>
                  月
                  <select name="day" id="day">
                    </select>
                  日</td>
                </tr>
              <tr>
                <td align="right">签名：</td>
                <td align="left"><input name="sign" type="text" class="input1" id="sign" value="${loginUser.sign}"/></td>
                </tr>
              <tr>
                <td align="right">&nbsp;</td>
                <td align="left"><input type="image" src="images/editbtn.png" /></td>
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