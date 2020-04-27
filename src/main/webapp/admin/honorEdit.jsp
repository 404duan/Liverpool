<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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
	th{
		 text-align: center;
	}
	td{
		 text-align: center;
	}
	
</style>
</head>
<body>

	<!-- 员工添加的模态框 -->
	<div class="modal fade" id="horAddModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">新增荣誉记录</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal">
						<div class="form-group">
							<label class="col-sm-2 control-label">赛事</label>
							<div class="col-sm-10">
								<input type="text" name="horName" class="form-control" id="horName_add_input">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">外文名</label>
							<div class="col-sm-10">
								<input type="text" name="horForname" class="form-control" id="horFor_add_input">
							</div>
						</div>
						
						<div class="form-group">
							<label class="col-sm-2 control-label">位置</label>
							<div class="col-sm-4">
								<select class="form-control" name="horDetail"></select>
							</div>
						</div>

					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" id="hor_save_btn">保存</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 修改的模态框 -->
	<div class="modal fade" id="horUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">编辑</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal">
						<div class="form-group">
							<label class="col-sm-2 control-label">赛事</label>
							<div class="col-sm-10">
								<input type="text" name="horName" class="form-control" id="hor_update_input">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">外文名</label>
							<div class="col-sm-10">
								<input type="text" name="horForName" class="form-control" id="horFor_update_input">
							</div>
						</div>
						
						<div class="form-group">
							<label class="col-sm-2 control-label">赛季</label>
							<div class="col-sm-4">
								<select class="form-control" name="horDetail" id="season_update_input"></select>
							</div>
						</div>

					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" id="hor_update_btn">更新</button>
				</div>
			</div>
		</div>
	</div>

	<div class="container">
		<!-- 显示表格数据 -->
		<div class="row">
			<div class="col-md-12">
				<table class="table table-striped table-hover" id="hors_table">
					<thead>
						<tr class="warning">
							<th>赛事</th>
							<th>外文名</th>
							<th>赛季</th>
							<th></th>
							<th><button id="hor_add_modal_btn" type="button" class="btn btn-primary btn-sm"><span class="glyphicon glyphicon-pencil">添加记录</span></button></th>
						</tr>
					</thead>
					<tbody></tbody>
				</table>
			</div>
		</div>
		<!-- 显示分页信息 -->
		<div class="row">
			<!-- 分页文字信息 -->
			<div class="col-md-6" id="page_info_area"></div>
			<!-- 分页条信息 -->
			<div class="col-md-6" id="page_nav_area"></div>
		</div>
	</div>
