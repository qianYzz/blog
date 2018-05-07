<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.blog.component.*"%>
<!DOCTYPE html>
<html class="no-js">   
<head>
<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()+ path;
User u = (User)session.getAttribute("user");
String name = null;
if (u==null){
		request.getRequestDispatcher("/view/login/login.jsp").forward(request, response);
}else{
  	name = u.getName();
	if(!name.equals("admin")){
	  	System.out.println("-----------------------:"+name);
		request.getRequestDispatcher("/view/login/404.jsp").forward(request, response);	
	}
}

%>
        <title>Admin Home Page</title>
        <!-- Bootstrap -->
        <link href="<%=basePath%>/view/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
        <link href="<%=basePath%>/view/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" media="screen">
        <link href="<%=basePath%>/view/vendors/easypiechart/jquery.easy-pie-chart.css" rel="stylesheet" media="screen">
        <link href="<%=basePath%>/view/assets/styles.css" rel="stylesheet" media="screen">
        <link rel="shortcut icon" href="<%=basePath%>/view/images/title.ico" /> 
        <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
        <!--[if lt IE 9]>
            <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
        <script src="<%=basePath%>/view/vendors/modernizr-2.6.2-respond-1.1.0.min.js"></script>
    </head>
    
    <body>
        <div class="navbar navbar-fixed-top">
            <div class="navbar-inner">
                <div class="container-fluid">
                    <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse"> <span class="icon-bar"></span>
                     <span class="icon-bar"></span>
                     <span class="icon-bar"></span>
                    </a>
                    <a class="brand" href="#">Admin Panel</a>
                    <div class="nav-collapse collapse">
                        <ul class="nav pull-right">
                            <li class="dropdown">
                                <a href="#" role="button" class="dropdown-toggle" data-toggle="dropdown"> <i class="icon-user"></i><%=name%><i class="caret"></i>

                                </a>
                                <ul class="dropdown-menu">
                                    <li>
                                        <a tabindex="-1" href="#">test</a>
                                    </li>
                                    <li class="divider"></li>
                                    <li>
                                        <a tabindex="-1" href="login.html">退出</a>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                        <ul class="nav">
                            <li class="active">
                                <a href="#">Dashboard</a>
                            </li>
                            <li class="dropdown">
                                <a href="#" data-toggle="dropdown" class="dropdown-toggle">Settings <b class="caret"></b>

                                </a>
                                <ul class="dropdown-menu" id="menu1">
                                    <li>
                                        <a href="#">Tools <i class="icon-arrow-right"></i>

                                        </a>
                                        <ul class="dropdown-menu sub-menu">
                                            <li>
                                                <a href="#">Reports</a>
                                            </li>
                                            <li>
                                                <a href="#">Logs</a>
                                            </li>
                                            <li>
                                                <a href="#">Errors</a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li>
                                        <a href="#">SEO Settings</a>
                                    </li>
                                    <li>
                                        <a href="#">Other Link</a>
                                    </li>
                                    <li class="divider"></li>
                                    <li>
                                        <a href="#">Other Link</a>
                                    </li>
                                    <li>
                                        <a href="#">Other Link</a>
                                    </li>
                                </ul>
                            </li>
                            <li class="dropdown">
                                <a href="#" role="button" class="dropdown-toggle" data-toggle="dropdown">Content <i class="caret"></i>

                                </a>
                                <ul class="dropdown-menu">
                                    <li>
                                        <a tabindex="-1" href="#">Blog</a>
                                    </li>
                                    <li>
                                        <a tabindex="-1" href="#">News</a>
                                    </li>
                                    <li>
                                        <a tabindex="-1" href="#">Custom Pages</a>
                                    </li>
                                    <li>
                                        <a tabindex="-1" href="#">Calendar</a>
                                    </li>
                                    <li class="divider"></li>
                                    <li>
                                        <a tabindex="-1" href="#">FAQ</a>
                                    </li>
                                </ul>
                            </li>
                            <li class="dropdown">
                                <a href="#" role="button" class="dropdown-toggle" data-toggle="dropdown">Users <i class="caret"></i>
                                </a>
                                <ul class="dropdown-menu">
                                    <li>
                                        <a tabindex="-1" href="#">User List</a>
                                    </li>
                                    <li>
                                        <a tabindex="-1" href="#">Search</a>
                                    </li>
                                    <li>
                                        <a tabindex="-1" href="#">Permissions</a>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                    <!--/.nav-collapse -->
                </div>
            </div>
        </div>
        <div class="container-fluid">
            <div class="row-fluid">
                <div class="span3" id="sidebar">
                    <ul class="nav nav-list bs-docs-sidenav nav-collapse collapse">
                        <li class="active">
                            <a href="<%=basePath%>/platform"><i class="icon-chevron-right"></i> 基本信息</a>
                        </li>
                        <li>
                            <a href="<%=basePath%>/platformform"><i class="icon-chevron-right"></i> 撰写博客</a>
                        </li>                   
                    </ul>
                </div>             
                <div class="span9" id="content">
                    <div class="row-fluid">
                        <div class="alert alert-success">
							<button type="button" class="close" data-dismiss="alert">&times;</button>
                            <h4>Success</h4>
                        	The operation completed successfully</div>
                        	<div class="navbar">
                            	<div class="navbar-inner">
	                                <ul class="breadcrumb">
	                                    <i class="icon-chevron-left hide-sidebar"><a href='#' title="Hide Sidebar" rel='tooltip'>&nbsp;</a></i>
	                                    <i class="icon-chevron-right show-sidebar" style="display:none;"><a href='#' title="Show Sidebar" rel='tooltip'>&nbsp;</a></i>
	                                    <li>
	                                        <a href="#">Dashboard</a> <span class="divider">/</span>	
	                                    </li>
	                                    <li>
	                                        <a href="#">Settings</a> <span class="divider">/</span>	
	                                    </li>
	                                    <li class="active">Tools</li>
	                                </ul>
                            	</div>
                        	</div>
                    	</div>
                    <div class="row-fluid">
                        <div class="span6">
                            <div class="block">
                                <div class="navbar navbar-inner block-header">
                                    <div class="muted pull-left">文章</div>
                                    <div class="pull-right"><span class="badge badge-info"></span>

                                    </div>
                                </div>
                                <div class="block-content collapse in">
                                    <table class="table table-bordered">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>标题</th>
                                                <th>内容</th>
                                                <th>时间</th>
                                                <th>操作</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${userlist.list}" var="fileObj" varStatus="s">
                                            <tr>
                                                <td>${requestScope.offset+s.index+1}</td>
                                                <td>${fileObj.title}</td>
                                                <td style="white-space:nowrap;overflow: hidden;text-overflow:ellipsis">pls wait</td>
                                                <td>${fileObj.createTime}</td>
                                                <td>
                                                <a href="<%=basePath%>/admin/delete?id=${fileObj.id}">
                                                <button class="btn btn-primary btn-lg">删除</button></a>
                                                 <a href="<%=basePath%>/admin/findedit?id=${fileObj.id}">
                                                 <button class="btn btn-primary btn-lg">编辑</button></a>                                                                        
                                                </td>
                                            </tr>
                                          </c:forEach>                                     
                                        </tbody>
                                    </table>
                                    <div class="pagination">
										<ul>
											<li><a href="<%=basePath%>/platform/${userlist.getPageNumber() >1 ? userlist.getPageNumber()-1:1}">上一页</a></li>
												<c:forEach var="i" begin="1" end="${userlist.getTotalPage() }">
													<c:if test="${userlist.getPageNumber()==i}">
															<li class="active"><a href="<%=basePath%>/platform/${i}"><c:out value="${i}"/></a></li>		
													</c:if>
													<c:if test="${userlist.getPageNumber()!=i}">
															<li ><a href="<%=basePath%>/platform/${i}"><c:out value="${i}"/></a></li>		
													</c:if>
												</c:forEach>
											<li><a href="<%=basePath%>/platform/${userlist.getPageNumber() < userlist.getTotalPage() ? userlist.getPageNumber()+1:userlist.getTotalPage()}">下一页</a></li>
										</ul>
									</div>
                                </div>
                            </div>
                        </div>
                    </div>              
                </div>
            </div>
            <hr>
            <footer>
               
            </footer>
        </div>
        <!--/.fluid-container-->
        <script src="<%=basePath%>/view/vendors/jquery-1.9.1.min.js"></script>
        <script src="<%=basePath%>/view/bootstrap/js/bootstrap.min.js"></script>
        <script src="<%=basePath%>/view/vendors/easypiechart/jquery.easy-pie-chart.js"></script>
        <script src="<%=basePath%>/view/assets/scripts.js"></script>
        <script>
        $(function() {
            // Easy pie charts
            $('.chart').easyPieChart({animate: 1000});
        });
        </script>
    </body>

</html>