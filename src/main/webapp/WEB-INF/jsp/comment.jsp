<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>
       <table id="pl${weibo.id}" style="display: none" border="0" cellpadding="0" cellspacing="0">
		<tr>
			<td class="content">热门评论</td>
		</tr>
				<tr id="${weibo.id}plfy1">
						<td style="font-size:13px" class="content" >
							<div class="${weibo.id}plfy11"></div>
						</td>
						<td></td>
						<td style="font-size:11px" class="content" ><div class="${weibo.id}plfy12"></div></td>
						<td style="font-size:11px" class="content" ><div class="${weibo.id}plfy13"></div></td>
				</tr>
				<tr id="${weibo.id}plfy2">
						<td style="font-size:13px" class="content" >
							<div class="${weibo.id}plfy21"></div>
						</td>
						<td></td>
						<td style="font-size:11px" class="content" ><div class="${weibo.id}plfy22"></div></td>
						<td style="font-size:11px" class="content" ><div class="${weibo.id}plfy23"></div></td>
				</tr>
				<tr id="${weibo.id}plfy3">
						<td style="font-size:13px" class="content" >
							<div class="${weibo.id}plfy31"></div>
						</td>
						<td></td>
						<td style="font-size:11px" class="content" ><div class="${weibo.id}plfy32"></div></td>
						<td style="font-size:11px" class="content" ><div class="${weibo.id}plfy33"></div></td>
				</tr>
				<tr id="${weibo.id}plfy4">
						<td style="font-size:13px" class="content" >
							<div class="${weibo.id}plfy41"></div>
						</td>
						<td></td>
						<td style="font-size:11px" class="content" ><div class="${weibo.id}plfy42"></div></td>
						<td style="font-size:11px" class="content" ><div class="${weibo.id}plfy43"></div></td>
				</tr>
				<tr id="${weibo.id}plfy5">
						<td style="font-size:13px" class="content" >
							<div class="${weibo.id}plfy51"></div>
						</td>
						<td></td>
						<td style="font-size:11px" class="content" ><div class="${weibo.id}plfy52"></div></td>
						<td style="font-size:11px" class="content" ><div class="${weibo.id}plfy53"></div></td>
				</tr>
			
			<tr><td>&nbsp;</td></tr>
			<tr >
				<td align="right" colspan="4">
        			<span class="${weibo.id}commUp">
   						<a href="javaScript:void(0)" style="text-decoration:none" onclick="comm(1,${weibo.id})">上一页</a>&nbsp; &nbsp;     
        			</span>
        			第&nbsp; <a id="${weibo.id}commPage">1</a> &nbsp;页 &nbsp;&nbsp;
        			<span class="${weibo.id}commdown">
          				<a href="javaScript:void(0)" style="text-decoration:none" onclick="comm(2,${weibo.id})">下一页</a>
        			</span> 
          			&nbsp;&nbsp;&nbsp;&nbsp;
        			共 &nbsp; <a id="${weibo.id}commTotalPage">1</a> &nbsp;页 
        		</td>
			</tr>
			<tr><td>&nbsp;</td></tr>
			<tr>
				<td class="content">
					<img src="${loginUser.images}" border="0" width="21" height="20" /><a href = "javascript:void(0)"style="text-decoration:none">${loginUser.nickName} ：</a>
					<input id="cb${weibo.id}" type="text" style="width: 224px; ">
					<span id="faces"></span>&nbsp;
				</td>
				<td colspan="2" align="center"><a onclick="show(${weibo.id})">表情</a></td>
				<td colspan="2" align="center"><a onclick="pubComment(${weibo.id})">发表</a></td>
			</tr>
			<tr><td>&nbsp;</td></tr>
            </table>
</body>
</html>