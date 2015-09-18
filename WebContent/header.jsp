<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
  <div style="display:inline;position:relative;top:30px;left:10px;"><a style="display:inline;font-size:30px;" href="index.jsp">零食铺子</a><p style="font-size:11px;display:inline;">满足你吃货的欲望~</p></div>
  <div style="display:inline-block;position:relative;top:30px;left:200px;"><input style="width:300px" class="easyui-searchbox" data-options="prompt:'请输入查询内容',searcher:doSearch" ></input></div>
  <div style="display:inline;position:relative;top:0px;left:550px;" id="login"><a href="<%=path%>/login.action">亲，请登录   </a> ${userSession} |  <a href="<%=path%>/regUsers.action">注册</a></div>
  <div style="display:inline;position:relative;top:30px;left:450px;" ><a href="javascript:void(0);"  onclick="myself()">个人中心</a></div>
  <div style="display:inline;position:relative;top:30px;left:450px;" ><a href="">购物车</a></div>
  	
<script type="text/javascript">

function doSearch(value){
	$("#panel").css("display","");
	$("#tabs_show").css("display","none");
	if(value != ""){
	$.getJSON("jsonData/GoodsData.json",function(data){
		var goodJson = $("#panel");
		 strHtml = "";   //存储数据的变量
		 goodJson.empty();
		 strHtml += "<div><p>搜索包含    "+value+"  关键字的搜索结果如下：</p></div>";
		 $.each(data,function(infoIndex,info){
			if(info.name.indexOf(value) != -1 ||info.detail.indexOf(value) != -1 || info.sort.indexOf(value) != -1){					  
			     strHtml += "<div style='width:190px;height:210px;display:inline-block;border:1px solid #999;margin-top:10px;margin-left:10px;'>";
				 strHtml += "<img width='170px' height='170px' src='" + info["image"] + "' />" + "<br/>";
				 strHtml += info["price"] + "<br/>";
				 strHtml += info["name"] + "<br/>";	 
				 strHtml += "</div>";
			     }
		 });
		 goodJson.html(strHtml);  //显示处理后的数据
	});
}else{
	alert("请输入查询内容！");
	
}	
}

function myself(){
	//更改layout的title
	$("#layout_menu").panel("setTitle","个人中心");
	//更改center内容
	$("#tabs_show").css("display","");
	$("#panel").css("display","none");
	//更换菜单的数据源
	$("#menu").tree({
		url:"jsonData/userTree.json",
        onClick : function (node) {
            if (node.attributes) {
            	//alert(node.text);  
            	infoShow(node.text, node.attributes.url);
            }
        }
	});
	
	$("#menu").tree('reload');
	
	//在右边center区域打开菜单，新增tab
    function infoShow(text, url) {
    	if ($("#tabs").tabs('exists', text)) {
            $('#tabs').tabs('select', text);
        } else {
            $('#tabs').tabs('add', {
                title : text,
                closable : true,
                content : text
                //url:"footer.jsp"
                //href:url
            });
        }
    }
  //绑定tabs的右键菜单
    $("#tabs").tabs({
        onContextMenu : function (e, title) {
            e.preventDefault();
            $('#tabsMenu').menu('show', {
                left : e.pageX,
                top : e.pageY
            }).data("tabTitle", title);
        }
    });
    
    //实例化menu的onClick事件
    $("#tabsMenu").menu({
        onClick : function (item) {
            CloseTab(this, item.name);
        }
    });
    
    //几个关闭事件的实现
    function CloseTab(menu, type) {
        var curTabTitle = $(menu).data("tabTitle");
        var tabs = $("#tabs");
        
        if (type === "close") {
            tabs.tabs("close", curTabTitle);
            return;
        }
        
        var allTabs = tabs.tabs("tabs");
        var closeTabsTitle = [];
        
        $.each(allTabs, function () {
            var opt = $(this).panel("options");
            if (opt.closable && opt.title != curTabTitle && type === "Other") {
                closeTabsTitle.push(opt.title);
            } else if (opt.closable && type === "All") {
                closeTabsTitle.push(opt.title);
            }
        });
        
        for (var i = 0; i < closeTabsTitle.length; i++) {
            tabs.tabs("close", closeTabsTitle[i]);
        }
    }
    
}
</script>
</body>
</html>