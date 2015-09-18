<%@ page language="java" import="java.util.*" %>
<%@ page contentType="text/html; charset=utf-8" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'hello.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <center>
      <h1>用户注册成功</h1>
      <hr>
           以下是您的注册信息：<br>
           用户名：${sessionScope.login_user.username}<br>
           密码：${sessionScope.login_user.password}<br>
           出生日期：<fmt:formatDate value="${sessionScope.login_user.birthday}" pattern="yyyy-MM-dd"/><br>
           去<a href="<%=path%>/login.action">登录</a>
           
    </center>
  </body>
</html>
