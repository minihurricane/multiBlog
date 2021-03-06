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
<title>结果 | MyBlog</title>
<!-- Bootstrap core CSS -->
<link
	href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Custom styles for this template -->
<link href="signin.css" rel="stylesheet">

<!-- 引入页面公共样式 -->
<link type="text/css" rel="stylesheet" href="${webContent }css/public.css" />

</head>
<body>
	<div class="head_line"></div>
	<div class="container" id="main">
		<div id="title">
			<h2>
				<a href="${webContent}index.jsp">MyBlog</a>
			</h2>
		</div>
		<div class="row c_center" style="margin: 0, auto;">
			<c:choose>
				<c:when test="${article==null}">
					<h4>更改文章失败了.....</h4>
				</c:when>
				<c:otherwise>
					<%-- 将传给该页面的id ${article.id}，用？作为getOneCreatedArticleById的传参条件 --%>
					<h4>
						成功!是否现在查看文章<a
							href="${webContent}getOneCreatedArticleById.action?id=${article.article_id}">${article.title}</a>
					</h4>
				</c:otherwise>
			</c:choose>


		</div>
		<div class="foot_line"></div>
	</div>
	<!-- container -->
	<div id="footer">
		<a href="${webContent }index.jsp">&nbsp;&nbsp;MyBlog</a>
	</div>
	<!-- footer -->
</body>
</html>