<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>球员列表</title>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<script type="text/javascript" src="${APP_PATH }/static/js/jquery-1.12.4.min.js"></script>
<link href="${APP_PATH }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
<script src="${APP_PATH }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>

<!-- 选择国籍的插件 -->
<script src="../static/selectNation/js/countrypicker.min.js"></script>
<link rel="stylesheet" href="../static/selectNation/js/dependancies/bootstrap-select-1.12.4/dist/css/bootstrap-select.min.css">
<script src="../static/selectNation/js/dependancies/bootstrap-select-1.12.4/dist/js/bootstrap-select.min.js"></script>
<style type="text/css">
.team-player-list{
	clear: both;
	overflow：hidden;
}
.team-player-list h2 {
	color: #333;
	line-height: 1.2;
	margin: 10px 0;
	text-transform: uppercase;
	border-bottom: 3px solid #e31b23;
}
.list-group-item{
	text-align: center;
	max-width:200px;
	max-height:200px;
	margin:4px;
	float:left;
	border: 0;
}
.img-circle{
	max-width:150px;
	max-height:150px;
}
.number{
	color:red;
	font-size:18px;
}
</style>
</head>
<body>
	<!-- 球员新增的模态框 -->
	<div class="modal fade" id="playerAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">新增球员</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal">
						<div class="form-group">
							<label class="col-sm-2 control-label">照片</label>
							<div class="col-sm-10">
								<img alt="" src="" id="preview-photo-add" class="img-circle">
								<input type="file" id="photo-file-add" style="display:none;" onchange="uploadAdd()"/>
								<input type="text" name="playerPhoto" id="filePathAdd" style="display:none;"/>
								<a style="float:right;margin-top:25px;margin-right: 223px;" href="javascript:void(0)" onclick="uploadPhotoAdd()"><span style="font-size: 12px;" class="label label-success">上传图片</span></a>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">姓名</label>
							<div class="col-sm-4">
								<input type="text" name="playerName" class="form-control" id="playerName_add_input">
								<span class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">全名</label>
							<div class="col-sm-4">
								<input type="text" name="playerFullName" class="form-control" id="playerFullname_add">
								<span class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">出生年月</label>
							<div class="col-sm-2" style="padding-right: 0px;">
								<select class="form-control" id="YYYYadd">
									<option value="">年</option>
								</select>
							</div>
							<div class="col-sm-2" style="padding-right: 0px;">
								<select class="form-control" id="MMadd">
									<option value="">月</option>
								</select>
							</div>
							<div class="col-sm-2" style="padding-right: 0px;">
								<select class="form-control" id="DDadd">
									<option value="">日</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">身高</label>
							<div class="col-sm-3">
								<div class="input-group">
								  <input type="text" class="form-control" name="playerHeight" id="height_add_input" placeholder="单位(cm)">
								  <span class="input-group-addon">cm</span>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">体重</label>
							<div class="col-sm-3">
								<div class="input-group">
								  <input type="text" class="form-control" name="playerWeight" id="weight_add_input" placeholder="单位(kg)">
								  <span class="input-group-addon">kg</span>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">球衣号码</label>
							<div class="col-sm-2">
								<input type="text" name="playerNum" class="form-control" id="playerNum_add_input">
								<span class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">位置</label>
							<div class="col-sm-3">
								<select class="form-control" name="playerPos" id="pos_select_add">
									<option value="前锋">前锋</option>
									<option value="中场">中场</option>
									<option value="后卫">后卫</option>
									<option value="门将">门将</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">国籍</label>
							<div class="col-sm-4">
								<select id="nationSelectAdd" class="form-control selectpicker countrypicker" data-live-search="true" name="playerNation"></select>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">周薪</label>
							<div class="col-sm-3">
								<div class="input-group">
								  <input type="text" class="form-control" name="playerWage" id="wage_add_input" placeholder="单位(万)">
								  <span class="input-group-addon">w£</span>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">合同期限</label>
							<div class="col-sm-2" style="padding-right: 0px;">
								<select class="form-control" id="conYYYYadd">
									<option value="">年</option>
								</select>
							</div>
							<div class="col-sm-2" style="padding-right: 0px;">
								<select class="form-control" id="conMMadd">
									<option value="">月</option>
								</select>
							</div>
							<div class="col-sm-2" style="padding-right: 0px;">
								<select class="form-control" id="conDDadd">
									<option value="">日</option>
								</select>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" id="player_add_btn">提交</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 球员修改的模态框 -->
	<div class="modal fade" id="playerUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">编辑球员</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal">
						<div class="form-group">
							<label class="col-sm-2 control-label">照片</label>
							<div class="col-sm-10">
								<img alt="" src="" id="preview-photo" class="img-circle">
								<input type="file" id="photo-file" style="display:none;" onchange="upload()"/>
								<input type="text" name="playerPhoto" id="filePath" style="display:none;"/>
								<a style="float:right;margin-top:25px;margin-right: 223px;" href="javascript:void(0)" onclick="uploadPhoto()"><span style="font-size: 12px;" class="label label-success">上传图片</span></a>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">姓名</label>
							<div class="col-sm-10">
								<p class="form-control-static" id="playerName_static"></p>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">全名</label>
							<div class="col-sm-10">
								<p class="form-control-static" id="playerFullname_static"></p>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">出生年月</label>
							<div class="col-sm-2" style="padding-right: 0px;">
								<select class="form-control" id="YYYY">
									<option value="">年</option>
								</select>
							</div>
							<div class="col-sm-2" style="padding-right: 0px;">
								<select class="form-control" id="MM">
									<option value="">月</option>
								</select>
							</div>
							<div class="col-sm-2" style="padding-right: 0px;">
								<select class="form-control" id="DD">
									<option value="">日</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">身高</label>
							<div class="col-sm-3">
								<div class="input-group">
								  <input type="text" class="form-control" name="playerHeight" id="height_update_input" placeholder="单位(cm)">
								  <span class="input-group-addon">cm</span>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">体重</label>
							<div class="col-sm-3">
								<div class="input-group">
								  <input type="text" class="form-control" name="playerWeight" id="weight_update_input" placeholder="单位(kg)">
								  <span class="input-group-addon">kg</span>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">球衣号码</label>
							<div class="col-sm-2">
								<input type="text" name="playerNum" class="form-control" id="playerNum_update_input" placeholder="">
								<span class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">位置</label>
							<div class="col-sm-3">
								<select class="form-control" name="playerPos" id="pos_select">
									<option value="前锋">前锋</option>
									<option value="中场">中场</option>
									<option value="后卫">后卫</option>
									<option value="门将">门将</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">国籍</label>
							<div class="col-sm-4">
								<select id="nationSelect" class="form-control selectpicker countrypicker" data-live-search="true" name="playerNation"></select>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">周薪</label>
							<div class="col-sm-3">
								<div class="input-group">
								  <input type="text" class="form-control" name="playerWage" id="wage_update_input" placeholder="单位(万)">
								  <span class="input-group-addon">w£</span>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">合同期限</label>
							<div class="col-sm-2" style="padding-right: 0px;">
								<select class="form-control" id="conYYYY">
									<option value="">年</option>
								</select>
							</div>
							<div class="col-sm-2" style="padding-right: 0px;">
								<select class="form-control" id="conMM">
									<option value="">月</option>
								</select>
							</div>
							<div class="col-sm-2" style="padding-right: 0px;">
								<select class="form-control" id="conDD">
									<option value="">日</option>
								</select>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<!-- <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button> -->
					<button type="button" class="btn btn-primary" id="player_update_btn">更新</button>
					<button type="button" class="btn btn-danger" id="player_del_btn">解雇</button>
				</div>
			</div>
		</div>
	</div>

	<div class="container">
		<div class="team-player-list">
			<h2>门将 GOALKEEPERS <span class="badge" id="goalkeeperNum"></span><button id="addPlayer" add-type="门将" type="button" class="btn btn-success" style="float:right;">新增门将</button></h2>
			<ul class="list-group" id="goalkeepers"></ul>
		</div>
		<div class="team-player-list">
			<h2>后卫 DEFENDERS <span class="badge" id="defenderNum"></span><button id="addPlayer" add-type="后卫" type="button" class="btn btn-success" style="float:right;">新增后卫</button></h2>
			<ul class="list-group" id="defenders"></ul>
		</div>
		<div class="team-player-list">
			<h2>中场 MIDFIELDERS <span class="badge" id="midfielderNum"></span><button id="addPlayer" add-type="中场" type="button" class="btn btn-success" style="float:right;">新增中场</button></h2>
			<ul class="list-group" id="midfielders"></ul>
		</div>
		<div class="team-player-list">
			<h2>前锋 FORWARDS <span class="badge" id="forwardNum"></span><button id="addPlayer" add-type="前锋" type="button" class="btn btn-success" style="float:right;">新增前锋</button></h2>
			<ul class="list-group" id="forwards"></ul>
		</div>
	</div>

