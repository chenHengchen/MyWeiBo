// JavaScript Document
var mm;
function checkoldpwd(){
	var pwd = document.getElementById("pwd").value;
	var msg = document.getElementById("pwdmsg");
	var url="PWDServlet?pwd="+pwd;
	var xhr=createXMLHttpRequest();
	xhr.open("GET",url,true);
	xhr.onreadystatechange = seekCallBake;
	xhr.send(null);
	function seekCallBake(){
		if(xhr.readyState==4 && xhr.status==200){
			msg.innerHTML = xhr.responseText;
			mm=xhr.responseText;
		}
	}
}

function checkpwd(){
	var pwd = document.getElementById("newpwd");
	var pwdmsg = document.getElementById("newpwdmsg");
	if(pwd.value.length<6 || pwd.value.length>16){
		pwdmsg.innerHTML = "<img src='icon/err.png' align='absmiddle'> <font color='red'>长度为6~16位</font>";
	}else{
		pwdmsg.innerHTML = "<img src='icon/ok.png' align='absmiddle'>";
	}
}
function checkrepwd(){
	var pwd = document.getElementById("newpwd");
	var repwd = document.getElementById("renewpwd");
	var repwdmsg = document.getElementById("renewpwdmsg");
	if(pwd.value != repwd.value){
		repwdmsg.innerHTML = "<img src='icon/err.png' align='absmiddle'> <font color='red'>密码不一致</font>";
	}else{
		repwdmsg.innerHTML = "<img src='icon/ok.png' align='absmiddle'>";
	}
}

function checkUpdatUser(){
	var pwd = document.getElementById("newpwd");
	var repwd = document.getElementById("renewpwd");
	if(typeof(mm)=="undefined" || mm.indexOf("ok")==-1 || pwd.value.length<6 || pwd.value.length>16 || pwd.value != repwd.value){
		alert("信息填写有误");
		return false;
	}else{
		return true;
	}
}