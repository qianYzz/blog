<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<!--[if lt IE 9]>
<script src="js/modernizr.js"></script>
<![endif]-->
</head>
<body>
<script>
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
</script>
<header>
  <div id="mnav">
    <h2><span class="navicon"></span></h2>
    <ul>
      <li><a href="/">网站首页</a></li>
      <li><a href="/about.html">关于我</a></li>
      <li><a href="/download/">模板分享</a></li>
      <li><a href="/jstt/">学无止境</a></li>
      <li><a href="/news/">慢生活</a></li>
      <li><a href="/e/tool/gbook/?bid=3">留言</a></li>
    </ul>
  </div>
  <nav>
    <ul>
      <li><a href="/">网站首页</a></li>
      <li><a href="/about.html">关于我</a></li>
      <li><a href="/download/">模板分享</a></li>
      <li><a href="/jstt/">学无止境</a></li>
      <li><a href="/news/">慢生活</a></li>
      <li><a href="/e/tool/gbook/?bid=3">留言</a></li>
    </ul>
  </nav>
</header>
<article>
  <div class="pics">
    <ul>
 
      <li><a href="/jstt/bj/2015-01-09/740.html" target="_blank"><img src="<%=basePath%>/view/picture/42d76eafa6495d9647a4fd245201f56c.jpg"></a><span>【匆匆那些年】总结个人博客经历的这四年…</span></li>
 
      <li><a href="/jstt/bj/2014-11-06/732.html" target="_blank"><img src="<%=basePath%>/view/picture/c9668d65657bc41b77f6834984538979.jpg"></a><span>分享我的个人博客访问量如何做到IP从10到600的...</span></li>
 
      <li><a href="/jstt/bj/2013-07-28/530.html" target="_blank"><img src="<%=basePath%>/view/picture/13ec5c876bf437fd7e9e6b12b565a69c.jpg"></a><span>如果要学习web前端开发，需要学习什么？</span></li>
    </ul>
  </div>
  <div class="sleftbox">
    <div class="newblogs">
      <h2 class="hometitle">最新文章</h2>
      <ul>
       

		 <c:forEach items="${userlist.list}" var="fileObj" varStatus="s">
        <li>
          <h3 class="blogtitle"><a href="/jstt/css3/2018-03-25/811.html" target="_blank" >${fileObj.title }</a></h3>
          <div class="bloginfo"><span class="blogpic"><a href="/jstt/css3/2018-03-25/811.html" title="别让这些闹心的套路，毁了你的网页设计"><img src="<%=basePath%>/view/picture/393d21b65031dd0d85eb2e5789a97b1e.jpg" alt="别让这些闹心的套路，毁了你的网页设计" /></a></span>
            <p>${fileObj.content }</p>
          </div>
          <div class="autor"><span class="lm f_l"><a href="/jstt/css3/" title="css3" target="_blank"  class="classname">css3</a></span><span class="dtime f_l">2018-03-25</span><span class="viewnum f_l">浏览（<a href="/">115</a>）</span><span class="f_r"><a href="/jstt/css3/2018-03-25/811.html" class="more">阅读原文>></a></span></div>
        </li>
        </c:forEach>
        
      </ul>
    </div>
  </div>
  <div class="srightbox">
    <div class="aboutme">
      <h2 class="ab_title">关于我</h2>
      <div class="avatar"><img src="<%=basePath%>/view/picture/b04.jpg" /></div>
      <div class="ab_con">
        <p>网名：dancesmile | 杨青</p>
        <p>职业：Web前端设计师、网页设计 </p>
        <p>个人微信：yangqq_1987</p>
        <p>邮箱：dancesmiling@qq.com</p>
      </div>
    </div>
    <div class="search">
      <form action="/e/search/index.php" method="post" name="searchform" id="searchform">
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
        <li><b><a href="/download/div/2015-04-10/746.html" target="_blank">【活动作品】柠檬绿兔小白个人博客模板30...</a></b>
          <p>展示的是首页html，博客页面布局格式简单，没有复杂的背景，色彩局部点缀，动态的幻灯片展示，切换卡，标...</p>
        </li>
        <li><b><a href="/download/div/2014-02-19/649.html" target="_blank"> 个人博客模板（2014草根寻梦）30...</a></b>
          <p>2014第一版《草根寻梦》个人博客模板简单、优雅、稳重、大气、低调。专为年轻有志向却又低调的草根站长设...</p>
        </li>
        <li><b><a href="/download/div/2013-08-08/571.html" target="_blank">黑色质感时间轴html5个人博客模板30...</a></b>
          <p>黑色时间轴html5个人博客模板颜色以黑色为主色，添加了彩色作为网页的一个亮点，导航高亮显示、banner图片...</p>
        </li>
        <li><b><a href="/download/div/2014-09-18/730.html" target="_blank">情侣博客模板系列之《回忆》Html30...</a></b>
          <p>Html5+css3情侣博客模板，主题《回忆》，使用css3技术实现网站动画效果，主题《回忆》,分为四个主要部分，...</p>
        </li>
        <li><b><a href="/download/div/2014-04-17/661.html" target="_blank">黑色Html5个人博客模板主题《如影随形》30...</a></b>
          <p>014第二版黑色Html5个人博客模板主题《如影随形》，如精灵般的影子会给人一种神秘的感觉。一张剪影图黑白...</p>
        </li>
        <li><b><a href="/jstt/bj/2015-01-09/740.html" target="_blank">【匆匆那些年】总结个人博客经历的这四年…30...</a></b>
          <p>博客从最初的域名购买，到上线已经有四年的时间了，这四年的时间，有笑过，有怨过，有悔过，有执着过，也...</p>
        </li>
      </ul>
      <div class="ad"><img src="<%=basePath%>/view/picture/ad300x100.jpg"></div>
    </div>
