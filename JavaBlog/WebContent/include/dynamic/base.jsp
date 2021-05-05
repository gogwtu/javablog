<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<base href="<%=basePath%>"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<meta http-equiv="Content-Language" content="zh-CN" />
<meta name="robots" content="all" />
<meta name="description" content="LeftGeek,计算机,博客"/>
<meta http-equiv="keywords" content="code"/>
<meta name="author" content="leftgeek.com" />
<link rel="icon" type="image/png" id="favicon" href="images/logo.png"/>
