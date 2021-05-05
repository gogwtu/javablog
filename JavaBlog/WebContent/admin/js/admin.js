
function createXMLHttpRequest() {
	var xmlHttp = null;
	//
	try {
		xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
	} catch (e) {
		try {
			xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
		} catch (e2) {
			xmlHttp = null;
		}
	}
	//
	if (!xmlHttp && typeof XMLHttpRequest != 'undefined') {
		xmlHttp = new XMLHttpRequest();
	}
	return xmlHttp;
}
function showInfo(info){
	window.parent.showInfo(info);
}
//create a popup window
function inputBox(title,html,fun){
	var mask=document.createElement("div");
	mask.setAttribute("id","mask");
    var frame=document.createElement("div");
	frame.setAttribute("id","inputbox");
	document.body.appendChild(mask);
    document.body.appendChild(frame);
    frame.innerHTML="<div id='boxhead'></div><form id='form' onsubmit='return "+fun+"'><div id='boxbody'></div><div id='boxfoot'><input type='submit' value='确定'/><input type='button' value='取消' onclick='closeBox()'/></div></form>";
    document.getElementById("boxhead").innerHTML=title;
    document.getElementById("boxbody").innerHTML=html;
}
//modify the popup window
function showInputBox(title, html, fun){
	document.getElementById("form").setAttribute("onsubmit", "return " + fun);
	document.getElementById("boxhead").innerHTML=title;
    document.getElementById("boxbody").innerHTML=html;
}
//close the popup window
function closeBox(){
	var mask=document.getElementById("mask");
    document.body.removeChild(mask);
	var lay=document.getElementById("inputbox");
    document.body.removeChild(lay);
}

function selectAll(value,name) {
	var ro = document.getElementsByName(name);
	for ( var i = 0; i < ro.length; i++) {
		ro[i].checked = value;
	}
}

function changeStatus(name,type,status1){
	var ro = document.getElementsByName(name);
	if (ro.length == 0) {
		return false;
	}
	var id = "", symbol = "";
	for ( var i = 0; i < ro.length; i++) {
		if (ro[i].checked) {
			id += symbol + ro[i].value;
			symbol = ",";
		}
	}
	
	if(id.length==0){
		showInfo("请至少选择一项!");
		return false;
	}
	var xmlHttp=createXMLHttpRequest();
    var url="admin/ChangeStatus";
    xmlHttp.open("post",url,true);
    xmlHttp.onreadystatechange=callback;
    xmlHttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded;charset=UTF-8");
	xmlHttp.send("type=" + type
			+"&status=" + status1
			+"&id=" + id);
    function callback()
    {
        if(xmlHttp.readyState==4&&xmlHttp.status==200){
	        var reply= xmlHttp.responseText;
	        if(reply=="s"){
	        	showInfo("操作成功");
	        	window.location.reload();
	        }else if (reply == "n") {
	        	showInfo("对不起,你没有权限");
			}else{
				showInfo("操作失败");
	        }
    	}
    }
}
//
function delData(name, type) {
	var ro = document.getElementsByName(name);
	if (ro.length == 0) {
		return false;
	}
	var id = "", symbol = "";
	for ( var i = 0; i < ro.length; i++) {
		if (ro[i].checked) {
			id += symbol + ro[i].value;
			symbol = ",";
		}
	}
	
	if(id.length==0){
		showInfo("请至少选择一项!");
		return false;
	}
	if (!confirm('确认删除吗?')) {
		return false;
	}
	var xmlHttp = createXMLHttpRequest();
	var url = "admin/Delete";
	xmlHttp.open("post",url,true);
    xmlHttp.onreadystatechange=callback;
    xmlHttp.setRequestHeader("Content-type","application/x-www-form-urlencoded;charset=UTF-8");
	xmlHttp.send("type=" + type + "&id=" + id);
	function callback() {
		if (xmlHttp.readyState == 4 && xmlHttp.status == 200) {
			var reply = xmlHttp.responseText;
			if (reply == "s") {
				showInfo("删除成功");
				window.location.reload();
			} else if (reply == "n") {
				showInfo("对不起,你没有权限");
			} else {
				showInfo("操作失败");
			}
		}
	}
	return false;
}
function deleteData(id,type) {
	if (!confirm('确认删除吗?')) {
		return false;
	}
	var xmlHttp = createXMLHttpRequest();
	var url = "admin/Delete";
	xmlHttp.open("post",url,true);
    xmlHttp.onreadystatechange=callback;
    xmlHttp.setRequestHeader("Content-type","application/x-www-form-urlencoded;charset=UTF-8");
	xmlHttp.send("type=" + type + "&id=" + id);
	function callback() {
		if (xmlHttp.readyState == 4 && xmlHttp.status == 200) {
			var reply = xmlHttp.responseText;
			if (reply == "s") {
				showInfo("删除成功");
				window.location.reload();
			} else if (reply == "n") {
				showInfo("对不起,你没有权限");
			} else {
				showInfo("操作失败");
			}
		}
	}
	return false;
}
function ajaxSend(method,url,callback){
	var xmlHttp = createXMLHttpRequest();
	xmlHttp.open(method, url, true);
	xmlHttp.onreadystatechange = callback;
	xmlHttp.send();
}

//获取数据函数
function getData(object,url,id){
	var xmlHttp = createXMLHttpRequest();
	var data="";
	xmlHttp.open("post", url, true);
	xmlHttp.onreadystatechange = callback;
	xmlHttp.send();
	function callback() {
		if (xmlHttp.readyState == 4 && xmlHttp.status == 200) {
			data = xmlHttp.responseText;
			document.getElementById(id).innerHTML=data;
			object.showPageCount();
		}
	}
}
//上传
function upload(type){
	var form=document.getElementById("form");
	var name=document.getElementById("file").value;
	if(name.length==0){
		return false;
	}
	form.action="admin/FileUpload?type="+type;
	form.method="post";
	form.target="hide";
	form.encoding="multipart/form-data";
	return true;
}

//tabpanel
function changeTab(num){
	var tab = document.getElementsByClassName("tabPanel");
	var tabLinks = document.getElementsByClassName("tab_panel_link");
	for(var i = 0; i < tab.length; i++){
		if(tab[i].style.display == "block"){
			tab[i].style.display = "none";
			tabLinks[i].setAttribute("class", "tab_panel_link");
			break;
		}
	}
	tab[num].style.display="block";
	tabLinks[num].setAttribute("class", "tab_panel_link tab_panel_link_current");
}
