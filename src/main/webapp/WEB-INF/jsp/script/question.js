// JavaScript Document
var mm;
function checkoldAnswer(){
	var oldAnswer = document.getElementById("oldAnswer").value;
	var oldAMsg = document.getElementById("oldAMsg");
	var url="QAServlet?answer="+oldAnswer;
	var xhr=createXMLHttpRequest();
	xhr.open("GET",url,true);
	xhr.onreadystatechange = seekCallBake;
	xhr.send(null);
	function seekCallBake(){
		if(xhr.readyState==4 && xhr.status==200){
			oldAMsg.innerHTML = xhr.responseText;
			mm=xhr.responseText;
		}
	}
}

function checknewQuestion(){
	var newQuestion = document.getElementById("newQuestion");
	var newQMsg = document.getElementById("newQMsg");
	if(newQuestion.value.indexOf(" ")==-1){
		newQMsg.innerHTML = "<img src='icon/ok.png' align='absmiddle'>";
	}else{
		newQMsg.innerHTML = "<img src='icon/err.png' align='absmiddle'> <font color='red'>不能包含空格</font>";
	}
	if(newQuestion.value.length == 0){
		newQMsg.innerHTML = "<img src='icon/err.png' align='absmiddle'> <font color='red'>密保问题不能为空</font>";
	}
}
function checknewAnswer(){
	var newAnswer = document.getElementById("newAnswer");
	var newAMsg = document.getElementById("newAMsg");
	if(newAMsg.value.indexOf(" ")==-1){
		newAMsg.innerHTML = "<img src='icon/ok.png' align='absmiddle'>";
	}else{
		newAMsg.innerHTML = "<img src='icon/err.png' align='absmiddle'> <font color='red'>不能包含空格</font>";
	}
	if(newAMsg.value.length == 0){
		newAMsg.innerHTML = "<img src='icon/err.png' align='absmiddle'> <font color='red'>答案不能为空</font>";
	}
}

function checkquestion(){
	var newQuestion = document.getElementById("newQuestion");
	var newAnswer = document.getElementById("newAnswer");
	if(typeof(mm)=="undefined" || mm.indexOf("ok")==-1 || newQuestion.value.length == 0 || newAMsg.value.length == 0 ||
			!(newAMsg.value.indexOf(" ")==-1) || !(newQuestion.value.indexOf(" ")==-1)){
		alert("信息填写有误");
		return false;
	}else{
		return true;
	}
}