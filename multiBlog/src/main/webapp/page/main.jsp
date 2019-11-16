<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<title>首页 | MyBlog</title>
<!-- Bootstrap core CSS -->
<link
	href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet"> 
<!-- Custom styles for this template -->
<link rel="stylesheet" href="signin.css">

<link type="text/css" rel="stylesheet" href="./css/main.css" />
<link type="text/css" rel="stylesheet" href="${webContent}css/public.css" />
<link type="text/css" rel="stylesheet" href="${webContent}css/sort.css" />

<style>
*{
	margin:0;
	padding:0;
}
html,body{
	height:100%;
	background: #eee;
}
a{
	text-decoration:none; /**去掉文字的下划线*/
	text-align:center; /**文字居中*/
	
}

#left_content{
	position:relative;
	float:left;
	/**background:#FF0;*/
	/**height:100%;*/
	width:30%;
	height:90%;
	
}
#fixed_content{
	position:fixed;
	top:10px;
	left:40px;
}
#right_content{
	top:0;
	width:70%;
	height:90%;
	float:left;
	/**background-color:#F00;*/
	
}
#footer{
	/* 把footer固定在页面底部用absolute */
	position: absolute;
	bottom: 0;
	width: 100%;
	/* 为什么有height之后，文本才居中对齐 */
	height: 60px;
	clear: both;
	text-align: center;
}
.container{
	
	width:100%;
	height:100%;
}

.articleContent{		
		 font-size: 12px;
        overflow: hidden;
        text-overflow: ellipsis;
        -webkit-line-clamp: 2;
        white-space: nowrap;        
}
.menu{
	padding:0 0 0 0;
	position:relative;
	float:left;
	width:500px;	
	height:90%;
	
	
}
.innermenu{
	width:auto;	
}
.menu li{
	position:relative;	
	list-style-type:none;
	line-height:30px;
	
	
	width:200px;
	height:30px;
	/**background-color:#84C1FF;*/
	
}
.menu li ul{ /**没有悬停时的：隐藏*/
	width:300px;
	height:auto;
	position:absolute;/**保证第二级列表不乱动*/
	left:-3000px;
}
.menu li:hover{
	/**background-color:#C30;*/
}
.menu li:hover ul{ /**悬停时：不隐藏；float:left*/
	position:absolute;
	left:auto;/*来进入视线范围*/
	
}

.menu li ul li{
	width:30px;
	height：400px;
	float:left;
}
.list-group{
	padding-left: 0;
    margin-bottom: 20px;
}
.list-group-item {
	width:112%;
    position: relative;
    display: block;
    padding: 10px 15px;
    margin-bottom: -1px;
    background-color: #fff;
    border: 1px solid #ddd;
}
.col-md-7{
	margin:1% 0 0 20%;
    width: 70%;
}

</style>
<script type="text/javascript">
function search_form(){
	var search_text=document.getElementById("search_text");
	console.log("search_text: "+search_text);
	if(search_text.value ==''||search_text.value==null){
		alert("搜索框为空！");
		return false;
	}
}
</script>
</head>

<body>
	<div class="container">
   	 <!--导航-->
		<div id="left_content"> 
        	<div id="fixed_content">  
        	<div class="" id="">
					<h2>
						<a href="${webContent}userLogin.action" style="color: #337ab7;font-weight:normal;">MyBlog</a>
					</h2>
					<img src="${webContent}img/header.jpg"
						height="130" width="130" alt="丢失了我的头像?" class="img-circle">
					
					<h5 class="text-muted">用户：${USER_SESSION.username}</h5>					
					<a href="${webContent}logoutSession.action">
					<i class=""></i>退出登录
					</a>									
			</div> 	
			<br/>			
			<div id="searchBox">
				<form action="${webContent}searchArticle.action" method="post" onsubmit="return search_form()" >
					<input type="text" id="search_text" name="title"/>
					<input type="submit" value="搜索博客" />
				
				</form>
			</div>

			<ul class="menu">
            	<li><a href="${webContent }index.jsp">首页</a>
                </li>       
                <li ><a href="${webContent}listSort.action?get=all">分类</a>
                	<!--<ul class="innermenu">
                    	<li>程序员</li>                     
                        <li>前端</li>
                        <li>后端</li>
                        <li>架构</li>
                        <li>数据库</li>
                        <li>游戏开发</li>
                        <li>安全</li>
                        <li>计算机基础</li>
                        <li>移动开发</li> 
                         <li>框架</li>                                           
                        <li>其他</li>
                    </ul>-->
                </li>    
                <li>
					<a href="${webContent}listTags.action?get=all">标签</a>                	
                </li>  
                <li class="innermenu">
					<a href="${webContent}listAxis.action">时间轴</a>                	
                </li>  
                <li class="innermenu">
					<a href="${webContent}page/about.jsp">关于</a>                	
                </li> 
                 <c:if test="${USER_SESSION.username!=null}">

				<a href="addArticle.action"> <span class="glyphicon glyphicon-plus">&nbsp;&nbsp;写新文章&nbsp;&nbsp;</span>
				</a><br/><br/>
				<a href="userManageArticle.action?get=${USER_SESSION.user_id }"> <span
						class="glyphicon glyphicon glyphicon-user">&nbsp;&nbsp;管理更多&nbsp;&nbsp;</span>
				</a>
				</c:if>                  
            </ul>    
           
            </div> 
                        
   		 </div>
   
  	 	<!--left_content-->
   		<div id="center_content" style="margin:0;padding:0;"></div>
   		 <!--right_content-->
  		 <div  id="right_content" >
           <div class="col-md-7">    			
           	 <br /> <br />
					<div class="list-group">
						<span href="#" class="list-group-item active">文章</span>
						<!-- 这里初始化文章列表 -->
						<c:forEach var="article" items="${article_list}">
							<div class="list-group-item">
							<%-- /Blog-master/Article?id=${article.id}: 前端用？传参给后端，则后端可以用request来获取值 --%>	

								<h4>
									<a
										href="${webContent}Article.action?id=${article.article_id}">${article.title}</a>
								</h4>
								<br /> <span>${article.time}&nbsp;&nbsp;&nbsp;&nbsp;</span> ${article.getUser().getUsername()}
								<%-- <a
								href="${webContent}SortServlet.action?get=${article.sort}">${article.sort}</a> --%>
								&nbsp;&nbsp;&nbsp;&nbsp;
								<span>阅读次数: ${article.visit}</span> <br />
								<br /> <p class="articleContent">${article.content}</p> <br />
								<br />
								<br />
								<%-- /Blog-master/ArticleController?id=${article.id} --%>
								<!-- 前端超链接能直接跳 后端控制器吗？？？ -->
								<!-- 超链接的href可以直接输入后端控制器的映射地址 -->
								<%-- <a href="/Blog-master/ArticleController?id=${article.id}"> --%>
								<a href="Article.action?id=${article.article_id}">阅读全文</a> <br />
							</div>
						</c:forEach>
						<!-- 初始化文章列表完成 -->
					</div>
   			 </div>
            </div> 
  		  <!--right_content-->
   		 <div id="footer" >
   		    <center>
			<a target="_blank" href="#" style="color: #337ab7;font-weight:normal;"> <img
			src="${webContent}img/github.png" width="22px"
			height="22px" class="img-circle">GitHub
			</a>
        	<font > <span style="font-size:10px">by lemonreds.</span></font>
        	</center>
   	 	</div>
   	 	<!--footer-->
    
    </div>

</body>
</html>
