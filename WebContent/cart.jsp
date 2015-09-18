<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>

<div class="cart">
		<div style="background:#fff">
		<table id="cartcontent" fitColumns="true" style="width:195px;height:auto;">
			<thead>
				<tr>
					<th field="name" width=140>名称</th>
					<th field="quantity" width=60 align="right">数量</th>
					<th field="price" width=60 align="right">单价</th>
				</tr>
			</thead>
		</table>
		</div>
		<p class="total">总额: $0</p>

	</div>
<script type="text/javascript">
var data = {"total":0,"rows":[]};
var totalCost = 0;

$(function(){
	$('#cartcontent').datagrid({
		singleSelect:true
	});
	
});

</script>
</body>
</html>