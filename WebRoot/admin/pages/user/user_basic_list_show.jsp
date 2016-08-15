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
				name:$('#name').val(),
				email:$('#email').val(),
				wechat_id:$('#wechat_id').val(),
				status:$('#status').val(),
			});
		}
	};
	
	
	function doEdit(){
		var rows = $('#tt').datagrid('getSelections');
		if(rows.length == 0){
			alert("错误：没有选择需要编辑的用户.\n");
		}
		else if(rows.length == 1){
			var datuid = rows[0].uid;
			var url = "user/user_e.do?uid=" + datuid;
			location.href = url; 
		}
		else{
			alert("错误：无法编辑多个用户.\n");
		}
	};
	
	function doDelete(){
		var rows = $('#tt').datagrid('getSelections');
		if(rows.length == 0){
			alert("错误：没有选择需要删除的用户.\n");
		}
		else{
			$.messager.confirm("提示：", "确定要删除选定的用户吗？删除之后无法恢复.\n", function (data) {  
            	if (data) {  
                	var ids = [];
					for(var i=0; i<rows.length; i++){
						ids.push(rows[i].uid);
					}
					var json_data = {
						"deleteIds":ids
					};
					$.ajax({
						type:"POST",
						url:"user/user_d",
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
	<h2>用户列表</h2>
	<table id="tt" title="用户列表" class="easyui-datagrid" style="width:100%"
			url="user/user_g" 
			toolbar="#tb"
			pagination="true" rownumbers="true"
			fitColumns="true">
		<thead>
			<tr style="width:100%">
				<th field="ck" checkbox="true" style="width:10%"></th>
				<th field="name" style="width:20%">用户名</th>
				<th field="wechat_id" style="width:20%">微信账号</th>
				<th field="status" style="width:10%">用户状态</th>
				<th field="image_url" style="width:15%;float:right">头像文件路径</th>
				<th field="regis_time" style="width:10%">注册时间</th>
			</tr>
		</thead>
	</table>
	
	<div id="tb" style="padding:5px;height:auto">
		<div style="margin-bottom:5px">
			<a href="javascript:doEdit()" class="easyui-linkbutton" iconCls="icon-edit" plain="true"></a>
			<a href="javascript:doDelete()" class="easyui-linkbutton" iconCls="icon-remove" plain="true"></a>
		</div>
		<div>
			注册时间  从: <input id="dfrom" name="dfrom" class="easyui-datebox" style="width:150px">
			到: <input id="dto" name="dto" class="easyui-datebox" style="width:150px">
			&nbsp;
			用户名: 
			<input id="name" name="name" textField="text" style="width:150px">
			&nbsp;
			用户微信号: 
			<input id="wechat_id" name="wechat_id" textField="text" style="width:150px">
			&nbsp;
			用户状态: <select name="status" id="status">
				<option value="0">全部用户</option>
			<c:forEach var="item" items="${status}" varStatus="s">
				<option value="${s.count}">${item}</option>
			</c:forEach>
				</select>
			&nbsp;
			<a href="javascript:doSearch()" class="easyui-linkbutton" iconCls="icon-search">搜索</a>
		</div>
	</div>
</body>
</html>