<script type="text/javascript">
$(function() {
	//显示年月日列表
	YYYYMMDDstart();
	$.ajax({
		url:"${APP_PATH}/getAllPlayers",
		type:"get",
		success:function(res){
			//console.log(res.extend);
			build_playList(res.extend.playList);
		}
	});
})
/* <!--
<li class="list-group-item">
	<a href="javascript:void(0)" playerId=9>
		<img class="img-circle" src="" alt="Roberto Firmino">
		<div class="number">9号</div>
		<span>Roberto Firmino</span>
	</a>
</li>  --> */
function build_playList(playList) {
	var goalkeeperNum=0;
	var defenderNum=0;
	var midfielderNum=0;
	var forwardNum=0;
	$.each(playList,function(index,item){
		var itemLi = $("<li></li>").addClass("list-group-item");
		var itemA = $("<a></a>").prop("href","javascript:void(0)").attr("playerId",item.playerId);
		var itemImg = $("<img>").addClass("img-circle").prop("src",item.playerPhoto);
		var numDiv = $("<div></div>").append(item.playerNum+"号").addClass("number");
		var nameSpan = $("<span></span>").append(item.playerName);
		if (item.playerPos == "门将") {
			itemLi.append(itemA.append(itemImg).append(numDiv).append(nameSpan)).appendTo("#goalkeepers");
			goalkeeperNum++;
		}
		if (item.playerPos == "后卫") {
			itemLi.append(itemA.append(itemImg).append(numDiv).append(nameSpan)).appendTo("#defenders");
			defenderNum++;
		}
		if (item.playerPos == "中场") {
			itemLi.append(itemA.append(itemImg).append(numDiv).append(nameSpan)).appendTo("#midfielders");
			midfielderNum++;
		}
		if (item.playerPos == "前锋") {
			itemLi.append(itemA.append(itemImg).append(numDiv).append(nameSpan)).appendTo("#forwards");
			forwardNum++;
		}
	})
	$("#goalkeeperNum").text(goalkeeperNum+"人");
	$("#defenderNum").text(defenderNum+"人");
	$("#midfielderNum").text(midfielderNum+"人");
	$("#forwardNum").text(forwardNum+"人");
}

