function createXMLHttpRequest(){
	var xmlHttp
	//本地浏览器是否支持ActiveX对象，返回对象为true，返回null为false
	if(window.ActiveXObject){
		xmlHttp = new ActiveXObject("Microsoft.XMLHTTP")
		//本地浏览器是否支持XMLHttpRequest对象
	}else if(window.XMLHttpRequest){
		//作为一个java对象来创建
		xmlHttp = new XMLHttpRequest();
	}
	return xmlHttp;
}