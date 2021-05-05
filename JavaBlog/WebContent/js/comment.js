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

//显示提示信息并自动消失
function showTip(message,tipId) {
	document.getElementById(tipId).innerHTML=message;
	setTimeout(hideTip, 2000);//
	function hideTip() {
		var hide = document.getElementById(tipId);
		hide.innerHTML="";
	}
}

function reply(username){
	window.location.hash = "#comment";
	document.getElementById("content").value="Reply to "+username+": ";
}

function addComment(articleId) {
	var name = document.getElementById("name").value;
	var email = document.getElementById("email").value;
	var homepage = document.getElementById("url").value;
	var content = document.getElementById("content").value;
	if (document.getElementById("newinfo").style.display == "none"){
		if (content.length == 0){
			return false;
		}
	} else if(name.length == 0
			|| email.length == 0
			|| content.length== 0){
		return false;
	}
	document.getElementById("submit").disabled = true;
	var xmlHttp = createXMLHttpRequest(); //
	var url = "AddComment";
	xmlHttp.open("post", url, true); //
	xmlHttp.onreadystatechange = callback; //
	xmlHttp.setRequestHeader("Content-type","application/x-www-form-urlencoded;charset=UTF-8");
	xmlHttp.send("articleId=" + articleId
			+ "&name=" + encodeURIComponent(name)
			+ "&email=" + encodeURIComponent(email)
			+ "&url=" + encodeURIComponent(homepage)
			+ "&content=" + encodeURIComponent(content));
	function callback()//
	{
		if (xmlHttp.readyState == 4 && xmlHttp.status == 200) {
			var data = xmlHttp.responseText;
			document.getElementById("submit").disabled = false;
			if (data == "s") {
				showTip("Submit successful","submitmsg");
				document.getElementById("name").value = "";
				document.getElementById("email").value = "";
				document.getElementById("url").value = "";
				document.getElementById("content").value = "";
			} else {
				showTip("Submit fail","submitmsg");
			}
		}
	}
	return false;
}
