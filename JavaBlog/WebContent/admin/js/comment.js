function CommentList(){}
CommentList.prototype.setArticleId=function(articleId){
	this.articleId=articleId;
};
CommentList.prototype.getArticleId=function(){
	return this.articleId;
};
CommentList.prototype.setStatus=function(status1){
	this.status1=status1;
};
CommentList.prototype.getStatus=function(){
	return this.status1;	
};
CommentList.prototype.setPageNow=function(pageNow){
	this.pageNow=pageNow;
};
CommentList.prototype.getPageNow=function(){
	return this.pageNow;
};
CommentList.prototype.setPageCount=function(pageCount){
	this.pageCount=pageCount;
};
CommentList.prototype.getPageCount=function(){
	return this.pageCount;
};
CommentList.prototype.setAttribute=function(attribute){
	this.attribute=attribute;
};
CommentList.prototype.getAttribute=function(){
	return this.attribute;
};
CommentList.prototype.setOrder=function(order){
	this.order=order;
};
CommentList.prototype.getOrder=function(){
	return this.order;
};
CommentList.prototype.upperPage=function(){
	if(this.pageNow>1){
		this.pageNow-=1;
		this.loadData();
	}
};
CommentList.prototype.nextPage=function(){
	if(this.pageNow<this.pageCount){
		this.pageNow+=1;
		this.loadData();
	}
};
CommentList.prototype.sort=function(attribute){
	this.setAttribute(attribute);
	if(this.order=="asc"){
		this.setOrder("desc");
	}else{
		this.setOrder("asc");
	}
	this.loadData();
};
CommentList.prototype.filter = function(status1){
	this.status1 = status1;
	this.loadData();
};
CommentList.prototype.getCommentList=function(){
	var url="admin/CommentList?articleId="+this.articleId+"&status="+this.status1+"&pageNow="+this.pageNow+"&attribute="+this.attribute+"&order="+this.order;
	window.location.href=url;
};
CommentList.prototype.loadData=function(){
	this.getCommentList();
};
CommentList.prototype.showToolBar = function(){
	var tools=document.getElementsByClassName("toolbar");
	tools[1].innerHTML=tools[0].innerHTML;
};
