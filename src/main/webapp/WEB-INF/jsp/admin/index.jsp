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
<script src="js/Chart-1.0.1-beta.4.js"></script>
<script>
	var data1 = {
		labels : ["${map.week1}","${map.week2}","${map.week3}","${map.week4}","${map.week5}","${map.week6}","${map.week7}"],
		datasets : [
			{
				lineItemName : "微博数",
				fillColor : "rgba(220,220,220,0.5)",
				strokeColor : "rgba(220,220,220,1)",
				pointColor : "rgba(220,220,220,1)",
				pointStrokeColor : "#fff",
				data : ["${map.ww1}","${map.ww2}","${map.ww3}","${map.ww4}","${map.ww5}","${map.ww6}","${map.ww7}"]
			},
			{
				lineItemName : "海螺数",
				fillColor : "rgba(151,187,205,0.5)",
				strokeColor : "rgba(151,187,205,1)",
				pointColor : "rgba(151,187,205,1)",
				pointStrokeColor : "#fff",
				data : ["${map.wc1}","${map.wc2}","${map.wc3}","${map.wc4}","${map.wc5}","${map.wc6}","${map.wc7}"]
			}
		]
	};
	var data2 = [
				{
					label: "本周海螺数",
					value: ${map.wc1+map.wc2+map.wc3+map.wc4+map.wc5+map.wc6+map.wc7},
					// value: 1,
					color:"#F38630"
				},
				{
					label: "本周微博总数",
					value: ${map.ww1+map.ww2+map.ww3+map.ww4+map.ww5+map.ww6+map.ww7},
					// value : 3,
					color : "#69D2E7"
				}		
			];
		var data4 = [
					{
						label: "海螺总数",
						value: ${map.c2},
						// value: 17,
						color:"#F38630"
					},
					{
						label: "回答总数",
						value : ${map.h2},
						// value : 9 ,
						color : "#E0E4CC"
					},
					{
						label: "评论总数",
						value : ${map.p2},
						// value : 10,
						color : "#E0E4CC"
					},
					{
						label: "用户总数",
						value : ${map.u2},
						// value : 19,
						color : "#CBDDE6"
					},
					{
						label: "微博总数",
						value : ${map.w2},
						// value : 62,
						color : "#69D2E7"
					}			
				];
		var data3 = {
				labels : ["用户数","微博数","评论数","海螺数","回答数"],
				datasets : [
					{
						barItemName: "历史总数",
						fillColor : "rgba(220,220,220,0.5)",
						strokeColor : "rgba(220,220,220,1)",
						data : ["${map.u2}","${map.w2}","${map.p2}","${map.c2}","${map.h2}"]
					},
					{
						barItemName: "本月新增",
						fillColor : "rgba(151,187,205,0.5)",
						strokeColor : "rgba(151,187,205,1)",
						data : ["${map.u1}","${map.w1}","${map.p1}","${map.c1}","${map.h1}"]
					}
				]
			};		
			var chartBar = null;
			var chartLine = null;
			var chartPie = null;
			var chartPie2 = null;
			window.onload = function(){				
				var ctx = document.getElementById("bChart").getContext("2d");
				chartPie = new Chart(ctx).Pie(data4, {segmentShowStroke : false, showTooltips : 1});
				var ctx = document.getElementById("cChart").getContext("2d");
				chartPie = new Chart(ctx).Pie(data2, {segmentShowStroke : false, showTooltips : 1});
				var ctx = document.getElementById("weekChart").getContext("2d");
				chartLine = new Chart(ctx).Line(data1);
				var ctx = document.getElementById("aChart").getContext("2d");
				chartBar = new Chart(ctx).Bar(data3);
			}
		</script>
</head>
<body>
<!-- header开始-->
	<%@include file="header.jsp" %>
<!-- header结束-->
<!-- container 开始-->
<table border="0" align="center" cellpadding="0" cellspacing="0" id="container">
  <tr>
    <td width="670" height="500" valign="top">
      <table border="0" align="center" cellpadding="0" cellspacing="0" id="userinfo">
        <tr>
        	<td>微博总数统计</td>
        </tr>
        <tr>
        	<td><canvas id="aChart" width="500" height="300"></canvas></td>
        	<td><canvas id="bChart" width="300" height="300"></canvas></td>
        </tr>
        <tr>
        	<td>本周微博海螺发布数统计</td>
        </tr>
        <tr>
        	<td><canvas id="weekChart" width="500" height="300"></canvas></td>
        	<td><canvas id="cChart" width="300" height="300"></canvas></td>
        </tr>
      </table>
    </td>
  </tr>
	</table>
<!-- container 结束-->

<!--footer开始-->
	<%@include file="../footer.jsp" %>
<!--footer结束-->
</body>
</html>