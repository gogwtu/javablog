function MessageList(){}
MessageList.prototype.setSenderId=function(senderId){
	this.senderId=senderId;
};
MessageList.prototype.getSenderId=function(){
	return this.senderId;
};
MessageList.prototype.setReceiverId=function(receiverId){
	this.receiverId=receiverId;
};
MessageList.prototype.getReceiverId=function(){
	return this.receiverId;
};
MessageList.prototype.setStatus=function(status1){
	this.status1=status1;
};
MessageList.prototype.getStatus=function(){
	return this.status1;	
};
MessageList.prototype.setPageNow=function(pageNow){
	this.pageNow=pageNow;
};
MessageList.prototype.getPageNow=function(){
	return this.pageNow;
};
MessageList.prototype.setPageCount=function(pageCount){
	this.pageCount=pageCount;
};
MessageList.prototype.getPageCount=function(){
	return this.pageCount;
};
MessageList.prototype.setAttribute=function(attribute){
	this.attribute=attribute;
};
MessageList.prototype.getAttribute=function(){
	return this.attribute;
};
MessageList.prototype.setOrder=function(order){
	this.order=order;
};
MessageList.prototype.getOrder=function(){
	return this.order;
};
MessageList.prototype.setType=function(type){
	this.type=type;
};
MessageList.prototype.getType=function(){
	return this.type;
};
MessageList.prototype.upperPage=function(){
	if(this.pageNow>1){
		this.pageNow-=1;
		this.loadData();
	}
};
MessageList.prototype.nextPage=function(){
	if(this.pageNow<this.pageCount){
		this.pageNow+=1;
		this.loadData();
	}
};
MessageList.prototype.sort=function(attribute){
	this.setAttribute(attribute);
	if(this.order=="asc"){
		this.setOrder("desc");
	}else{
		this.setOrder("asc");
	}
	this.loadData();
};
MessageList.prototype.filter = function(status1){
	this.status1 = status1;
	this.loadData();
};
MessageList.prototype.getMessageList=function(){
	var url="admin/MessageList?senderId=" + this.senderId
			+ "&receiverId="+this.receiverId
			+ "&status="+this.status1
			+ "&pageNow="+this.pageNow
			+ "&attribute="+this.attribute
			+ "&order="+this.order
			+ "&type="+this.type;
	window.location.href=url;
};
MessageList.prototype.loadData=function(){
	this.getMessageList();
};
MessageList.prototype.showToolBar = function(){
	var tools=document.getElementsByClassName("toolbar");
	tools[1].innerHTML=tools[0].innerHTML;
};

function newMessage(){
	var title="发送消息";
	var selectuser = document.getElementById('userIdList');
	var html="<label>姓名</label>"+ selectuser.innerHTML +"<br/>" +
			"<label>内容</label><input type='text' id='inputtext'/>";
	inputBox(title,html,'addMessage()');
}

function addMessage(){     
	var receiverId=document.getElementById("userIdText").value;
	var content=document.getElementById("inputtext").value;
	if(name.lenth==0){
		return false;
	}
	var xmlHttp=createXMLHttpRequest();
    var url="admin/EditMessage";
    xmlHttp.open("post",url,true);
    xmlHttp.onreadystatechange=addcallback;
    xmlHttp.setRequestHeader("Content-type","application/x-www-form-urlencoded;charset=UTF-8");
    xmlHttp.send("receiverId=" + receiverId
    		+ "&content=" + encodeURIComponent(content));
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
