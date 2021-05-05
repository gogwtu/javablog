function ResourceList(){}
ResourceList.prototype.setStatus=function(status1){
	this.status1=status1;
};
ResourceList.prototype.getStatus=function(){
	return this.status1;	
};
ResourceList.prototype.setPageNow=function(pageNow){
	this.pageNow=pageNow;
};
ResourceList.prototype.getPageNow=function(){
	return this.pageNow;
};
ResourceList.prototype.setPageCount=function(pageCount){
	this.pageCount=pageCount;
};
ResourceList.prototype.getPageCount=function(){
	return this.pageCount;
};
ResourceList.prototype.setAttribute=function(attribute){
	this.attribute=attribute;
};
ResourceList.prototype.getAttribute=function(){
	return this.attribute;
};
ResourceList.prototype.setOrder=function(order){
	this.order=order;
};
ResourceList.prototype.getOrder=function(){
	return this.order;
};
ResourceList.prototype.upperPage=function(){
	if(this.pageNow>1){
		this.pageNow-=1;
		this.loadData();
	}
};
ResourceList.prototype.nextPage=function(){
	if(this.pageNow<this.pageCount){
		this.pageNow+=1;
		this.loadData();
	}
};
ResourceList.prototype.sort=function(attribute){
	this.setAttribute(attribute);
	if(this.order=="asc"){
		this.setOrder("desc");
	}else{
		this.setOrder("asc");
	}
	this.loadData();
};
ResourceList.prototype.filter = function(status1){
	this.status1 = status1;
	this.loadData();
};
ResourceList.prototype.getResourceList=function(){
	var url="admin/ResourceList?status="+this.status1+"&pageNow="+this.pageNow+"&attribute="+this.attribute+"&order="+this.order;
	window.location.href=url;
};
ResourceList.prototype.loadData=function(){
	this.getResourceList();
};
ResourceList.prototype.showToolBar = function(){
	var tools=document.getElementsByClassName("toolbar");
	tools[1].innerHTML=tools[0].innerHTML;
};
function newUpload(){
	var title="上传文件";
	var html="<input type='file' name='file' id='file'><iframe style='display:none;' name='hide'></iframe>";
	inputBox(title,html,'upload(1)');
}
function uploadCallback(name, url, type){
	closeBox();
	showInfo("上传成功");
	window.location.reload();
}
function addResource(){     
	var resourceId=document.getElementById("resourceId").value;
	var name=document.getElementById("inputtext").value;
	if(name.length==0){
		return false;
	}
	var xmlHttp=createXMLHttpRequest();
    var url="admin/EditResource";
    xmlHttp.open("post",url,true);
    xmlHttp.onreadystatechange=addcallback;
    xmlHttp.setRequestHeader("Content-type","application/x-www-form-urlencoded;charset=UTF-8");
    xmlHttp.send("resourceId="+resourceId+"&name="+encodeURIComponent(name));
    function addcallback()
    {
        if(xmlHttp.readyState==4&&xmlHttp.status==200){
	        var data= xmlHttp.responseText;
	        if(data=="s"){
	        	showInfo("成功");
	        	window.location.reload();
	        }else if(data=="n"){
	        	showInfo("对不起，你没有权限");
	        }else{
	        	showInfo("失败");
	        }
    	}
    }
	return false;
}
function modiResource(num){
	var selects = document.getElementsByName("select");
		document.getElementById("resourceId").value=selects[num].value;
		var ro=document.getElementById("dtable").rows[num+1];
	var value=ro.cells[1].innerHTML;
	var title="修改资料";
	var html="<input type='text' id='inputtext' value='"+value+"'/>";
	inputBox(title,html,'addResource()');
}
