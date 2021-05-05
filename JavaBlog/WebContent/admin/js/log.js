function LogList(){}
LogList.prototype.setStatus=function(status1){
	this.status1=status1;
};
LogList.prototype.getStatus=function(){
	return this.status1;	
};
LogList.prototype.setPageNow=function(pageNow){
	this.pageNow=pageNow;
};
LogList.prototype.getPageNow=function(){
	return this.pageNow;
};
LogList.prototype.setPageCount=function(pageCount){
	this.pageCount=pageCount;
};
LogList.prototype.getPageCount=function(){
	return this.pageCount;
};
LogList.prototype.setAttribute=function(attribute){
	this.attribute=attribute;
};
LogList.prototype.getAttribute=function(){
	return this.attribute;
};
LogList.prototype.setOrder=function(order){
	this.order=order;
};
LogList.prototype.getOrder=function(){
	return this.order;
};
LogList.prototype.upperPage=function(){
	if(this.pageNow>1){
		this.pageNow-=1;
		this.loadData();
	}
};
LogList.prototype.nextPage=function(){
	if(this.pageNow<this.pageCount){
		this.pageNow+=1;
		this.loadData();
	}
};
LogList.prototype.sort=function(attribute){
	this.setAttribute(attribute);
	if(this.order=="asc"){
		this.setOrder("desc");
	}else{
		this.setOrder("asc");
	}
	this.loadData();
};
LogList.prototype.filter = function(status1){
	this.status1 = status1;
	this.loadData();
};
LogList.prototype.getLogList=function(){
	var url="admin/LogList?status="+this.status1+"&pageNow="+this.pageNow+"&attribute="+this.attribute+"&order="+this.order;
	window.location.href=url;
};
LogList.prototype.loadData=function(){
	this.getLogList();
};
LogList.prototype.showToolBar = function(){
	var tools=document.getElementsByClassName("toolbar");
	tools[1].innerHTML=tools[0].innerHTML;
};
