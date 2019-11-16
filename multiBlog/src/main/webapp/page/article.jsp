<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
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
<title>${article.title} | MyBlog</title>
<!-- Bootstrap core CSS -->
<link
	href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="signin.css" rel="stylesheet">

<!-- 引入本页面的特殊样式 -->
<link type="text/css" rel="stylesheet" href="./css/article.css" />
<link type="text/css" rel="stylesheet" href="./css/comment.css" />

<script src="./js/article.js"></script>

</head>
<body>
	<div class="head_line"></div>
	<div class="container" id="main">

		<div class="head">
			<div id="title">
				<h2>
					<a href="${webContent}index.jsp">MyBlog</a>
				</h2>
			</div>
		</div>

		<div id="article">
			<div id="a_head ">
				<h3>${article.title}</h3>
				<br />
				<div>
					<h5>
						<span>${article.time}</span>&nbsp;&nbsp;&nbsp;&nbsp;
						<span>${article.getUser().getUsername() }</span> &nbsp;&nbsp;&nbsp;&nbsp;
						<%-- <a href="${webContent }listSort.action?get=${article.sort}">${article.getSort().getSort()}</a> --%>
						${article.getSort().getSort()}
						
					<%-- ${article.author}  --%>
					</h5>
				</div>
				<div class="r_div">
					<h5>
						<span class="glyphicon glyphicon-eye-open">&nbsp;${article.visit}&nbsp;</span>						
						 <span class="glyphicon glyphicon-heart" id="love">&nbsp;${article.star}&nbsp;</span>
						 <!-- 此处comment为三表联结，但没有实现comment联结，只进行两联结，故不能显示 --> 
						 <%-- <span	class="glyphicon glyphicon-comment">&nbsp;${article.comment}&nbsp; </span> --%>
					</h5>
				</div>
				<div id="tag">
				<%-- <c:forEach var="t" items="${article_tags}">
					<a href="${webContent }listTags?get=${t.tag}">${t.tag}&nbsp;</a>
				</c:forEach> --%>
					<%-- <a href="${webContent }listTags.action?get=${article_tags.tag}">${article_tags.tag}&nbsp;</a> --%>
					${article_tags.tag}&nbsp;
				</div>
			</div>
		</div>
			<div class="line"></div>



			<div id="a_content">
			<!-- 引入 show.jsp 显示文章内容 ${article.content}-->
			<!-- page="/page/showArticle.jsp" 此处可以跳到page层下的视图；视图层可以跳自定义路径下的任意视图 -->
			<!-- 而后端有前后缀，则跳到指定的page层下的视图 -->
			<jsp:include page="/page/showArticle.jsp"/> <%-- 为什么/page前不能加${webContent}	 --%>		
			</div>


			<div>
				<div class="f_div">
					<span class="glyphicon glyphicon-chevron-left"></span>
										
					<c:choose>
						<c:when test="${article_pre!=null}">
							<a href="${webContent }Article.action?id=${article_pre.article_id}">&nbsp;上一篇:${article_pre.title}</a>
						</c:when>					
						<c:otherwise>
							&nbsp;没有更早的文章了
						</c:otherwise>					
					</c:choose>
					
				</div>	
							
				<div class="r_div">
				
						<c:choose>
						<c:when test="${article_next!=null}">
							<a href="${webContent }Article.action?id=${article_next.article_id}">下一篇:&nbsp;${article_next.title}</a>
						</c:when>					
						<c:otherwise>
							&nbsp;没有更多的文章了
						</c:otherwise>					
					</c:choose>
						
					<span class="glyphicon glyphicon-chevron-right"></span>
				</div>
				
				<div>			
				<span class="btn btn-default" style="color:#d9534f;"  onclick="love_article(${article.article_id})" >点赞</span>
				</div>						
				<br/>
			</div>
			
			<div class="line"></div>
			
			<!-- 评论 -->					
			<div class="comment"> 
			
			<div class="r_div">
			<a href="#comment"><span class="glyphicon glyphicon-pencil">&nbsp;写评论....</span></a>
			</div>
					
			<!-- 加载文章评论 -->	
			<c:if test="${user_comment_map!=null}">
			<c:forEach var="map" varStatus="status" items="${user_comment_map}">
			
				<div class="row" >
				<div class="f_div">		
				<img src="${webContent }img/comment.jpg" height="50" width="50"  class="img-circle"/>
				&nbsp;&nbsp;			
				<span style="color: #428bca"> ${map.key}</span>		
				<c:forEach var="list" items="${map.value }">			
					<span>&nbsp;&nbsp;${list.comment_time}</span>
					<div  id="c_content" class="c_left">						
					<pre>${list.content }</pre>			
					</div>			
					<div class="r_div">			
					<a><span class="glyphicon glyphicon-thumbs-up"  onclick="star(this,${list.comment_id})">${list.star}</span></a>
					&nbsp;
					<a><span class="glyphicon glyphicon-thumbs-down" onclick="diss(this,${list.comment_id})">${list.diss}</span></a>
					&nbsp;	
				</c:forEach>
				</div>			
				
					<!-- admin here -->
					<c:if test="${sessionScope.user!=null}">	
						<span class="btn btn-default" style="color:red;" onclick="deletecm(this,${list.comment_id})">删除</span>
						&nbsp;		
					</c:if>		
				</div>			
				<div class="line"></div>
				</div>		
			
			</c:forEach>
			
			</c:if>
			</div>
			<!-- 这里可以扩展子评论 -->			
			
				
			<!-- 写评论 -->
			<div id="comment">
			
			<form action="${webContent }addComment.action?article_id=${article.article_id}&username=${USER_SESSION.getUsername()}" method="post">
				<!-- 用户登录后，才能评论 -->
				<!-- <input  style="width:30%" class="form-control" type="text" name="nickname" id="nickname" value="热心网友"  > -->
				<br/>							
				<textarea style="resize:none; width:100%; height:180px;" name="content" id="content"></textarea>
				<br/>
				<br/>			
				<input  class="btn btn-default"  type="submit"   value="评论" onclick="addComment()"/>	
				<br/>						
			</form>			
			</div>
			<!--  -->    			
			<div class="line"></div>
			 	
	</div>
	<div id="footer">	
	<a href="${webContent }/index.jsp">MyBlog首页&nbsp;&nbsp;</a>|
	<a href="#">&nbsp;&nbsp;返回顶部</a>
	</div>
	<!-- footer -->
	
<script type="text/javascript">
function addComment(){
	
			//var form=document.getElementsByTagName("form")[0];
			//var article_id='${article.article_id}';	//js 中能否使用EL表达式-->否	 
			//之前获取的是整个article，就没有显示，此次是只获取article其中的一部分
			//alert("article_id:"+article_id);
			//var star='${article.star}';
			//form.action=form.action+"article_id="+'${article.article_id}'+"&star="+star+"&nickname="+document.getElementsById("nickname")+"&content="+document.getElementsById("content");
			//alert("action的路径："+form.action);  //为什么没有弹窗
			
	//在添加评论时，判断用户是否登录，否--则要求登录后才能评论		
}
	
</script>
</body>
</html>