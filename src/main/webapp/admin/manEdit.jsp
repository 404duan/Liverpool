<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>管理组</title>
<%
	pageContext.setAttribute("APP_PATH",request.getContextPath());
%>
<!-- web路径：
不以/开始的相对路径，找资源，以当前资源的路径为基准,经常容易出问题。
以/开始的相对路径，找资源，以服务器的路径为标准（http://localhost:3306）；需要加上项目名 -->
<script type="text/javascript" src="../static/selectNation/js/jquery-1.11.0.min.js"></script>
<link href="../static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
<script src="../static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>

<!-- 选择国籍的插件 -->
<script src="../static/selectNation/js/countrypicker.min.js"></script>
<link rel="stylesheet" href="../static/selectNation/js/dependancies/bootstrap-select-1.12.4/dist/css/bootstrap-select.min.css">
<script src="../static/selectNation/js/dependancies/bootstrap-select-1.12.4/dist/js/bootstrap-select.min.js"></script>
<style type="text/css">
	img{
		width:120px;
		height:120px;
	}
	.panel-body{
		padding:0px;
		padding-top: 15px;
	}
	.col-md-4{
		padding:0px;
	}
	.col-md-6{
		padding:1px;
		margin-left: 15px;
	}
	.col-md-4.panel.panel-primary{
		/* border:0px; */
		margin: 10px;
	}
	.btn.btn-primary{
		margin:2px;
	}
	.btn.btn-danger{
		margin:2px;
		float: right;
	}
</style>
</head>
<body>
	<!-- 增加的模态框 -->
	<div class="modal fade" id="manAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">新增职位</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal">
						<div class="form-group">
							<label class="col-sm-2 control-label">照片</label>
							<div class="col-sm-10">
								<img alt="" src="" id="preview-photo-add">
								<input type="file" id="photo-file-add" style="display:none;" onchange="uploadAdd()"/>
								<input type="text" name="manImg" id="filePathAdd" style="display:none;"/>
								<a style="float:right;margin-top:25px;margin-right: 223px;" href="javascript:void(0)" onclick="uploadPhotoAdd()"><span style="font-size: 12px;" class="label label-success">上传图片</span></a>
							</div>
						</div>
					
						<div class="form-group">
							<label class="col-sm-2 control-label">中文名</label>
							<div class="col-sm-6">
								<input name="manName" class="form-control" id="manName_add_input"></input>
								<span class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">外文名</label>
							<div class="col-sm-6">
								<input name="manForname" class="form-control" id="manForName_add_input"></input>
							</div>
						</div>
						
						<div class="form-group">
							<label class="col-sm-2 control-label">国籍</label>
							<div class="col-sm-4">
								<select id="nationSelect" class="form-control selectpicker countrypicker" data-live-search="true" name="manNation"></select>
							</div>
						</div>
						
						<div class="form-group">
							<label class="col-sm-2 control-label">职务</label>
							<div class="col-sm-4">
								<input name="manTitle" class="form-control" id="manTitle_add_input"></input>
								<span class="help-block"></span>
							</div>
						</div>

					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" id="man_add_btn">提交</button>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 更新的模态框 -->
	<div class="modal fade" id="manUpdateModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">编辑</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal">
						
						<div class="form-group">
							<label class="col-sm-2 control-label">照片</label>
							<div class="col-sm-10">
								<img alt="" src="" id="preview-photo">
								<input type="file" id="photo-file" style="display:none;" onchange="upload()"/>
								<input type="text" name="manImg" id="filePath" style="display:none;"/>
								<a style="float:right;margin-top:25px;margin-right: 223px;" href="javascript:void(0)" onclick="uploadPhoto()"><span style="font-size: 12px;" class="label label-success">上传图片</span></a>
							</div>
						</div>
					
						<div class="form-group">
							<label class="col-sm-2 control-label">中文名</label>
							<div class="col-sm-10">
								<p class="form-control-static" id="manName_update_static"></p>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">外文名</label>
							<div class="col-sm-10">
								<p class="form-control-static" id="manForName_update_static"></p>
							</div>
						</div>
						
						<div class="form-group">
							<label class="col-sm-2 control-label">国籍</label>
							<div class="col-sm-4">
								<select id="nationSelect0" class="form-control selectpicker countrypicker" data-live-search="true" name="manNation"></select>
							</div>
						</div>
						
						<div class="form-group">
							<label class="col-sm-2 control-label">任职时间</label>
							<div class="col-sm-4">
								<select id="yearSelect" class="form-control" name="manYear"></select>
							</div>
						</div>

					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" id="man_update_btn">更新</button>
				</div>
			</div>
		</div>
	</div>
	
	
	<div class="container">
		<div class="row" id="mans_div">
			<button style="margin-top:10px;" type="button" class="btn btn-primary" onclick="addNewMan()">新增职位</button>
		</div>
	</div>
	
<script type="text/javascript">
$(function() {
	$.ajax({
		url:"${APP_PATH}/getMans",
		type:"get",
		success:function(res){
			build_mans_panels(res.extend.managers);
		}
	});
})

