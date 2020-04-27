<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>合影管理</title>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<script type="text/javascript" src="${APP_PATH }/static/js/jquery-1.12.4.min.js"></script>
<link href="${APP_PATH }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
<script src="${APP_PATH }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>

<div class="container">
	<div class="row">
			<form class="form-horizontal">
				<div class="form-group">
					<label class="col-sm-2 control-label">预览</label>
					<div class="col-sm-10">
                		<img id="preview-photo" class="feature-image img-responsive" style="min-height:360px;min-width:580px;;float:left;" src="" width="100px">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">路径</label>
					<div class="col-sm-10">
						<input style="width:580px;" type="text" name="imgPath" class="form-control" id="add-photo" readonly="readonly">
						<a style="float:right;margin-top:25px;margin-right: 223px;" href="javascript:void(0)" onclick="uploadPhoto()"><span style="font-size: 17px;" class="label label-success">更新合影</span></a>
					</div>
				</div>

			</form>
		</div>
</div>

<input type="file" name="pictureFile" id="photo-file" style="display:none;" onchange="upload()"/>

<script type="text/javascript">
	$(function(){
		$.ajax({
			url:"${APP_PATH}/carou",
			type:"GET",
			success:function(result){
				//console.log(result);
				$("#preview-photo").attr("src",result.extend.allImg[3].imgPath);
				$("#add-photo").val(result.extend.allImg[3].imgPath);
			}
		});
	})

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
					$("#add-photo").val(result.extend.filePath);
					//alert("上传成功！");
					//window.location.reload();
				}else {
					alert(result.extend.tip);
				}
			},
			error : function(result) {
				alert("上传失败！");
			}
		});
		
		var carousel = new FormData();
		var imgPath = $("#add-photo").val();
		carousel.append("imgId",4);
		carousel.append("imgPath",imgPath);
		$.ajax({
			url:"${APP_PATH}/carou",
			type:"POST",
			data:carousel,
			contentType : false,
			processData : false,
			success:function(result){
				alert("修改成功！");
			}
		});
	}
</script>
</body>
</html>