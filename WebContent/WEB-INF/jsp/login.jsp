<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<jsp:include page="../../inc.jsp"></jsp:include>
</head>
<body>
<body>
<div style="margin:0 auto;position:relative;width:400px;top:200px;">
<div style="margin:0 auto;position:absolute;">
	<div class="easyui-panel" title="登录，开启你的零食之旅~" style="width:400px;">
		<div style="padding:10px 60px 20px 60px">
     <form id="ff" action="<%=path%>/login.action" method="post">
     <div>
				<label for="name">用户名:</label>
				<input id="nameText" class="easyui-validatebox" type="text" name="username" required="true"></input>
			</div>
			
			<div>
				<label for="password">密&nbsp;&nbsp;&nbsp;码:</label>
				<input id="pwdText" class="easyui-validatebox" type="password" name="password" required="true"></input>
			</div>
			<br/>
			<div style="display:inline;">
				<table cellspacing="1" cellpadding="1"   >  
   
                 <tr>  
                   <td><a href="register.jsp" >新用户注册</a>  |</td>  
     
      <td><input type="submit" name="submit" value="登录"  />
      <input type="reset" name="reset" value="重置"/></td>  
                </tr>  
</table>  
			</div>
		</form>
	</div>
	</div>
	</div>
	</div>
</body>
</html>