function build_mans_panels(result){
	var mans = result;
	$.each(mans,function(index,item){
		var date = new Date(item.manYear)
		var year = date.getFullYear();
		var panelDiv = $("<div></div>").addClass("col-md-4 panel panel-primary");
		var panelHeadDiv = $("<div></div>").addClass("panel-heading")
							.append($("<h3></h3>").addClass("panel-title").append(item.manTitle));
		var img = $("<img></img>").addClass("img-circle");
		img.attr("src",item.manImg);
		var Ul = $("<ul></ul>").addClass("list-group")
			.append($("<li></li>").addClass("list-group-item list-group-item-success").append(item.manName))
			.append($("<li></li>").addClass("list-group-item list-group-item-info").append(item.manForname))
			.append($("<li></li>").addClass("list-group-item list-group-item-warning").append("国籍："+item.manNation))
			.append($("<li></li>").addClass("list-group-item list-group-item-danger").append("任职时间："+year+"年"));
		var panelBodyDiv = $("<div></div>").addClass("panel-body")
		.append($("<div></div>").addClass("row").append($("<div></div>").addClass("col-md-1"))
												.append($("<div></div>").addClass("col-md-4").append(img))
												.append($("<div></div>").addClass("col-md-6").append(Ul)));
		var editBtn = $("<button></button>").addClass("btn btn-primary edit_btn")
		.append($("<span></span").addClass("glyphicon glyphicon-pencil")).append("编辑");
		//为编辑按钮添加一个自定义的属性，来表示当前人员的id
		editBtn.attr("edit-id",item.manId);
		var delBtn = $("<button></button>").addClass("btn btn-danger delete_btn")
		.append($("<span></span").addClass("glyphicon glyphicon-trash")).append("解雇");
		//为删除按钮添加一个自定义的属性来表示当前删除人员的id
		delBtn.attr("del-id",item.manId);
		panelDiv.append(panelHeadDiv).append(panelBodyDiv).append(editBtn).append(delBtn).appendTo(mans_div);
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
			}else {
				alert(result.extend.tip);
			}
		},
		error : function(result) {
			alert("上传失败！");
		}
	});
}

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

$(document).on("click",".edit_btn",function(){
	//显示年份列表
	getYears("#yearSelect");
	//2、查出人员信息，显示
	getMan($(this).attr("edit-id"));
	//3、把id传递给模态框的更新按钮
	$("#man_update_btn").attr("edit-id",$(this).attr("edit-id"));
	$("#manUpdateModal").modal({
		backdrop:"static"
	});
});

function getMan(id) {
	$.ajax({
		url:"${APP_PATH}/man/"+id,
		type:"GET",
		success:function(result){
			var manData = result.extend.man;
			$("#manName_update_static").text(manData.manName);
			$("#manForName_update_static").text(manData.manForname);
			$("#preview-photo").attr("src",manData.manImg);
			$("#nationSelect").val(manData.manNation);
			$("#filePath").val(manData.manImg);
			/* 选中下拉框国籍原本项 */
			$(".filter-option.pull-left").text(manData.manNation);
			/* 选中任职时间原本项 */
			getSelected("yearSelect",manData.manYear);
			$("#yearSelect").val(manData.manYear);
		}
		
	});
}

function getSelected(ele,data){
	var s = document.getElementById(ele);
	var ops = s.options;
	for(var i=0;i<ops.length; i++){
		var tempValue = ops[i].value;
		if(tempValue == data) {
			ops[i].selected = true;
			break;
		}
	}
}

function getYears(ele){
	//清空之前下拉列表的值
	$(ele).empty();
	var date = new Date();
	var year = date.getFullYear();//2020
	for (var i = 0; i < 50; i++) {
		var optionEle = $("<option></option>").append(year).attr("value",year);
		optionEle.appendTo(ele);
		year--;
	}
}

//更新个人信息
$("#man_update_btn").click(function() {			
	//发送ajax请求保存更新的数据
	$.ajax({
		url:"${APP_PATH}/man/"+$(this).attr("edit-id"),
		type:"PUT",
		data:$("#manUpdateModal form").serialize(),
		success:function(result){
			alert("更新成功！");
			//1、关闭对话框
			$("#manUpdateModal").modal("hide");
			//2、回到本页面
			location.reload();
		}
	});
});

//删除记录
$(document).on("click", ".delete_btn", function() {
	var manId = $(this).attr("del-id");
	//1、弹出是否确认删除对话框
	var manName = $(this).parents("div").find("div:eq(1)").children("div").find("div:eq(2)").children("ul").find("li:eq(0)").text();//姓名（中文名）
	var manTitle = $(this).parents("div").children("div").children("h3").text();//职务
	if(confirm("确认解除【"+manName+"】的【"+manTitle+"】职务吗？")){
		//确认，发送ajax请求删除
		$.ajax({
			url:"${APP_PATH}/man/"+manId,
			type:"DELETE",
			success:function(result){
				location.reload();
			}
		});
	}
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

//清空表单样式及内容
function reset_form(ele) {
	$(ele)[0].reset();
	//清空表单样式
	$(ele).find("*").removeClass("has-error has-success");
	$(ele).find(".help-block").text("");
}

//新增
function addNewMan() {
	//清除表单数据（表单重置）
	reset_form("#manAddModal form");
	$("#manAddModal").modal({
		backdrop:"static"
	});
}

$("#man_add_btn").click(function() {
	if($("#manName_add_input").val() == ""){
		show_validate_msg("#manName_add_input","error","姓名不能为空！");
		return false;
	}else {
		show_validate_msg("#manName_add_input","success","");
	}
	if($("#manTitle_add_input").val() == ""){
		show_validate_msg("#manTitle_add_input","error","职务不能为空！");
		return false;
	}else {
		show_validate_msg("#manTitle_add_input","success","");
	}
	$.ajax({
		url:"${APP_PATH}/man",
		type:"POST",
		data:$("#manAddModal form").serialize(),
		success:function(result){
			if(result.code == 200){
				//录入成功
				//关闭模态框
				$('#manAddModal').modal('hide');
				//发送ajax请求显示最后一页数据即可
				location.reload();
			}
		}
	});
})
</script>
	
</body>
</html>