var contentHTML;
var textarea;//文本域对象

function closeWindow(){
	var isSaved = document.getElementById("isSaved").value;
	if (isSaved == "0"){//没保存
		return "sure to leave?";
	}
}

function onLoad(textareaid) {
	textarea=document.getElementById(textareaid);
	var iframe=document.getElementById("editframe").contentWindow;
	var editor = iframe.document.getElementById("textarea");
	editor.innerHTML=textarea.value;
	editor.focus();
	document.getElementById("isSaved").value = '1';//is saved
	window.onbeforeunload = closeWindow;
}

function exeCommand(command, value) {
	var iframe=document.getElementById("editframe").contentWindow;
	iframe.document.execCommand(command, false, value);
}

function queryCommandState(command){
	var iframe=document.getElementById("editframe").contentWindow;
	return iframe.document.queryCommandState(command);
}

function queryCommandValue(command){
	var iframe=document.getElementById("editframe").contentWindow;
	return iframe.document.queryCommandValue(command);
}

// 加粗
function Bold() {
	//var obj = document.getElementById("boldbutton");
	focusOn();
	exeCommand('Bold', '');
}

// 斜体
function Italic() {
	//var obj = document.getElementById("italicbutton");
	focusOn();
	exeCommand('Italic', '');
}

//下划线
function UnderLine() {
	//var obj = document.getElementById("underlinebutton");
	focusOn();
	exeCommand('UnderLine', '');
}

// 向里缩进
function Indent() {
	focusOn();
	exeCommand('Indent', '');
}

// 向外缩进
function Outdent() {
	focusOn();
	exeCommand('Outdent', '');
}

// 无序列表
function UnorderList() {
	//var obj = document.getElementById("unorderbutton");
	focusOn();
	exeCommand('InsertUnorderedList', '');
}

// 有序列表
function OrderList() {
	//var obj = document.getElementById("orderbutton");
	focusOn();
	exeCommand('InsertOrderedList', '');
}
// 添加超链接
function CreateLink() {
	var title="Add Link";
	var html="<label>Name</label><input type='text' id='linkname'/>"
		+ "<br/><label>Url</label><input type='text' id='linkurl' value='http://'/>";
	inputBox(title,html,'doCreateLink()');
}
function doCreateLink(){
	var name = document.getElementById("linkname").value;
	var url = document.getElementById("linkurl").value;
	closeBox();
	focusOn();
	var link = "<a href=\"" + url + "\" target=\"_blank\">" + name + "</a>";
	exeCommand('inserthtml', link);
	return false;
}
// 移除超链接
function Unlink() {

}
// 左对齐
function JustifyLeft() {
	document.getElementById("leftbutton").style.backgroundColor="rgb(205, 205, 205)";
	document.getElementById("centerbutton").style.backgroundColor="rgb(255, 255, 255)";
	document.getElementById("rightbutton").style.backgroundColor="rgb(255, 255, 255)";
	focusOn();
	exeCommand('JustifyLeft', '');
}

// 居中对齐
function JustifyCenter() {
	document.getElementById("leftbutton").style.backgroundColor="rgb(255, 255, 255)";
	document.getElementById("centerbutton").style.backgroundColor="rgb(205, 205, 205)";
	document.getElementById("rightbutton").style.backgroundColor="rgb(255, 255, 255)";
	focusOn();
	exeCommand('JustifyCenter', '');
}

// 右对齐
function JustifyRight() {
	document.getElementById("leftbutton").style.backgroundColor="rgb(255, 255, 255)";
	document.getElementById("centerbutton").style.backgroundColor="rgb(255, 255, 255)";
	document.getElementById("rightbutton").style.backgroundColor="rgb(205, 205, 205)";
	focusOn();
	exeCommand('JustifyRight', '');
}
//清除格式
function RemoveFormat(){
	focusOn();
	exeCommand('RemoveFormat', null);
}

