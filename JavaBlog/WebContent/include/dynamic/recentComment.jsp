<%@page import="javablog.util.StrFilter"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="javablog.util.ConfigProperty"%>
<%@ page import="javablog.bean.CommentBean,javablog.bean.CommentBeanBo
,javablog.database.DBConnectionPool,java.sql.Connection"%>
<%
	String countText = request.getParameter("count");
	if (countText != null){
		StrFilter sf= new StrFilter();
		int pageSize = sf.parseInt(countText);
		if (pageSize < 4 || pageSize > 16){
			pageSize = Integer.parseInt(ConfigProperty.configCtrl.getConfigValue("front_recent_comment_count"));
		}
%>
<ul id="recent_comment_list">
	<%
	Connection connection = DBConnectionPool.getDBConnectionPool().getConnection();
	if (connection != null){
		CommentBeanBo cbb = new CommentBeanBo(connection);
		cbb.setPageSize(pageSize);
		cbb.setFilter(ConfigProperty.STATUS_NORMAL, 0, 0, "comment_id", "desc");
		ArrayList<CommentBean> al = cbb.getComments(1);
		for (int i = 0; i < al.size(); i++) {
			CommentBean cb = al.get(i);
	%>
	<li>
    <% if (cb.getUrl().length() > 0){%>
		  <a href="<%=cb.getUrl()%>" target="blank"><%=cb.getName()%></a><%}
      else {%>
      <%=cb.getName()%><%}%>:&nbsp;<%=cb.getContent()%></li>
	<%
		}
		cbb.closeConnection();
	}
	%>
</ul>
<%
}
%>
