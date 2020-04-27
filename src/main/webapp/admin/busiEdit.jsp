<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>赞助商管理</title>
<%
	pageContext.setAttribute("APP_PATH",request.getContextPath());
%>
<!-- web路径：
不以/开始的相对路径，找资源，以当前资源的路径为基准,经常容易出问题。
以/开始的相对路径，找资源，以服务器的路径为标准（http://localhost:3306）；需要加上项目名 -->
<script type="text/javascript" src="${APP_PATH }/static/js/jquery-1.12.4.min.js"></script>
<link href="${APP_PATH }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
<script src="${APP_PATH }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>

<style type="text/css">
	.thumbnail{
		width:212.5px;
		height:72px;
	}
	img{
		max-height: 72px;
		max-width: 212.5px;
	}
</style>
</head>
<body>
<!-- 更新模态框 -->
<div class="modal fade" tabindex="-1" role="dialog" id="UpdateModal">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">更新商务合作</h4>
      </div>
      <div class="modal-body">
        	
        	<form class="form-horizontal">
						<div class="form-group">
							<label class="col-sm-2 control-label">Logo</label>
							<div class="col-sm-10">
								<img style="max-width:120px;max-height:70px;" alt="" src="" id="preview-photo-update">
								<input type="file" id="photo-file-update" style="display:none;" onchange="uploadUpdate()"/>
								<a style="float:right;margin-top:18px;;margin-right: 260px;" href="javascript:void(0)" onclick="uploadPhotoUpdate()"><span style="font-size: 12px;" class="label label-success">上传图片</span></a>
							</div>
						</div>
						
						<div class="form-group">
							<label class="col-sm-2 control-label">Logo路径</label>
							<div class="col-sm-8">
								<input type="text" name="busiLogo" class="form-control" id="filePathUpdate" onchange="previewUpdate()" placeholder="可上传图片或于此处填写图片网络路径"/>
								<span class="help-block"></span>
							</div>
						</div>
						
						<div class="form-group">
							<label class="col-sm-2 control-label">友情链接</label>
							<div class="col-sm-8">
								<input name="busiHref" class="form-control" id="busiHref_update_input"></input>
							</div>
						</div>
					
						<div class="form-group">
							<label class="col-sm-2 control-label">中文名</label>
							<div class="col-sm-6">
								<input name="busiName" class="form-control" id="busiName_update_input"></input>
								<span class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">外文名</label>
							<div class="col-sm-6">
								<input name="busiForname" class="form-control" id="busiForName_update_input"></input>
							</div>
						</div>
						
						<div class="form-group">
							<label class="col-sm-2 control-label">合作业务</label>
							<div class="col-sm-4">
								<input name="busiType" class="form-control" id="busiType_update_input"></input>
							</div>
						</div>

					</form>
        	
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
        <button type="button" class="btn btn-primary" id="updateBtn">提交</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- 增加模态框 -->
<div class="modal fade" tabindex="-1" role="dialog" id="AddModal">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">新增商务合作</h4>
      </div>
      <div class="modal-body">
        	
        	<form class="form-horizontal">
						<div class="form-group">
							<label class="col-sm-2 control-label">Logo</label>
							<div class="col-sm-10">
								<img style="max-width:120px;max-height:70px;" alt="" src="" id="preview-photo-add">
								<input type="file" id="photo-file-add" style="display:none;" onchange="uploadAdd()"/>
								<a style="float:right;margin-top:18px;;margin-right: 260px;" href="javascript:void(0)" onclick="uploadPhotoAdd()"><span style="font-size: 12px;" class="label label-success">上传图片</span></a>
							</div>
						</div>
						
						<div class="form-group">
							<label class="col-sm-2 control-label">Logo路径</label>
							<div class="col-sm-8">
								<input type="text" name="busiLogo" class="form-control" id="filePathAdd" onchange="preview()" placeholder="可上传图片或于此处填写图片网络路径"/>
								<span class="help-block"></span>
							</div>
						</div>
						
						<div class="form-group">
							<label class="col-sm-2 control-label">友情链接</label>
							<div class="col-sm-8">
								<input name="busiHref" class="form-control" id="busiHref_add_input"></input>
							</div>
						</div>
					
						<div class="form-group">
							<label class="col-sm-2 control-label">中文名</label>
							<div class="col-sm-6">
								<input name="busiName" class="form-control" id="busiName_add_input"></input>
								<span class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">外文名</label>
							<div class="col-sm-6">
								<input name="busiForname" class="form-control" id="busiForName_add_input"></input>
							</div>
						</div>
						
						<div class="form-group">
							<label class="col-sm-2 control-label">合作业务</label>
							<div class="col-sm-4">
								<input name="busiType" class="form-control" id="busiType_add_input"></input>
							</div>
						</div>

					</form>
        	
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
        <button type="button" class="btn btn-primary" id="addBtn">提交</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
	
	<div class="container" style="margin-top:10px;">
		<button type="button" class="btn btn-success" style="float:right;" id="addBtnModal">增加商业合作信息</button>
		<div class="row" id="busiInfo"></div>
	</div>
	
</body>
<script type="text/javascript">
$(function() {
	$.ajax({
		url:"${APP_PATH}/busi",
		type:"get",
		success:function(res){
			build_busi_div(res.extend.busi);
		}
	});
})

