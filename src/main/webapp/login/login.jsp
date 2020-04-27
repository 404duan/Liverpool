<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>后台登录</title>

<%
	pageContext.setAttribute("APP_PATH",request.getContextPath());
%>
<script type="text/javascript" src="${APP_PATH }/static/js/jquery-1.12.4.min.js"></script>
<link href="${APP_PATH }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
<script src="${APP_PATH }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="style.css">
<link rel="shortcut icon" href="https://d3j2s6hdd6a7rg.cloudfront.net/v2/JE-469/lfc/images/favicon.png" type="image/png"/>

</head>
<body>
	
	<!-- 忘记密码 -->
	<div class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" id="updateModal">
	  <div class="modal-dialog modal-sm" role="document">
	    <div class="modal-content">
	    	<div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title">密码重置</h4>
		    </div>
		    <div class="modal-body">
		        <form>
		        	<div class="form-group" id="userDiv">
					    <label for="usernameInput">管理员账号</label>
					    <input type="text" class="form-control" id="usernameInput" name="admName" placeholder="Username">
					</div>
		        	<div class="form-group" id="emailDiv" style="display: none;">
					    <label for="emailP">密保邮箱</label>
					    <p class="form-control-static"></p>
					</div>
					<div class="form-group" id="wholeEmailDiv" style="display: none;">
					    <label for="emailInput">完整邮箱</label>
					    <input type="email" class="form-control" id="emailInput" name="admEmail" placeholder="Email">
					    <button type="button" class="btn-default" id="sendVerf" style="margin-top:4px;border: 1px solid rgb(204, 204, 204);">发送验证码</button>
					</div>
					<div class="form-group" id="verfDiv" style="display: none;">
					    <label for="verfInput">验证码</label>
					    <input type="text" class="form-control" id="verfInput" placeholder="验证码">
					</div>
					<div class="form-group" id="pswDiv" style="display: none;">
					    <label for="exampleInputPassword0">新密码</label>
					    <input type="password" class="form-control" id="exampleInputPassword0" name="admPassword" placeholder="Password">
					</div>
					<div class="form-group" id="pswConDiv" style="display: none;">
					    <label for="exampleInputPassword1">确认密码</label>
					    <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
					</div>
		        </form>
		        	<button type="button" id="submitbtn" class="btn btn-default" style="color:black;border: 1px solid rgb(204, 204, 204);">下一步</button>
		        	<button type="button" id="savebtn" class="btn btn-default" style="display:none;color:black;border: 1px solid rgb(204, 204, 204);">更改密码</button>
		    </div>
	      
	    </div>
	  </div>
	</div>
	
	<div class="login-box" id="loginDiv">
		<h1>Login</h1>
		<form>
			<div class="textbox form-group">
				<i class="fa fa-user" aria-hidden="true"></i>
				<input type="text" id="username" name="admName" placeholder="管理员">
			</div>
			
			<div class="textbox form-group">
				<i class="fa fa-lock" aria-hidden="true"></i>
				<input type="password" id="password" name="admPassword" placeholder="密码">
			</div>
			
			<div class="verifbox">
				<img alt="" src="icons/验证码.png">
				<input type="text" placeholder="验证码" id="ver_input">
				<div class="code" onclick="changeCode()" title="换一张" id="checkCode">
					<!-- 验证码区域 -->
				</div>
			</div>
		
			<div class="checkbox form-group" style="padding-left:7px;">
			    <label>
			      <input type="checkbox" name="remember"> 一天内免登录
			    </label>
			    <a class="forget" href="#" data-toggle="modal" data-target=".bs-example-modal-sm">忘记密码</a>
			</div>
			<input class="btn" type="button" value="登录" onclick="signOn()">
		</form>
		<a href="${APP_PATH }" style="color: white;float:right;">回首页</a>
		
	</div>

	<!-- <div class="footer">Copyright © 2020 段琦</div> -->

</body>
<script type="text/javascript">

var code; //在全局定义验证码
//产生验证码
window.onload = function() {
	changeCode();
}