$(document).on("click",".list-group-item a",function(){
	//查出球员信息，显示
	getPlayer($(this).attr("playerId"));
	//把球员id传递给模态框的更新按钮
	$("#player_update_btn").attr("edit-id",$(this).attr("playerId"));
	$("#player_del_btn").attr("del-id",$(this).attr("playerId"));
	$("#playerUpdateModal").modal({
		backdrop:"static"
	});
});

$("#player_update_btn").click(function() {
	var player = {
			"playerId":$(this).attr("edit-id"),
			"playerPhoto":$("#filePath").val(),
			"playerBirth":$("#YYYY").val()+"-"+$("#MM").val()+"-"+$("#DD").val(),
			"playerHeight":$("#height_update_input").val(),
			"playerWeight":$("#weight_update_input").val(),
			"playerNum":$("#playerNum_update_input").val(),
			"playerPos":$("#pos_select").val(),
			"playerNation":$("#nationSelect").val(),
			"playerWage":$("#wage_update_input").val()*10000,
			"playerContract":$("#conYYYY").val()+"-"+$("#conMM").val()+"-"+$("#conDD").val()
	}
	if (confirm("确认更新【"+$("#playerName_static").text()+"】的资料吗")) {
		$.ajax({
			url:"${APP_PATH}/player/"+$(this).attr("edit-id"),
			type:"PUT",
			data:player,
			success:function(res){
				//console.log(res);
				location.reload();
			},
			error:function(){
				alert("更新失败！");
			}
		})
	}
})

$("#player_del_btn").click(function() {
	if (confirm("确认解雇【"+$("#playerName_static").text()+"】吗")) {
		$.ajax({
			url:"${APP_PATH}/player/"+$(this).attr("del-id"),
			type:"DELETE",
			success:function(res){
				//console.log(res);
				location.reload();
			},
			error:function(){
				alert("删除失败！");
			}
		})
	}
})

