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
		
		$('#tt').datagrid('load',{
			nickname:$('#nickname').val(),
			realname:$('#realname').val(),
			id_number:$('#id_number').val(),
			gender:$('#gender').val(),
			degree:$('#degree').val(),
			major:$('#major').val(),
			workunit:$('#workunit').val(),
			position:$('#position').val(),
			phone:$('#phone').val(),
			email:$('#email').val(),
		});
	};
	
	
	function doEdit(){
		var rows = $('#tt').datagrid('getSelections');
		if(rows.length == 0){
			alert("错误：没有选择需要编辑的用户.\n");
		}
		else if(rows.length == 1){
			var datuid = rows[0].uid;
			var url = "user/userbasic_e.do?uid=" + datuid;
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
						url:"user/userbasic_d",
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
	<h2>个人用户列表</h2>
	<table id="tt" title="个人用户列表" class="easyui-datagrid" style="width:100%"
			url="user/userbasic_g" 
			toolbar="#tb"
			pagination="true" rownumbers="true"
			fitColumns="true">
		<thead>
			<tr style="width:100%">
				<th field="ck" checkbox="true" style="width:10%"></th>
				<th field="nickname" style="width:10%">昵称</th>
				<th field="realname" style="width:10%">真实姓名</th>
				<th field="id_number" style="width:15%">身份证号</th>
				<th field="gender" style="width:5%">性别</th>
				<th field="degree" style="width:10%">文化程度</th>
				<th field="major" style="width:10%">所学专业</th>
				<th field="workunit" style="width:10%">工作单位</th>
				<th field="position" style="width:5%">职务</th>
				<th field="phone" style="width:10%">电话</th>
				<th field="email" style="width:15%;float:right">电子邮箱</th>
			</tr>
		</thead>
	</table>
	
	<div id="tb" style="padding:5px;height:auto">
		<div style="margin-bottom:5px">
			<a href="javascript:doEdit()" class="easyui-linkbutton" iconCls="icon-edit" plain="true"></a>
			<a href="javascript:doDelete()" class="easyui-linkbutton" iconCls="icon-remove" plain="true"></a>
		</div>
		<div>
			昵称: 
			<input id="nickname" name="nickname" textField="text" style="width:100px">
				
			&nbsp;
			真实姓名: 
			<input id="realname" name="realname" textField="text" style="width:100px">
			
			&nbsp;
			身份证号: 
			<input id="id_number" name="id_number" textField="text" style="width:300px">
			
			&nbsp;
			性别: <select name="gender" id="gender">
				<option value="0">男</option>
				<option value="1">女</option>
				</select>
			
			&nbsp;
			文化程度: 
			<input id="degree" name="degree" textField="text" style="width:100px">
			
			&nbsp;
			所学专业: 
			<input id="major" name="major" textField="text" style="width:200px">
			
			<br>
			工作单位: 
			<input id="workunit" name="workunit" textField="text" style="width:200px">
			
			&nbsp;
			职务: 
			<input id="position" name="position" textField="text" style="width:100px">
			
			&nbsp;
			电话: 
			<input id="phone" name="phone" textField="text" style="width:100px">
			
			&nbsp;
			电子邮箱: 
			<input id="email" name="email" textField="text" style="width:200px">
			
			&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="javascript:doSearch()" class="easyui-linkbutton" iconCls="icon-search">搜索</a>
		</div>
	</div>
</body>
</html>