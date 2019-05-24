// JavaScript Document
//微博文本获取焦点
function blogtextfocus(){
	if(document.getElementById("blogtext").value == "你正在做什么？"){
	document.getElementById("blogtext").value="";
	document.getElementById("blogtext").style.color="#000000";
	}
}
//΢���ı�ʧȥ����
function blogtextblur(){
	if(document.getElementById("blogtext").value == ""){
	document.getElementById("blogtext").value="你正在做什么？";
	document.getElementById("blogtext").style.color="#999999";
	}	
}

function imgAct(id){
	   
	   var img = $("#"+id);  
	   var oWidth=img.width(); //取得图片的实际宽度  
	   var oHeight=img.height(); //取得图片的实际高度  
	    
	  $("#"+id).live("click",function(){
	      $(this).toggle(function(){   
	          img.width(oWidth*3);  
	            img.height(oHeight*3);   
	         }, function(){   
	             img.width(oWidth);  
	             img.height(oHeight);   
	        }).trigger('click');    
	  });  

}

function like(id){
	/*
	 * id:微博编号
	 * spanMsg:span标签里面的值
	 */
	var msg=document.getElementById("like"+id);
	spanMsg = msg.innerText;
	
	var url="WeiboLike?weiboId="+id+"&spanMsg="+spanMsg;
	var xhr=createXMLHttpRequest();
	xhr.open("POST",url,true);
	xhr.onreadystatechange = seekCallBake;
	xhr.send(null);
	function seekCallBake(){
		if(xhr.readyState==4 && xhr.status==200){
			msg.innerHTML = xhr.responseText;
		}
	}
	
}
function trans(id){
	var msg=document.getElementById("trans"+id);
	spanMsg = msg.innerText;
	
	var url="WeiboTrans?weiboId="+id+"&spanMsg="+spanMsg;
	var xhr=createXMLHttpRequest();
	xhr.open("POST",url,true);
	xhr.onreadystatechange = seekCallBake;
	xhr.send(null);
	function seekCallBake(){
		if(xhr.readyState==4 && xhr.status==200){
			alert("转发成功！");
			msg.innerHTML = xhr.responseText;
		}
	}
}

function comm(zt,id){
	var p = $("#"+id+"commPage").html();
	var url_comm = "getComm?weiboId="+id+"&p="+p+"&fy=0";
	if(zt == 0){
		var msg = document.getElementById("pl"+id);
		if(msg.style.cssText == "display: none;"){
			msg.style.display="inline";
		}else{
			msg.style.display="none";
		}
	}
	if(zt == 1){
		//上一页
		url_comm = "getComm?weiboId="+id+"&p="+p+"&fy=1";
	}else if(zt == 2){
		//下一页
		url_comm = "getComm?weiboId="+id+"&p="+p+"&fy=2";
	}
	$.ajax({
		type : "post",
		url : url_comm,
		contentType : "application/json",
		dataType : "json",
		success : function(data) {
			var l = data.length;
			for(var i=1;i<data.length;i++){
				$("."+id+"plfy"+i+"1").html("<img src='"+data[i-1].commUser.images+"' border='0' width='21' height='20' />&nbsp;<a href = 'user_index?userId="+data[i-1].commUser.id+"' style='text-decoration:none'>"+data[i-1].commUser.nickName+" ：</a>"+data[i-1].commentBody+"&nbsp;&nbsp;&nbsp;")
				$("."+id+"plfy"+i+"2").html(data[i-1].commentDate);
				//$("."+id+"plfy"+i+"3").html("<span style='cursor:pointer'>&nbsp;&nbsp;&nbsp;&nbsp;赞("+data[i-1].commentLike+")");
			}	//控制显示评论
			while(l<5){
				l++;
				$("."+id+"plfy"+l+"1").html("");
				$("."+id+"plfy"+l+"2").html("");
				$("."+id+"plfy"+l+"3").html("");
			}	//控制填充不足五条的评论
			
			$("#"+id+"commPage").html(data[data.length-1].page);
			$("#"+id+"commTotalPage").html(data[data.length-1].totalPage);
			
			if($("#"+id+"commPage").html()==1){
				$("."+id+"commUp").css("display","none");
			}else{
				$("."+id+"commUp").css("display","inline");
			}
			if($("#"+id+"commTotalPage").html()==1 || $("#"+id+"commPage").html()==$("#"+id+"commTotalPage").html()){
				$("."+id+"commdown").css("display","none");
			}else{
				$("."+id+"commdown").css("display","inline");
			}
		}
	});
}

function pubComment(id){
	var msg=document.getElementById("cb"+id);
	var commmsg=document.getElementById("comm"+id);
	if(msg.value == ""){
		alert("评论不能为空！");
	}else{
		var url="pubComment?weiboId="+id+"&comment="+msg.value;
		var xhr=createXMLHttpRequest();
		xhr.open("POST",url,true);
		xhr.onreadystatechange = seekCallBake;
		xhr.send(null);
		function seekCallBake(){
			if(xhr.readyState==4 && xhr.status==200){
				alert("评论成功！");
				comm.innerHTML = xhr.responseText;
			}
		}
		
		
	}
}

//目标微博翻页
function nextCommPage(id){
	
}
//目标微博上一页
function upCommPage(id){
	
}

function coll(id){
	//微博收藏
	var url="weiboCollect?weiboId="+id;
	var xhr=createXMLHttpRequest();
	xhr.open("POST",url,true);
	xhr.onreadystatechange = seekCallBake;
	xhr.send(null);
	function seekCallBake(){
		if(xhr.readyState==4 && xhr.status==200){
			alert("收藏成功！");
		}
	}
}