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
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="css/global.css" />
<link rel="stylesheet" type="text/css" href="css/home.css" />
<title>神奇海螺</title>
<script type="text/javascript" src="script/home.js"></script>
<script type="text/javascript" src="script/jquery-1.8.3.min.js"></script>
 <script type="text/javascript" src="script/face.js"></script>
 <script type="text/javascript" src="script/friend.js"></script>
 <script>
	function Ashow(){
		new Face("inputbox").show()
	}
 </script>
</head>
<body>
<!-- header开始-->
	<%@include file="../header.jsp" %>
<!-- header结束-->
<!-- container 开始-->
<table border="0" align="center" cellpadding="0" cellspacing="0" id="container">
  <tr>
    <td width="670" height="600" valign="top"><form action="publishConch" method="post"><table width="100%" border="0" cellpadding="0" cellspacing="0" id="input">
      <tr>
        <td width="160" height="48">&nbsp;</td>
        <td width="479"><!-- 有问题为什么步先问问神奇海螺 --></td>
        <td width="31">&nbsp;</td>
      </tr>
      <tr>
        <td height="84">&nbsp;</td>
        <td><textarea id="inputbox" name="inputbox" cols="45" rows="5" maxlength="140" placeholder="说点什么吧。。。"></textarea></td>
        <td>&nbsp;</td>
      </tr>
     <tr>
        <td>&nbsp;</td>
        <td align="right" valign="top"><div id="faces"></div><a href="javascript:void(0)"><image src="icon/biaoqing.png" width="47" height="22" align="absmiddle" onclick="Ashow()" /></a> 
        	悬赏积分数<select name="cNumber">
        		<option value="10">10</option>
        		<option value="20">20</option>
        		<option value="30">30</option>
        		<option value="40">40</option>
        		<option value="50">50</option>
        		<option value="60">60</option>
        		<option value="70">70</option>
        		<option value="80">80</option>
        		<option value="90">90</option>
        		<option value="100">100</option>
        	</select><input type="image" src="images/btn_input.png" width="100" height="26" align="absmiddle" /></td>
        <td>&nbsp;</td>
      </tr>
    </table></form>

	<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" id="menu">
          <tr>
            <td width="100%" align="left">
            <table  border="0" align="left" cellpadding="0" cellspacing="0">
              <tr>
                <td width="60px"><a href="conch_index?operation=NEWS&nPage=1">最新发布</a></td>
                <td width="60px"><a href="conch_index?operation=SOLVE&nPage=1">已解决</a></td>
                <td width="60px"><a href="conch_index?operation=UNSOLVE&nPage=1">未解决</a></td>
                <td width="60px"><a href="conch_index?operation=ME&nPage=1">我的海螺</a></td>
              </tr>
            </table>
            </td>
          </tr>
      </table>
    <!-- weibo 开始-->
  
    <c:forEach items="${conch.conchList}" var="conch">
    	<table id="weibo" width="90%" border="0" align="center" cellpadding="3" cellspacing="0" style="background-color: #F8F8F8">
          <tr>
            <td rowspan="3" align="center" valign="top"><img src="${conch.chUser.images}" width="50" height="50" /></td>
            <td width="88%" class="content"><a href="user_index?userId=${conch.chUser.id}">${conch.chUser.nickName}</a><a style="color: red">
            <c:if test="${conch.chUser.conchIntegral >=0 && conch.chUser.conchIntegral<=300}">【初出茅庐】</c:if>
            <c:if test="${conch.chUser.conchIntegral >300 && conch.chUser.conchIntegral<=600}">【学富五车】</c:if>
            <c:if test="${conch.chUser.conchIntegral >600 && conch.chUser.conchIntegral<=1000}">【 名杨万里】</c:if>
            <c:if test="${conch.chUser.conchIntegral >1000}">【博古通今】</c:if>
            </a><br>${conch.conchBody}</td>
          </tr>
          <tr>
            <td height="25"><table width="100%" border="0" cellpadding="0" cellspacing="0" id="weibo_status">
              <tr>
                <td>${conch.conchTime}</td>
                <td align="right">
                	<a href="conchDetail?conchId=${conch.id}" style="text-decoration:none">悬赏积分:${conch.cNumber}</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                	<a href="conchDetail?conchId=${conch.id}" style="text-decoration:none">
                		<c:if test="${conch.state == 0}">未解决</c:if>
                		<c:if test="${conch.state == 1}">已解决</c:if>
                	</a>
                </td>
              </tr>
            </table></td>
          </tr>
          <tr></tr>
    </table>
    </c:forEach>
    
    
    
    
    
    <table align="center" id="page">
        <tr>
        <td align="right">
        	<c:if test="${pageBean.page!=1}">
   				<a href="conch_index?nPage=${pageBean.page-1}" style="text-decoration:none">上一页</a>&nbsp; &nbsp;     
        	</c:if>
        	第&nbsp; ${pageBean.page} &nbsp;页 &nbsp;&nbsp;
        	<c:if test="${pageBean.page != pageBean.totalPage}">
          		<a href="conch_index?nPage=${pageBean.page+1}" style="text-decoration:none">下一页</a>
        	</c:if> 
          	&nbsp;&nbsp;&nbsp;&nbsp;
        	共 &nbsp; ${pageBean.totalPage} &nbsp;页 
        </td>
      </tr>
    </table>
    
    <!-- weibo 结束-->
    </td>
	    <td width="280" align="center" valign="top" class="pageright">
        <!-- userinfo 开始-->
        <table align="center" id="userinfo">
          <tr>
            <td colspan="2" align="left"><table width="80%" border="0" align="left" cellpadding="3" cellspacing="0">
              <tr>
                <td align="center" class="split2"><a href="3">关注</a><br>${loginUser.attention}</td>
                <td align="center" class="split2"><a href="3">粉丝</a><br>${loginUser.fans}</td>
                <td align="center"><a href="#">微博</a><br>${loginUser.blogNumber}</td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td colspan="2" class="split1"><a href="userinfo_index">个人账户设置</a>&nbsp;&nbsp;&nbsp;<a href="message?userBId=-1">未读私信(${alerts.unRMNum})</a></td>
          </tr>
        </table>
    
        <table border="0" align="center" cellpadding="0" cellspacing="0" id="userlist">
          <tr>
            <td class="title" height="29">可能感兴趣的人</td>
            <td align="right" class="title"><a href="home_index">[换一换]</a></td>
          </tr>
         
          <c:forEach items="${tuijian}" var="tj">
          	 <tr>
            	<td colspan="2">
	            	<table border="0" cellpadding="0" cellspacing="0" class="userdetail">
		             	<tr>
		               	 	<td width="26%"><a href="user_index?userId=${tj.id}"><img src="${tj.images}" width="50" height="50" border="0" /></a></td>
		                	<td width="74%"><a href="user_index?userId=${tj.id}">${tj.nickName}</a> 
		                		<input name="${tj.id}" type="button" class="btnguanzhu" id="${tj.id}" value="+关注"  onclick="attention(${tj.id})"/>
		               		<br />签名：${tj.sign}<br /></td>
		              	</tr>
	            	</table>
            	</td>
          	</tr>
          </c:forEach>
          
        </table>
        <!-- userinfo 结束--></td>
  </tr>
	</table>
<!-- container 结束-->
<!--footer开始-->
	<%@include file="../footer.jsp" %>
<!--footer结束-->
</body>
</html>
</html>