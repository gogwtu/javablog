<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div id="toolbar">
	<span onclick="Bold()" title="Bold" id="boldbutton"></span>
	<span onclick="Italic()" title="Italic" id="italicbutton"></span>
	<span onclick="UnderLine()" title="Underline" id="underlinebutton"></span>
	<span onclick="UnorderList()" title="Unordered list" id="unorderbutton"></span>
	<span onclick="OrderList()" title="Ordered list" id="orderbutton"></span>
	<span onclick="JustifyLeft()" title="Justify left" id="leftbutton"></span>
	<span onclick="JustifyCenter()" title="Justify center" id="centerbutton"></span>
	<span onclick="JustifyRight()" title="Jusfity right" id="rightbutton"></span>
	<span onclick="CreateLink()" title="Create link" id="linkbutton"></span>
	<span onclick="RemoveFormat()" title="Remove format" id="removeformatbutton"></span>
	<span onclick="InsertImage()" title="Insert image" id="imagebutton"></span>
	<span onclick="InsertDoc()" title="Attachment" id="docbutton"></span>
	<span onclick="FontName()" title="Font name" id="fontnamebutton"></span>
	<span onclick="FontSize()" title="Font size" id="fontsizebutton"></span>
	<span onclick="ForeColor()" title="Font color" id="forecolorbutton"></span>
	<span onclick="BackColor()" title="Background color" id="backcolorbutton"></span>
	<span title="Preview" onclick="Preview()" id="previewbutton"></span>
	<span title="HTML" onclick="Source()" id="sourcebutton"></span>
	<div class="pickercontainer" id="fontcontainer">
		<ul>
			<li style="font-family:'宋体','SimSun'" onclick="setFontName('宋体')">宋体</li>
			<li style="font-family:'楷体','楷体_GB2312','SimKai'" onclick="setFontName('楷体')">楷体</li>
			<li style="font-family:'隶书','SimLi'" onclick="setFontName('隶书')">隶书</li>
			<li style="font-family:'黑体','SimHei'" onclick="setFontName('黑体')">黑体</li>
			<li style="font-family:'微软雅黑','WenQuanYi Micro Hei'" onclick="setFontName('微软雅黑')">微软雅黑</li>
			<li style="font-family:'arial','helvetica','sans-serif'" onclick="setFontName('arial')">arial</li>
			<li style="font-family:'times new roman'" onclick="setFontName('times new roman')">times new roman</li>
			<li style="font-family:'verdana'" onclick="setFontName('verdana')">verdana</li>
		</ul>
	</div>
	<div class="pickercontainer" id="fontsizecontainer">
		<ul>
			<li onclick="setFontSize(1)"><font size="1">六号</font></li>
			<li onclick="setFontSize(2)"><font size="2">五号</font></li>
			<li onclick="setFontSize(3)"><font size="3">四号</font></li>
			<li onclick="setFontSize(4)"><font size="4">三号</font></li>
			<li onclick="setFontSize(5)"><font size="5">二号</font></li>
			<li onclick="setFontSize(6)"><font size="6">一号</font></li>
		</ul>
	</div>
	<div id="colorcontainer">
		<input type="hidden" id="color_type" value="fore"/>
		<table cellspacing="1" cellpadding="1" border="1">
			<tbody><tr>
			<td bgcolor="#FFFFFF" onclick="setColor('#FFFFFF')"><div></div></td>
			<td bgcolor="#FFCCCC" onclick="setColor('#FFCCCC')"><div></div></td>
			<td bgcolor="#FFCC99" onclick="setColor('#FFCC99')"><div></div></td>
			<td bgcolor="#FFFF99" onclick="setColor('#FFFF99')"><div></div></td>
			<td bgcolor="#FFFFCC" onclick="setColor('#FFFFCC')"><div></div></td>
			<td bgcolor="#99FF99" onclick="setColor('#99FF99')"><div></div></td>
			<td bgcolor="#99FFFF" onclick="setColor('#99FFFF')"><div></div></td>
			<td bgcolor="#CCFFFF" onclick="setColor('#CCFFFF')"><div></div></td>
			<td bgcolor="#CCCCFF" onclick="setColor('#CCCCFF')"><div></div></td>
			<td bgcolor="#FFCCFF" onclick="setColor('#FFCCFF')"><div></div></td>
			</tr>
			<tr>
			<td bgcolor="#CCCCCC" onclick="setColor('#CCCCCC')"><div></div></td>
			<td bgcolor="#FF6666" onclick="setColor('#FF6666')"><div></div></td>
			<td bgcolor="#FF9966" onclick="setColor('#FF9966')"><div></div></td>
			<td bgcolor="#FFFF66" onclick="setColor('#FFFF66')"><div></div></td>
			<td bgcolor="#FFFF33" onclick="setColor('#FFFF33')"><div></div></td>
			<td bgcolor="#66FF99" onclick="setColor('#66FF99')"><div></div></td>
			<td bgcolor="#33FFFF" onclick="setColor('#33FFFF')"><div></div></td>
			<td bgcolor="#66FFFF" onclick="setColor('#66FFFF')"><div></div></td>
			<td bgcolor="#9999FF" onclick="setColor('#9999FF')"><div></div></td>
			<td bgcolor="#FF99FF" onclick="setColor('#FF99FF')"><div></div></td>
			</tr>
			<tr>
			<td bgcolor="#C0C0C0" onclick="setColor('#C0C0C0')"><div></div></td>
			<td bgcolor="#FF0000" onclick="setColor('#FF0000')"><div></div></td>
			<td bgcolor="#FF9900" onclick="setColor('#FF9900')"><div></div></td>
			<td bgcolor="#FFCC66" onclick="setColor('#FFCC66')"><div></div></td>
			<td bgcolor="#FFFF00" onclick="setColor('#FFFF00')"><div></div></td>
			<td bgcolor="#33FF33" onclick="setColor('#33FF33')"><div></div></td>
			<td bgcolor="#66CCCC" onclick="setColor('#66CCCC')"><div></div></td>
			<td bgcolor="#33CCFF" onclick="setColor('#33CCFF')"><div></div></td>
			<td bgcolor="#6666CC" onclick="setColor('#6666CC')"><div></div></td>
			<td bgcolor="#CC66CC" onclick="setColor('#CC66CC')"><div></div></td>
			</tr>
			<tr>
			<td bgcolor="#999999" onclick="setColor('#999999')"><div></div></td>
			<td bgcolor="#CC0000" onclick="setColor('#CC0000')"><div></div></td>
			<td bgcolor="#FF6600" onclick="setColor('#FF6600')"><div></div></td>
			<td bgcolor="#FFCC33" onclick="setColor('#FFCC33')"><div></div></td>
			<td bgcolor="#FFCC00" onclick="setColor('#FFCC00')"><div></div></td>
			<td bgcolor="#33CC00" onclick="setColor('#33CC00')"><div></div></td>
			<td bgcolor="#00CCCC" onclick="setColor('#00CCCC')"><div></div></td>
			<td bgcolor="#3366FF" onclick="setColor('#3366FF')"><div></div></td>
			<td bgcolor="#6633FF" onclick="setColor('#6633FF')"><div></div></td>
			<td bgcolor="#CC33CC" onclick="setColor('#CC33CC')"><div></div></td>
			</tr>
			<tr>
			<td bgcolor="#666666" onclick="setColor('#666666')"><div></div></td>
			<td bgcolor="#990000" onclick="setColor('#990000')"><div></div></td>
			<td bgcolor="#CC6600" onclick="setColor('#CC6600')"><div></div></td>
			<td bgcolor="#CC9933" onclick="setColor('#CC9933')"><div></div></td>
			<td bgcolor="#999900" onclick="setColor('#999900')"><div></div></td>
			<td bgcolor="#009900" onclick="setColor('#009900')"><div></div></td>
			<td bgcolor="#339999" onclick="setColor('#339999')"><div></div></td>
			<td bgcolor="#3333FF" onclick="setColor('#3333FF')"><div></div></td>
			<td bgcolor="#6600CC" onclick="setColor('#6600CC')"><div></div></td>
			<td bgcolor="#993399" onclick="setColor('#993399')"><div></div></td>
			</tr>
			<tr>
			<td bgcolor="#333333" onclick="setColor('#333333')"><div></div></td>
			<td bgcolor="#660000" onclick="setColor('#660000')"><div></div></td>
			<td bgcolor="#993300" onclick="setColor('#993300')"><div></div></td>
			<td bgcolor="#996633" onclick="setColor('#996633')"><div></div></td>
			<td bgcolor="#666600" onclick="setColor('#666600')"><div></div></td>
			<td bgcolor="#006600" onclick="setColor('#006600')"><div></div></td>
			<td bgcolor="#336666" onclick="setColor('#336666')"><div></div></td>
			<td bgcolor="#000099" onclick="setColor('#000099')"><div></div></td>
			<td bgcolor="#333399" onclick="setColor('#333399')"><div></div></td>
			<td bgcolor="#663366" onclick="setColor('#663366')"><div></div></td>
			</tr>
			<tr>
			<td bgcolor="#000000" onclick="setColor('#000000')"><div></div></td>
			<td bgcolor="#330000" onclick="setColor('#330000')"><div></div></td>
			<td bgcolor="#663300" onclick="setColor('#663300')"><div></div></td>
			<td bgcolor="#663333" onclick="setColor('#663333')"><div></div></td>
			<td bgcolor="#333300" onclick="setColor('#333300')"><div></div></td>
			<td bgcolor="#003300" onclick="setColor('#003300')"><div></div></td>
			<td bgcolor="#003333" onclick="setColor('#003333')"><div></div></td>
			<td bgcolor="#000066" onclick="setColor('#000066')"><div></div></td>
			<td bgcolor="#330099" onclick="setColor('#330099')"><div></div></td>
			<td bgcolor="#330033" onclick="setColor('#330033')"><div></div></td>
			</tr>
			</tbody>
		</table>
	</div>
</div>
<div id="editorframe_box">
	<iframe id="editframe" src="admin/blank.jsp"></iframe>
</div>