<div class="paihang">
      <h2 class="ab_title"><a href="/">站长推荐</a></h2>
      <ul>
        <li><b><a href="/jstt/css3/2018-03-20/808.html" target="_blank">十条设计原则教你学会如何设计网页布局!30...</a></b>
          <p>网页常见的布局有很多种,单列布局,多列布局.其中单列布局是国外很多网站比较常用的.咱们很多站长以及门户...</p>
        </li>
        <li><b><a href="/download/div/2018-03-18/807.html" target="_blank">html5个人博客模板主题《绅士》30...</a></b>
          <p>因其颜色主要是黑白搭配,重点突出的是文字内容,就像是一个颇有内涵的绅士.所以此模板主题为《绅士》,个人...</p>
        </li>
        <li><b><a href="/jstt/css3/2018-03-14/806.html" target="_blank">用js+css3来写一个手机栏目导航30...</a></b>
          <p>有些站长说想做一个手机适应的网站,但是导航太难了,如果要使用框架的话,代码非常多,冗余.再用dreamwear打...</p>
        </li>
        <li><b><a href="/jstt/css3/2018-03-14/805.html" target="_blank">6条网页设计配色原则,让你秒变配色高手30...</a></b>
          <p>网页设计好不好看,颜色是毋庸置疑要排首位的,所以关于颜色的搭配技巧以及原则,对于每一个要学习web前端设...</p>
        </li>
        <li><b><a href="/news/life/2018-03-13/804.html" target="_blank">作为一个设计师,如果遭到质疑你是否能恪守自己的原则?30...</a></b>
          <p>就拿我自己来说吧，有时候会很矛盾，设计好的作品，不把它分享出来，会觉得待在自己电脑里面实在是没有意...</p>
        </li>
        <li><b><a href="/news/life/2018-03-12/803.html" target="_blank">Come on,行动起来吧!我们和时间来一场赛跑!30...</a></b>
          <p>时间过得那么飞快,使我的小心眼儿里不只是着急,还有悲伤.有一天,我放学回家,看到太阳快落山了,就下决心说...</p>
        </li>
      </ul>
    </div>
    <div class="links">
      <h2 class="ab_title">友情链接</h2>
      <ul>
        <li><a href="http://www.yangqq.com">杨青个人博客</a></li>
        <li><a href="http://www.yangqq.com/download/">个人博客模板</a></li>
        <li><a href="http://www.yangqq.com/link.html">优秀个人博客</a></li>
      </ul>
    </div>
    <div class="weixin">
      <h2 class="ab_title">官方微信</h2>
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
