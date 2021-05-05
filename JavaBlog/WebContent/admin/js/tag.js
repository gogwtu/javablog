function TagList(){}
TagList.prototype.setStatus=function(status1){
	this.status1=status1;
};
TagList.prototype.getStatus=function(){
	return this.status1;	
};
TagList.prototype.setPageNow=function(pageNow){
	this.pageNow=pageNow;
};
TagList.prototype.getPageNow=function(){
	return this.pageNow;
};
TagList.prototype.setPageCount=function(pageCount){
	this.pageCount=pageCount;
};
TagList.prototype.getPageCount=function(){
	return this.pageCount;
};
TagList.prototype.setAttribute=function(attribute){
	this.attribute=attribute;
};
TagList.prototype.getAttribute=function(){
	return this.attribute;
};
TagList.prototype.setOrder = function(order){
	this.order = order;
};
TagList.prototype.getOrder=function(){
	return this.order;
};
TagList.prototype.upperPage=function(){
	if(this.pageNow>1){
		this.pageNow-=1;
		this.loadData();
	}
};
TagList.prototype.nextPage=function(){
	if(this.pageNow<this.pageCount){
		this.pageNow+=1;
		this.loadData();
	}
};
TagList.prototype.sort=function(attribute){
	this.setAttribute(attribute);
	if(this.order == "asc"){
		this.setOrder("desc");
	}else{
		this.setOrder("asc");
	}
	this.loadData();
};
TagList.prototype.filter = function(status1){
	this.status1 = status1;
	this.loadData();
};
TagList.prototype.getTagList=function(){
	var url="admin/TagList?pageNow="+this.pageNow+"&status="+this.status1+"&attribute="+this.attribute+"&order="+this.order;
	window.location.href=url;
};
TagList.prototype.loadData=function(){
	this.getTagList();
};

TagList.prototype.showToolBar = function(){
	var tools=document.getElementsByClassName("toolbar");
	tools[1].innerHTML=tools[0].innerHTML;
};

function newTag(){
	document.getElementById("tag").value="0";
	var title="添加标签";
	var html="<label>名称</label><input type='text' id='inputtext'/>";
	inputBox(title,html,'addTag()');
}
function addTag(){
	var tag=document.getElementById("tag").value;
	var name=document.getElementById("inputtext").value;
	if(name==null||name.length==0){
		return false;
	}
	var xmlHttp=createXMLHttpRequest();
    var url="admin/EditTag";
    xmlHttp.open("post",url,true);
    xmlHttp.onreadystatechange=addcallback;
    xmlHttp.setRequestHeader("Content-type","application/x-www-form-urlencoded;charset=UTF-8");
    xmlHttp.send("tagId="+tag+"&name="+encodeURIComponent(name));
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
function modiTag(num){
	var selects = document.getElementsByName("select");
	document.getElementById("tag").value=selects[num].value;
	var ro=document.getElementById("dtable").rows[num+1];
	var value=ro.cells[1].innerHTML;
	var title="修改标签";
	var html="<label>名称</label><input type='text' id='inputtext' value='"+value+"'/>";
	inputBox(title,html,'addTag()');
}
