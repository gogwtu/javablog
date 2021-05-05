<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="javablog.bean.UserBean,javablog.bean.UserBeanBo" %>
<%@page import="javablog.database.DBConnectionPool,java.sql.Connection"%>
<%
	String articleId = request.getParameter("articleId");
	String user = (String) session.getAttribute("userId");
	String avatarUrl = "images/avatar.png";
	String display = "block";
	String name = "Guest";
	if (user != null) {//admin
		Connection connection = DBConnectionPool.getDBConnectionPool().getConnection();
		if (connection != null){
			UserBeanBo ubb = new UserBeanBo(connection);
			UserBean ub = ubb.getUser(Integer.parseInt(user));
			if (ub != null){
				name = ub.getName();
				avatarUrl = ub.getAvatar();
				display = "none";
			}
			ubb.closeConnection();
		}
	}
%>
<a id="comment"></a>
<div>
	Hello, <%=name %>, feel free to comment
</div>
<form>
	<div class="left">
		<div style="display:<%=display %>" id="newinfo">
			<div>
				<input type="text" class="left input" id="name"/>
				<label class="right label"><font class="strong" title="Can't be empty">*</font>&nbsp;Name(&lt;32)</label>
			</div>
			<div>
				<input type="text" class="left input" id="email"/>
				<label class="right label"><font class="strong" title="Can't be empty">*</font>&nbsp;Email(&lt;128,won't be published)</label>
			</div>
			<div>
				<input type="text" class="left input" id="url"/>
				<label class="right label">&nbsp;&nbsp;&nbsp;Homepage(&lt;256)</label>
			</div>
		</div>
		<div id="contentbox">
			<textarea id="content"></textarea>
		</div>
		<div id="submitbox">
			<span>
				<input class="button" id="submit" type="button" onclick="addComment(<%=articleId %>)" value="Post Comment" />
			</span>
			<span id="submitmsg">(&lt;512)</span>
		</div>
	</div>
	<div class="right avatar">
		<img src="<%=avatarUrl %>" alt="Avatar" />
	</div>
</form>
