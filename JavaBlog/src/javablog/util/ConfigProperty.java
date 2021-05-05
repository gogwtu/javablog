package javablog.util;

import javablog.database.ConfigCtrl;

public class ConfigProperty {

	public static final byte STATUS_NORMAL = 0;
	public static final byte STATUS_TRASH = 1;
	public static final byte STATUS_PENDING = 2;
	public static final byte STATUS_DRAFT = 3;
	public static final byte STATUS_READ = 0;// 消息已读
	public static final byte STATUS_UNREAD = 1;// 消息未读
	public static final byte ID_ROLE = 0;
	public static final byte ID_USER = 1;
	public static final byte ID_CATEGORY = 2;
	public static final byte ID_TAG = 3;
	public static final byte ID_ARTICLE = 4;
	public static final byte ID_COMMENT = 5;
	public static final byte ID_LINK = 6;
	public static final byte ID_MESSAGE = 7;
	public static final byte ID_RESOURCE = 8;
	public static final byte ID_LOG = 9;
	public static final byte ID_SYS = 10;
	
	public static ConfigCtrl configCtrl = new ConfigCtrl("config/config.properties");
	public static String website_name = configCtrl.getConfigValue("website_name");
	public static int front_blog_page_size = Integer.parseInt(configCtrl.getConfigValue("front_blog_page_size"));
	public static int front_page_count = Integer.parseInt(configCtrl.getConfigValue("front_page_count"));
	public static int front_recent_post_count = Integer.parseInt(configCtrl.getConfigValue("front_recent_post_count"));
	public static int front_recent_comment_count = Integer.parseInt(configCtrl.getConfigValue("front_recent_comment_count"));
	public static int front_comment_page_size = Integer.parseInt(configCtrl.getConfigValue("front_comment_page_size"));
	public static int admin_role_page_size = Integer.parseInt(configCtrl.getConfigValue("admin_role_page_size"));
	public static int admin_user_page_size = Integer.parseInt(configCtrl.getConfigValue("admin_user_page_size"));
	public static int admin_category_page_size = Integer.parseInt(configCtrl.getConfigValue("admin_category_page_size"));
	public static int admin_tag_page_size = Integer.parseInt(configCtrl.getConfigValue("admin_tag_page_size"));
	public static int admin_article_page_size = Integer.parseInt(configCtrl.getConfigValue("admin_article_page_size"));
	public static int admin_comment_page_size = Integer.parseInt(configCtrl.getConfigValue("admin_comment_page_size"));
	public static int admin_link_page_size = Integer.parseInt(configCtrl.getConfigValue("admin_link_page_size"));
	public static int admin_message_page_size = Integer.parseInt(configCtrl.getConfigValue("admin_message_page_size"));
	public static int admin_resource_page_size = Integer.parseInt(configCtrl.getConfigValue("admin_resource_page_size"));
	public static int admin_log_page_size = Integer.parseInt(configCtrl.getConfigValue("admin_log_page_size"));
	public static String admin_email = configCtrl.getConfigValue("admin_email");
	public static String admin_password = configCtrl.getConfigValue("admin_password");
}
