<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'static_manage.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link type="text/css" href="admin/assets/css/base.css"
	rel="stylesheet" />	
	<link rel="stylesheet" type="text/css" href="/css/public.css" />
	
	<script type="text/javascript" src="admin/assets/js/jquery-1.11.2.min.js"></script>
	<script>
	$(document).ready(function(){
	  $("button").click(function(){
	    $.post('info/static', {}, function( dta ) {
 		});
 		$('#static_page').attr('src', $('#static_page').attr('src'));  		
	  });
	});
	</script>

  </head>
  
  <body>
  	<div>
  		<button style="height:40px;width:80px;">重新生成静态主页</button>
  	</div>
  	<hr/>
  	<iframe id="static_page" src="http://localhost:8000/o/test.html" 
  		style="width:100%;height:100%"></iframe>
  </body>
</html>