function getPlayer(id) {
	$.ajax({
		url:"${APP_PATH}/player/"+id,
		type:"GET",
		success:function(res){
			/* console.log(res); */
			var player = res.extend.player;
			$("#preview-photo").prop("src",player.playerPhoto);
			$("#filePath").val(player.playerPhoto);
			$("#playerName_static").text(player.playerName);
			$("#playerFullname_static").text(player.playerFullname);
			$("#YYYY").val(player.playerBirth.substring(0,4));
			$("#MM").val(player.playerBirth.substring(5,7));
			$("#DD").val(player.playerBirth.substring(8,10));
			$("#height_update_input").val(player.playerHeight);
			$("#weight_update_input").val(player.playerWeight);
			$("#playerNum_update_input").val(player.playerNum);
			$("#pos_select").val(player.playerPos);
			$(".filter-option.pull-left").text(player.playerNation);
			$("#nationSelect").val(player.playerNation);
			$("#wage_update_input").val(parseFloat(player.playerWage)/10000);
			$("#conYYYY").val(player.playerContract.substring(0,4));
			$("#conMM").val(player.playerContract.substring(5,7));
			$("#conDD").val(player.playerContract.substring(8,10));
		}
	})
}
</script>
<script type="text/javascript">
function YYYYMMDDstart(){   
	//MonHead = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];   
	
	//先给年下拉框赋内容   
	var y  = new Date().getFullYear();
	for (var i = 0; i < 50; i++) {
		$("<option></option>").append(y).attr("value",y).appendTo($("#YYYY"));
		$("<option></option>").append(y).attr("value",y).appendTo($("#YYYYadd"));
		y--;
	}
	var y  = new Date().getFullYear();
	for (var i = 0; i < 20; i++) {
		$("<option></option>").append(y).attr("value",y).appendTo($("#conYYYY"));
		$("<option></option>").append(y).attr("value",y).appendTo($("#conYYYYadd"));
		y++;
	}
	
	//赋月份的下拉框   
	for (var i = 1; i < 13; i++){
		if(i<10){
			$("<option></option>").append("0"+i).attr("value","0"+i).appendTo($("#MM"));
			$("<option></option>").append("0"+i).attr("value","0"+i).appendTo($("#conMM"));
			
			$("<option></option>").append("0"+i).attr("value","0"+i).appendTo($("#MMadd"));
			$("<option></option>").append("0"+i).attr("value","0"+i).appendTo($("#conMMadd"));
		}else{
			$("<option></option>").append(i).attr("value",i).appendTo($("#MM"));
			$("<option></option>").append(i).attr("value",i).appendTo($("#conMM"));
			
			$("<option></option>").append(i).attr("value",i).appendTo($("#MMadd"));
			$("<option></option>").append(i).attr("value",i).appendTo($("#conMMadd"));
		}
	}
	
	for (var i=1; i<=31; i++){
		if (i<10) {
			$("<option></option>").append("0"+i).attr("value","0"+i).appendTo($("#DD"));
			$("<option></option>").append("0"+i).attr("value","0"+i).appendTo($("#conDD"));
			
			$("<option></option>").append("0"+i).attr("value","0"+i).appendTo($("#DDadd"));
			$("<option></option>").append("0"+i).attr("value","0"+i).appendTo($("#conDDadd"));
		}else{
			$("<option></option>").append(i).attr("value",i).appendTo($("#DD"));
			$("<option></option>").append(i).attr("value",i).appendTo($("#conDD"));
			
			$("<option></option>").append(i).attr("value",i).appendTo($("#DDadd"));
			$("<option></option>").append(i).attr("value",i).appendTo($("#conDDadd"));
		}
	}
}

/* function conMMDD(str) {  //月发生变化时日期联动   
	var YYYYvalue = $("#conYYYY").val();   
	if (YYYYvalue == ""){
		var e = $("#conDD");
		optionsClear(e);
		return;
	}   
	var n = MonHead[str - 1];   
	if (str == 2 && IsPinYear(YYYYvalue)) n++;   
	var e = $("#conDD");
	optionsClear(e);
	//赋日期的下拉框   
	for (var i=1; i<(n+1); i++){
		if (i<10) {
			var optionEle = $("<option></option>").append("0"+i).attr("value","0"+i);
		}else{
			var optionEle = $("<option></option>").append(i).attr("value",i);
		}
		optionEle.appendTo(e);
	}
}
function MMDD(str) {  //月发生变化时日期联动   
	var YYYYvalue = $("#YYYY").val();   
	if (YYYYvalue == ""){
		var e = $("#DD");
		optionsClear(e);
		return;
	}   
	var n = MonHead[str - 1];   
	if (str ==2 && IsPinYear(YYYYvalue)) n++;   
	writeDay(n)   
}
function writeDay(n) {  //据条件写日期的下拉框
	var e = $("#DD");
	optionsClear(e);
	//赋日期的下拉框   
	for (var i=1; i<(n+1); i++){
		if (i<10) {
			var optionEle = $("<option></option>").append("0"+i).attr("value","0"+i);
		}else{
			var optionEle = $("<option></option>").append(i).attr("value",i);
		}
		optionEle.appendTo(e);
	}
}   
function IsPinYear(year) {	//判断是否闰平年
	return(0 == year%4 && (year%100 !=0 || year%400 == 0));
}   
function optionsClear(ele) {   
	$(ele).empty();
} */
//更新的上传图片
function uploadPhoto() {
	$("#photo-file").click();
}

