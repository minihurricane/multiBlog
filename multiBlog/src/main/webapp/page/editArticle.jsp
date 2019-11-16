<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String webContent = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	request.setAttribute("webContent", webContent);
	request.setCharacterEncoding("gb2312");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>新的文章 | MyBlog</title>


<!-- Bootstrap core CSS -->
<link
	href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="signin.css" rel="stylesheet">
<link type="text/css" rel="stylesheet" href="./css/add.css" />

<link rel="stylesheet" href="./editormd/css/style.css" />
<link rel="stylesheet" href="./editormd/css/editormd.css" />

<script src="./editormd/js/zepto.min.js"></script>
<script src="./editormd/js/editormd.js"></script>

<script src="./js/add.js"></script>
</head>
<body>
	<div class="head_line"></div>
	<div class="container" id="main">
		<div id="title">
			<h2>
				<a href="${webContent}index.jsp">MyBlog</a>
			</h2>
		</div>

		<form action="${webContent}updateArticle.action?article_id=${editArticle.article_id}" method="post"
			onsubmit="return checkSubmit();">

			<div class="info">
				<!-- title -->
				<span class="help">标题</span> <input type="text" class="form-control"
					id="title1" name="title" value="${editArticle.title }">
				<!-- time -->
				<span class="help">时间</span> <input type="text" class="form-control"
					id="time1" name="time" value="${editArticle.time}" readonly="readonly" />
				<!-- author-->
				<span class="help">作者</span> <input type="text" class="form-control"
					id="user1" name="author" value="${editArticle.getUser().getUsername()}"
					readonly="readonly" />
				<!-- sort -->
				<span class="help">分类</span><br />

				<%-- <c:forEach var="s"  items="${sort_count}">
 				<input class="btn btn-default" type="button" value="${s.key}" onclick="sort_click(this)"> &nbsp;					
 				</c:forEach> 	 --%>
				<!-- <input type="text" class="form-control"  id="sort" name="sort"> -->
				<select name="sort" class="form-control" id="sort" value="${editArticle.getSort().getSort() }">
					<option value="程序人生">程序人生</option>
					<option value="前端">前端</option>
					<option value="后端">后端</option>
					<option value="架构">架构</option>
					<option value="数据库">数据库</option>
					<option value="游戏开发">游戏开发</option>
					<option value="安全">安全</option>
					<option value="计算机基础">计算机基础</option>
					<option value="移动开发">移动开发</option>
					<option value="其他">其他</option>
				</select>

				<!-- tag -->
				<span class="help">标签</span><br />
				<c:forEach var="tag" items="${all_tag}">
					<input class="btn btn-default" type="button" value="${tag.tag}"
						onclick="tags_click(this)">&nbsp;
		   		</c:forEach>
		   		
		   		<c:forEach var="tags" items="${editArticle.getTag() }">
		   			<input type="text" class="form-control" id="tags1" name="tags" value="${tags.getTag()}">
		   		</c:forEach>
				
			</div>


			<div class="foot_line"></div>
			<!-- content -->
			<div class="editormd" id="mdView">								
				<textarea id="content1" name="content" >
					${editArticle.content }
				</textarea>
			</div>
			<br /> <input class="btn btn-default" type="submit" value="提交" />
		</form>

		<div class="foot_line"></div>
		<!-- container -->
	</div>
	<!-- container -->

	<div id="footer">
		<a href="#">&nbsp;&nbsp;MyBlog</a>

	</div>
	<!-- footer -->

<script type="text/javascript">
var testEditor;
var jQuery = Zepto;
$(function() {
		testEditor = editormd("mdView", {
			width  : "90%",
			height : 720,
			path   : './editormd/lib/',
            codeFold : true,
            searchReplace : true,
            saveHTMLToTextarea : true,    // 保存 HTML 到 Textarea                   
            htmlDecode : "style,script,iframe|on*", // 开启 HTML 标签解析，为了安全性，默认不开启
            emoji : true,
            taskList : true,
            tocm: true,      
            tex : true,  
            flowChart : true,  
            sequenceDiagram : true,   
            imageUpload : true,
	        imageFormats : ["jpg", "jpeg", "gif", "png", "bmp", "webp"],				        
	        imageUploadURL : "/Blog/UploadPic",
	        //后台只需要返回一个 JSON 数据				      
			onload : function() {
				//console.log("onload =>", this, this.id, this.settings);
			}
		});				
		editor.setToolbarAutoFixed(false);//工具栏自动固定定位的开启与禁用               
});
				
		function checkSubmit() {
			var title = document.querySelector('#title1');
			var time = document.querySelector('#time1');
			var author = document.querySelector('#user1');
			var tags=document.querySelector('#tags1');
			var content = document.querySelector('#content1');

			if (title.value=='' || title.value==null) {
				alert('标题不能空！');
				title.focus();
				return false;
			}
			if (time.value=='' || time.value==null) {
				alert('时间不能为空！');
				return false;
			}
			if (author.value=='' || author.value==null) {
				alert('作者不能为空！');
				return false;
			}
			if(tags.value==null || tags.value==''){
				alert('标签不能为空！');
				return false;
			}			
			if (content.value=='' || content.value==null) {
				alert('博客内容不能为空！');
				return false;
			}

			return true;
		}
</script>

</body>
</html>