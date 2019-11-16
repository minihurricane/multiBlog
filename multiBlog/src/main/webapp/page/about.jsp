<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String webContent = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	request.setAttribute("webContent", webContent);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Bootstrap core CSS -->
<link
	href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Custom styles for this template -->
<!-- 引入页面公共样式 -->
<link type="text/css" rel="stylesheet" href="${webContent }css/public.css" />
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
			<div style="margin-top: 120px; text-align: center">
				<h2>about me</h2>
				<h4>MyBlog By minihurricane 2019</h4>
				<h4>MyBlog : https://blog.csdn.net/ifnotcorrect</h4>
				<div style="text-align: center">
					<h4>
						Email : studious.hurricane@qq.com<br /> GitHub:
						###<br /> QQ: ###<br />
					</h4>
				</div>
			</div>
		</div>
	</div>
	
	<div id="footer">
		 <center>			
			<a href="${webContent}adminLogin.action" style="color: #337ab7;font-weight:normal;"><img
			src="${webContent}img/github.png" width="22px"
			height="22px" class="img-circle">GitHub</a>
        	<font > <span style="font-size:10px">by lemonreds.</span></font>
        	</center>
	</div>
	
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