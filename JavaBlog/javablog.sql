CREATE SCHEMA `javablog` DEFAULT CHARSET=UTF8;
/*
角色表，每个角色都有相应的id，名称，权限，状态
权限是一串01字符，为1代表拥有该项权限，为0
表示没有该项权限
状态取值范围为：0，1，2
0：正常
1：待审核
2：回收站
*/
CREATE TABLE `roles` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL UNIQUE,
  `permission` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`role_id`)
);
/*
用户表，每个用户都有相应的id，角色，用户名，
密码，姓名，邮箱，主页地址，头像地址，状态
状态为取值范围为：0，1，2
0：正常
1：待审核
2：回收站
删除角色时，删除其下用户
*/
CREATE TABLE `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL UNIQUE,
  `password` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL UNIQUE,
  `url` varchar(255) NOT NULL,
  `avatar` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL,
  FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`) ON DELETE CASCADE,
  PRIMARY KEY (`user_id`)
);
/*
分类表，每个分类都有相应的id，名称，状态
状态为取值范围为：0，1，2
0：正常
1：待审核
2：回收站
删除分类时，并不删除其下子分类，而是将其下子分类的
父分类置空
*/
CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL UNIQUE,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`category_id`)
);

/*
标签表，每个标签都有相应的id，名称，状态
状态为取值范围为：0，1，2
0：正常
1：待审核
2：回收站
*/
CREATE TABLE `tags` (
  `tag_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL UNIQUE,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`tag_id`)
);

/*
文章表，每篇文章都有相应的id，分类，作者，标题，
内容，修改日期，状态
状态为取值范围为：0，1，2
0：正常
1：待审核
2：回收站
删除分类或用户时，并不删除其下的文章，而是将相应外键置空
*/
CREATE TABLE `articles` (
  `article_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11),/*外键，可以为空*/
  `author_id` int(11),/*外键，可以为空*/
  `title` varchar(255) NOT NULL,
  `content` LONGTEXT NOT NULL,
  `date` timestamp NOT NULL,
  `status` tinyint(4) NOT NULL,
  FOREIGN KEY (`category_id`) REFERENCES `metas` (`meta_id`) ON DELETE SET NULL,
  FOREIGN KEY (`author_id`) REFERENCES `users` (`user_id`) ON DELETE SET NULL,
  PRIMARY KEY (`article_id`)
);

/*
文章标签关系表，记录文章与标签的多对多关系
两者都是外键，合并起来为主键
*/
CREATE TABLE `article_tags` (
  `article_id` int(11) NOT NULL,/*外键，不能为空*/
  `tag_id` int(11) NOT NULL,/*外键，不能为空*/
  FOREIGN KEY (`article_id`) REFERENCES `articles` (`article_id`) ON DELETE CASCADE,
  FOREIGN KEY (`tag_id`) REFERENCES `tags` (`tag_id`) ON DELETE CASCADE,
  PRIMARY KEY (`article_id`, `tag_id`)
);


/*
评论表，每个评论都有相应的id，文章，用户id，用户名，邮箱，
主页地址，头像，内容，日期，状态
状态为取值范围为：0，1，2
0：正常
1：待审核
2：回收站
删除用户时，并不删除其评论，而是将相应外键置空，
删除文章时，将其下评论全部删除
*/
CREATE TABLE `comments` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11),
  `user_id` int(11),
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `content` varchar(255) NOT NULL,
  `date` timestamp NOT NULL,
  `status` tinyint(4) NOT NULL,
  FOREIGN KEY (`article_id`) REFERENCES `articles` (`article_id`) ON DELETE CASCADE,
  FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE SET NULL,
  PRIMARY KEY (`comment_id`)
);
/*
链接表，每个链接都有相应的id，名称，地址，状态
状态为取值范围为：0，1，2
0：正常
1：待审核
2：回收站
*/
CREATE TABLE `links` (
  `link_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL UNIQUE,
  `url` varchar(255) NOT NULL UNIQUE,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`link_id`)
);

/*
资源表，每个资源都有相应的id，名称，位置，状态，上传时间
状态为取值范围为：0，1，2
0：正常
1：待审核
2：回收站
*/
CREATE TABLE `resources` (
  `resource_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL UNIQUE,
  `url` varchar(255) NOT NULL UNIQUE,
  `date` timestamp NOT NULL,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`resource_id`)
);


/*
留言表，每个留言都有相应的id，发送方id，接收方id，内容，时间，状态
状态为取值范围为：0，1
0：已读
1：未读
*/
CREATE TABLE `messages` (
  `message_id` int(11) NOT NULL AUTO_INCREMENT,
  `sender_id` int(11) NOT NULL,/*外键，不能为空*/
  `receiver_id` int(11) NOT NULL,/*外键，不能为空*/
  `content` varchar(255) NOT NULL,
  `date` timestamp NOT NULL,
  `status` tinyint(4) NOT NULL,
  FOREIGN KEY (`sender_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  FOREIGN KEY (`receiver_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  PRIMARY KEY (`message_id`)
);
/*
日志表，每个日志都有相应的id，内容，时间，状态
状态为取值范围为：0，1，2
0：正常
1：待审核
2：回收站
*/
CREATE TABLE `logs` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) NOT NULL,
  `date` timestamp NOT NULL,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`log_id`)
);
