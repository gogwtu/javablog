package javablog.servlet.admin.display;

import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import javablog.bean.*;
import javablog.database.DBConnectionPool;
import javablog.util.ConfigProperty;
import javablog.util.StrFilter;

public class MessageList extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public MessageList() {
		super();
	}

	public void destroy() {
		super.destroy();
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		boolean flag = false;
		String targetUrl = "iMessageList.jsp";
		HttpSession session = request.getSession(true);
		String userIdText = (String) session.getAttribute("userId");
		if (userIdText != null) {
			String senderIdText = request.getParameter("senderId");//sender id
			String receiverIdText = request.getParameter("receiverId");//receiver id
			String statusText = request.getParameter("status");//status
			String attribute = request.getParameter("attribute");// 排序字段
			String order = request.getParameter("order");// 排序方式
			String type = request.getParameter("type");// 是管理所有消息，还是阅读自己的消息
			String pageNowText = request.getParameter("pageNow");// 获得要显示的页数
			
			StrFilter sf = new StrFilter();
			int senderId = sf.parseInt(senderIdText);
			int receiverId = sf.parseInt(receiverIdText);
			int status = sf.parseInt(statusText);
			int pageNow = sf.parseInt(pageNowText);
			if (pageNow == 0) {
				pageNow = 1;
			}
			if (attribute == null){
				attribute = "";
			}
			if (order == null){
				order = "";
			}
			if (type == null){
				type = "";
			}
			
			if ((senderId >= 0)
					&& (receiverId >= 0)
					&& this.isValidStatus(status)
					&& this.isValidAttribute(attribute)
					&& sf.isValidOrder(order)
					&& pageNow > 0){
				Connection connection = DBConnectionPool.getDBConnectionPool().getConnection();
				if (connection != null){
					flag = true;
					if (type.equalsIgnoreCase("receive")) {// 用户个人收到的消息
						receiverId = Integer.parseInt(userIdText);
						senderId = 0;
					} else if (type.equalsIgnoreCase("send")) {// 用户个人发送的消息
						receiverId = 0;
						senderId = Integer.parseInt(userIdText);
					} else {// 管理所有消息
						flag = false;
						senderId = 0;
						receiverId = 0;
						UserBeanBo ubb = new UserBeanBo(connection);
						UserBean ub = ubb.getUser(Integer.parseInt(userIdText));
						if (ub != null && ub.getStatus() == ConfigProperty.STATUS_NORMAL){
							RoleBeanBo ugbb = new RoleBeanBo(connection);
							RoleBean role = ugbb.getRole(ub.getRoleId());
							if (role != null && role.getStatus() == 0 && role.canReadMessage()) {
								request.setAttribute("role", role);
								targetUrl = "messageList.jsp";
								flag = true;
							}
						}
					}
	
					if (flag){
						MessageBeanBo mbb = new MessageBeanBo(connection);
						mbb.setPageSize(ConfigProperty.admin_message_page_size);
						mbb.setFilter(status, senderId, receiverId, attribute, order);
						ArrayList<MessageBean> al = mbb.getMessages(pageNow);
			
						request.setAttribute("messageList", al);
						request.setAttribute("senderId", senderId + "");
						request.setAttribute("receiverId", receiverId + "");
						request.setAttribute("pageNow", pageNow + "");
						request.setAttribute("rowCount", mbb.getRowCount() + "");
						request.setAttribute("pageCount", mbb.getPageCount() + "");
						request.setAttribute("attribute", attribute);
						request.setAttribute("order", order);
						request.setAttribute("status", status + "");
						request.setAttribute("type", type);
						
						//设置用户列表,直接允许全部状态的用户接收信息
						UserBeanBo ubb = new UserBeanBo(connection);
						ArrayList<UserBean> ubal = ubb.getUsers(0);
						request.setAttribute("userList", ubal);
						
						mbb.closeConnection();
					}
				}
			}
		}

		if (flag){
			request.getRequestDispatcher(targetUrl).forward(request,
					response);
		} else {
			request.getRequestDispatcher("error.jsp")
					.forward(request, response);
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

	public void init() throws ServletException {

	}

	private boolean isValidAttribute(String attribute){
		boolean result = false;
		if (attribute == null
				|| attribute.length() == 0
				|| attribute.equalsIgnoreCase("sender_id")
				|| attribute.equalsIgnoreCase("receiver_id")
				|| attribute.equalsIgnoreCase("date")){
			result = true;
		}
		return result;
	}

	private boolean isValidStatus(int status){
		boolean result = false;
		if (status == ConfigProperty.STATUS_READ
				|| status == ConfigProperty.STATUS_UNREAD){
			result = true;
		}
		return result;
	}
}
