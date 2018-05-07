<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.blog.component.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()+ path;
User u = (User)session.getAttribute("user");
%>
<!doctype html>
<html>
<head>
<meta charset="gb2312">
<title>关于我_个人博客网站</title>
<meta name="keywords" content="个人博客,杨青个人博客,个人博客模板,杨青" />
<meta name="description" content="杨青个人博客，是一个站在web前端设计之路的女程序员个人网站，提供个人博客模板免费资源下载的个人原创网站。" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="<%=basePath%>/view/css/base.css" rel="stylesheet">
<link href="<%=basePath%>/view/css/index.css" rel="stylesheet">
<link rel="shortcut icon" href="<%=basePath%>/view/images/title.ico" /> 
<!--[if lt IE 9]>
<script src="js/modernizr.js"></script>
<![endif]-->
</head>
<body>
<%@include file="/view/common/header.jsp"%>
<article>
  <div class="leftbox">
    <div class="infos">
      <div class="newsview">
        <h2 class="intitle">您现在的位置是：<a href="<%=basePath%>">网站首页</a>&nbsp;&gt;&nbsp;<a href="<%=basePath%>/about">关于我</a></h2>
        <div class="news_infos m20">
				冥冥中该来则来，无处可逃。
        </div>
      </div>
    </div>
    <div class="meandblog">
      <h2>我和我的博客</h2>
      <ul>
<li><a href="http://www.yangqq.com/" target="_blank">【友情连接】杨青博客</a></li>
      </ul>
    </div>
  </div>
  <div class="rightbox">
    <div class="aboutme m20">
      <h2 class="ab_title">关于我</h2>
       <div class="avatar"><img src="<%=basePath%>/view/picture/home_touxiang.png" /></div>
      <div class="ab_con">
		<p>网名：qianYzz</p>
        <p>职业：召唤师 </p>
        <p>个人微信：qianYzz</p>
        <p>邮箱：qianYzz@lrxyz.com</p>
      </div>
    </div>
    <div class="weixin">
      <h2 class="ab_title">杨清微信</h2>
      <ul>
        <img src="<%=basePath%>/view/picture/wx.jpg">
      </ul>
    </div>
  </div>
</article>
<footer>
  <p>Design by <a href="http://www.yangqq.com">杨青个人博客</a> <a href="/">蜀ICP备11002373号-1</a></p>
</footer>
</body>
</html>
