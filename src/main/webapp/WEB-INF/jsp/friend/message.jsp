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
<link rel="stylesheet" type="text/css" href="css/friend.css" />
<title>微博 - 别来碰我的关注</title>
<link rel="stylesheet" type="text/css" href="css/chat.css" />
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="js/chat.js"></script>
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
<table border="0" align="center" cellpadding="0" cellspacing="0" style="width: 950px; background-color: #EBEEF3">
  <tr>
  <td>
<!--效果html开始-->
    <div class="content">
        <div class="chatBox">
            <div class="chatLeft">
                <div class="chat01">
                    <div class="chat01_title">
                        <ul class="talkTo">
                            <li><a href="javascript:;">${bUser.nickName}</a></li></ul>
                    </div>
                    <div class="chat01_content">
                        <div class="message_box mes1">
                        </div>
                        <div class="message_box mes2">
                        </div>
                        <div class="message_box mes3" style="display: block;">
                        	<!-- 聊天框 -->
                        	<c:forEach items="${messageList}" var="message">
                        		<div class="message clearfix">
	                        	<div class="user-logo">
	                        		<img src="${message.userA.images}" width="50px" height="50px">
	                        	</div>
	                        	<div class="wrap-text">
	                        		<a class="clearfix">${message.userA.nickName}</a>
	                        		<div>${message.message}</div>
	                        	</div>
	                        	<div class="wrap-ri">
	                        		<div clsss="clearfix"><span>${message.messageDate}</span></div>
	                        	</div>
	                        	<div style="clear:both;"></div>
                        		</div>
                        	</c:forEach>
                        	<!-- 聊天框 -->
                        	
                        </div>
                        
                    </div>
                </div>
                <div class="chat02">
                    <div class="chat02_title">
                        <a class="chat02_title_btn ctb01" href="javascript:;" onclick="Ashow()"></a>
                        <div id="faces"></div>
                    </div>
              <form action="sendMessage?userBId=${bUser.id}" method="post">
                    <div class="chat02_content">
                        <textarea id="inputbox" name="inputbox"></textarea>
                    </div>
                    <div class="chat02_bar">
                        <ul>
                            <li style="left: 20px; top: 10px; padding-left: 30px;"></li>
                            <li style="right: 5px; top: 5px;"><input type="image" src="img/send_btn.jpg" onclick="subMessage()">
                            <script type="text/javascript">
                            	function subMessage(){
                            		document.getElementById(inputbox).value="";
                            	}
                            </script>
                            </li>
                        </ul>
                    </div>
               </form>
                </div>
            </div>
            <div class="chatRight">
                <div class="chat03">
                    <div class="chat03_title">
                        <label class="chat03_title_t">
                        	  联系好友</label>
                    </div>
                    <div class="chat03_content">
                        <ul>
                            <c:forEach items="${attUsers}" var="attUser">
	                            <li>
	                                <a href="message?userBId=${attUser.id}">
	                                <img src="${attUser.images}"></a><a href="message?userBId=${attUser.id}" class="chat03_name">&nbsp;&nbsp;&nbsp;${attUser.nickName}
	                                		<c:if test="${attUser.unReadMessage != 0}">(${attUser.unReadMessage})</c:if>
	                                	</a>
	                            </li>
                            </c:forEach>
                            
                        </ul>
                    </div>
                </div>
            </div>
            <div style="clear: both;">
            </div>
        </div>
    </div>
<!--效果html结束-->
	</td>
	</tr>
	</table>
<!-- container 结束-->


<!--footer开始-->
	<%@include file="../footer.jsp" %>
<!--footer结束-->
</body>
</html>
</html>