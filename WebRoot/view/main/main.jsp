<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List" %>
<%@page import="com.blog.component.*" %>
<%@page import="com.blog.component.*" %>
<%@page import="com.jfinal.plugin.activerecord.Page" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.blog.service.BlogService" %>

<!doctype html>
<html>
<head>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()+ path;
%>
<meta charset="gb2312">
<title>qianYzz</title>
<meta name="keywords" content="个人博客,杨青个人博客,个人博客模板,杨青" />
<meta name="description" content="杨青个人博客，是一个站在web前端设计之路的女程序员个人网站，提供个人博客模板免费资源下载的个人原创网站。" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="<%=basePath%>/view/css/base.css" rel="stylesheet">
<link href="<%=basePath%>/view/css/index.css" rel="stylesheet">
<link rel="shortcut icon" href="<%=basePath%>/view/images/title.ico" /> 
<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
<!--[if lt IE 9]>
<script src="js/modernizr.js"></script>
<![endif]-->
</head>
<body>
<%@include file="/view/common/header.jsp"%>
<article>
<div class="pics">
  <ul>
 	 <c:forEach items="${toplist}" var="fileObj" varStatus="s">
   	 <li><a href="<%=basePath%>/viewblog?id=${fileObj.id }" target="_blank"><img src="<%=basePath%>/upload/${fileObj.imagename}">
   	 </a><span>${fileObj.title }</span></li>
   </c:forEach>
  </ul>
</div>
  <div class="sleftbox">
    <div class="newblogs">
      <h2 class="hometitle">最新文章</h2>
      <ul>      

		<c:forEach items="${userlist.list}" var="fileObj" varStatus="s">
        <li>
          <h3 class="blogtitle"><a href="<%=basePath%>/viewblog?id=${fileObj.id }" target="_blank" >${fileObj.title }</a></h3>
          <div class="bloginfo"><span class="blogpic"><a href="<%=basePath%>/viewblog?id=${fileObj.id }" title="别让这些闹心的套路，毁了你的网页设计" target="_blank" >
          	<img src="<%=basePath%>/upload/${fileObj.imagename}" alt="别让这些闹心的套路，毁了你的网页设计" /></a></span>
            <p>${fileObj.brief }</p>
          </div>
          <div class="autor">
          	  <span class="lm f_l"><a href="#" title="${fileObj.genre } " target="_blank"  class="classname">
					${fileObj.genre }  
          	  </a></span>
	          <span class="dtime f_l">${fileObj.createTime }</span>
	          <span class="viewnum f_l">浏览（<a href="#">${fileObj.viewcount}</a>）</span>
	          <span class="f_r"><a href="<%=basePath%>/viewblog?id=${fileObj.id }" class="more" target="_blank" >阅读原文>></a></span>
          </div>
        </li>
        </c:forEach>
        
      </ul>
      
     <div class="pagelist">
		    <ul class="pagination">
			<li><a href="<%=basePath%>/${userlist.getPageNumber() >1 ? userlist.getPageNumber()-1:1}">&laquo;</a></li>
			</ul>
			<c:forEach var="i" begin="1" end="${userlist.getTotalPage() }">
				<c:if test="${userlist.getPageNumber()==i}">
				 	<ul class="pagination">
						<li class="active"><a href="<%=basePath%>/${i}"><c:out value="${i}"/></a></li>		
					</ul>
				</c:if>
				<c:if test="${userlist.getPageNumber()!=i}">
					<ul class="pagination">
						<li ><a href="<%=basePath%>/${i}"><c:out value="${i}"/></a></li>		
					</ul>
				</c:if>
			</c:forEach>
			<ul class="pagination">
				<li><a href="<%=basePath%>/${userlist.getPageNumber() < userlist.getTotalPage() ? userlist.getPageNumber()+1:userlist.getTotalPage()}">&raquo;</a></li>
			</ul>	
    	</div>
    </div>
  </div>
  <div class="srightbox">
    <div class="aboutme">
      <h2 class="ab_title">关于我</h2>
      <div class="avatar"><img src="<%=basePath%>/view/picture/home_touxiang.png" /></div>
      <div class="ab_con">
        <p>网名：qianYzz</p>
        <p>职业：召唤师 </p>
        <p>个人微信：qianYzz</p>
        <p>邮箱：qianYzz@lrxyz.com</p>
      </div>
    </div>
    <div class="search">
      <form action="<%=basePath%>/" method="get" name="searchform" id="searchform">
        <input name="keyboard" id="keyboard" class="input_text" value="请输入关键字" style="color: rgb(153, 153, 153);" onfocus="if(value=='请输入关键字'){this.style.color='#000';value=''}" onblur="if(value==''){this.style.color='#999';value='请输入关键字'}" type="text">
        <input name="show" value="title" type="hidden">
        <input name="tempid" value="1" type="hidden">
        <input name="tbname" value="news" type="hidden">
        <input name="Submit" class="input_submit" value="搜索" type="submit">
      </form>
    </div>
    <div class="paihang">
      <h2 class="ab_title"><a href="/">点击排行</a></h2>
      <ul>
      <c:forEach items="${runklist}" var="fileObj" varStatus="s">

        <li><b><a href="<%=basePath%>/viewblog?id=${fileObj.id }" target="_blank">${fileObj.title}</a></b>
          <p>${fileObj.brief}</p>
        </li>
     
      </c:forEach>
      </ul>
      <div class="ad"><img src="<%=basePath%>/view/picture/ad300x100.jpg"></div>
    </div>
  </div>
</article>
<footer>
  <p>copy from<a href="http://www.yangqq.com">  @杨青个人博客</a></p>
</footer><script src="<%=basePath%>/view/js/61a9ee23bfbe484da195456aea8b6f8b.js"></script>
</body>
</html>
