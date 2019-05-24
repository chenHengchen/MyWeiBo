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
<link rel="stylesheet" type="text/css" href="css/profile.css" />
<title>微博 - ${logonUser.nickName}的海螺问题</title>
<script type="text/javascript" src="script/ajax.js"></script>
<script type="text/javascript" src="script/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="script/profile.js"></script>
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
    <td width="670" height="600" valign="top"><table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" id="curruser">
      <tr>
        <td width="24%" style="width: 91px; "><img src="${detailMap.conch.chUser.images}" width="120" height="120" class="userphoto" /></td>
        <td width="76%" valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0" id="curruserdetail">
          <tr>
            <td><a href="user_index?userId=${detailMap.conch.chUser.id}">
            	${detailMap.conch.chUser.nickName}</a><a style="color: red">
				<c:if test="${detailMap.conch.chUser.conchIntegral >=0 && detailMap.conch.chUser.conchIntegral<=300}">【初出茅庐】</c:if>
            	<c:if test="${detailMap.conch.chUser.conchIntegral >300 && detailMap.conch.chUser.conchIntegral<=600}">【学富五车】</c:if>
           	 	<c:if test="${detailMap.conch.chUser.conchIntegral >600 && detailMap.conch.chUser.conchIntegral<=1000}">【 名杨万里】</c:if>
           		<c:if test="${detailMap.conch.chUser.conchIntegral >1000}">【博古通今】</c:if>
           		</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${detailMap.conch.conchTime}发布      	
            </td>
          </tr>
          <tr>
            <td>
            <p>
            	 ${detailMap.conch.conchBody}
              <br><br>
            <a href="javaScript:void(0)">悬赏积分(${detailMap.conch.cNumber})</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="javaScript:void(0)">
				<c:if test="${detailMap.conch.state == 0}">未解决</c:if>
                <c:if test="${detailMap.conch.state == 1}">已解决</c:if>
			</a></p></td>
          </tr>
        </table></td>
      </tr>
    </table>
      	
        <!-- weibo 开始-->
    	
    	<c:forEach items="${detailMap.conchComm}" var="comm">
    		<table id="weibo" width="90%" border="0" align="center" cellpadding="3" cellspacing="0" style="background-color: #F8F8F8">
          <tr>
            <td rowspan="3" align="center" valign="top"><img src="${comm.commUser.images}" width="50" height="50" /></td>
            <td width="88%" class="content"><a href="user_index?userId=${comm.commUser.id}">${comm.commUser.nickName}</a><a style="color: red">
            <c:if test="${comm.commUser.conchIntegral >=0 && comm.commUser.conchIntegral<=300}">【初出茅庐】</c:if>
            <c:if test="${comm.commUser.conchIntegral >300 && comm.commUser.conchIntegral<=600}">【学富五车】</c:if>
            <c:if test="${comm.commUser.conchIntegral >600 && comm.commUser.conchIntegral<=1000}">【 名杨万里】</c:if>
            <c:if test="${comm.commUser.conchIntegral >1000}">【博古通今】</c:if>
            </a><br>${comm.commentBody}</td>
          </tr>
          <tr>
            <td height="25"><table width="100%" border="0" cellpadding="0" cellspacing="0" id="weibo_status">
              <tr>
                <td>${comm.commentDate}</td>
                <td align="right">
               		<c:if test="${comm.commentState == 100 && detailMap.conch.state == 0}">
               			<a href="adoptComm?conchId=${detailMap.conch.id}&comm=${comm.id}" style="text-decoration:none">采纳</a>
               		</c:if>
                	<c:if test="${comm.commentState == 101 && detailMap.conch.state == 1}">
               			<a href="javaScript:void(0)" style="text-decoration:none">已采纳</a>
               		</c:if>
                </td>
              </tr>
            </table></td>
          </tr>
          <tr></tr>
    </table>
    	</c:forEach>
     
      <!-- 分页。。。 -->
      <%-- <table align="center" id="page">
        <tr>
        <td align="right">
        	<c:if test="${pageBean.page!=1}">
   				<a href="pageUpAndDown?operation=Up&pageId=${pageBean.page}&action=${action}" style="text-decoration:none">上一页</a>&nbsp; &nbsp;     
        	</c:if>
        	第&nbsp; ${pageBean.page} &nbsp;页 &nbsp;&nbsp;
        	<c:if test="${pageBean.page != pageBean.totalPage}">
          		<a href="pageUpAndDown?operation=Down&pageId=${pageBean.page}&action=${action}" style="text-decoration:none">下一页</a>
        	</c:if> 
          	&nbsp;&nbsp;&nbsp;&nbsp;
        	共 &nbsp; ${pageBean.totalPage} &nbsp;页 
        </td>
      </tr>
    </table> --%>
    <!-- weibo 结束-->
    </td>
	    <td width="280" align="center" valign="top" class="pageright">
        <!-- userinfo 开始-->
			<%@include file="../userinfo.jsp" %>
        <!-- userinfo 结束--></td>
  </tr>
  <tr>
      <td>
      <table id="weibo" width="90%" border="0" align="center" cellpadding="3" cellspacing="0" style="background-color: #F8F8F8">
          <tr>
            <td rowspan="3" align="center" valign="top"><img src="${loginUser.images}" width="50" height="50" /></td>
            <td width="88%" class="content"><a href="user_index?userId=${loginUser.id}">回复人</a><a style="color: red">
            <c:if test="${loginUser.conchIntegral >=0 && loginUser.conchIntegral<=300}">【初出茅庐】</c:if>
            <c:if test="${loginUser.conchIntegral >300 && loginUser.conchIntegral<=600}">【学富五车】</c:if>
            <c:if test="${loginUser.conchIntegral >600 && loginUser.conchIntegral<=1000}">【 名杨万里】</c:if>
            <c:if test="${loginUser.conchIntegral >1000}">【博古通今】</c:if>
            </a>
            <form action="conchComm?userId=${loginUser.id}&conchId=${detailMap.conch.id}" method="post">
            	<textarea rows="" cols="inputbox" id="inputbox" name="inputbox" style="width: 403px; height: 60px;"></textarea>
            	<!-- <input type="text" id="inputbox" name="inputbox"> -->
			 	<a href="javaScript:void(0)" onclick="Ashow()">表情</a>&nbsp;&nbsp;&nbsp;
				<%-- <input type="button" value="回复" onclick="conchComm('${loginUser.id}','${detailMap.conch.chUser.id}')"> --%>
				<input type="submit" value="回复" >
			</form>
            </td>
            <td><div id="faces"></div></td>
          </tr>
          <tr></tr>
    </table>
      </td>
      </tr>
	</table>
<!-- container 结束-->

<!--footer开始-->
	<%@include file="../footer.jsp" %>
<!--footer结束-->
<script type="text/javascript">
	function conchComm(uId,cId){
		var inputbox = document.getElementById("inputbox").value;
		var url="conchComm?userId="+uId+"&conchId="+cId+"$inputbox="+inputbox;
		var xhr=createXMLHttpRequest();
		xhr.open("POST",url,true);
		xhr.onreadystatechange = seekCallBake;
		xhr.send(null);
		function seekCallBake(){
			if(xhr.readyState==4 && xhr.status==200){
			}
		}
		alert("回复成功！")
		document.getElementById("inputbox").value="";
	}
</script>
</body>
</html>