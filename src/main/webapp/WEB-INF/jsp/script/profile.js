// JavaScript Document
//微博文本获取焦点
function blogtextfocus(){
	if(document.getElementById("blogtext").value == "你正在做什么？"){
	document.getElementById("blogtext").value="";
	document.getElementById("blogtext").style.color="#000000";
	}
}
//微博文本失去焦点
function blogtextblur(){
	if(document.getElementById("blogtext").value == ""){
	document.getElementById("blogtext").value="你正在做什么？";
	document.getElementById("blogtext").style.color="#999999";
	}	
}

//关注与取消关注
function attention(id){
	var bmsg = document.getElementById(id).value;
	if(bmsg == "+关注"){
		document.getElementById(id).value="已关注";
		var url="attention?operation=GZ&attId="+id;
	}else if(bmsg == "已关注"){
		document.getElementById(id).value="+关注";
		var url="attention?operation=QXGZ&attId="+id;
	}
	
	var xhr=createXMLHttpRequest();
	xhr.open("GET",url,true);
	xhr.onreadystatechange = seekCallBake;
	xhr.send(null);
	function seekCallBake(){
		if(xhr.readyState==4 && xhr.status==200){
		
		}
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

function deleteWeibo(id){
	var wmsg = document.getElementById("weibo"+id);
	var r = confirm("是否确认删除？");
	if(r == true){
		var url="deleteWeibo?weiboId="+id;
		var xhr=createXMLHttpRequest();
		xhr.open("post",url,true);
		xhr.onreadystatechange = seekCallBake;
		xhr.send(null);
		function seekCallBake(){
			if(xhr.readyState==4 && xhr.status==200){
				alert("删除成功！可在回收站查看被删除微博！");
				wmsg.style.display="none";
			}
		}
	}
}