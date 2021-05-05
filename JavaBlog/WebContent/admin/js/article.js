function ArticleList(){}
ArticleList.prototype.setCategoryId=function(categoryId){
	this.categoryId=categoryId;
};
ArticleList.prototype.getCategoryId=function(){
	return this.categoryId;
};
ArticleList.prototype.setAuthorId=function(authorId){
	this.authorId=authorId;
};
ArticleList.prototype.getAuthorId=function(){
	return this.authorId;
};
ArticleList.prototype.setTagId=function(tagId){
	this.tagId=tagId;
};
ArticleList.prototype.getTagId=function(){
	return this.tagId;
};
ArticleList.prototype.setStatus=function(status1){
	this.status1=status1;
};
ArticleList.prototype.getStatus=function(){
	return this.status1;	
};
ArticleList.prototype.setPageNow=function(pageNow){
	this.pageNow=pageNow;
};
ArticleList.prototype.getPageNow=function(){
	return this.pageNow;
};
ArticleList.prototype.setPageCount=function(pageCount){
	this.pageCount=pageCount;
};
ArticleList.prototype.getPageCount=function(){
	return this.pageCount;
};
ArticleList.prototype.setAttribute=function(attribute){
	this.attribute=attribute;
};
ArticleList.prototype.getAttribute=function(){
	return this.attribute;
};
ArticleList.prototype.setOrder=function(order){
	this.order=order;
};
ArticleList.prototype.getOrder=function(){
	return this.order;
};
ArticleList.prototype.upperPage=function(){
	if(this.pageNow>1){
		this.pageNow-=1;
		this.loadData();
	}
};
ArticleList.prototype.nextPage=function(){
	if(this.pageNow<this.pageCount){
		this.pageNow+=1;
		this.loadData();
	}
};
ArticleList.prototype.sort=function(attribute){
	this.setAttribute(attribute);
	if(this.order == "asc"){
		this.setOrder("desc");
	}else{
		this.setOrder("asc");
	}
	this.loadData();
};

ArticleList.prototype.filter = function(status1){
	this.status1 = status1;
	this.loadData();
};

ArticleList.prototype.getArticleList=function(){
	var url="admin/ArticleList?categoryId=" +this.categoryId
		+"&authorId="+this.authorId
		+"&tagId="+this.tagId
		+"&status="+this.status1
		+"&pageNow="+this.pageNow
		+"&attribute="+this.attribute
		+"&order="+this.order;
	window.location.href=url;
};
ArticleList.prototype.loadData = function(){
	this.getArticleList();
};
ArticleList.prototype.showToolBar = function(){
	var tools=document.getElementsByClassName("toolbar");
	tools[1].innerHTML=tools[0].innerHTML;
};
