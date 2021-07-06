<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">

<head>
<meta charset="utf-8">
<title>你的最爱--bobo网盘</title>

<link href="https://cdn.bootcdn.net/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" rel="stylesheet">

<link rel="icon"
	href="https://cdn.jsdelivr.net/gh/wangyang-o/imgcdn/img/20200512002714.png"
	type="image/x-icon">
<!--  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"> -->
<link rel="stylesheet" href="css/style.css">

</head>

<body>
	<div class="dowebok" id="dowebok">
		<div class="form-container sign-in-container">
			<form action="Modifypassword" method="post">
				<h1>登录</h1>
				<div class="social-container">
					<a href="#" class="social"><i class="fa fa-qq"></i></a> <a href="#"
						class="social"><i class="fa fa-link"></i></a> <a href="#"
						class="social"><i class="fa fa-twitter"></i></a>
				</div>
				<span>使用您的帐号</span> <input type="text" placeholder="用户名" name="user">
				<input type="password" placeholder="旧密码" name="password">
				<input type="password" placeholder="新密码" name="npassword">
				<button type="submit">确定</button>
			</form>
		</div>
		<div class="overlay-container">
			<div class="overlay">
				<div class="overlay-panel overlay-right">
					<p>请使用您的帐号进行登录</p>
					<a href="login.jsp"><button class="ghost" id="signIn">登录页</button></a>
				</div>
			</div>
		</div>
	</div>
	<script src="js/index.js"></script>
		<script type="text/javascript" color="100,50,100" opacity='1' zIndex="-2" count="99" src="//cdn.bootcss.com/canvas-nest.js/1.0.1/canvas-nest.min.js"></script>
	
</body>

</html>