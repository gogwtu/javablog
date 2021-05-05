//滚动条事件处理
function windowScroll() {
    //body's scrolltop
    var bdScrollTop = window.pageYOffset 
	    || document.documentElement.scrollTop 
	    || document.body.scrollTop 
	    || 0;
    var mainBar = document.getElementById("main_div");
	var sideBar = document.getElementById("sidebar_div");
	var shortDiv, longDiv;
	if (mainBar.scrollHeight < sideBar.scrollHeight){
		shortDiv = mainBar;
		longDiv = sideBar;
	} else {
		shortDiv = sideBar;
		longDiv = mainBar;
	}

	var screenHeight = window.innerHeight;//window.screen.availHeight;窗口实际可见区域高度
	var topHeight = document.getElementById("header").clientHeight;//距离顶端的高度
	var scrolledHeight = screenHeight - topHeight;//已经显示的高度
	var emptyHeight = 60;//留白高度为60px
	
		if (bdScrollTop <= longDiv.clientHeight - scrolledHeight + emptyHeight){//离底部还有emptyHeight时认为长端显示完
			if (bdScrollTop >= Math.max(shortDiv.clientHeight - scrolledHeight + emptyHeight, topHeight)){//离底部还有emptyHeight时短边停止滚动
				shortDiv.style.position = "fixed";
				shortDiv.style.top = Math.min(screenHeight - emptyHeight - topHeight - shortDiv.clientHeight, 0) + "px";
			} else {
				shortDiv.style.position = "static";
			}
		} else {
			if (bdScrollTop <= Math.max(shortDiv.clientHeight - scrolledHeight + emptyHeight, topHeight)){//短边回到正常状态
				shortDiv.style.position = "static";
			} else {//短边滚动
				shortDiv.style.position = "fixed";
				shortDiv.style.top = Math.min(screenHeight - topHeight - shortDiv.clientHeight
									+ longDiv.clientHeight - scrolledHeight -bdScrollTop, 0) + "px";
			}
			
		}

}
//滚动条事件注册
function scrollInit() {
	window.onscroll = windowScroll;
}

function search() {
	var keysentence = document.getElementById("searchText").value;
	keysentence = keysentence.replace("/","");
	if (keysentence == "Search Site..." || keysentence.length == 0) {
		return false;
	} else {
		window.location.href = "search/" + keysentence + "/";
		return false;
	}
}

function onFocus(obj,text){
	if(obj.value==text){
		obj.value="";
	}
}

function onBlur(obj,text){
	if(obj.value==""){
		obj.value=text;
	}
}
//调节网页亮度
function adjustBright(){
	var bd = document.body;
	var container = document.getElementById("container");
	var main = document.getElementById("main");
	//var sidebar = document.getElementById("sidebar");
	var light = document.getElementById("light");
	var bright = light.getAttribute("value");
	if (bright == "1"){//1-dark 0-bright
		bd.style.backgroundColor = "#F7F7F7";
		container.style.backgroundColor = "#FFFFFF";
		container.style.color = "#000000";
		main.style.backgroundColor = "#FFFFFF";
		main.style.color = "#000000";
		//sidebar.style.backgroundColor = "#FFFFFF";
		light.setAttribute("value", "0");
		light.src = "images/light_off.png";
		light.title = "turn off the light";
	} else {
		bd.style.backgroundColor = "#333333";
		container.style.backgroundColor = "#333333";
		container.style.color = "#FDFDFD";
		main.style.backgroundColor = "#333333";
		main.style.color = "#FDFDFD";
		//sidebar.style.backgroundColor = "#333333";
		light.setAttribute("value", "1");
		light.src = "images/light_on.png";
		light.title = "turn on the light";
	}
}
