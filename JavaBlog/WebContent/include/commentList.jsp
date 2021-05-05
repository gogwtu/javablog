<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat,javablog.bean.CommentBean"%>
<%
	ArrayList<CommentBean> al = (ArrayList<CommentBean>) request.getAttribute("commentList");
	if (al != null) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
%>
<ul>
	<%
		CommentBean cb;
		int uid = 0;
		for (int i = 0; i < al.size(); i++){
			cb = al.get(i);
			uid = cb.getUserId() == 0? 0: 1;
	%>
	<li class="comment<%=uid %>" name="comment<%=cb.getCommentId() %>">
		<div class="userinfo">
			<div class="name">
        <% if (cb.getUrl().length() > 0){%>
				<a href="<%=cb.getUrl()%>" target="blank"><%=cb.getName()%></a>
        <%} else {%><%=cb.getName()%><%}%></div>
			<div class="avatar">
				<img src="<%=cb.getEmail()%>" alt="avatar" />
			</div>
			</div>
		<div class="commentinfo">
			<div class="reply">
				<div class="left"><%=sdf.format(cb.getDate())%></div>
				<div class="right">
					<a class="buttonlink" href="javascript:void(0)" onclick="reply('<%=cb.getName()%>')">Respond</a>
				</div>
			</div>
			<div class="content">
				<%=cb.getContent()%></div>
		</div>
	</li>
	<%
		}
	%>
</ul>
<%
	}
%>
