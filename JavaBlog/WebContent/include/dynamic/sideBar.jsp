<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div id="sidebar_div">
<div class="sidebox" id="toolBox">
	<jsp:include page="toolbar.jsp"></jsp:include>
</div>
<div class="sidebox" id="searchBox">
	<jsp:include page="searchBox.jsp"></jsp:include>
</div>
<div class="sidebox">
	<div class="boxtitle">
		Categories
	</div>
	<div class="boxcontent category_list">
		<jsp:include page="categoryList.jsp"></jsp:include>
	</div>
</div>
<div class="sidebox">
	<div class="boxtitle">
			Recent Posts
		</div>
		<div class="boxcontent post_list">
			<jsp:include page="titleList.jsp">
				<jsp:param value="6" name="count" />
				<jsp:param value="article_id" name="attribute" />
			</jsp:include>
		</div>
</div>
<div class="sidebox">
    <div class="boxtitle">
        Tags
    </div>
    <div class="boxcontent tag_list">
        <jsp:include page="tagList.jsp"></jsp:include>
    </div>
</div>
<div class="sidebox">
	<div class="boxtitle">
		Recent Comments
	</div>
	<div class="boxcontent comment_list">
		<jsp:include page="recentComment.jsp">
			<jsp:param value="6" name="count" />
		</jsp:include>
	</div>
</div>
<div class="sidebox">
	<div class="boxtitle">
		Links
	</div>
	<div class="boxcontent link_list">
		<jsp:include page="linkList.jsp"></jsp:include>
	</div>
</div>
</div>
