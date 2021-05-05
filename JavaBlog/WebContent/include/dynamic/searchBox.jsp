<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div id="searchdiv">
	<form action="search" method="get" onsubmit="return search()">
		<input name="q" type="text" id="searchText"
		value="Search Site..." autocomplete="off" spellcheck="false"
			onfocus="onFocus(this,'Search Site...')"
			onblur="onBlur(this,'Search Site...')" />
		<input id="go" type="image" src="images/search.png" />
	</form>
</div>