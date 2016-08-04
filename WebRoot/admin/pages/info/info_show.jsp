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

<title>My JSP 'index.jsp' starting page</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

	<link rel="stylesheet" type="text/css" href="jeasyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="jeasyui/themes/icon.css">
	<script type="text/javascript" src="admin/assets/js/jquery-1.11.2.min.js"></script>
	<script type="text/javascript" src="jeasyui/jquery.easyui.min.js"></script>
	<script>
	$(document).ready(function(){
		$("#testb").click(function(){
			var df = $('#dfrom').datebox('getValue');
			var dt = $('#dto').datebox('getValue');
			var keyw = $('#searchkw').val();
			var ct = $('#searchct').val();
			alert("From: " + df + " To: " + dt + " keyword: " + keyw + " category: " + ct);
	  	});
	});
	
	function doSearch(){
		$('#tt').datagrid('load',{
			datefrom: $('#dfrom').datebox('getValue'),
			dateto: $('#dto').datebox('getValue'),
			keyw: $('#searchkw').val(),
			ct: $('#searchct').val()
		});
	};
	
	function doAdd(){
		alert("增添");
	};
	
	function doEdit(){
		var rows = $('#tt').datagrid('getSelections');
		if(rows.length == 0){
			alert("没有选中");
		}
		else if(rows.length == 1){
			var dataid = rows[0].aid;
			alert("编辑, id: " + dataid);
		}
		else{
			alert("超过一个被选中");
		}
	};
	
	function doDelete(){
		var rows = $('#tt').datagrid('getSelections');
		if(rows.length == 0){
			alert("");
		}
		else{
			$.messager.confirm("", function (data) {  
            	if (data) {  
                	var ids = [];
					for(var i=0; i<rows.length; i++){
						ids.push(rows[i].aid);
					} 
					alert(":\n" + ids.join("\n"));
           		}  
            	else {  
                	alert("");  
            	} 
            });
		}
	};
	</script>
</head>
<body>
	<h2>文章列表</h2>
	<table id="tt" title="文章列表" class="easyui-datagrid" style="width:800px"
			url="info/info_list" 
			toolbar="#tb"
			pagination="true" rownumbers="true"
			fitColumns="true">
		<thead>
			<tr>
				<th field="ck" checkbox="true"></th>
				<th field="aid" width="60">ID</th>
				<th field="title" width="80">标题</th>
				<th field="autor" align="right" width="70">作者</th>
				<th field="category" align="right" width="70">分类</th>
			</tr>
		</thead>
	</table>
	
	<div id="tb" style="padding:5px;height:auto">
		<div style="margin-bottom:5px">
			<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="doAdd()"></a>
			<a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="doEdit()"></a>
			<a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="doDelete()"></a>
		</div>
		<div>
			日期 从: <input id="dfrom" class="easyui-datebox" style="width:120px">
			到: <input id="dto" class="easyui-datebox" style="width:120px">
			关键词: 
			<input id="searchkw" textField="text" style="width:180px">
			作者: 
			<input id="author" textField="text" style="width:180px">
			分类: 
			类别： <select name="category" id="category">
			<c:forEach var="item" items="${categories}" varStatus="s">
				<option value="${s.count}">${item}</option>
			</c:forEach>
		</select>
			
			
			<a href="#" class="easyui-linkbutton" iconCls="icon-search" onclick="doSearch()">Search</a>
		</div>
	</div>
	<button id="testb">test</button>
</body>
</html>