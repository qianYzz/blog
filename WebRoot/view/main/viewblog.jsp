<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.blog.component.*" %>
<%@page import="java.util.List" %>
<%@page import="com.jfinal.plugin.activerecord.Page" %>
<%@page import="com.blog.service.BlogService" %>

<!doctype html>
<html>
<head>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()+ path;
	String id = request.getParameter("id");
	Blog b = BlogService.queryById(id);
	b.setViewcount(b.getViewcount()+1);
	b.update();
	String blogid = b.getId();
	String userid=null;
	User u = (User)session.getAttribute("user");
	String username = null;
	if(u!=null){
		userid = u.getId();	
		username = u.getName();
	}
	System.out.println(userid);
	System.out.println(username);
%>
<meta charset="gb2312">
<title>${blog.title }</title>
<meta name="keywords" content="帝国cms" />
<meta name="description" content="帝国cms关键词和tags标签自动同步方法" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="<%=basePath%>/view/css/base.css" rel="stylesheet">
<link href="<%=basePath%>/view/css/index.css" rel="stylesheet">
<link rel="shortcut icon" href="<%=basePath%>/view/images/title.ico" /> 
<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">  
<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!--[if lt IE 9]>
<script src="js/modernizr.js"></script>
<![endif]-->
</head>
<body>
<!-- <script>
window.onload = function ()
{
	var oH2 = document.getElementsByTagName("h2")[0];
	var oUl = document.getElementsByTagName("ul")[0];
	oH2.onclick = function ()
	{
		var style = oUl.style;
		style.display = style.display == "block" ? "none" : "block";
		oH2.className = style.display == "block" ? "open" : ""
	}
}
</script> -->
 <%@include file="/view/common/header.jsp"%>
<article>
  <div class="leftbox">
    <div class="infos">
      <div class="newsview">     
        <h2 class="intitle">您现在的位置是：<a href="<%=basePath%>/">首页</a>&nbsp;>&nbsp;<a href="<%=basePath%>/">文章</a></h2>
        <h3 class="news_title">${blog.title }</h3>
        <div class="news_author"><span class="au01"></span><span class="au02">${blog.createTime }</span><span class="au03">共<b>${blog.viewcount }</b>人围观</span></div>
        <div class="tags"><a href="#" target="_blank">文章 </a></div>
        <div class="news_about"><strong>简介</strong>${blog.brief }</div>
        <div class="news_infos">
			<p>${blog.content }</p>
        </div>
     <div class="news_pl">
           	<h2>文章评论</h2>
     <c:if test="${counts>0}">
      	  <c:forEach items="${commentlist}" var="fileObj" varStatus="s">     	  	
	          <div class="user-comment">
	            <ul>
	              <li>
	                <div class="userimg"><img src="<%=basePath%>/view/images/dlrb.png" alt=""></div>
	                <div class="comment-info">
	                  <p class="username"><a class="text-org" href="">${fileObj.name}:</a></p>
	                  <div class="last-comment"><em class="text-gray">评论：</em>${fileObj.comments}</div>
	                </div>
	                <div class="comment-date">${fileObj.createTime}</div>
	              
	              </li>
	            </ul>
	              <div class="comment-reply">
	              	<%-- <a class="reply" id="reply" href="<%=basePath%>/comment/reply/?userid=${fileObj.userid}&id=${fileObj.blogid}">回复</a>   --%>
	              	<a>回复</a>
	              	</div>
	          </div>      
		 </c:forEach>   	
	 </c:if>
	 	<form  method="get" action="<%=basePath%>/comment/addComment/" id="form">
				<input type="hidden" value="<%=userid%>" name="userid" >
				<input type="hidden" name="blogid" value="<%=blogid%>">
				<input type="hidden" name="type" value="${type}">
				<input type="hidden" name="fromuserid" value="<%=userid%>">
				<div class="form-group">
					<textarea class="form-control" id="form-control" name="comments" rows="3" style="margin: 0px; height: 122px; width: 645px;" placeholder="说点什么吧。。。">${username}</textarea>
				</div>
					<button class="btn btn-warning" id="btn">发表评论</button>
		</form>
		</div>
	</div>
</div>
    <div class="nextinfo">
    </div>
 </div>
<script> 
var userid = '<%=userid%>';
var type = '${type}';

    $('.form-control').focus(function(){

    	if(userid==null||userid=="null"){
        	window.location.href = '<%=basePath%>/login';    		
    	}
    });


/* if(type=="0"){
	$('.form-control').focus();
} */
</script>
<script type="text/javascript">
$(document).ready(function(){
	  $("#btn").click(function(){
		 var cnt = $('#form-control').val();
	 	 if(cnt==""){	 		 
		 	 return false;	 		
	 	 }
	  });
	});
</script>
  <div class="rightbox">
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
    </div>
  </div>
</article>
<footer>
  <p>copy from<a href="http://www.yangqq.com">@杨青个人博客</a></p>
</footer><script src="<%=basePath%>/view/js/61a9ee23bfbe484da195456aea8b6f8b.js"></script>
</body>
</html>
