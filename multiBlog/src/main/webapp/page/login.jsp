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
<!-- <link
	href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet"> -->
<!-- Custom styles for this template -->
<%-- <link rel="stylesheet" href="${webContent}css/public.css" />
<link rel="stylesheet" href="${webContent}css/login.css" /> --%>

<style>
*{
	margin:0;
	padding:0;
}

body{
	background:#eee;
}
a{
	text-decoration:none; /**去掉文字的下划线*/
	text-align:center; /**文字居中*/
	
}
#form{
    display: block;
    width:310px;
	height:154px;
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
/**
.form-control{
	width:310px;
	height:34px;
}*/
.form-control {
    display: block;
    width: 284px;
    height: 20px;
    padding: 6px 12px;
    font-size: 14px;
    line-height: 1.42857143;
    color: #555;
    background-color: #fff;
    background-image: none;
    border: 1px solid #ccc;
    border-radius: 4px;
    -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
    box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
    -webkit-transition: border-color ease-in-out .15s,-webkit-box-shadow ease-in-out .15s;
    -o-transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
    transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
}
.btn {
    display: inline-block;
    padding: 6px 12px;
    margin-bottom: 0;
    font-size: 14px;
    font-weight: 400;
    line-height: 1.42857143;
    text-align: center;
    white-space: nowrap;
    vertical-align: middle;
    -ms-touch-action: manipulation;
    touch-action: manipulation;
    cursor: pointer;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
    background-image: none;
    border: 1px solid transparent;
    border-radius: 4px;
}
.btn-group-lg>.btn, .btn-lg {
    padding: 10px 16px;
    font-size: 18px;
    line-height: 1.3333333;
    border-radius: 6px;
}
.btn-block {
    display: block;
    width:100%;
}
.btn-primary {
    color: #fff;
    background-color: #337ab7;
    border-color: #2e6da4;
}
.visitor {
	position:relative;
	color: #337ab7;
	display: inline-block;
	margin-top: 20px;	
    font-size:14px;
}
#input, #inputpassword {
	margin: 10px 0;
}

#submit {
	margin-top: 10px;
}

#center_content{
	width:340px;
	height:400px;
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
<script>
// 判断是登录账号和密码是否为空
function check(){
    var usercode = $("#usercode").val();
    var password = $("#password").val();
    if(usercode=="" || password==""){
    	$("#message").text("账号或密码不能为空！");
        return false;
    }  
    return true;
}
</script>
</head>
<body>
	
<div class="container">
	<div id="center_content">
    	<h1 >
        	<a href="" style="color: #337ab7;font-weight:normal;">MyBlog</a>
        </h1><br/>
        <font color="red">
			 <%-- 提示信息--%>
			 <span id="message">${msg}</span>
		</font>
         <center>
        <div id="form">
    		<form action="${webContent}getSession.action" method="post" onsubmit="return check()">             	
    		<input type="text" name="username" class="form-control " placeholder="用户名"/><br/>			       	  		
    		<input type="password" name="password" class="form-control" placeholder="密码"/><br/>
           		<!--&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-->          
       			<input type="submit" class="btn btn-lg btn-block btn-primary" value="登录"/>           
       		 </form>
        </div>
       
       
       	 <a href="${webContent }index.jsp" class="visitor">访客登录</a>
       	 <a href="${webContent }register.jsp" class="visitor" >注册</a>
        </center>
    </div>
   
</div>

<div id="footer">
		<a  href="${webContent}adminLogin.action" style="color: #337ab7;font-weight:normal;"> <img
			src="${webContent}img/github.png" width="22px"
			height="22px" class="img-circle">GitHub
		</a>
        <font > <span style="font-size:10px">by lemonreds.</span></font>
 </div>
<script>


</script>
</body>
</html>