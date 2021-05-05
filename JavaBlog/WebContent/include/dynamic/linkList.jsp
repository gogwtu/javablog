<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="javablog.util.ConfigProperty"%>
<%@ page import="javablog.bean.LinkBean,javablog.bean.LinkBeanBo" %>
<%@page import="javablog.database.DBConnectionPool,java.sql.Connection"%>
<ul>
<%
	Connection connection = DBConnectionPool.getDBConnectionPool().getConnection();
	if (connection != null){
		LinkBeanBo lbb = new LinkBeanBo(connection);
		lbb.setFilter(ConfigProperty.STATUS_NORMAL, null, null);
		lbb.setPageSize(lbb.getRowCount());
		ArrayList<LinkBean> al = lbb.getLinks(0);//get all links
		for(int i = 0; i < al.size(); i++){
			LinkBean lb = al.get(i);
 %>
	<li>
    <a href="<%=lb.getUrl() %>" title="<%=lb.getUrl()%>" target="blank"><%=lb.getName() %></a>
	</li>
	<%
		}
		lbb.closeConnection();
	}
	%>
</ul>
