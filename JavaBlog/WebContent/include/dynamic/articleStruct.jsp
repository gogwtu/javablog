<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="javablog.bean.ArticleBean,javablog.bean.ArticleBeanBo"%>
<%@page import="javablog.util.ConfigProperty,javablog.util.StrFilter"%>
<%@page import="javablog.database.DBConnectionPool,java.sql.Connection"%>
<%
  ArticleBean ab = (ArticleBean) request.getAttribute("article");
	if (ab != null) {
%>
<ul>
  <%
  int section;
  for (section = 1; section <= 5; section++){
  %>
	<li>
    <a href="article/<%=ab.getArticleId()%>/#sec_<%=section%>">Section <%=section%></a>
	</li>
  <%
  }
  %>
</ul>
<%
}
%>