//adjust image size
function adjustImageSize(){
	var width = document.getElementById("image_width").value;
	var height = document.getElementById("image_height").value;
	document.getElementById("image_demo").width = width;
	document.getElementById("image_demo").height = height;
}
// 插入图片
function InsertImage(){
	var title="插入图片";
	var html="<div class=\"tab_panel_bar\">"
		+ "<a class=\"tab_panel_link tab_panel_link_current\" href=\"javascript:void(0)\" onclick=\"changeTab(0)\">Upload</a>"
		+ "<a class=\"tab_panel_link\" href=\"javascript:void(0)\" onclick=\"changeTab(1)\">Insert link</a></div>"
		+ "<div style=\"display:block\" class=\"tabPanel\">"
		+ "<input type='file' name='file' id='file'>"
		+ "<iframe style='display:none;' name='hide'></iframe></div>"
		+ "<div class=\"tabPanel\">"
		+ "<label>Url</label>"
		+ "<input type=\"text\" name=\"image_url\" id=\"image_url\"/></div>";
	inputBox(title,html,'onInsertImage()');
}
//whether to upload an image or add a link
function onInsertImage(){
	var form = document.getElementById("form");
	var tab = form.getElementsByClassName("tabPanel");
	if (tab[0].style.display != "none"){//upload an image
		return upload(1);
	} else {//add a link
		var url = document.getElementById("image_url").value;
		return insertImageCallback("", url);//must return false
	}
}
//modify the size of the image
function insertImageCallback(name, url){
	var title="编辑图片" + name;
	var html="<label>Width:</label>"
		+ "<input type='text' id='image_width' value='360' onchange='adjustImageSize()'/>"
		+ "<br/><label>Height:</label>"
		+ "<input type='text' id='image_height' value='240' onchange='adjustImageSize()'/>"
		+ "<div id='image_demo_div'><img src='"
		+ url + "' id='image_demo' width='360' height='240'/></div>";
	showInputBox(title,html,'Image()');
	return false;
}
function Image(){
	var imgWidth = document.getElementById("image_width").value;
	var imgHeight = document.getElementById("image_height").value;
	//var img = document.getElementById("image_demo_div").innerHTML;
	var imgUrl = document.getElementById("image_demo").src;
	closeBox();
	focusOn();
	var html = "<img src='" + imgUrl + "' width='"+imgWidth+"' height='"+imgHeight+"'/>";
	exeCommand('inserthtml', html);
	return false;
}
//插入附件
function InsertDoc(){
	var title="插入附件";
	var html="<div class=\"tab_panel_bar\">"
		+ "<a class=\"tab_panel_link tab_panel_link_current\" href=\"javascript:void(0)\" onclick=\"changeTab(0)\">Upload</a>"
		+ "<a class=\"tab_panel_link\" href=\"javascript:void(0)\" onclick=\"changeTab(1)\">Insert link</a></div>"
		+ "<div style=\"display:block\" class=\"tabPanel\">"
		+ "<input type='file' name='file' id='file'>"
		+ "<iframe style='display:none;' name='hide'></iframe></div>"
		+ "<div class=\"tabPanel\">"
		+ "<label>Url</label>"
		+ "<input type=\"text\" name=\"doc_url\" id=\"doc_url\"/></div>";
	inputBox(title,html,'onInsertDoc()');
}
//whether to upload an doc or add a link
function onInsertDoc(){
	var form = document.getElementById("form");
	var tab = form.getElementsByClassName("tabPanel");
	if (tab[0].style.display != "none"){//upload an doc
		return upload(2);
	} else {//add a link
		var url = document.getElementById("doc_url").value;
		return insertDocCallback("", url);//must return false
	}
}
//modify the name of the attachment
function insertDocCallback(name, url){
	var title="编辑附件";
	var html="<label>Name:</label><input type='text' id='doc_name' value='" + name + "'/>"
		+ "<input type='hidden' id='doc_url' value='" + url + "'/>";
	showInputBox(title,html,'Doc()');
	return false;
}
function Doc(){
	var name = document.getElementById("doc_name").value;
	var url = document.getElementById("doc_url").value;
	closeBox();
	focusOn();
	var html = "<a href=\"" + url + "\" target=\"_blank\">" + name + "</a>";
	exeCommand('inserthtml', html);
	return false;
}

//后台会输出uploadCallback调用相应函数
function uploadCallback(name, url, type){
	if(type==1){
		insertImageCallback(name, url);
	}else{
		insertDocCallback(name, url);
	}
}

// 字体
function FontName() {
	var picker=document.getElementById("fontcontainer");
	if(picker.style.display!="block"){	
		picker.style.display="block";
	}else{
		picker.style.display="none";
	}
}
function setFontName(name){
	document.getElementById("fontcontainer").style.display="none";
	focusOn();
	exeCommand('FontName', name);
}
// 字体大小
function FontSize() {
	var picker=document.getElementById("fontsizecontainer");
	if(picker.style.display!="block"){	
		picker.style.display="block";
	}else{
		picker.style.display="none";
	}
}

