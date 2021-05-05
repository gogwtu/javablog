package javablog.bean;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;

import javablog.util.ConfigProperty;

public class MessageBeanBo extends ModelCtrl {

	public MessageBeanBo(Connection connection) {
		super(connection);
	}

	/*
	 * 根据信息id获得信息
	 */
	public MessageBean getMessage(int messageId) {
		MessageBean ab = null;
		String sql = "SELECT * FROM messages WHERE message_id=" + messageId;
		ArrayList<MessageBean> ams = this.getMessages(sql);
		if (ams.size() > 0) {
			ab = ams.get(0);
		}
		return ab;
	}

	/*
	 * 设置sql语句中的过滤器
	 */
	// 设置排序方式函数
	public void setFilter(int status, int senderId, int receiverId,
			String attribute, String order) {
		filter = " WHERE status=" + status;
		if (senderId != 0) {
			filter += " AND sender_id=" + senderId;
		}
		if (receiverId != 0) {
			filter += " AND receiver_id=" + receiverId;
		}
		if (attribute != null && attribute.length() > 0) {
			filter += " ORDER BY " + attribute;
			if (order != null && order.equalsIgnoreCase("desc")) {
				filter += " " + order;
			}
		}
	}

	/*
	 * 获取结果集记录条数
	 */
	public int getRowCount() {
		return super.getRowCount("messages");
	}

	/*
	 * 根据sql语句获得所有信息记录
	 */
	public ArrayList<MessageBean> getMessages(String sql) {
		ResultSet rs = null;
		Statement st = null;
		ArrayList<MessageBean> ams = new ArrayList<MessageBean>();
		try {
			st = connection.createStatement();
			rs = st.executeQuery(sql);
			while (rs.next()) {
				MessageBean ab = new MessageBean();
				ab.setMessageId(rs.getInt("message_id"));
				ab.setSenderId(rs.getInt("sender_id"));
				ab.setReceiverId(rs.getInt("receiver_id"));
				ab.setContent(rs.getString("content"));
				ab.setDate(rs.getTimestamp("date"));
				ab.setStatus(rs.getInt("status"));

				ams.add(ab);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e2) {
					e2.printStackTrace();
				}
				rs = null;
			}
			if (st != null) {
				try {
					st.close();
				} catch (Exception e2) {
					e2.printStackTrace();
				}
				st = null;
			}
		}
		return ams;
	}

	/*
	 * 根据页数获取第pageNow页的所有信息记录 pageNow为0时获取所有信息
	 */
	public ArrayList<MessageBean> getMessages(int pageNow) {
		ArrayList<MessageBean> ams = new ArrayList<MessageBean>();
		String sql = "SELECT * FROM messages " + this.filter;
		if (pageNow > 0) {
			sql += " LIMIT " + (pageNow - 1) * pageSize + "," + pageSize;
		}
		ams = this.getMessages(sql);
		return ams;
	}

	/*
	 * 搜索并返回所有信息记录
	 */
	public ArrayList<MessageBean> searchMessages(String keywords, int pageNow) {
		ArrayList<MessageBean> ams = new ArrayList<MessageBean>();
		keywords = keywords.trim();
		keywords = keywords.replaceAll(" +", "%");
		String sql = "SELECT * FROM messages WHERE name LIKE '%" + keywords
				+ "%'";
		if (pageNow > 0) {
			sql += " LIMIT " + (pageNow - 1) * pageSize + "," + pageSize;
		}
		ams = this.getMessages(sql);
		return ams;
	}

	/*
	 * 添加一条信息记录
	 */
	public boolean addMessage(MessageBean messageModel) {
		boolean result = false;
		messageModel.setDate(new Timestamp((new Date()).getTime()));
		String sql = "INSERT INTO messages(sender_id, receiver_id, content, date, status) VALUES("
				+ messageModel.getSenderId()
				+ ","
				+ messageModel.getReceiverId()
				+ ",'"
				+ messageModel.getContent()
				+ "','"
				+ messageModel.getDate()
				+ "'," + messageModel.getStatus() + ")";
		int messageId = this.insert(sql);
		if (messageId > 0) {
			messageModel.setMessageId(messageId);
			result = true;
		}
		return result;
	}

	/*
	 * 修改一条信息记录
	 */
	public boolean editMessage(MessageBean messageModel) {
		boolean result = false;
		messageModel.setDate(new Timestamp((new Date()).getTime()));
		String sql = "UPDATE messages SET sender_id="
				+ messageModel.getSenderId() + ",receiver_id="
				+ messageModel.getReceiverId() + ",content='"
				+ messageModel.getContent() + "',date='"
				+ messageModel.getDate() + "',status="
				+ messageModel.getStatus() + " WHERE message_id="
				+ messageModel.getMessageId();
		result = this.update(sql);
		return result;
	}

	/*
	 * 根据信息id删除相应信息
	 */
	public boolean deleteMessage(int messageId) {
		boolean result = false;
		String sql = "DELETE FROM messages WHERE message_id=" + messageId;
		result = this.update(sql);
		return result;
	}

	/*
	 * 根据信息id删除相应信息
	 */
	public boolean deleteMessage(String messageIds) {
		boolean result = false;
		String sql = "DELETE FROM messages WHERE message_id IN(" + messageIds
				+ ")";
		result = this.update(sql);
		return result;
	}

	// 修改信息状态函数
	public boolean changeStatus(int messageId, int status) {
		boolean result = false;
		if (status == ConfigProperty.STATUS_UNREAD || status == ConfigProperty.STATUS_READ) {
			String sql = "UPDATE messages SET status=" + status
					+ " WHERE message_id=" + messageId;
			result = this.update(sql);
		}
		return result;
	}

	// 修改信息状态函数
	public boolean changeStatus(String messageIds, int status) {
		boolean result = false;
		if (status == ConfigProperty.STATUS_UNREAD || status == ConfigProperty.STATUS_READ) {
			String sql = "UPDATE messages SET status=" + status
					+ " WHERE message_id IN(" + messageIds + ")";
			result = this.update(sql);
		}
		return result;
	}
}