function changeCode() {
	$("#checkCode").empty();//先把原来的清掉
	code = "";
	var codeLength = 4; //验证码的长度
	var random = new Array(0, 1, 2, 3, 4, 5, 6, 7, 8, 9,
			'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', 
			'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i','j', 'k','l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'); //随机数   
	for (var i = 0; i < codeLength; i++) { //循环操作
	    var charIndex = Math.floor(Math.random() * 62); //取得随机数的索引
	    code += random[charIndex]; //根据索引取得随机数加到code上
	}
	//把code值赋给验证码区域
	for (var i = 0; i < codeLength; i++) {
		var getRandomColor = function() {
			//深色
			return '#' +
				(function(color) {
					return(color += '5678956789defdef' [Math.floor(Math.random() * 16)]) &&
						(color.length == 6) ? color : arguments.callee(color);
				})('');
			//浅色
			/* return '#' +
					(function(color) {
						return(color += '0123401234abcabc' [Math.floor(Math.random() * 16)]) &&
							(color.length == 6) ? color : arguments.callee(color);
					})(''); */
		}
		var span = $("<span></span>").append(code[i]).css("color",getRandomColor);
		span.appendTo($("#checkCode"));
	}
}
//校验验证码
function validate() {
	var inputCode = document.getElementById("ver_input").value.toUpperCase(); //取得输入的验证码并转化为大写
	if (inputCode.length <= 0) { //若输入的验证码长度为0
	    alert("请输入验证码！"); //则弹出请输入验证码
	    return false;
	} else if (inputCode != code.toUpperCase()) { //若输入的验证码与产生的验证码不一致时
	    alert("验证码输入错误！"); //则弹出验证码输入错误
	    changeCode(); //刷新验证码
	    return false;
	} else { //输入正确时
	    return true;
	}
}

//登录
function signOn() {
	if (!validate()) {
		$("#ver_input").val("");
		return;
	}else if ($("#username").val() == "") {
		alert("请输入用户名！");
		return;
	}else if ($("#password").val() == "") {
		alert("请输入密码！");
		return;
	}else {
		$.ajax({
			url:"${APP_PATH}/login",
			type:"get",
			data:$("#loginDiv form").serialize(),
			success:function(res){
				//console.log(res);
				if (res.code == 200) {
					window.location.href = "${APP_PATH}/admin/admin.jsp";
				}else if (res.code == 400) {
					alert("用户名或密码错误！");
				}else {
					alert("请重试！");
				}
			},
			error:function(res){
				alert("网络异常，请重试！");
				//console.log(res);
			}
		});
	}
}


/* 忘记密码 */
var wholeEmail;
var verfCode;
$("#submitbtn").click(function() {
	if ($("#usernameInput").val() == "") {
		alert("请输入要找回的管理员账号！");
		return;
	}
	$.ajax({
		url:"${APP_PATH}/findByName/"+$("#usernameInput").val(),
		type:"get",
		success:function(res){
			//console.log(res);
			if(res.extend.admin == null){
				alert("没有此管理员！");
				return;
			}
			wholeEmail = res.extend.admin.admEmail;
			$("#emailDiv").css("display","");
			$("#emailDiv").children("p").text(hidePartEmail(res.extend.admin.admEmail));
			$("#wholeEmailDiv").css("display","");
			$("#pswDiv").css("display","");
			$("#pswConDiv").css("display","");
			$("#savebtn").css("display","");
			$("#savebtn").attr("edit-id",res.extend.admin.admId);
			$("#verfDiv").css("display","");
			$("#submitbtn").css("display","none");
			$("#userDiv").css("display","none");
		}
	});
})

function hidePartEmail(str) {
	var newStr;
	newStr = "*****"+str.substring(5,str.length);
	return newStr;
}

$("#sendVerf").click(function() {
	if ($("#emailInput").val() == "") {
		alert("请输入完整邮箱！");
		return;
	}
	if($("#emailInput").val() != wholeEmail){
		alert("邮箱不正确！");
		return;
	}
	$.ajax({
		url:"${APP_PATH}/mail/sendVerf",
		type:"get",
		data:"admEmail="+wholeEmail,
		success:function(res){
			if(res.code == 200){
				verfCode = res.extend.verf;
				$("#sendVerf").attr('disabled',true);
				i = 30;//30s倒计时
				change();
				alert("发送成功！")
			}else if (res.code == 400) {
				alert("发送失败！");
			}
		}
	});
	
})

function change() {
	$("#sendVerf").text("重新发送("+i+"s)");
	if (i==0) {
		$("#sendVerf").text("重新发送");
		$("#sendVerf").attr('disabled',false);//倒计时结束，按钮可点击
	}else {
		setTimeout("change()", 1000);
	}
	i--;
}

$("#savebtn").click(function() {
	if($("#verfInput").val() == ""){
		alert("请输入验证码！");
		return;
	}else if ($("#verfInput").val() != verfCode) {
		alert("验证码错误！");
		return;
	}
	if($("#exampleInputPassword0").val() == ""){
		alert("请输入密码！");
		return;
	}
	if($("#exampleInputPassword1").val() == ""){
		alert("请输入确认密码！");
		return;
	}
	if($("#exampleInputPassword0").val() != $("#exampleInputPassword1").val()){
		alert("两次输入密码不一致！");
		return;
	}
	if(confirm("确认更改吗？")){
		$.ajax({
			url:"${APP_PATH}/updPsw/"+$(this).attr("edit-id"),
			type:"PUT",
			data:$("#updateModal form").serialize(),
			success:function(res){
				alert("密码更改成功！");
				location.reload();
			}
		});
	}
})
</script>
</html>