function upload() {
	if ($("#photo-file").val() == "") {
		return;
	}
	var formData = new FormData();
	formData.append("image",document.getElementById("photo-file").files[0]);
	$.ajax({
		url : "${APP_PATH}/uploadImg",
		type:"POST",
		async:false,
		data : formData,
		contentType : false,
		processData : false,
		success : function(result) {
			if (result.code == 200) {
				$("#preview-photo").attr("src",result.extend.filePath);
				$("#filePath").val(result.extend.filePath);
				alert("上传成功！");
				//window.location.reload();
			}else {
				alert(result.extend.tip);
			}
		},
		error : function(result) {
			alert("上传失败！");
		}
	});
}

//新增的上传图片
function uploadPhotoAdd() {
	$("#photo-file-add").click();
}

function uploadAdd() {
	if ($("#photo-file-add").val() == "") {
		return;
	}
	var formData = new FormData();
	formData.append("image",document.getElementById("photo-file-add").files[0]);
	$.ajax({
		url : "${APP_PATH}/uploadImg",
		type:"POST",
		async:false,
		data : formData,
		contentType : false,
		processData : false,
		success : function(result) {
			if (result.code == 200) {
				$("#preview-photo-add").attr("src",result.extend.filePath);
				$("#filePathAdd").val(result.extend.filePath);
				alert("上传成功！");
				//window.location.reload();
			}else {
				alert(result.extend.tip);
			}
		},
		error : function(result) {
			alert("上传失败！");
		}
	});
}

$("[id=addPlayer]").click(function(){
	//alert($(this).attr("add-type"));
	$("#pos_select_add").val($(this).attr("add-type"));
	$("#playerAddModal").modal({
		backdrop:"static"
	});
});

function show_validate_msg(ele,status,msg) {
	//清除当前元素的校验状态
	$(ele).parent().removeClass("has-success has-error");
	$(ele).next("span").text("");
	if("success"==status) {
		$(ele).parent().addClass("has-success");
		$(ele).next("span").text(msg);
	}else if ("error"==status) {
		$(ele).parent().addClass("has-error");
		$(ele).next("span").text(msg);
	}
}

$("#player_add_btn").click(function() {
	if ($("#playerName_add_input").val()=="") {
		show_validate_msg("#playerName_add_input","error","球员姓名不能为空！");
		return;
	}else {
		show_validate_msg("#playerName_add_input","success","");
	}
	if ($("#playerFullname_add").val()=="") {
		show_validate_msg("#playerFullname_add","error","球员全名不能为空！");
		return;
	}else {
		show_validate_msg("#playerFullname_add","success","");
	}
	if (confirm("确认提交吗？")) {
		var player = {
				"playerName":$("#playerName_add_input").val(),
				"playerFullname":$("#playerFullname_add").val(),
				"playerPhoto":$("#filePathAdd").val(),
				"playerBirth":$("#YYYYadd").val()+"-"+$("#MMadd").val()+"-"+$("#DDadd").val(),
				"playerHeight":$("#height_add_input").val(),
				"playerWeight":$("#weight_add_input").val(),
				"playerNum":$("#playerNum_add_input").val(),
				"playerPos":$("#pos_select_add").val(),
				"playerNation":$("#nationSelectAdd").val(),
				"playerWage":$("#wage_add_input").val()*10000,
				"playerContract":$("#conYYYYadd").val()+"-"+$("#conMMadd").val()+"-"+$("#conDDadd").val()
		}
		$.ajax({
			url:"${APP_PATH}/player",
			data:player,
			type:"POST",
			success:function(res){
				alert("添加新援成功！");
				location.reload();
			}
		});
	}
})
</script>
</body>
</html>