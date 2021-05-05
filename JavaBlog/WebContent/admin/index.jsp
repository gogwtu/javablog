<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="javablog.bean.UserBean,javablog.bean.UserBeanBo" %>
<%@page import="javablog.database.DBConnectionPool,java.sql.Connection"%>
<%
	String user = (String) session.getAttribute("userId");
	if (user == null) {
		response.sendRedirect("login.jsp");
	} else {
		Connection connection = DBConnectionPool.getDBConnectionPool().getConnection();
		if (connection != null){
			UserBeanBo ubb = new UserBeanBo(connection);
			UserBean ub = ubb.getUser(Integer.parseInt(user));
			ubb.closeConnection();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<jsp:include page="admin-base.jsp"></jsp:include>
		<title>LeftGeek</title>
		<link rel="stylesheet" type="text/css" href="admin/css/index.css" />
		<script type="text/javascript" src="admin/js/admin.js"></script>
		<script type="text/javascript" src="admin/js/index.js"></script>
	</head>
	<body>
		<div id="head">
			<div id="logo">
				<a href="admin/start.jsp" target="content">LeftGeek</a>
			</div>
			<div id="set">
				<label>Welcome:<%=ub.getName() %></label>
			</div>
			<div id="infobox">
				<div id="info"></div>
			</div>
			<div id="profile">
				<a id="accountMenuSwitch" class="account-menu-normal" href="javascript:void(0)"
					onmouseover="showAccountMenu()"  onmouseout="hideAccountMenu()">Account</a>
				<div id="accountMenu" onmouseover="showAccountMenu()" onmouseout="hideAccountMenu()">
					<ul>
						<li><a href="admin/personal.jsp" target="content">My profile</a></li>
						<li><a href="admin/MessageList?type=receive" target="content">Messages</a></li>
						<li><a href="javascript:void(0)" onclick="exit();return false;">Logout</a></li>
					</ul>
				</div>
			</div>
			<div id="exit">
				<a href="" target="blank">Home</a>
			</div>
		</div>
		<div id="menubox">
			<jsp:include page="menu.jsp"></jsp:include>
		</div>
		<div id="frame">
			<iframe id="framecontent" src="admin/start.jsp" name="content"></iframe>
		</div>
	</body>
</html>
<%
		}
	}
%>
