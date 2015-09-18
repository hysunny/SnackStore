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
    <title>注册</title>
<jsp:include page="/inc.jsp"></jsp:include>
<script type="text/javascript">
//扩展一个'equals'的验证规则   
$.extend($.fn.validatebox.defaults.rules, {   
    equals: {   
        validator: function(value,param){   
            return value == $(param[0]).val();   
        },   
        message: '两次密码输入不一致，请重新输入！'  
    }   
}); 
function validatorloginName(){
	//alert("xx");
	var username = $("#nameText").val();
	$.ajax({
		type:"POST",
		url:"<%=path%>/check.action",
		data:"username="+username,
		dataType : "text", 
		//dataType : "json", 
		//async:false,
		success:function(data){
			//alert(data);
			if(data=="false"){
				$("#error").html("");
			}else if(data=="true"){
				$("#error").html("该用户已注册！");
			}
	    },
	    error:function(){
	    	
	    	alert("error!");
	    	
	    }
	});
}

function clean(){
	$("#error").html("");
}
</script>
    <%@ include file="/common/meta.jsp"%>
	
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
    <script type="text/javascript" src="<%=path%>/js/Calendar3.js" charset="utf-8"></script>
  </head>
  
  <body>
<div style="margin:0 auto;position:relative;width:400px;top:200px;">
<div style="margin:0 auto;position:absolute;">
	<div class="easyui-panel" title="注册新账号" style="width:400px;">
		<div style="padding:10px 30px 20px 60px">
      <form id="ff" action="<%=path%>/regUsers.action" name="loginForm" method="post">
        <div>
				<label for="name">用&nbsp;&nbsp;户&nbsp;名:</label>
				<input id="nameText" class="easyui-validatebox" type="text" name="username" required="true" onfocus="clean()" onchange="validatorloginName()"></input>
				<p id="error" style="display:inline;color:red;"></p>
			</div>
			
			<div>
				<label for="password">密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码:</label>
				<input id="pwd" name="password" type="password" class="easyui-validatebox" data-options="required:true" />
				
			</div>
			<div>
				<label for="password">确认密码:</label>
				<input id="rpwd" name="rpwd" type="password" class="easyui-validatebox" required="required" validType="equals['#pwd']" />  

			</div>
			<br/>
			<div style="display:inline;">
				<input type="submit" value="注册" onclick="register()">
			</div>
			    
			<div style="display:inline;">
			    <input type="reset" value="重置" onclick="clearForm()">
			</div>
		</form>
	</div>
	</div>
	</div>
	</div>
  </body>
</html>
