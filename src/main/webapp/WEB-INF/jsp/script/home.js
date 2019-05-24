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

function checkWeibo(){
	var inputbox = document.getElementById("inputbox").value;
	var pic = document.getElementById("pic").value;
	if(inputbox.length==0){
		alert("微博内容不能为空！");
		return false;
	}else if(pic!=""){
		var foot = pic.split(".")[1];
		if(foot=="png" || foot=="jpg" || foot=="gif"){
			return ture;
		}else{
			alert("图片格式有误！请选择以png、jpg、gif结尾的图片");
			return false;
		}
	}
}