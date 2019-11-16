<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String webContent = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	request.setAttribute("webContent", webContent);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理 | MyBlog</title>


<!-- Bootstrap core CSS -->
<link
	href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Custom styles for this template -->
<link href="signin.css" rel="stylesheet">

<link type="text/css" rel="stylesheet" href="./css/public.css" />
<link type="text/css" rel="stylesheet" href="./css/admin.css" />

<script src="./js/admin.js"></script>

</head>
<body>
	<div class="head_line"></div>
	<div class="container" id="main">

		<div id="header">
			<div>
				<h2>
					<a href="${webContent}login.action">MyBlog </a><br/>									
				</h2>
				<h5 class="text-muted">有点粗糙 但能用就行</h5>
			</div>
		</div>		
		<div id="searchBox">
			<form action="${webContent}searchArticle.action" method="post" >
				<input type="text" id="search_text" name="title"/>
				<input type="submit" value="搜索博客" Onclick="search_form()"/>			
			</form>
			<div>
				
			</div>
		</div>				
		<br/>
		<!-- 提示信息：搜索不到内容时 -->
		<c:if test="${showSearchArticle_msg!=null || showSearchArticle_msg !=''}">
			<h3><span>${showSearchArticle_msg}</span></h3>
		</c:if>
		<!-- 这里初始化列表 -->					
		<c:forEach var="article" items="${searchArticles}">					
				
				<div>
				<!-- 分类信息 -->
				<ul class="list-group">
				<!--因为map为键值对，所以循环内部又弄一个循环来来获取值 -->
				
				<li class="list-group-item">
							<span><a href="${webContent }Article.action?id=${article.article_id}">${article.title}</a></span>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<span>${article.getUser().getUsername() }</span>
					<div class="r_div">
						<!-- a.time：无 -->
						<span>${article.time}</span> <a
							href="${webContent }AdminData.action?article_id=${article.article_id}">
							
						</a>						
					</div>
				</li>
									
				</ul>
				</div>								
		</c:forEach>					
	<!-- 初始化列表完成 -->
		
		<div class="foot_line"></div>
	</div>
	<!-- container -->

	<!-- <div id="footer">
		<a href="#">&nbsp;&nbsp;MyBlog</a>
	</div> -->

<script type="text/javascript">
function search_form(){
	var search_text=document.querySelector("#search_text");
	if(search_text.value ==''||search_text.value==null){
		alert("搜索框为空！");
		return false;
	}
}
</script>
</body>
</html>