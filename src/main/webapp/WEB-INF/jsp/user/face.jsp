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
<link rel="stylesheet" type="text/css" href="css/myface.css" />
<title>微博 - 账号管理</title>
<script type="text/javascript" src="script/myface.js"></script>
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
        <form action="updateFace" method="post" enctype="multipart/form-data" onsubmit="return chechMyFace()">
      <table border="0" align="center" cellpadding="0" cellspacing="0" id="userinfo">
        <tr>
          <td class="title">个人资料</td>
          </tr>
        <tr>
          <td class="menu"><a href="userinfo_index">基本资料</a> | <a href="pwd_index">修改密码</a> | 修改头像 | <a href="question_index">修改密保</a></td>
        </tr>
        <tr>
          <td align="center"><table width="90%" border="0" cellpadding="5" cellspacing="0" id="userinfo_content">
            <tr>
              <td width="20%" align="center">
              	<span id="showIcon"><img src="${loginUser.images}" width="120" height="120" id="pic"/></span>
              </td>
              <td width="53%"><p>
                <input type="file" name="icon" id="icon" onmouseout="checkIcon()"/>
                <input type="submit" style="CURSOR: hand"  name="Submit" id="Submit" value=" 上传 " />
              	</p>
                	<p>请选择png、jpg、gif格式，且文件大小不超过2M的图片 </p>
               		<p><span id="iconMsg"></span>&nbsp;</p>
                </td>
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