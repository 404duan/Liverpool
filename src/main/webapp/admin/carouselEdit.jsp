<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>轮播图编辑</title>

<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>

<link href="../static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	
	
	
	<table class="table">
            <tr class="active">
                <td width="60" align="right">预览:</td>
                <td valign="middle">
                	<img id="preview-photo-1" style="float:left;" src="" width="100px">
                	<a style="float:left;margin-top:40px;" href="javascript:void(0)" onclick="uploadPhoto(1)">上传图片</a>
                </td>
                
                <td width="60" align="right">预览:</td>
                <td valign="middle">
                	<img id="preview-photo-2" style="float:left;" src="" width="100px">
                	<a style="float:left;margin-top:40px;" href="javascript:void(0)" onclick="uploadPhoto(2)">上传图片</a>
                </td>
                
                <td width="60" align="right">预览:</td>
                <td valign="middle">
                	<img id="preview-photo-3" style="float:left;" src="" width="100px">
                	<a style="float:left;margin-top:40px;" href="javascript:void(0)" onclick="uploadPhoto(3)">上传图片</a>
                </td>
            </tr>
            <tr class="info">
                <td width="60" align="right">①:</td>
                <td><input type="text" id="add-photo-1" name="photo" value="" readonly="readonly"/></td>
                
                <td width="60" align="right">②:</td>
                <td><input type="text" id="add-photo-2" name="photo2" value="" readonly="readonly"/></td>
                
                <td width="60" align="right">③:</td>
                <td><input type="text" id="add-photo-3" name="photo3" value="" readonly="readonly"/></td>
     		</tr>
     </table>
	
	<input type="file" name="pictureFile" id="photo-file-1" style="display:none;" onchange="upload1()"/>
	
	<input type="file" name="pictureFile" id="photo-file-2" style="display:none;" onchange="upload2()"/>
	
	<input type="file" name="pictureFile" id="photo-file-3" style="display:none;" onchange="upload3()"/>

	<script type="text/javascript">

		//上传图片
		function upload1() {
			if ($("#photo-file-1").val() == "") {
				return;
			}
			var formData = new FormData();
			formData.append("image",document.getElementById("photo-file-1").files[0]);
			$.ajax({
				url : "${APP_PATH}/uploadImg",
				type:"POST",
				async:false,
				data : formData,
				contentType : false,
				processData : false,
				success : function(result) {
					if (result.code == 200) {
						$("#preview-photo-1").attr("src",result.extend.filePath);
						$("#add-photo-1").val(result.extend.filePath);
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
			var imgPath = $("#add-photo-1").val();
			carousel.append("imgId",$("#add-photo-1").attr("edit-id"));
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
		
		//上传图片
		function upload2() {
			if ($("#photo-file-2").val() == "") {
				return;
			}
			var formData = new FormData();
			formData.append("image",document.getElementById("photo-file-2").files[0]);
			$.ajax({
				url : "${APP_PATH}/uploadImg",
				type:"POST",
				async:false,
				data : formData,
				contentType : false,
				processData : false,
				success : function(result) {
					if (result.code == 200) {
						$("#preview-photo-2").attr("src",result.extend.filePath);
						$("#add-photo-2").val(result.extend.filePath);
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
			var imgPath = $("#add-photo-2").val();
			carousel.append("imgId",$("#add-photo-2").attr("edit-id"));
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
		
		//上传图片
		function upload3() {
			if ($("#photo-file-3").val() == "") {
				return;
			}
			var formData = new FormData();
			formData.append("image",document.getElementById("photo-file-3").files[0]);
			$.ajax({
				url : "${APP_PATH}/uploadImg",
				type:"POST",
				async:false,
				data : formData,
				contentType : false,
				processData : false,
				success : function(result) {
					if (result.code == 200) {
						$("#preview-photo-3").attr("src",result.extend.filePath);
						$("#add-photo-3").val(result.extend.filePath);
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
			var imgPath = $("#add-photo-3").val();
			carousel.append("imgId",$("#add-photo-3").attr("edit-id"));
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

		function uploadPhoto(id) {
			if (id == 1) {
				$("#add-photo-1").attr("edit-id",id);
				$("#photo-file-1").click();
			}else if (id == 2) {
				$("#add-photo-2").attr("edit-id",id);
				$("#photo-file-2").click();
			}else if (id == 3) {
				$("#add-photo-3").attr("edit-id",id);
				$("#photo-file-3").click();
			}
			
		}
	</script>

	<script type="text/javascript"
		src="../static/js/jquery-1.12.4.min.js"></script>
	<script
		src="../static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
		
	<script type="text/javascript">
		$(document).ready(function(){
			$.ajax({
				url:"${APP_PATH}/carou",
				type:"GET",
				success:function(result){
					//console.log(result);
					$("#preview-photo-1").attr("src",result.extend.allImg[0].imgPath);
					$("#add-photo-1").val(result.extend.allImg[0].imgPath);
					$("#preview-photo-2").attr("src",result.extend.allImg[1].imgPath);
					$("#add-photo-2").val(result.extend.allImg[1].imgPath);
					$("#preview-photo-3").attr("src",result.extend.allImg[2].imgPath);
					$("#add-photo-3").val(result.extend.allImg[2].imgPath);
				}
			});
		});
	</script>

</body>
</html>