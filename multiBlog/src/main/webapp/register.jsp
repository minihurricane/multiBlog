<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<title>登录 | MyBlog</title>
<!-- Bootstrap core CSS -->
<link
	href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Custom styles for this template -->
<link rel="stylesheet" href="/Blog/css/public.css" />
<link rel="stylesheet" href="/Blog/css/login.css" />
<script type="text/javascript" src="${webContent}js/jquery-3.4.1.js"></script>
<style>
body {
	background: #eee;
}

.container {
	position: fixed;
	top: 50%;
	left: 50%;
	width: 340px;
	height: 400px;
	margin-left: -170px;
	margin-top: -200px;
	text-align: center;
}

#input, #inputpassword {
	margin: 10px 0;
}

#submit {
	margin-top: 10px;
}

.visitor {
	display: inline-block;
	margin-top: 20px;
}

#footer {
	/* 把footer固定在页面底部用absolute */
	position: absolute;
	bottom: 0;
	width: 100%;
	/* 为什么有height之后，文本才居中对齐 */
	height: 60px;
	clear: both;
	text-align: center;
}
</style>
</head>
<body>
       <!-- 登录模块：位置的确定用的是position，再确定上左距离窗口多少来确定登录div的大体位置 -->
	<div class="container">
		<!-- form表单里的action跳的是后端，应该也可以跳前端 -->
		<!-- enctype="application/x-www-form-urlencoded" / enctype="multipart/form-data"-->
		<!-- 是不是form根本就不能在后端用request来 获取值，form传了什么，后端就接收什么，不要用request去获取form传过来的值 -->
		

			<h1>
				<a href="${webContent}index.jsp">MyBlog</a>
			</h1>

			<label for="input" class="sr-only">用户名</label> 
			<input type="text" id="username"
				class="form-control" placeholder="用户名" name="username" /><br/>
			<label for="inputPassword" class="sr-only">密码</label> 
			<input
				type="password" id="password" class="form-control" placeholder="密码"
				name="password" />
			 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<!-- <button class="btn btn-lg btn-primary btn-block" type="submit"
				id="submit">登录</button> -->
			<center><input type="button" class="btn btn-lg btn-primary btn-block" value="立即注册" onclick="register()"/></center>
								
	</div>


	<div id="footer">
		<a target="_blank" href="#"> <img src="${pageContext.request.contextPath}/img/github.png"
			width="22px" height="22px" class="img-circle">GitHub
		</a> by lemonreds.
		
	</div>
	<!-- footer -->

	<script type="text/javascript">
		/* 该register函数需要调用jQuery */
		function register() {
			var username = $("#username").val();	//$("#username") -->之所以要用#username ，为了获取到id为username的标签？
			var password = $("#password").val();
			/* var webContent=${webContent};
			alert("项目路径："+webContent); --> 注释该代码则能运行 */
			alert("username:"+username+"password:"+password); 
/* 			user/register：后端的register并不是form表格的action，故后端的register不用method = RequestMethod.POST */
			//$.post()并不像之前的前跳后，后跳前；而是前端调用完后端后，将结果在前端显示
			$.post("${webContent}user/register.action?username=" + username
					+ "&password=" + password, 
				function(msg) {
				if (msg == 'success') {
					location.href = "${webContent}page/login.jsp";	//注册成功后，要自己再登录一遍
				} else {
					alert(msg);
				}
			});
		}
	</script>
</body>
</html>