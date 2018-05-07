<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()+ path;
%>
    <title>Admin Login</title>
    <!-- Bootstrap -->
    <link href="<%=basePath%>/view/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link href="<%=basePath%>/view/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" media="screen">
    <link href="<%=basePath%>/view/assets/styles.css" rel="stylesheet" media="screen">
    <link rel="shortcut icon" href="<%=basePath%>/view/images/title.ico" /> 
    <script src="<%=basePath%>/view/js/vendor/modernizr-2.6.2-respond-1.1.0.min.js"></script>
  </head>
  <body id="login">
    <div class="container">
    <div id="msg" style="color:red;margin:60px auto 20px auto;width:360px;height:2em;">${errMsg}</div>

      <form class="form-signin" action="<%=basePath%>/login/signin" method="get">
        <h2 class="form-signin-heading">Please sign in</h2>
        <input type="text" class="input-block-level" placeholder="Email address" name="name">
        <input type="password" class="input-block-level" placeholder="Password" name="password">
        <label class="checkbox">
          <input type="checkbox" value="remember-me"> Remember me
        </label>
        <button class="btn btn-large btn-primary" type="submit">Sign in</button>
      </form>

    </div> <!-- /container -->
    <script src="<%=basePath%>/view/vendors/jquery-1.9.1.min.js"></script>
    <script src="<%=basePath%>/view/bootstrap/js/bootstrap.min.js"></script>
    
  </body>
</html>