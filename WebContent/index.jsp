<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.io.*,java.sql.*,javax.sql.* ,javax.naming.*"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>    

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>零食铺子网购系统</title>
<jsp:include page="/inc.jsp"></jsp:include>
</head>
<body id="container" class="easyui-layout">
  <div data-options="region:'north',split:true,href:'header.jsp'" style="height:100px;"></div>  
 
  <div data-options="region:'south',split:true,href:'footer.jsp'" style="height:100px;"></div>  
    
  <div id="layout_menu" data-options="region:'west',title:'零食分类',split:true,href:'menu.jsp'" style="width:150px;"></div>
  <div data-options="region:'east',title:'购物车',split:true,href:'cart.jsp'" style="width:200px;"></div>   
  
  <div data-options="region:'center',href:'content.jsp'" style="padding:5px;background:#eee;"></div> 
  
   

</body>
</html>