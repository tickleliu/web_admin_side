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
<!-- 配置文件 -->
<script type="text/javascript" charset="utf-8"
	src="ueditor/ueditor.config.js">
</script>
<!-- 编辑器源文件 -->
<script type="text/javascript" charset="utf-8"
	src="ueditor/ueditor.all.min.js">
</script>
<!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
<!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
<script type="text/javascript" charset="utf-8"
	src="ueditor/lang/zh-cn/zh-cn.js">
</script>
<script>
/*		function sub(){
			var content = $("content").val();
			alert(content);
			return false;
			
		}*/
	</script>
<!-- 默认样式 -->
<link type="text/css" href="ueditor/themes/default/css/ueditor.css"
	rel="stylesheet" />

<link type="text/css" href="admin/assets/css/base.css"
	rel="stylesheet" />
	
<link rel="stylesheet" type="text/css" href="/css/public.css" />
<!-- 上传图片 -->
<script src="admin/assets/js/jquery-2.1.3.min.js"></script>
<script src="js/vendor/jquery.ui.widget.js"></script>
<script src="js/jquery.iframe-transport.js"></script>
<script src="js/jquery.fileupload.js"></script>
<script type="text/javascript" src="js/jquery.uploadify.min.js"></script>

</head>

<body>


	<form action="info/info_modify" method="post" id="myform">

		<div style="float:left;width:50%;height:300px">
			
				<div style="height:16%">
					<input type="hidden" id="aid" name="aid" value="${aid}"/>
				 	<a>标题： </a>
					<input type="text" name="title" id="title" value='${title}' style="width:500px" />
				</div>
				<div style="height:16%">
					<a>作者：</a> 
					<input type="text" name="author" id="author" value='${author}' style="width:200px" />
				</div>
				<div style="height:16%">
					<a>类别：</a>
				 <select name="category" id="category" style="width:200px"> 
					<c:forEach var="item" items="${categories}" varStatus="s">
						<option value="${s.count}" 
							<c:if
								test="${category == s.count}">
								selected="true"
							</c:if>
						>${item}</option>
					</c:forEach>
				</select>
				</div>
				<div style="height:16%">
					<a>是推荐页：</a>
					<input type="checkbox" id="irecom" name="irecom" checked='${irecom}' style="vertical-align:sub;"/>
				</div>
				<div style="height:16%">
					<a>是图片页：</a>
					<input type="checkbox" id="igraph" name="igraph" checked='${igraph}' style="vertical-align:sub;"/>
				</div>	
				<div style="height:16%;width:15%">
					<label id="uploadSubmit" class="upload_button" for="fileupload" style="">上传文件</label>
						<form>
							<input id="fileupload" type="file" name="fileupload" style="position:absolute;clip:rect(0 0 0 0);">
						</form>					
				</div>			
			
		</div> 
		<div  style="float:left;width:30%;height:300px">
			<img class="s_img_border" src="${gpath}" id="image" style="max-width:300px;max-height:300px;min-width:50px;min-height:50px;">
		</div>
        <div style="clear:both"></div>
        
        <script>
        $(function () {	
        	if($("#igraph").attr("checked") != "checked") {
					$("#fileupload").css("display", "none");
					$("#image").css("display", "none");
					$("#uploadSubmit").css("display", "none");
				}	else {
					$("#fileupload").css("display", "block");
					$("#image").css("display", "block");
					$("#uploadSubmit").css("display", "block");
				}
			$("#igraph").click(function(){
				if($("#igraph").is(":checked")) {
					$("#fileupload").css("display", "block");
					$("#image").css("display", "block");
					$("#uploadSubmit").css("display", "block");
				}
				else{
					$("#fileupload").css("display", "none");
					$("#image").css("display", "none");
					$("#uploadSubmit").css("display", "none");
				}		
					
				
			});
			
		});
        </script>
		
        <script>
        $(function () {
            $('#fileupload').fileupload({
                dataType: 'json',
				url: "http://localhost:8000/easycms/info/upload?aid=${aid}",
                progressall: function (e, data) {
                    var progress = parseInt(data.loaded / data.total * 100, 10);
                    $('.progress .bar').css(
                        'width',
                        progress + '%'
                    );
                    $('.progress .bar').text(progress + '%');
                },

                done: function(e, data) {
                    $('.progress .bar').text("done");
                },
                success: function(data) {
                $("#image").attr("src", data.url);
                }
            });
        });
        </script>

		<textarea name="content" id="content"></textarea>
		<br />
		<input type="submit" value="提交" style="height:40px;width:60px;" />
		<input type = "button" value ="返回" onclick="window.history.back();" style="height:40px;width:60px;" />
	</form>
	<br />
	
	<!-- 实例化编辑器 -->
	<script type="text/javascript">
			var ue = UE.getEditor("content");
			ue.ready(function() {ue.setContent('${content}');});
	</script>
</body>
</html>
