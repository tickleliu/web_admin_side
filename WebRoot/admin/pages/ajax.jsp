<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'ajax.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="text/javascript" src="/SSM2/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
  $("#b01").click(function(){
  htmlobj=$.ajax({url:"/SSM2/ajax/resp",async:false});
  $("#myDiv").html(htmlobj.responseText);
  });
});
$(document).ready(function(){
    $("#b02").click(function(){
    var img_url="/SSM2/img/alpha.png";
    $.get(img_url, function(){
    $("img").attr("src", img_url);
    })
    })
    });
</script>
  </head>
  
  <body>
<div id="myDiv"><h2>通过 AJAX 改变文本</h2></div>
<button id="b01" type="button">改变内容</button>
<button id="b02" type="button">加载图片</button>
<img src="">t</img>
  </body>
</html>
