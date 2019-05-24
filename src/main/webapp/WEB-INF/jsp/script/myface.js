// JavaScript Document
function checkIcon(){
	var icon = document.getElementById("icon").value;
	var iconMsg = document.getElementById("iconMsg");
	var foot = icon.split(".")[1];
	if(icon==""){
		iconMsg.innerHTML = "<img src='icon/err.png' align='absmiddle'> <font color='red'>请选择图片</font>";
	}else if(foot=="png" || foot=="jpg" || foot=="gif"){
		iconMsg.innerHTML = "<img src='icon/ok.png' align='absmiddle'>";
	}
}

function chechMyFace(){
	var icon = document.getElementById("icon").value;
	var foot = icon.split(".")[1];
	if(foot=="png" || foot=="jpg" || foot=="gif"){
		return ture;
	}else{
		alert("文件格式有误！");
		return false;
	}
}

function showIcon(pic,imgfile){
	if (imgfile.value){
		pic.src=imgfile.value;
		}
}