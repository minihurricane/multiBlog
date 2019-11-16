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
<title>分类 | MyBlog</title>


<!-- Bootstrap core CSS -->
<link
	href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet"> 
<!-- Custom styles for this template -->
<link href="signin.css" rel="stylesheet">


<%-- <link type="text/css" rel="stylesheet" href="${webContent }css/public.css" /> --%>
<%-- <link type="text/css" rel="stylesheet" href="${webContent }css/sort.css" /> --%>
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
#footer{
	float:left;
	height:10%;
	width:100%;
	/**background-color:#0F0;*/
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
</head>
<body>
	<div class="head_line"></div>

	<div class="container" id="main">

		<!--导航-->
		<div id="left_content"> 
        	<div id="fixed_content">  
        	<div class="" id="">
					<h2>						
						<a href="${webContent }index.jsp"  style="color: #337ab7;font-weight:normal;">MyBlog</a>
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
				<form action="${webContent}searchArticle.action" method="post" >
					<input type="text" id="search_text" name="title"/>
					<input type="submit" value="搜索博客" onclick="return search_form()"/>
				
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

				<a href="${webContent}addArticle.action"> <span class="glyphicon glyphicon-plus">&nbsp;&nbsp;写新文章&nbsp;&nbsp;</span>
				</a><br/><br/>
				<a href="${webContent}userManageArticle.action?get=${USER_SESSION.user_id }"> <span
						class="glyphicon glyphicon glyphicon-user">&nbsp;&nbsp;管理更多&nbsp;&nbsp;</span>
				</a>
				</c:if>                  
            </ul>    
           
         </div> 
                        
   		 </div>
			<div class="col-md-2" id="center_content" style="margin:0;padding:0;"></div>
			<div class="col-md-7 " id="right_Content">
				
				<div class="list-group">
					<a href="#" class="list-group-item active">分类</a>
					<!-- 这里初始化列表 -->					
					<c:forEach var="map" items="${sort_article_map}">					
					<div class="sort_name">
					<!-- 分类名字 -->
					<span class="glyphicon glyphicon-triangle-bottom"></span>	&nbsp;	&nbsp;${map.key}					
					</div>
					<div>
					<!-- 分类信息 -->
					<ul class="list-group">
					<!--因为map为键值对，所以循环内部又弄一个循环来来获取值 -->
						<c:forEach var="list" items="${map.value}">
						<li class="list-group-item">
									<div>
										<div>
										<a href="${webContent }Article.action?id=${list.article_id}">${list.title}</a>
										</div>
										<div class="c_right">
										<img src="${webContent }img/time.png">
										${list.time}&nbsp;&nbsp;&nbsp;&nbsp;
										${list.getUser().getUsername()}&nbsp;&nbsp;&nbsp;&nbsp; 
										<span class="visit"><img src="${webContent }img/visit.png">
										${list.visit}	</span>
										</div>
									</div>
						</li>
						</c:forEach>					
					</ul>
					</div>								
					</c:forEach>					
					<!-- 初始化列表完成 -->

				</div>
			</div>
		</div>

		
	</div>
	<!-- container -->


	<div id="footer">
		<center>
		<a target="_blank" href="#" style="color: #337ab7;font-weight:normal;"> <img
			src="${webContent}img/github.png" width="22px"
			height="22px" class="img-circle">GitHub
			</a>
        	<font > <span style="font-size:10px">by lemonreds.</span></font>
        </center>
	</div>
	<!-- footer -->

<script type="text/javascript">
function search_form(){
	var search_text=document.querySelector("#search_text");
	if(search_text.value =='' || search_text.value==null){
		alert("搜索框为空！");
		return false;
	}
}
</script>
</body>
</html>