<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.entity.Goods" %>
<%@ page import="com.model.GoodsHandller" %>
<%
       List<Goods> goods = GoodsHandller.getGoods();
       
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<style type="text/css">

        #divframe{  width:98%; margin:0 auto;}

        .loadTitle{ background:#CCC; height:30px;}
.divOver{
 
 border:solid 1px red !important;
}

.divbox{width:180px;height:210px;display:inline-block;border:1px solid #999;margin-top:10px;margin-left:10px;}

</style>
<script type="text/javascript">
$(function(){
	
})
var sort = $("#menu").tree("getSelected").id;
<%
String goodsSort = request.getParameter("sort");
System.out.println(goodsSort);
%>
</script>
<!-- 
<div id="divframe">
    <div id="goodShow">
    </div>
</div>
 -->
 
 
 <%
   for(int i=0;i<goods.size();i++){
	   System.out.println(goods.get(i).getGoodsSort());
	   System.out.println(goodsSort);
	   if( goods.get(i).getGoodsSort().equals(goodsSort)){
		   
   %>
 <div class="divbox" onclick="detailShow(i)">
   <img width="170px" height="170px"  src="<%=goods.get(i).getGoodsUrl() %>"/><br/>
   <%=goods.get(i).getGoodsPrice() %><br/>
   <%=goods.get(i).getGoodsName() %>
   
 </div>
 <%} }%>
 
 
 
 
 
 
<script type="text/javascript">
$(function(){
	
})
var sort = $("#menu").tree("getSelected").id;

/*
$.getJSON("jsonData/GoodsData.json",function(data){
	var goodJson = $("#goodShow");
	 strHtml = "";   //存储数据的变量
	 goodJson.empty();
	 $.each(data,function(infoIndex,info){
		 //判断分类，分类显示货品信息
		 if(sort == info["sort"]){
			 strHtml += "<div class='divbox' onclick='detailShow("+ infoIndex +")'>";
			 strHtml += "<img width='170px' height='170px' src='" + info["image"] + "' />" + "<br/>";
			 strHtml += info["price"] + "<br/>";
			 strHtml += info["name"] + "<br/>";	 
			 strHtml += "</div>";	
		 }
	 });
	 goodJson.html(strHtml);  //显示处理后的数据
	
});*/
//当鼠标滑入时将div的class换成divOver
$(".divbox").hover(function(){
		$(this).addClass('divOver');	
		
	},function(){
		//鼠标离开时移除divOver样式
		$(this).removeClass('divOver');	
	}
);

	
/*
function detailShow(index){
	$.getJSON("jsonData/GoodsData.json",function(data){
		var detailJson = $("#panel");
		 strHtml = "";   //存储数据的变量
		 detailJson.empty();
	
		  $.each(data,function(infoIndex,info){
			  if(index == infoIndex){
			  //strHtml += "<div class='goodsDetail'>";
			  strHtml += "<img style='display:inline;left:100px;position:relative;' width='300px' height='300px' class='detailImg'  src='" + info["image"] + "' />" ;
			  strHtml += "<div style='display:inline-block;position:relative;left:150px;width:200px;height:200px;top:-100px;' class='goodsDetail'>";
			  strHtml += "<p id='goodsName'>" + info["name"] + "</p><br/>";
			  strHtml += info["detail"] + "<br/>";
			  strHtml += "<p id='goodsPrice'>" + info["price"] + "</p><br/>";
			  strHtml += "数量：<input id='goodsQuantity' type='text' value='1'/>" + "<br/>";
			  strHtml += info["count"] + "<br/>";
			  strHtml += "<input type='button' value='立即购买' />";
			  var name = $("#goodsName").text();
			  var price = $("#goodsPrice").text();
			  strHtml += "<input type='button' id='addToCart' value='加入购物车' onclick='addCart()'  />";
			  strHtml += "</div>";
			 
			  
			  }
		  });
		  detailJson.html(strHtml);  //显示处理后的数据

	});
	
			 
}

function addCart(){
	$("#container").layout('expand','east');  
	var name = $("#goodsName").text();
	var price = parseFloat($("#goodsPrice").text());
	//alert(name);
	
	function add(){
		for(var i=0; i<data.total; i++){
			var row = data.rows[i];
			if (row.name == name){
				row.quantity += 1;
				return;
			}
		}
		data.total += 1;
		data.rows.push({
			name:name,
			quantity:1,
			price:price
		});
	}
	add();
	totalCost += price;
	$('#cartcontent').datagrid('loadData', data);
	$('div.cart .total').html('Total: $'+totalCost);
}*/
</script>

</body>
</html>