<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>球队历史</title>
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
<div class="panel panel-default">
  <!-- Default panel contents -->
  <div class="panel-heading">球队历史</div>
  <div class="panel-body">
    <p style="text-indent:2em"></p>
  </div>
  <div style="float:right;margin-top:6px;">
  	<button id="contentEdit" type="button" class="btn btn-primary">更新内容</button>
  </div>
</div>

<!-- 内容更新模态框 -->
<div class="modal fade" tabindex="-1" role="dialog" id="myModal">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">编辑内容</h4>
      </div>
      <div class="modal-body">
        <form role="form">
			<div class="form-group">
				<textarea class="form-control" rows="8" style="resize:none;text-indent:2em"></textarea>
			</div>
		</form>
      </div>
      <div class="modal-footer">
      	<button style="float: left" type="button" class="btn btn-default" id="resetBtn">清空</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="button" class="btn btn-primary" id="submitBtn">提交</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<script type="text/javascript">
	$(document).ready(function(){
		$.ajax({
			url:"${APP_PATH}/gethisText",
			type:"get",
			success:function(res){
				//console.log(res);
				$("p").text(res.extend.hisDetail.hisText);
				$("textarea").val(res.extend.hisDetail.hisText);
			}
		});
	})
	
	$("#resetBtn").click(function() {
		$("textarea").val("");
	})

	$("#contentEdit").click(function() {
		$("#myModal").modal({
			backdrop:"static"
		});
	})
	
	$("#submitBtn").click(function() {
		if ($("textarea").val() == "") {
			return;
		}
		if(confirm("确认更新吗？")){
			var history = {};
			history.hisId = 1;
			history.hisText = $("textarea").val();
			$.ajax({
				url:"${APP_PATH}/updateHis",
				type:"post",
				data:history,
				success:function(res){
					alert("更新成功！");
					window.location.reload();
				}
			});
		}
		
	})
</script>

</body>
</html>