<script type="text/javascript">
/* $(document).ready(function(){
	
}) */

		$(function() {
			//去首页
			to_page(1);
		});
		
		function to_page(pn){
			$.ajax({
				url:"${APP_PATH}/hors",
				data:"pn="+pn,
				type:"get",
				success:function(result){
					//console.log(result);
					//1、解析并显示数据
					build_hors_table(result);
					//2、解析并显示分页信息
					build_page_info(result);
					//3、解析显示分页条数据
					build_page_nav(result);
				}
			});
		}
		
		function build_hors_table(result){
			//清空table表格
			$("#hors_table tbody").empty();
			var hors = result.extend.pageInfo.list;
			$.each(hors,function(index,item){
				var horNameTd = $("<td></td>").append(item.horName);
				var horFornameTd = $("<td></td>").append(item.horForname);
				var horDetailTd = $("<td></td>").append(item.horDetail);
				var horImgTd = $("<td></td>").append(item.horImg);
				var editBtn = $("<button></button>").addClass("btn btn-primary btn-xs edit_btn")
								.append($("<span></span").addClass("glyphicon glyphicon-pencil")).append("编辑");
				//为编辑按钮添加一个自定义的属性，来表示当前球员的id
				editBtn.attr("edit-id",item.horId);
				var delBtn = $("<button></button>").addClass("btn btn-danger btn-xs delete_btn")
								.append($("<span></span").addClass("glyphicon glyphicon-trash")).append("删除");
				//为删除按钮添加一个自定义的属性来表示当前删除球员的id
				delBtn.attr("del-id",item.horId);
				var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn);
				$("<tr></tr>")
					.append(horNameTd)
					.append(horFornameTd)
					.append(horDetailTd)
					.append(horImgTd)
					.append(btnTd)
					.appendTo("#hors_table tbody");
			});
		}
		//解析显示分页信息 <span class="label label-default">New</span>
		function build_page_info(result){
			$("#page_info_area").empty();
			var spanLabel0 = $("<span></span>").addClass("label label-info");
			var spanLabel1 = $("<span></span>").addClass("label label-info");
			var spanLabel2 = $("<span></span>").addClass("label label-info");
			$("#page_info_area").append("当前 ").append(spanLabel0.append(result.extend.pageInfo.pageNum)).append(" 页，总 ")
			.append(spanLabel1.append(result.extend.pageInfo.pages)).append(" 页，总 ")
			.append(spanLabel2.append(result.extend.pageInfo.total)).append(" 条记录");
			totalRecord = result.extend.pageInfo.total;
			currentPage = result.extend.pageInfo.pageNum
		}
		//解析显示分页条
		function build_page_nav(result){
			$("#page_nav_area").empty();
			//page_nav_area
			var ul = $("<ul></ul>").addClass("pagination");
			var firstPageLi = $("<li></li>").append($("<a></a>").append("首页"));
			var prePageLi = $("<li></li>").append($("<a></a>").append("上页"));
			if(result.extend.pageInfo.hasPreviousPage == false){
				firstPageLi.addClass("disabled");
				prePageLi.addClass("disabled");
			}else{
				//为元素添加点击翻页的事件
				firstPageLi.click(function(){
					to_page(1);
				});
				prePageLi.click(function(){
					to_page(result.extend.pageInfo.pageNum - 1);
				});
			}
			
			var nextPageLi = $("<li></li>").append($("<a></a>").append("下页"));
			var lastPageLi = $("<li></li>").append($("<a></a>").append("末页"));
			if(result.extend.pageInfo.hasNextPage == false){
				nextPageLi.addClass("disabled");
				lastPageLi.addClass("disabled");
			}else{
				nextPageLi.click(function(){
					to_page(result.extend.pageInfo.pageNum + 1);
				});
				lastPageLi.click(function(){
					to_page(result.extend.pageInfo.pages);
				});
			}
			
			//添加首页和前一页的提示
			ul.append(firstPageLi).append(prePageLi);
			$.each(result.extend.pageInfo.navigatepageNums,function(index,item){
				var numLi = $("<li></li>").append($("<a></a>").append(item));
				if(result.extend.pageInfo.pageNum == item){
					numLi.addClass("active");
				}
				numLi.click(function(){
					to_page(item);
				});
				ul.append(numLi);
			});
			//添加下一页和末页的提示
			ul.append(nextPageLi).append(lastPageLi);
			
			//把ul加入到nav
			var navEle = $("<nav></nav>").append(ul);
			navEle.appendTo("#page_nav_area");
		}
		
		$(document).on("click",".edit_btn",function(){
			getSeason("#horUpdateModal select");
			//查出对应id信息，显示
			getHor($(this).attr("edit-id"));
			//把id传递给模态框的更新按钮
			$("#hor_update_btn").attr("edit-id",$(this).attr("edit-id"));
			$("#horUpdateModal").modal({
				backdrop:"static"
			});
		});
		
		function getHor(id) {
			$.ajax({
				url:"${APP_PATH}/hor/"+id,
				type:"GET",
				success:function(result){
					var horData = result.extend.hor;
					$("#hor_update_input").val(horData.horName);
					$("#horFor_update_input").val(horData.horForname);
					/* 选中原本项 */
					var s = document.getElementById("season_update_input");
					var ops = s.options;
					for(var i=0;i<ops.length; i++){
						var tempValue = ops[i].value;
						if(tempValue == horData.horDetail) {
							ops[i].selected = true;
							break;
						}
					}
				}
				
			});
		}
		
		function getSeason(ele){
			//清空之前下拉列表的值
			$(ele).empty();
			var date = new Date();
			var preYear = date.getFullYear();//2020
			var sufYear = date.getFullYear()+1;//2021
			for (var i = 0; i < 100; i++) {
				var optionEle = $("<option></option>").append(preYear+"/"+sufYear).attr("value",preYear+"/"+sufYear);;//2020/2021
				optionEle.appendTo(ele);
				preYear--;
				sufYear--;
			}
		}
		
		//点击新增按钮弹出模态框
		$("#hor_add_modal_btn").click(function(){
			getSeason("#horAddModal select");
			//弹出模态框
			$("#horAddModal").modal({
				backdrop:"static"
			});
		});
		
		//更新信息
		$("#hor_update_btn").click(function() {			
			//发送ajax请求保存更新的数据
			$.ajax({
				url:"${APP_PATH}/hor/"+$(this).attr("edit-id"),
				type:"PUT",
				data:$("#horUpdateModal form").serialize(),
				success:function(result){
					/* console.log(result);
					alert(result.msg); */
					//1、关闭对话框
					$("#horUpdateModal").modal("hide");
					//2、回到本页面
					to_page(currentPage);
				}
			});
		});
		
		//保存新增记录
		$("#hor_save_btn").click(function(){
			$.ajax({
				url:"${APP_PATH}/hor",
				type:"POST",
				data:$("#horAddModal form").serialize(),
				success:function(result){
					if(result.code == 200){
						//录入成功
						//关闭模态框
						$('#horAddModal').modal('hide');
						//发送ajax请求显示最后一页数据即可
						to_page(totalRecord);
					}
				}
			});
		});
		
		//删除记录
		$(document).on("click", ".delete_btn", function() {
			var horId = $(this).attr("del-id");
			//1、弹出是否确认删除对话框
			//alert($(this).parents("tr").find("td:eq(1)").text());
			var horDetail = $(this).parents("tr").find("td:eq(2)").text();//赛季
			var horName = $(this).parents("tr").find("td:eq(0)").text();//赛事
			if(confirm("确认删除【"+horDetail+"赛季"+horName+"】的记录吗？")){
				//确认，发送ajax请求删除
				$.ajax({
					url:"${APP_PATH}/hor/"+horId,
					type:"DELETE",
					success:function(result){
						to_page(currentPage);
					}
				});
			}
		});
</script>

</body>
</html>