function build_busi_div(data) {
	$("#busiInfo").empty();//清空原区域
	var busiData = data;
	$.each(busiData,function(index,item){
		if (index == 3) {
			$("<div></div>").addClass("col-xs-6 col-md-3").append("<br><br><br><br><br>").appendTo(busiInfo);
		}
		var divBtnGroup = $("<div></div>").append($("<button></button").css("float","right").prop("type","button").addClass("btn btn-default dropdown-toggle")
			.attr("data-toggle","dropdown").append("操作").append($("<span></span>").addClass("caret")))
			.append($("<ul></ul>").addClass("dropdown-menu").append($("<li></li>").append($("<a></a>").text("更新").addClass("edit_btn").attr("edit-id",item.busiId).prop("href","javascript:void(0)")))
															.append($("<li></li>").addClass("divider").attr("role","separator"))
															.append($("<li></li>").append($("<a></a>").text("删除").addClass("delete_btn").attr("del-id",item.busiId).prop("href","javascript:void(0)"))));
		
		var Div = $("<div></div>").addClass("col-xs-6 col-md-3");
		var a = $("<a></a>").css("margin-bottom","10px").attr("title",item.busiType).attr("target","_blank").attr("href",item.busiHref).addClass("thumbnail");
		var img = $("<img>").attr("src",item.busiLogo);
		Div.append(a.append(img)).append(divBtnGroup).appendTo(busiInfo);
	});
}

//清空表单样式及内容
function reset_form(ele) {
	$(ele)[0].reset();
	//清空表单样式
	$(ele).find("*").removeClass("has-error has-success");
	$(ele).find(".help-block").text("");
}

$("#addBtnModal").click(function() {
	reset_form("#AddModal form");
	$("#AddModal").modal({
		backdrop:"static"
	});
})

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
				$("#filePathAdd").prop("readOnly",true);
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

/* 更新的上传图片 */
function uploadPhotoUpdate() {
	$("#photo-file-update").click();
}

function uploadUpdate() {
	if ($("#photo-file-update").val() == "") {
		return;
	}
	var formData = new FormData();
	formData.append("image",document.getElementById("photo-file-update").files[0]);
	$.ajax({
		url : "${APP_PATH}/uploadImg",
		type:"POST",
		async:false,
		data : formData,
		contentType : false,
		processData : false,
		success : function(result) {
			if (result.code == 200) {
				$("#preview-photo-update").attr("src",result.extend.filePath);
				$("#filePathUpdate").val(result.extend.filePath);
				$("#filePathUpdate").prop("readOnly",true);
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

$("#addBtn").click(function() {
	if($("#filePathAdd").val() == ""){
		show_validate_msg("#filePathAdd","error","请上传或填写图片路径！");
		return false;
	}else {
		show_validate_msg("#filePathAdd","success","");
	}
	if($("#busiName_add_input").val() == ""){
		show_validate_msg("#busiName_add_input","error","此处不能为空！");
		return false;
	}else {
		show_validate_msg("#busiName_add_input","success","");
	}
	$.ajax({
		url:"${APP_PATH}/busi",
		type:"POST",
		data:$("#AddModal form").serialize(),
		success:function(result){
			if(result.code == 200){
				//录入成功
				//关闭模态框
				$('#AddModal').modal('hide');
				//发送ajax请求显示最后一页数据即可
				location.reload();
			}
		}
	});
})

//删除记录
$(document).on("click", ".delete_btn", function() {
	var busiId = $(this).attr("del-id");
	//1、弹出是否确认删除对话框
	var busiType = $(this).parents("div").parents("div").children("a").attr("title");
	//console.log(busiType);
	if(confirm("确认删除【"+busiType+"】吗？")){
		//确认，发送ajax请求删除
		$.ajax({
			url:"${APP_PATH}/busi/"+busiId,
			type:"DELETE",
			success:function(result){
				location.reload();
			}
		});
	}
});

//更新记录
$(document).on("click", ".edit_btn", function() {
	//填好原本信息
	getInfo($(this).attr("edit-id"));
	$("#updateBtn").attr("edit-id",$(this).attr("edit-id"));
	$("#UpdateModal").modal({
		backdrop:"static"
	});
});

function getInfo(id) {
	$.ajax({
		url:"${APP_PATH}/busi/"+id,
		type:"get",
		success:function(res){
			//console.log(res.extend.busi);
			$("#preview-photo-update").prop("src",res.extend.busi.busiLogo);
			$("#filePathUpdate").val(res.extend.busi.busiLogo);
			$("#busiHref_update_input").val(res.extend.busi.busiHref);
			$("#busiName_update_input").val(res.extend.busi.busiName);
			$("#busiForName_update_input").val(res.extend.busi.busiForname);
			$("#busiType_update_input").val(res.extend.busi.busiType);
		}
	});
}

$("#updateBtn").click(function() {
	if($("#filePathUpdate").val() == ""){
		show_validate_msg("#filePathUpdate","error","请上传或填写图片路径！");
		return false;
	}else {
		show_validate_msg("#filePathUpdate","success","");
	}
	if($("#busiName_update_input").val() == ""){
		show_validate_msg("#busiName_update_input","error","此处不能为空！");
		return false;
	}else {
		show_validate_msg("#busiName_update_input","success","");
	}
	$.ajax({
		url:"${APP_PATH}/busi/"+$(this).attr("edit-id"),
		type:"PUT",
		data:$("#UpdateModal form").serialize(),
		success:function(result){
			if(result.code == 200){
				//录入成功
				//关闭模态框
				$('#UpdateModal').modal('hide');
				location.reload();
			}
		}
	});
})

function preview() {
	$("#preview-photo-add").prop("src",$("#filePathAdd").val());
}

function previewUpdate() {
	$("#preview-photo-update").prop("src",$("#filePathUpdate").val());
}
</script>
</html>