<%@page import="javablog.bean.RoleBean"%>
<%@page import="javablog.bean.UserBeanBo,java.sql.Connection"%>
<%@page import="javablog.bean.UserBean,java.text.SimpleDateFormat"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="javablog.bean.MessageBean,javablog.database.DBConnectionPool
,javablog.util.ConfigProperty"%>
<%
    String user=(String)session.getAttribute("userId");
	ArrayList<MessageBean> messageList = (ArrayList<MessageBean>)request.getAttribute("messageList");
	//信息列表页面可能需要发送新消息,这需要提前查询所有用户的id和用户名发送给前台,由前台选择发送信息时用
	ArrayList<UserBean> userList = (ArrayList<UserBean>)request.getAttribute("userList");
	if (user == null || messageList == null || userList == null) {
        response.sendRedirect("error.jsp");
    } else {
        int senderId = Integer.parseInt((String)request.getAttribute("senderId"));
        int receiverId = Integer.parseInt((String)request.getAttribute("receiverId"));
        int pageNow = Integer.parseInt((String)request.getAttribute("pageNow"));
        int pageCount = Integer.parseInt((String)request.getAttribute("pageCount"));
        String attribute = (String)request.getAttribute("attribute");
        String order = (String)request.getAttribute("order");
        int status = Integer.parseInt((String)request.getAttribute("status"));
        String pageInfo=pageNow + "/" + pageCount + "页";
        if(pageNow > 1){
            pageInfo += "<a href='javascript:void(0)' onclick='messageList.upperPage()'>上一页</a>";
        }
        if(pageNow < pageCount){
            pageInfo += "<a href='javascript:void(0)' onclick='messageList.nextPage()'>下一页</a>";
        }
        Connection connection = DBConnectionPool.getDBConnectionPool().getConnection();
		if (connection != null){
	        UserBeanBo ubb = new UserBeanBo(connection);
	        UserBean sender, receiver;
	        sender = ubb.getUser(senderId);
	        receiver = ubb.getUser(receiverId);
	        RoleBean roleBean = (RoleBean)request.getAttribute("role");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <jsp:include page="admin-base.jsp"></jsp:include>
        <title>Messages</title>
        <script type="text/javascript" src="admin/js/admin.js"></script>
        <script type="text/javascript" src="admin/js/message.js"></script>
        <link rel="stylesheet" type="text/css" href="admin/css/admin.css">
        <script type="text/javascript">
            var messageList=new MessageList();
            messageList.changeStatus=function(status1){
                changeStatus('select',<%=ConfigProperty.ID_MESSAGE %>,status1);
            };
            messageList.deleteData=function(){
                delData('select',<%=ConfigProperty.ID_MESSAGE %>);
            };
            messageList.setSenderId(<%=senderId%>);
            messageList.setReceiverId(<%=receiverId%>);
            messageList.setStatus(<%=status%>);
            messageList.setPageNow(<%=pageNow%>);
            messageList.setPageCount(<%=pageCount%>);
            messageList.setAttribute("<%=attribute%>");
            messageList.setOrder("<%=order%>");
            messageList.setType("");
        </script>
    </head>
    <body onload="messageList.showToolBar()">
        <div class="titlebar">
           <span class="left">
                Messages
                <%
                    if (sender != null){
                %>
                    &nbsp;of&nbsp;Sender&nbsp;&quot;<a href="admin/MessageList?senderId=<%=senderId %>"><%=sender.getName() %></a>&quot;
                <%
                    }
                    if (receiver != null){
                %>
                        &nbsp;of&nbsp;Receiver&nbsp;&quot;<a href="admin/MessageList?receiverId=<%=receiverId %>"><%=receiver.getName() %></a>&quot;
                <%
                    }
                %>
            </span>
            <span class="right">
                <input  class="button"type="button" value="刷新" onclick="messageList.getMessageList()" />
                <input class="button" type="button" onclick="javascript:history.back()" value="返回"/>
                <input class="button" type="button" onclick="javascript:history.forward()" value="前进"/>
            </span>
        </div>
        <div class="filtermenu">
            <ul>
                <li><a <%if(status==ConfigProperty.STATUS_UNREAD)out.print("class='current'"); %> href="javascript:void(0)" onclick="messageList.filter(<%=ConfigProperty.STATUS_UNREAD%>)">Unread</a></li>
                <li><a <%if(status==ConfigProperty.STATUS_READ)out.print("class='current'"); %>href="javascript:void(0)" onclick="messageList.filter(<%=ConfigProperty.STATUS_READ%>)">Read</a></li>
            </ul>
        </div>
        <div class="toolbar">
            <div class="left">
                <%
                    if (roleBean.canDeleteMessage()) {
                %>
                <input class="button" type="button" value="Delete" onclick="messageList.deleteData()" />
                <%
                    }
                	if (roleBean.canAddMessage()) {
                		//提前输出所有用户名和用户id并隐藏起来,因为用户只能看见用户名,但是与后台传递消息使用的是用户id
                %>
                <div id="userIdList" style="display: none">
                	<select id="userIdText">
                	<%
                		for(int i=0;i<userList.size();i++){
        	                UserBean tmp_ub=userList.get(i);
        	                //自己不能给自己发消息
        	                if (Integer.parseInt(user) != tmp_ub.getUserId()){
        	        %>
                    <option value="<%=tmp_ub.getUserId()%>"><%=tmp_ub.getName()%></option>
                    <%
        	                }
                        }
                    %>
                	</select>
                </div>
    				<input class="button" type="button" value="Add" onclick="newMessage()"/>
    				<%
    				}
                    if (roleBean.canEditMessage()) {
	                    if (status == ConfigProperty.STATUS_READ) {
	                %>
	                <input class="button" type="button" value="Mark Unread"
	                    onclick="messageList.changeStatus(<%=ConfigProperty.STATUS_UNREAD %>)" />
	                <%
	                    }else if(status==ConfigProperty.STATUS_UNREAD){
	                %>
	                <input class="button" type="button" value="Mark Read"
	                    onclick="messageList.changeStatus(<%=ConfigProperty.STATUS_READ %>)" />
	                <%
	                    }
                    }
                %>
            </div>
            <div class="page right">
                <%=pageInfo %>
            </div>
        </div>
        <table id="dtable">
            <thead>
                <tr>
                    <th><input type="checkbox" id="checkall" onclick="selectAll(this.checked,'select')"/></th>
                    <th>
                        <a href="javascript:void(0)" onclick="messageList.sort('sender_id')">Sender</a>
                    </th>
                    <th>
                        <a href="javascript:void(0)" onclick="messageList.sort('receiver_id')">Receiver</a>
                    </th>
                    <th>
                        Content
                    </th>
                    <th>
                        <a href="javascript:void(0)" onclick="messageList.sort('date')">Date</a>
                    </th>
                </tr>
            </thead>
            <tbody id="datas">
            <%
	            
	            SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
	            for(int i=0;i<messageList.size();i++){
	                MessageBean rb=messageList.get(i);
	                sender = ubb.getUser(rb.getSenderId());
	                receiver = ubb.getUser(rb.getReceiverId());
	            %>
	                <tr>
		                <td><input value='"+<%=rb.getMessageId() %>+"' name='select' type='checkbox'/></td>
		                <td><a href="admin/messageList.jsp?senderId=<%=rb.getSenderId() %>"><%=sender.getName() %></a></td>
		                <td><a href="admin/messageList.jsp?receiverId=<%=rb.getReceiverId() %>"><%=receiver.getName() %></a></td>
		                <td><%=rb.getContent() %></td>
		                <td><%=sdf.format(rb.getDate()) %></td>
		                <td><a href="javascript:void(0)" onclick="delete(<%=i %>)">Edit</a></td>
	                </tr>
	        <%
	            }
	            ubb.closeConnection();
            %>
            </tbody>
        </table>
        <div class="toolbar">
        </div>
    </body>
</html>
<%
    	}
    }
%>
