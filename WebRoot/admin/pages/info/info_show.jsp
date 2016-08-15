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
	<script type="text/javascript" src="jeasyui/locale/easyui-lang-zh_CN.js"></script>
	<script>
	function doSearch(){
		var vf = $('#dfrom').datebox('getValue');
		var vt = $('#dto').datebox('getValue');
		var valid = true;
		if(vf.length > 0 && vt.length > 0){
			var df = $.fn.datebox.defaults.parser(vf);
			var dt = $.fn.datebox.defaults.parser(vt);
			valid = dt >= df;
		}
		if(!valid){
			alert("错误：结束时间早于开始时间。\n");
		}
		else{
			$('#tt').datagrid('load',{
				datefrom: $('#dfrom').datebox('getValue'),
				dateto: $('#dto').datebox('getValue'),
				keyw: $('#searchkw').val(),
				ct: $('#category').val(),
				author:$('#author').val(),
				irecom:$('#irecom').val(),
				igraph:$('#igraph').val(),
			});
		}
	};
	
	function doAdd(){
		location.href = "info/info_e.do"; 
	};
	
	function doEdit(){
		var rows = $('#tt').datagrid('getSelections');
		if(rows.length == 0){
			alert("错误：没有选择需要编辑的文章.\n");
		}
		else if(rows.length == 1){
			var dataid = rows[0].aid;
			var url = "info/info_e.do?aid=" + dataid;
			location.href = url; 
		}
		else{
			alert("错误：无法编辑多个文章.\n");
		}
	};
	
	function doDelete(){
		var rows = $('#tt').datagrid('getSelections');
		if(rows.length == 0){
			alert("错误：没有选择需要删除的文章.\n");
		}
		else{
			$.messager.confirm("提示：", "确定要删除选定的文章吗？删除之后无法恢复.\n", function (data) {  
            	if (data) {  
                	var ids = [];
					for(var i=0; i<rows.length; i++){
						ids.push(rows[i].aid);
					}
					var json_data = {
						"deleteIds":ids
					};
					$.ajax({
						type:"POST",
						url:"info/info_d",
						contentType: "application/json; charset=utf-8", 
						data: JSON.stringify(json_data),
						dataType: "text",
						success: function(message, status){
							message = $.parseJSON(message);
							if(message.result == "success"){
								alert("删除数据成功.\n");
								doSearch();
							} else {
								alert("删除数据失败.\n");
							}
						},
						error: function() {
								alert("删除数据失败.\n");
                    }
					});
           		}  
            });
		}
	};
	
	</script>
</head>
<body>
	<h2>文章列表</h2>
	<table id="tt" title="文章列表" class="easyui-datagrid" style="width:100%"
			url="info/info_g" 
			toolbar="#tb"
			pagination="true" rownumbers="true"
			fitColumns="true">
		<thead>
			<tr style="width:100%">
				<th field="ck" checkbox="true" style="width:10%"></th>
				<th field="title" style="width:40%">标题</th>
				<th field="author" style="width:15%">作者</th>
				<th field="category" style="width:10%">类别</th>
				<th field="create_time" style="width:10%">创建时间</th>
				<th field="irecom" style="width:10%">是推荐页</th>
				<th field="igraph" style="width:10%;float:right">是图片页</th>
			</tr>
		</thead>
	</table>
	
	<div id="tb" style="padding:5px;height:auto">
		<div style="margin-bottom:5px">
			<a href="javascript:doAdd()" class="easyui-linkbutton" iconCls="icon-add" plain="true"></a>
			<a href="javascript:doEdit()" class="easyui-linkbutton" iconCls="icon-edit" plain="true"></a>
			<a href="javascript:doDelete()" class="easyui-linkbutton" iconCls="icon-remove" plain="true"></a>
		</div>
		<div>
			日期 从: <input id="dfrom" class="easyui-datebox" style="width:150px">
			到: <input id="dto" class="easyui-datebox" style="width:150px">
			
			|	
			关键词: 
			<input id="searchkw" textField="text" style="width:300px">
			
			|
			作者:
			<input id="author" textField="text" style="width:130px">
			
			|
			是推荐页:
			<input type="checkbox" id="irecom" style="vertical-align:sub;">
			
			|
			是图片页:
			<input type="checkbox" id="igraph" style="vertical-align:sub;">			
			
			|
			类别: <select name="category" id="category">
				<option value="0">全部分类</option>
			<c:forEach var="item" items="${categories}" varStatus="s">
				<option value="${s.count}">${item}</option>
			</c:forEach>
		</select>
			
			
			<a href="javascript:doSearch()" class="easyui-linkbutton" iconCls="icon-search">搜索</a>
		</div>
	</div>
</body>
</html>