function setFontSize(size){
	document.getElementById("fontsizecontainer").style.display="none";
	focusOn();
	exeCommand('FontSize', size);
}
//
function setColor(color){
	document.getElementById("colorcontainer").style.display="none";
	var type = document.getElementById("color_type").value;
	focusOn();
	if(type == "fore"){
		exeCommand('ForeColor', color);
	}else{
		exeCommand('BackColor', color);
	}
}

// 字体颜色
function ForeColor() {
	document.getElementById("color_type").value="fore";
	var box=document.getElementById("colorcontainer");
	if(box.style.display!="block"){
		box.style.display="block";
	}else{
		box.style.display="none";
	}
}

//字体背景颜色
function BackColor() {
	document.getElementById("color_type").value="back";
	var box=document.getElementById("colorcontainer");
	if(box.style.display!="block"){
		box.style.display="block";
	}else{
		box.style.display="none";
	}
}
// 预览效果
function Preview() {
	var iframe=document.getElementById("editframe").contentWindow;
	var text = iframe.document.getElementById("textarea");
	var htmlContent = text.innerHTML;
	var open = window.open('');
	open.document.write(htmlContent);
}

// 查看编辑框里的HTML源代码
function Source() {
	var iframe=document.getElementById("editframe").contentWindow;
	var editorframe=document.getElementById("editorframe_box");
	var textareaBox = document.getElementById("textarea_box");
	var editor = iframe.document.getElementById("textarea");

	//var obj = document.getElementById("sourcebutton");
	//changeBackground(obj);
	if (editorframe.style.display != 'none') {
		editorframe.style.display = 'none';
		textarea.value = editor.innerHTML;
		textareaBox.style.display = 'block';
		textarea.focus();
	} else {
		editorframe.style.display = 'block';
		textareaBox.style.display = 'none';
		editor.innerHTML = textarea.value;
		editor.focus();
	}
}

function focusOn() {
	var iframe=document.getElementById("editframe").contentWindow;
	var text = iframe.document.getElementById("textarea");
	text.focus();
}

function addTag(obj){
	var tagInput = document.getElementById("tagText");
	tagInput.value += obj.innerHTML + ",";
}

function updateArticle(status1, stateChangeFunction){
	var iframe=document.getElementById("editframe").contentWindow;
	var editor = iframe.document.getElementById("textarea");
	var htmlContent = editor.innerHTML;
	textarea.value = htmlContent;//设置content
	//设置category
	var categoryId = document.getElementById("categoryText").value;
	document.getElementById("statusText").value=status1;
	//设置tag
	var tags = document.getElementById("tagText").value;
	document.getElementById("statusText").value=status1;
	var articleId = document.getElementById("articleIdText").value;
	var title = document.getElementById("titleText").value;
	var content = textarea.value;
	content=content.replace(/<br>/g,"<br/>");
	content=content.replace(/<img(\b[^>]+)>/g,"<img $1 />");
	
	var xmlHttp = createXMLHttpRequest(); //
	var url = "admin/EditArticle";
	xmlHttp.open("post", url, true); //
	if(stateChangeFunction == "save"){
		xmlHttp.onreadystatechange = save; //save
	}else{
		xmlHttp.onreadystatechange = post; //
	}
	xmlHttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded;charset=UTF-8");
	xmlHttp.send("articleId=" + articleId
			+ "&title=" + encodeURIComponent(title)
			+ "&content=" + encodeURIComponent(content)
			+ "&categoryId=" + categoryId
			+ "&tag=" + tags
			+ "&status="+status1);
	
	function save() {
		if (xmlHttp.readyState == 4 && xmlHttp.status == 200) {
			var data = xmlHttp.responseText;
			if (data == "f") {
				showInfo("保存失败");
			} else if(data=="n") {
				showInfo("对不起，你没有权限");
			}else{
				showInfo("保存成功");
				// 更新articleId
				document.getElementById("articleIdText").value = data;
				document.getElementById("isSaved").value="1";
			}
		}
	}
	function post(){
		if (xmlHttp.readyState == 4 && xmlHttp.status == 200) {
			var data = xmlHttp.responseText;
			if (data == "f") {
				showInfo("发表失败");
			} else if(data=="n") {
				showInfo("对不起，你没有权限");
			}else{
				showInfo("发表成功");
				// 更新articleId
				document.getElementById("articleIdText").value = data;
				document.getElementById("isSaved").value="1";
				window.location.href="admin/showArticle.jsp?articleId="+data;
			}
		}
	}
	return false;
}
