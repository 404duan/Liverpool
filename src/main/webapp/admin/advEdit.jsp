<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<script type="text/javascript" src="${APP_PATH }/static/js/jquery-1.12.4.min.js"></script>
<link href="${APP_PATH }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
<script src="${APP_PATH }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<style type="text/css">
/*解决模态框显示后页面偏移问题和背景颜色变黑问题*/
body.modal-open {
	overflow-y: auto !important;		
	padding-right: 0 !important;/* 解决了右边框每次加17px问题 */
}
.modal-backdrop {
  opacity: 0 !important;
  filter: alpha(opacity=0) !important;/* 解决背景颜色加深问题 */
}
</style>
</head>

<body>
<div class="row" style="margin-left: 10px;margin-top: 10px;">
	<div class="col-lg-6">
	    <div class="input-group">
	      <input id="advTitle" type="text" class="form-control">
	      <span class="input-group-btn">
	        <button id="updateAdvBytitle" class="btn btn-default" type="button">修改标题</button>
	      </span>
	    </div><!-- /input-group -->
	</div><!-- /.col-lg-6 -->
</div>
<div style="margin-left: 10px;">
	<textarea id="advText" class="input-group" rows="" cols="" style="margin: 15px; width: 499px; height: 81px;"></textarea>
</div>
<div class="row" style="margin-left: 10px;">
	<textarea id="advPath" class="input-group" rows="" cols="" style="margin: 15px; width: 499px; height: 60px;"></textarea>
		<div class="col-lg-4"></div>
		<div class="col-lg-6">
			<div class="input-group">
				<div class="input-group-btn">
				<button id="updateAdv" type="button" class="btn btn-primary">更新宣传片</button>
					<button style="cursor:help;" type="button" id="help" class="btn btn-default" aria-label="Help" data-placement="bottom" title="如何导入视频">
						<span class="glyphicon glyphicon-question-sign"></span>
					</button>
				</div>
			</div><!-- /.input-group -->
		</div>
		<div class="col-lg-6">
		<span class="glyphicon glyphicon-facetime-video" style="margin: 5px;"><span style="margin-left:5px;" class="label label-danger">预览</span></span>
			<div id="advPathPrev" style="padding:30px;"></div>
		</div>
</div>

	<!-- help模态框 -->
	<div class="modal fade" tabindex="-1" role="dialog" id="myModal">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">如何导入视频</h4>
				</div>
				<div class="modal-body" style="text-align: center;">
					<img alt="help" src="${APP_PATH }/images/help.png" style="height: 340px;">
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				</div>
			</div><!-- /.modal-content -->
		</div><!-- /.modal-dialog -->
	</div><!-- /.modal -->

	<script type="text/javascript">
	$(document).ready(function(){
		$.ajax({
		url:"/ssm-crud/getAdv",
		type:"GET",
		success:function(result){
			//console.log(result.extend.extend.advTitle);
			$("#advTitle").attr("placeholder",result.extend.extend.advTitle);
			$("#advText").attr("placeholder",result.extend.extend.advText);
			$("#advPathPrev").html(result.extend.extend.advPath);
			$("#advPath").attr("placeholder",result.extend.extend.advPath);
		}
		});
	});
	$("#help").click(function(){
		$("#myModal").modal({
			backdrop:"static"
		});
	})
	$("#updateAdv").click(function(){
		var adVideo = {}
		adVideo.advId = 1;
		if($("#advTitle").val() == ""){
			adVideo.advTitle = $("#advTitle").attr("placeholder");
		}else {
			adVideo.advTitle = $("#advTitle").val();
		}
		if ($("#advText").val() == "") {
			adVideo.advText = $("#advText").attr("placeholder");
		}else {
			adVideo.advText = $("#advText").val();
		}
		if ($("#advPath").val() == "") {
			adVideo.advPath = $("#advPath").attr("placeholder");
		}else {
			adVideo.advPath = $("#advPath").val();
		}
		
		//console.log(adVideo);
		if(confirm("确认更新吗？")){
		$.ajax({
			url:"/ssm-crud/updateAdv",
			type:"POST",
			data:adVideo,
			success:function(result){
				console.log(result);
				alert("更新成功！");
				$("#advTitle").val("");
				$("#advText").val("");
				$("#advPath").val("");
				$("#advTitle").attr("placeholder",result.extend.extend.advTitle);
				$("#advText").attr("placeholder",result.extend.extend.advText);
				$("#advPathPrev").html(result.extend.extend.advPath);
				$("#advPath").attr("placeholder",result.extend.extend.advPath);
			}
		});
		}//end if
	})
	
	$("#updateAdvBytitle").click(function(){
		$("#updateAdv").click();
	})
	
	
</script>
</body>
</html>