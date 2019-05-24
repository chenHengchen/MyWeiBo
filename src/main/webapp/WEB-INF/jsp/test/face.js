function Face(id){this.ojb=$("#"+id);this.oid=id; this.create()}
//头像路径
var faceUrl="/WebContent/jsp/gif/";
//定义头像数量
var faceNums=52;
Face.prototype.create =function(){
	var oid=this.oid;
	var my_face=$("body").find("[name=my_face_"+oid+"]");
	var msg="<style>.faceContent{width:364px; position:absolute;border:1px solid #aaa;border-top:none;display:;z-index:9999; text-align:center;padding:3px;padding-bottom:6px;background:#fff;} .faceContent a img{float:left;cursor:pointer;margin:1px 1px; border:#cacaca 1px solid}  .faceContent a:hover img{border:1px solid #f51d69}   #faceTitle{height:22px; width:36px; position:absolute; background:url("+faceUrl+"first.gif) no-repeat center center #fff;border:1px solid #aaa;border-bottom:none;'}</style>"
	msg+="<div class='faceContent' id='faceContent_"+oid+"'></div>";
	if(my_face.length==0){
		var _div="<span name='my_face_"+oid+"'></span>";
		$("body").append($(_div).html(msg));
	}else{
		my_face.html(msg);
	}
	$("#faceContent_"+oid).html("");
	var _str="";
	for(var i=1;i<=faceNums;i++){
		var str=faceUrl+"F_"+i+".gif";
		_str+="<a href='javascript:void(0)'><img src="+str+" fn=[@F_"+i+"@] /></a>";
	}
	$("#faceContent_"+oid).html(_str);
}

Face.prototype.close=function(id){
	if(!id){
		$("#my_face_"+this.oid).html("");
	}else{
		$("#my_face_"+id).html("");
	}
}

function removeFace(id){
	$("#faceContent_"+id).hide();
	$("#my_face_"+id).html("");
}

//控制表情区位置
Face.prototype.show=function(){	
	var O=this.ojb;
	var oid=this.oid;
	var top=O.offset().top;
	var left=O.offset().left;
	var h=O.height();
	$("#faceContent_"+oid).css("top",(top+h)+"px").css("left",left+"px").show();
	$("#faceContent_"+oid+" img").unbind("click").bind("click",function(){
		var _v=O.val();
		_v+=$(this).attr("fn");
		O.val(_v);
		$("#faceContent_"+oid).hide();
	});
}
//重新显示
function reShow(id){
	var O=$("#"+id);
	var top=O.offset().top;
	var left=O.offset().left;
	var h=O.height();
	$("#faceContent_"+id).css("top",(top+h)+"px").css("left",left+"px");
}

//替换页面中的表情代码为图片
function convertImg(val){
	return val.replace(/\[@/g, "<img src="+faceUrl+"").replace(/\@]/g, ".gif />");;
}
