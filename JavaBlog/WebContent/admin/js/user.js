function UserList(){}
UserList.prototype.setRoleId=function(roleId){
	this.roleId=roleId;
};
UserList.prototype.getRoleId=function(){
	return this.roleId;	
};
UserList.prototype.setStatus=function(status1){
	this.status1=status1;
};
UserList.prototype.getStatus=function(){
	return this.status1;	
};
UserList.prototype.setPageNow=function(pageNow){
	this.pageNow=pageNow;
};
UserList.prototype.getPageNow=function(){
	return this.pageNow;
};
UserList.prototype.setPageCount=function(pageCount){
	this.pageCount=pageCount;
};
UserList.prototype.getPageCount=function(){
	return this.pageCount;
};
UserList.prototype.setAttribute=function(attribute){
	this.attribute=attribute;
};
UserList.prototype.getAttribute=function(){
	return this.attribute;
};
UserList.prototype.setOrder=function(order){
	this.order=order;
};
UserList.prototype.getOrder=function(){
	return this.order;
};
UserList.prototype.sort=function(attribute){
	this.setAttribute(attribute);
	if(this.order=="asc"){
		this.setOrder("desc");
	}else{
		this.setOrder("asc");
	}
	this.loadData();
};
UserList.prototype.filter = function(status1){
	this.status1 = status1;
	this.loadData();
};
UserList.prototype.getUserList=function(){
	var url="admin/UserList?roleId="+this.roleId+"&pageNow="+this.pageNow+"&status="+this.status1+"&attribute="+this.attribute+"&order="+this.order;
	window.location.href=url;
};
UserList.prototype.loadData=function(){
	this.getUserList();
};
UserList.prototype.showToolBar = function(){
	var tools=document.getElementsByClassName("toolbar");
	tools[1].innerHTML=tools[0].innerHTML;
};
function addUser(){
	var userId=document.getElementById("userId").value;
	var roleId = document.getElementById("roleId").value;
	var name=document.getElementById("name").value;
	var username=document.getElementById("username").value;
	var email=document.getElementById("email").value;
	var xmlHttp=createXMLHttpRequest();
    var url="admin/EditUser";
    xmlHttp.open("post",url,true);
    xmlHttp.onreadystatechange=addcallback;
    xmlHttp.setRequestHeader("Content-type","application/x-www-form-urlencoded;charset=UTF-8");
    xmlHttp.send("userId="+userId+"&roleId="+roleId+"&name="+encodeURIComponent(name)+"&username="+encodeURIComponent(username)+"&email="+encodeURIComponent(email));
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
function newUser(){
	document.getElementById("userId").value="0";
	var title="添加用户";
	var roleList = document.getElementById("roleDiv").innerHTML;
	var html="<label>姓名</label><input type='text' id='name'/><br/><label>用户名</label><input type='text' id='username'/><br/><label>邮箱</label><input type='text' id='email'/><br/><label>角色</label><select id='roleId'>" + roleList + "</select>";
	inputBox(title,html,'addUser()');
}
function modiUser(num){
	var selects = document.getElementsByName("select");
	document.getElementById("userId").value=selects[num].value;
	var ro=document.getElementById("dtable").rows[num+1];
	var roleList = document.getElementById("roleDiv").innerHTML;
	var title="修改用户";
	var html="<input type='hidden' id='name'/><input type='hidden' id='username'/><input type='hidden' id='email'/><label>角色</label><select id='roleId'>" + roleList + "</select>";
	inputBox(title,html,'addUser()');
}
