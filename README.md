javablog
========
#ayugeak的Github帐号早已无法登录，故javablog转移到当前的leftgeek帐号下来维护  

A blog written in java, which is also the source code of my blog "http://leftgeek.com/"

This is an eclipse web project, which can be imported by eclipse

Currently only support mysql 5.7

Project structure: 25 directories, 194 files  

JavaBlog  
├── javablog.sql  
├── permission_explain.txt  
├── src  
│   └── javablog  
│       ├── bean  
│       │   ├── ArticleBeanBo.java  
│       │   ├── ArticleBean.java  
│       │   ├── ArticleTagBeanBo.java  
│       │   ├── ArticleTagBean.java  
│       │   ├── CategoryBeanBo.java  
│       │   ├── CategoryBean.java  
│       │   ├── CommentBeanBo.java  
│       │   ├── CommentBean.java  
│       │   ├── LinkBeanBo.java  
│       │   ├── LinkBean.java  
│       │   ├── LogBeanBo.java  
│       │   ├── LogBean.java  
│       │   ├── MessageBeanBo.java  
│       │   ├── MessageBean.java  
│       │   ├── MetaModel.java  
│       │   ├── ModelCtrl.java  
│       │   ├── ResourceBeanBo.java  
│       │   ├── ResourceBean.java  
│       │   ├── ResultBean.java  
│       │   ├── RoleBeanBo.java  
│       │   ├── RoleBean.java  
│       │   ├── TagBeanBo.java  
│       │   ├── TagBean.java  
│       │   ├── UserBeanBo.java  
│       │   └── UserBean.java  
│       ├── database  
│       │   ├── ConfigCtrl.java  
│       │   ├── DBConnectionPool.java  
│       │   ├── DBCtrl.java  
│       │   └── InitDB.java  
│       ├── servlet  
│       │   ├── AddComment.java  
│       │   ├── admin  
│       │   │   ├── account  
│       │   │   │   ├── Account.java  
│       │   │   │   ├── FindPassword.java  
│       │   │   │   ├── Login.java  
│       │   │   │   ├── Logout.java  
│       │   │   │   ├── Register.java  
│       │   │   │   └── VerifyImage.java  
│       │   │   ├── display  
│       │   │   │   ├── ArticleList.java  
│       │   │   │   ├── CategoryList.java  
│       │   │   │   ├── CommentList.java  
│       │   │   │   ├── ConfigList.java  
│       │   │   │   ├── LinkList.java  
│       │   │   │   ├── LogList.java  
│       │   │   │   ├── MessageList.java  
│       │   │   │   ├── ResourceList.java  
│       │   │   │   ├── RoleList.java  
│       │   │   │   ├── TagList.java  
│       │   │   │   └── UserList.java  
│       │   │   └── edit  
│       │   │       ├── ChangeStatus.java  
│       │   │       ├── Delete.java  
│       │   │       ├── EditArticle.java  
│       │   │       ├── EditCategory.java  
│       │   │       ├── EditConfig.java  
│       │   │       ├── EditLink.java  
│       │   │       ├── EditMessage.java  
│       │   │       ├── EditResource.java  
│       │   │       ├── EditRole.java  
│       │   │       ├── EditTag.java  
│       │   │       ├── EditUser.java  
│       │   │       ├── FileUpload.java  
│       │   │       └── Install.java  
│       │   ├── Archive.java  
│       │   ├── Author.java  
│       │   ├── Blog.java  
│       │   ├── Category.java  
│       │   ├── Rss.java  
│       │   ├── Search.java  
│       │   ├── ShowArticle.java  
│       │   └── Tag.java  
│       └── util  
│           ├── CacheCtrl.java  
│           ├── ConfigProperty.java  
│           ├── SocketMail.java  
│           ├── StrFilter.java  
│           ├── UrlFilter.java  
│           └── ValidChecker.java  
└── WebContent  
    ├── index.jsp  
    ├── about.jsp  
    ├── project.jsp  
    ├── robots.txt  
    ├── search.jsp  
    ├── tag.jsp  
    ├── archive.jsp  
    ├── article.jsp  
    ├── author.jsp  
    ├── category.jsp  
    ├── error.jsp  
    ├── include  
    │   ├── articleList.jsp  
    │   ├── base.jsp  
    │   ├── commentList.jsp  
    │   ├── footer.jsp  
    │   ├── header.jsp  
    │   ├── newComment.jsp  
    │   ├── page.jsp  
    │   ├── sideBar.jsp  
    │   ├── dynamic  
    │   │   ├── base.jsp  
    │   │   ├── categoryList.jsp  
    │   │   ├── header.jsp  
    │   │   ├── linkList.jsp  
    │   │   ├── recentComment.jsp  
    │   │   ├── searchBox.jsp  
    │   │   ├── sideBar.jsp  
    │   │   ├── tagList.jsp  
    │   │   ├── titleList.jsp  
    │   │   ├── toolbar.jsp  
    │   │   └── weibo.jsp  
    │   └── static  
    │       ├── base.html  
    │       ├── categoryList.html  
    │       ├── footer.html  
    │       ├── header.html  
    │       ├── linkList.html  
    │       ├── recentComment.html  
    │       ├── searchBox.html  
    │       ├── sideBar.jsp  
    │       ├── tagList.html  
    │       ├── titleList.html  
    │       ├── toolbar.html  
    │       └── weibo.html  
    ├── css  
    │   ├── about.css  
    │   ├── archive.css  
    │   ├── blog.css  
    │   ├── comment.css  
    │   ├── error.css  
    │   ├── main.css  
    │   └── project.css  
    ├── images  
    │   ├── avatar.png  
    │   ├── bg.png  
    │   ├── error404.png  
    │   ├── light_off.png  
    │   ├── light_on.png  
    │   ├── logo.png  
    │   ├── rss.png  
    │   ├── search.png  
    │   └── tag.png  
    ├── js  
    │   ├── comment.js  
    │   └── main.js  
    ├── admin  
    │   ├── admin-base.jsp  
    │   ├── articleList.jsp  
    │   ├── blank.jsp  
    │   ├── categoryList.jsp  
    │   ├── commentList.jsp  
    │   ├── configList.jsp  
    │   ├── editor.jsp  
    │   ├── error.jsp  
    │   ├── iMessageList.jsp  
    │   ├── index.jsp  
    │   ├── install.jsp  
    │   ├── linkList.jsp  
    │   ├── login.jsp  
    │   ├── logList.jsp  
    │   ├── menu.jsp  
    │   ├── messageList.jsp  
    │   ├── newArticle.jsp  
    │   ├── personal.jsp  
    │   ├── register.jsp  
    │   ├── resourceList.jsp  
    │   ├── roleList.jsp  
    │   ├── showArticle.jsp  
    │   ├── start.jsp  
    │   ├── tagList.jsp  
    │   ├── userList.jsp  
    │   ├── css  
    │   │   ├── admin.css  
    │   │   ├── config.css  
    │   │   ├── editor.css  
    │   │   ├── index.css  
    │   │   ├── login.css  
    │   │   └── profile.css  
    │   ├── images  
    │   │   └── icons.png  
    │   └── js  
    │       ├── account.js  
    │       ├── admin.js  
    │       ├── article.js  
    │       ├── category.js  
    │       ├── comment.js  
    │       ├── config.js  
    │       ├── editor.js  
    │       ├── index.js  
    │       ├── link.js  
    │       ├── login.js  
    │       ├── log.js  
    │       ├── message.js  
    │       ├── resource.js  
    │       ├── role.js  
    │       ├── tag.js  
    │       └── user.js  
    ├── META-INF  
    │   ├── context.xml  
    │   └── MANIFEST.MF  
    └── WEB-INF  
        ├── config  
        ├── web.xml  
        │   ├── config.properties  
        │   ├── database.properties  
        │   └── sql.properties  
        └── lib  
            ├── commons-codec-1.9.jar  
            ├── mysql-connector-java-5.1.18-bin.jar  
            └── servlet-api.jar  


