<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script type="text/javascript" src="script/ajax.js"></script>
<script type="text/javascript" src="script/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="script/friend.js"></script>
 <script type="text/javascript" src="script/face.js"></script>
<script>
	function show(id){
		new Face("cb"+id).show()
	}
 </script>

<link rel="stylesheet" type="text/css" href="css/global.css" />
<link rel="stylesheet" type="text/css" href="css/home.css" />
<body>
	<table id="header" align="center" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="20%" align="center"><img src="images/logo.png" width="178" height="62" /></td>
    <td width="55%" align="right">
      <table border="0" align="right" cellpadding="0" cellspacing="0" id="daohang">
        <tr>
          <td width="20%"><a href="adminIndex">首页</a></td>
          <td width="20%"><a href="userManage?page=1&key=all">用户管理</a></td>
          <td width="20%"><a href="weiboManage?page=1&key=all">微博管理</a></td>
          <td width="20%"><a href="conchManage?page=1&key=all">海螺管理</a></td>
        </tr>
      </table>
    </td>
    <td width="25%" align="right">
      <table id="welcome" border="0" cellspacing="0" cellpadding="0" >
        <tr>          
          <td width="30" height="30" rowspan="2" class="userface_bg"><img src="${admin.images}" border="0" width="21" height="20" /></td>
          <td>欢迎您，管理员${admin.name}！</td>
        </tr>
        <tr>
          <td><a href="adminExit">[ 退出 ]</a></td>
        </tr>
      </table>
    </td>
  </tr>
</table>
</body>
</html>