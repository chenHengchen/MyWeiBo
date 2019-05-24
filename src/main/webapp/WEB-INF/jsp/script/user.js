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