function RoleList(){}
RoleList.prototype.setStatus=function(status1){
	this.status1=status1;
};
RoleList.prototype.getStatus=function(){
	return this.status1;	
};
RoleList.prototype.setPageNow=function(pageNow){
	this.pageNow=pageNow;
};
RoleList.prototype.getPageNow=function(){
	return this.pageNow;
};
RoleList.prototype.setPageCount=function(pageCount){
	this.pageCount=pageCount;
};
RoleList.prototype.getPageCount=function(){
	return this.pageCount;
};
RoleList.prototype.setAttribute=function(attribute){
	this.attribute=attribute;
};
RoleList.prototype.getAttribute=function(){
	return this.attribute;
};
RoleList.prototype.setOrder=function(order){
	this.order=order;
};
RoleList.prototype.getOrder=function(){
	return this.order;
};
RoleList.prototype.upperPage=function(){
	if(this.pageNow>1){
		this.pageNow-=1;
		this.loadData();
	}
};
RoleList.prototype.nextPage=function(){
	if(this.pageNow<this.pageCount){
		this.pageNow+=1;
		this.loadData();
	}
};
RoleList.prototype.sort=function(attribute){
	this.setAttribute(attribute);
	if(this.order=="asc"){
		this.setOrder("desc");
	}else{
		this.setOrder("asc");
	}
	this.loadData();
};
RoleList.prototype.filter = function(status1){
	this.status1 = status1;
	this.loadData();
};
RoleList.prototype.getRoleList=function(){
	var url="admin/RoleList?status="+this.status1+"&pageNow="+this.pageNow+"&attribute="+this.attribute+"&order="+this.order;
	window.location.href=url;
};
RoleList.prototype.loadData=function(){
	this.getRoleList();
};
RoleList.prototype.showToolBar = function(){
	var tools=document.getElementsByClassName("toolbar");
	tools[1].innerHTML=tools[0].innerHTML;
};
function addRole(){
	var form = document.getElementById("form");
	var permClass = form.getElementsByClassName("perm_class");
	var permission = "";
	var perm, symbol = "";
	for (var i = 0; i < permClass.length; i++){
		var permItem = permClass[i].getElementsByClassName("perm_item");
		perm = 0;
		for (var j = 0; j < permItem.length; j++){
			if (permItem[j].checked){
				perm |= (1 << j);
			}
		}
		permission += symbol + perm;
		symbol = ",";
	}
	
	var roleId=document.getElementById("roleId").value;
	var name=document.getElementById("name").value;
	if(permission.length==0){
		return false;
	}
	var xmlHttp=createXMLHttpRequest();
    var url="admin/EditRole";
    xmlHttp.open("post",url,true);
    xmlHttp.onreadystatechange=addcallback;
    xmlHttp.setRequestHeader("Content-type","application/x-www-form-urlencoded;charset=UTF-8");
    xmlHttp.send("roleId="+roleId+"&permission="+permission+"&name="+encodeURIComponent(name));
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
function newRole(){
	document.getElementById("roleId").value="0";
	var title="添加角色";
	var permsDiv = document.getElementById("permissionDiv");
	var permItems = permsDiv.getElementsByClassName("perm_item");
	for (var i = 0; i < permItems.length; i++){
		permItems[i].removeAttribute("checked");
	}
	var permission = document.getElementById("permissionDiv").innerHTML;
	var html="<label>名称</label><input type='text' id='name'/><br/>" + permission;
	inputBox(title,html,'addRole()');
}
function modiRole(num){
	var selects = document.getElementsByName("select");
	document.getElementById("roleId").value=selects[num].value;
	var ro=document.getElementById("dtable").rows[num+1];
	var name=ro.cells[1].innerHTML;
	var oldPermItems = ro.cells[2].getElementsByClassName("perm_item");
	
	var permsDiv = document.getElementById("permissionDiv");
	var permItems = permsDiv.getElementsByClassName("perm_item");
	for (var i = 0; i < permItems.length; i++){
		if (oldPermItems[i].checked){
			permItems[i].setAttribute("checked", "checked");
		} else {
			permItems[i].removeAttribute("checked");
		}
	}

	var permission = permsDiv.innerHTML;
	var title="修改角色";
	var html="<label>名称</label><input type='text' value='"+name+"' id='name'/><br/>" + permission;
	inputBox(title,html,'addRole()');
}
