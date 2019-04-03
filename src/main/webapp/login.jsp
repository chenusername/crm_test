<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri ="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"><html>
<head>
<meta charset="UTF-8">
<%
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath() + "/";
%>
<base href="<%=basePath%>">
<link href="jquery/bootstrap_3.3.0/css/bootstrap.min.css"
	type="text/css" rel="stylesheet" />
<script type="text/javascript" src="jquery/jquery-1.11.1-min.js"></script>
<script type="text/javascript"
	src="jquery/bootstrap_3.3.0/js/bootstrap.min.js"></script>
</head>


<script type="text/javascript">
	$(function(){
		$("#loginAct").focus();
		$("#loginBtn").click(function(){
			login();
		})
		$(window).keydown(function(event){
			if(event.keyCode==13){
				login();
			}
		})
		
	})
	//登录采用ajax ,post
	function login(){
		var loginAct = $("#loginAct").val();
		var loginPwd = $("#loginPwd").val();
		alert(loginAct)
		alert(loginPwd)
		if(loginAct==""||loginPwd==""){
			$("#msg").html("账号密码不能为空")
		}
		
		$.ajax({
			url:"settings/user/login.do",
			data:{
				"loginAct":loginAct,
				"loginPwd":loginPwd
			},
			type:"post",
			dataType:"json",
			success:function(data){
				if(data.success){
					window.location.href="workbench/index.jsp"
				}else{
					$("#msg").html(data.msg);
				}
			} 
		})
	}
</script>
<body>
	<div style="position: absolute; top: 0px; left: 0px; width: 60%;">
		<img src="image/IMG_7114.JPG"
			style="width: 100%; height: 90%; position: relative; top: 50px;">
	</div>
	<div id="top"
		style="height: 50px; background-color: #3C3C3C; width: 100%;">
		<div
			style="position: absolute; top: 5px; left: 0px; font-size: 30px; font-weight: 400; color: white; font-family: 'times new roman'">
			CRM &nbsp;<span style="font-size: 12px;">&copy;2017&nbsp;动力节点</span>
		</div>
	</div>

	<div
		style="position: absolute; top: 120px; right: 100px; width: 450px; height: 400px; border: 1px solid #D5D5D5">
		<div style="position: absolute; top: 0px; right: 60px;">
			<div class="page-header">
				<h1>登录</h1>
			</div>
			<form action="workbench/index.html" class="form-horizontal"
				role="form">
				<div class="form-group form-group-lg">
					<div style="width: 350px;">
						<input class="form-control" id="loginAct" type="text"  placeholder="用户名">
					</div>
					<div style="width: 350px; position: relative; top: 20px;">
						<input class="form-control" id="loginPwd" type="password" placeholder="密码">
					</div>
					<div class="checkbox"
						style="position: relative; top: 30px; left: 10px;">

						<span id="msg" style="color: red"></span>

					</div>
					<button type="button" id="loginBtn" class="btn btn-primary btn-lg btn-block"
						style="width: 350px; position: relative; top: 45px;">登录</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>