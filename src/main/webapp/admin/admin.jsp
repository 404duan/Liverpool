<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>俱乐部管理</title>

<link rel="shortcut icon" href="https://d3j2s6hdd6a7rg.cloudfront.net/v2/JE-469/lfc/images/favicon.png" type="image/png"/>
<!-- Bootstrap -->
<link rel="stylesheet" href="../css/bootstrap.min.css">
<script src="../js/jquery-3.4.1.js"></script>
<script src="../js/bootstrap.js"></script>
    <style type="text/css">
    	@media (min-width: 768px) {
    		#slider_sub{
    			width:250px;
    			margin-top: 51px;
    			position:absolute;
    			z-index: 1;
    			height:600px;
    		}
    		.page_main{
    			background:url("../login/bg/04.jpg") no-repeat;
    			height:600px;
    		 	margin-left: 255px;
    		 	background-size: cover;
    		}
    		iframe{
    			width:1008px;
    			height:600px;
    			border-width: 0px;
    		}
    		#advInfoArea iframe{
    			width:800px;
    		}
    	}
    </style>
</head>
<%
	pageContext.setAttribute("APP_PATH",request.getContextPath());
%>
<body> 

	<!-- 导航 -->
	<nav class="navbar navbar-default navbar-static-top" style="margin-bottom: 0px;">
		
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#slider_sub">
					<span class="sr-only"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">
				<img alt="Brand" src="https://d3j2s6hdd6a7rg.cloudfront.net/v2/JE-469/lfc/images/favicon.png" style="height: 28px; width: 28px;"></a>
				<a href="#" class="navbar-brand">球队管理</a>
			</div>
			<ul class="nav navbar-nav navbar-right" style="margin-right: 25px;">
				<li><a href="${APP_PATH }"><span class="badge" style="background: #C12E2A;">返回主页</span></a></li>
				<li><a href="#" id="logout"><span class="glyphicon glyphicon-off"></span>&nbsp;注销</a></li>
			</ul>

			<!-- 侧边功能栏 -->
			<div class="navbar-default navbar-collapse" id="slider_sub">
				<ul class="nav">
					<li>
						<a href="#sub1" data-toggle="collapse">首页管理<span class="glyphicon glyphicon-chevron-right pull-right"></span></a>
						<ul id="sub1" class="nav collapse">
							<li><a href="#" id="carouArea"><span class="glyphicon glyphicon-picture"></span>&nbsp;首页轮播图</a></li>
							<li><a href="#" id="advArea"><span class="glyphicon glyphicon-facetime-video"></span>&nbsp;宣传片管理</a></li>
							<li><a href="#" id="hisArea"><span class="glyphicon glyphicon-globe"></span>&nbsp;球队历史</a></li>
							<li><a href="#" id="horArea"><span class="glyphicon glyphicon-glass"></span>&nbsp;荣誉管理</a></li>
						</ul>
					</li>
					<li>
						<a href="#sub2" data-toggle="collapse">球员管理<span class="glyphicon glyphicon-chevron-right pull-right"></span></a>
						<ul id="sub2" class="nav collapse">
							<li><a href="#" id="grpArea"><span class="glyphicon glyphicon-camera"></span>&nbsp;合影管理</a></li>
							<li><a href="#" id="playerArea"><span class="glyphicon glyphicon-user"></span>&nbsp;球员信息</a></li>
						</ul>
					</li>
					<li>
						<a href="#sub3" data-toggle="collapse">管理团队<span class="glyphicon glyphicon-chevron-right pull-right"></span></a>
						<ul id="sub3" class="nav collapse">
							<li><a href="#" id="manArea"><span class="glyphicon glyphicon-tags"></span>&nbsp;管理组</a></li>
							<li><a href="#" id="coachArea"><span class="glyphicon glyphicon-user"></span>&nbsp;教练团队</a></li>
						</ul>
					</li>
					<li>
						<a href="#sub4" data-toggle="collapse">商务合作<span class="glyphicon glyphicon-chevron-right pull-right"></span></a>
						<ul id="sub4" class="nav collapse">
							<li><a href="#" id="busiArea"><span class="glyphicon glyphicon-shopping-cart"></span>&nbsp;赞助商信息</a></li>
						</ul>
					</li>
				</ul>
			</div>
	</nav>
	
	<div class="page_main">
		<div class="row" id="publicArea">
			<div id="playerInfoArea" style="display:none;">
				<iframe src="${APP_PATH }/admin/playerList.jsp"></iframe>
				<%-- <jsp:include page="/admin/playerEdit.jsp"></jsp:include> --%>
			</div>
			<div id="carouInfoArea" style="display:none;">
				<iframe src="${APP_PATH }/admin/carouselEdit.jsp"></iframe>
				<%-- <jsp:include page="/admin/carouselEdit.jsp"></jsp:include> --%>
			</div>
			<div id="advInfoArea" style="display:none;">
				<%-- <iframe src="${APP_PATH }/admin/advEdit.jsp"></iframe> --%>
				<jsp:include page="advEdit.jsp"></jsp:include>
			</div>
			<div id="hisInfoArea" style="display:none;margin-left: 10px;">
				<iframe id="hisIframe" src="${APP_PATH }/admin/historyEdit.jsp"></iframe>
			</div>
			<div id="horInfoArea" style="display:none;margin-left: 10px;">
				<iframe src="${APP_PATH }/admin/honorEdit.jsp"></iframe>
			</div>
			<div id="grpInfoArea" style="display:none;margin-left: 10px;">
				<iframe src="${APP_PATH }/admin/grphotoEdit.jsp"></iframe>
			</div>
			<div id="manInfoArea" style="display:none;margin-left: 10px;">
				<iframe src="${APP_PATH }/admin/manEdit.jsp"></iframe>
			</div>
			<div id="coachInfoArea" style="display:none;margin-left: 10px;">
				<iframe src="${APP_PATH }/admin/coachEdit.jsp" class="iframe-box"></iframe>
			</div>
			<div id="busiInfoArea" style="display:none;margin-left: 10px;">
				<iframe src="${APP_PATH }/admin/busiEdit.jsp" class="iframe-box"></iframe>
			</div>
		</div>
		
		
	</div><!-- page_main -->

	
	
	<script type="text/javascript">
	
	$("#logout").click(function() {
		if (confirm("确认退出登录吗？")) {
			$.ajax({
				url:"${APP_PATH}/logout",
				type:"get",
				success:function(res){
					window.location.href = "${APP_PATH}/login/login.jsp";
				}
			});
		}
	})
	
	function changeBg() {
		$(".page_main").css("background","url("+")");
	}
	
		$("#playerArea").click(function() {
			changeBg();
			$("#carouInfoArea").hide();
			$("#advInfoArea").hide();
			$("#hisInfoArea").hide();
			$("#horInfoArea").hide();
			$("#grpInfoArea").hide();
			$("#manInfoArea").hide();
			$("#coachInfoArea").hide();
			$("#busiInfoArea").hide();
			$("#playerInfoArea").show();
		});
		
		$("#carouArea").click(function() {
			changeBg();
			$("#playerInfoArea").hide();
			$("#advInfoArea").hide();
			$("#hisInfoArea").hide();
			$("#horInfoArea").hide();
			$("#grpInfoArea").hide();
			$("#manInfoArea").hide();
			$("#coachInfoArea").hide();
			$("#busiInfoArea").hide();
			$("#carouInfoArea").show();
		});
		
		$("#advArea").click(function() {
			changeBg();
			$("#playerInfoArea").hide();
			$("#carouInfoArea").hide();
			$("#hisInfoArea").hide();
			$("#horInfoArea").hide();
			$("#grpInfoArea").hide();
			$("#manInfoArea").hide();
			$("#coachInfoArea").hide();
			$("#busiInfoArea").hide();
			$("#advInfoArea").show();
		});
		
		$("#hisArea").click(function() {
			changeBg();
			$("#playerInfoArea").hide();
			$("#carouInfoArea").hide();
			$("#advInfoArea").hide();
			$("#horInfoArea").hide();
			$("#grpInfoArea").hide();
			$("#manInfoArea").hide();
			$("#coachInfoArea").hide();
			$("#busiInfoArea").hide();
			$("#hisInfoArea").show();
		});
		
		$("#horArea").click(function() {
			changeBg();
			$("#playerInfoArea").hide();
			$("#carouInfoArea").hide();
			$("#advInfoArea").hide();
			$("#hisInfoArea").hide();
			$("#grpInfoArea").hide();
			$("#manInfoArea").hide();
			$("#coachInfoArea").hide();
			$("#busiInfoArea").hide();
			$("#horInfoArea").show();
		});
		
		$("#grpArea").click(function() {
			changeBg();
			$("#playerInfoArea").hide();
			$("#carouInfoArea").hide();
			$("#advInfoArea").hide();
			$("#hisInfoArea").hide();
			$("#horInfoArea").hide();
			$("#manInfoArea").hide();
			$("#coachInfoArea").hide();
			$("#busiInfoArea").hide();
			$("#grpInfoArea").show();
		});
		
		$("#manArea").click(function() {
			changeBg();
			$("#playerInfoArea").hide();
			$("#carouInfoArea").hide();
			$("#advInfoArea").hide();
			$("#hisInfoArea").hide();
			$("#horInfoArea").hide();
			$("#grpInfoArea").hide();
			$("#coachInfoArea").hide();
			$("#busiInfoArea").hide();
			$("#manInfoArea").show();
		});
		
		$("#coachArea").click(function() {
			changeBg();
			$("#playerInfoArea").hide();
			$("#carouInfoArea").hide();
			$("#advInfoArea").hide();
			$("#hisInfoArea").hide();
			$("#horInfoArea").hide();
			$("#grpInfoArea").hide();
			$("#manInfoArea").hide();
			$("#busiInfoArea").hide();
			$("#coachInfoArea").show();
		});
		
		$("#busiArea").click(function() {
			changeBg();
			$("#playerInfoArea").hide();
			$("#carouInfoArea").hide();
			$("#advInfoArea").hide();
			$("#hisInfoArea").hide();
			$("#horInfoArea").hide();
			$("#grpInfoArea").hide();
			$("#manInfoArea").hide();
			$("#coachInfoArea").hide();
			$("#busiInfoArea").show();
		});
	
	</script>
	
	
	
</body>

</html>