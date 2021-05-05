function LinkList(){}
LinkList.prototype.setStatus=function(status1){
	this.status1=status1;
};
LinkList.prototype.getStatus=function(){
	return this.status1;	
};
LinkList.prototype.setPageNow=function(pageNow){
	this.pageNow=pageNow;
};
LinkList.prototype.getPageNow=function(){
	return this.pageNow;
};
LinkList.prototype.setPageCount=function(pageCount){
	this.pageCount=pageCount;
};
LinkList.prototype.getPageCount=function(){
	return this.pageCount;
};
LinkList.prototype.setAttribute=function(attribute){
	this.attribute=attribute;
};
LinkList.prototype.getAttribute=function(){
	return this.attribute;
};
LinkList.prototype.setOrder=function(order){
	this.order=order;
};
LinkList.prototype.getOrder=function(){
	return this.order;
};
LinkList.prototype.sort=function(attribute){
	this.setAttribute(attribute);
	if(this.order=="asc"){
		this.setOrder("desc");
	}else{
		this.setOrder("asc");
	}
	this.loadData();
};
LinkList.prototype.filter = function(status1){
	this.status1 = status1;
	this.loadData();
};
LinkList.prototype.getLinkList=function(){
	var url="admin/LinkList?pageNow="+this.pageNow+"&status="+this.status1+"&attribute="+this.attribute+"&order="+this.order;
	window.location.href=url;
};
LinkList.prototype.loadData=function(){
	this.getLinkList();
};
LinkList.prototype.showToolBar = function(){
	var tools=document.getElementsByClassName("toolbar");
	tools[1].innerHTML=tools[0].innerHTML;
};
function newLink(){
	document.getElementById("link").value="0";
	var title="添加链接";
	var html="<label>名称</label><input type='text' id='name'/><br/><label>Url</label><input type='text' id='url'/>";
	inputBox(title,html,'addLink()');
}
function addLink(){     
	var link=document.getElementById("link").value;
	var name=document.getElementById("name").value;
	var linkurl=document.getElementById("url").value;
	if(name.length==0||linkurl.length==0){
		return false;
	}
	var xmlHttp=createXMLHttpRequest();
    var url="admin/EditLink";
    xmlHttp.open("post",url,true);
    xmlHttp.onreadystatechange=addcallback;
    xmlHttp.setRequestHeader("Content-type","application/x-www-form-urlencoded;charset=UTF-8");
    xmlHttp.send("linkId="+link+"&name="+encodeURIComponent(name)+"&url="+linkurl);
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
function modiLink(num){
	var selects = document.getElementsByName("select");
	document.getElementById("link").value=selects[num].value;
	var ro=document.getElementById("dtable").rows[num+1];
	var name=ro.cells[1].innerHTML;
	var url=ro.cells[2].innerHTML;
	var title="修改链接";
	var html="<label>名称</label><input type='text' value='"+name+"' id='name'/><br/><label>Url</label><input type='text' value='"+url+"' id='url'/>";
	inputBox(title,html,'addLink()');
}
