function CategoryList(){}
CategoryList.prototype.setStatus=function(status1){
	this.status1=status1;
};
CategoryList.prototype.getStatus=function(){
	return this.status1;	
};
CategoryList.prototype.setPageNow=function(pageNow){
	this.pageNow=pageNow;
};
CategoryList.prototype.getPageNow=function(){
	return this.pageNow;
};
CategoryList.prototype.setPageCount=function(pageCount){
	this.pageCount=pageCount;
};
CategoryList.prototype.getPageCount=function(){
	return this.pageCount;
};
CategoryList.prototype.setAttribute=function(attribute){
	this.attribute=attribute;
};
CategoryList.prototype.getAttribute=function(){
	return this.attribute;
};
CategoryList.prototype.setOrder=function(order){
	this.order=order;
};
CategoryList.prototype.getOrder=function(){
	return this.order;
};
CategoryList.prototype.upperPage=function(){
	if(this.pageNow>1){
		this.pageNow-=1;
		this.loadData();
	}
};
CategoryList.prototype.nextPage=function(){
	if(this.pageNow<this.pageCount){
		this.pageNow+=1;
		this.loadData();
	}
};
CategoryList.prototype.sort=function(attribute){
	this.setAttribute(attribute);
	if(this.order=="asc"){
		this.setOrder("desc");
	}else{
		this.setOrder("asc");
	}
	this.loadData();
};
CategoryList.prototype.filter = function(status1){
	this.status1 = status1;
	this.loadData();
};
CategoryList.prototype.getCategoryList=function(){
	var url="admin/CategoryList?pageNow="+this.pageNow+"&status="+this.status1+"&attribute="+this.attribute+"&order="+this.order;
	window.location.href=url;
};
CategoryList.prototype.loadData=function(){
	this.getCategoryList();
};

CategoryList.prototype.showToolBar = function(){
	var tools=document.getElementsByClassName("toolbar");
	tools[1].innerHTML=tools[0].innerHTML;
};

function newCategory(){
	document.getElementById("category").value="0";
	var title="添加分类";
	var html="<label>名称</label><input type='text' id='inputtext'/>";
	inputBox(title,html,'addCategory()');
}
function addCategory(){     
	var category=document.getElementById("category").value;
	var name=document.getElementById("inputtext").value;
	if(name.lenth==0){
		return false;
	}
	var xmlHttp=createXMLHttpRequest();
    var url="admin/EditCategory";
    xmlHttp.open("post",url,true);
    xmlHttp.onreadystatechange=addcallback;
    xmlHttp.setRequestHeader("Content-type","application/x-www-form-urlencoded;charset=UTF-8");
    xmlHttp.send("categoryId="+category+"&name="+encodeURIComponent(name));
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
function modiCategory(num){
	var selects = document.getElementsByName("select");
	document.getElementById("category").value=selects[num].value;
	var ro=document.getElementById("dtable").rows[num+1];
	var value=ro.cells[1].innerHTML;
	var title="修改分类";
	var html="<label>名称</label><input type='text' id='inputtext' value='"+value+"'/>";
	inputBox(title,html,'addCategory()');
}
