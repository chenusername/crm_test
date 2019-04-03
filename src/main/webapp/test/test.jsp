<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri ="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + 	request.getServerPort() + request.getContextPath() + "/";
%>
<base href="<%=basePath%>">

<link href="jquery/bootstrap_3.3.0/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
<link href="jquery/bootstrap-datetimepicker-master/css/bootstrap-datetimepicker.min.css" type="text/css" rel="stylesheet" />

<script type="text/javascript" src="jquery/jquery-1.11.1-min.js"></script>
<script type="text/javascript" src="jquery/bootstrap_3.3.0/js/bootstrap.min.js"></script>
<script type="text/javascript" src="jquery/bootstrap-datetimepicker-master/js/bootstrap-datetimepicker.js"></script>
<script type="text/javascript" src="jquery/bootstrap-datetimepicker-master/locale/bootstrap-datetimepicker.zh-CN.js"></script>


<link rel="stylesheet" type="text/css" href="jquery/bs_pagination/jquery.bs_pagination.min.css">
<script type="text/javascript" src="jquery/bs_pagination/jquery.bs_pagination.min.js"></script>
<script type="text/javascript" src="jquery/bs_pagination/en.js"></script>

<script type="text/javascript">

	$(function(){
		
		$(".time").datetimepicker({
    		language:  "zh-CN",
    		format: "yyyy-mm-dd hh:ii:ss",//显示格式
    		minView: "hour",//设置只显示到月份
    		initialDate: new Date(),//初始化当前日期
    		autoclose: true,//选中自动关闭
			todayBtn: true, //显示今日按钮
    		clearBtn : true,
			pickerPosition: "bottom-left"
 		});
		
		
		pageList(1,2);
		$("#searchBtn").click(function(){
			$("#hidden-loginName").val($.trim($("#search-loginName").val()));
			$("#hidden-realName").val($.trim($("#search-realName").val()));
			$("#hidden-lastLoginTime").val($.trim($("#search-lastLoginTime").val()));
			pageList(1,2)
		})
		
	});
	function pageList(pageNo,pageSize){
		//发送ajax到后台，取得数据（市场活动信息列表）
		//从隐藏域中将值取出来，铺在搜索框中。
		$("#search-loginName").val($.trim($("#hidden-loginName").val()));
		$("#search-realName").val($.trim($("#hidden-realName").val()));
		$("#search-lastLoginTime").val($.trim($("#hidden-lastLoginTime").val()));
			
		$.ajax({
			url : "test/user/pageList.do",
			data : {
				"pageNo":pageNo,
				"pageSize":pageSize,
				"loginName":$.trim($("#search-loginName").val()),
				"realName":$.trim($("#search-realName").val()),
				"lastLoginTime":$.trim($("#search-lastLoginTime").val())
			},
			type : "get",
			dataType : "json",
			success : function(data){
				/*
					data:{"total":int,"dataList":{用户1}，{2}，{3}}
				*/
				var html="";
				$.each(data.dataList,function(i,n){
					html+='<tr class="active">';
					html+='<td><input type="checkbox" /></td>';
					html+='<td><a style="text-decoration: none; cursor: pointer;">'+n.login_name+'</a></td>';
                    html+='<td>'+n.login_pwd+'</td>';
                    html+='<td>'+n.real_name+'</td>';
					html+='<td>'+n.email+'</td>';
					html+='<td>'+n.last_login_time+'</td>';
					html+='</tr>';
				})
				$("#activityBody").html(html);
				
				//计算总页数
				var totalPages = data.total%pageSize==0?data.total/pageSize:parseInt(data.total/pageSize)+1;
				
				//展示完市场活动信息列表之后，进行分页相关操作
				$("#activityPage").bs_pagination({
					currentPage: pageNo, // 页码
					rowsPerPage: pageSize, // 每页显示的记录条数
					maxRowsPerPage: 20, // 每页最多显示的记录条数
					totalPages: totalPages, // 总页数
					totalRows: data.total, // 总记录条数

					visiblePageLinks: 3, // 显示几个卡片

					showGoToPage: true,
					showRowsPerPage: true,
					showRowsInfo: true,
					showRowsDefaultInfo: true, 
					
					//在触发分页 相关事件（例如点击上一页，下一页，第N页）  的时候 触发该方法
					onChangePage : function(event, data){
						pageList(data.currentPage , data.rowsPerPage);
					}
			   });
				
			}
				
		})

		
		
		
	}
</script>
</head>
<body>
	<input type="hidden" id="hidden-loginName">
	<input type="hidden" id="hidden-realName">
	<input type="hidden" id="hidden-lastLoginTime">
	<div>
		<div style="position: relative; left: 10px; top: -10px;">
			<div class="page-header">
				<h3>用户列表</h3>
			</div>
		</div>
	</div>
	<div style="position: relative; top: -20px; left: 0px; width: 100%; height: 100%;">
		<div style="width: 100%; position: absolute;top: 5px; left: 10px;">
		
			<div class="btn-toolbar" role="toolbar" style="height: 80px;">
				<form class="form-inline" role="form" style="position: relative;top: 8%; left: 5px;">
				  
				  <div class="form-group">
				    <div class="input-group">
				      <div class="input-group-addon">登录名</div>
				      <input class="form-control" type="text" id="search-loginName">
				    </div>
				  </div>
				  <div class="form-group">
				    <div class="input-group">
				      <div class="input-group-addon">真实姓名</div>
				      <input class="form-control" type="text" id="search-realName">
				    </div>
				  </div>


				  <div class="form-group">
				    <div class="input-group">
				      <div class="input-group-addon">最后登录时间</div>
					  <input class="form-control time" type="text" id="search-lastLoginTime">
				    </div>
				  </div>
				  
				  <button type="submit" class="btn btn-default" id="searchBtn">查询</button>
				  
				</form>
			</div>
			<div style="position: relative;top: 10px;">
				<table class="table table-hover">
					<thead>
						<tr style="color: #B3B3B3;">
							<td><input type="checkbox" /></td>
							<td>登录名</td>
                            <td>登录密码</td>
							<td>真实姓名</td>
							<td>邮箱</td>
							<td>最后登录时间</td>
						</tr>
					</thead>
					<tbody id="activityBody">
						<!-- <tr class="active">
							<td><input type="checkbox" /></td>
							<td><a style="text-decoration: none; cursor: pointer;" onclick="window.location.href='detail.html';">发传单</a></td>
                            <td>zhangsan</td>
							<td>2020-10-10</td>
							<td>2020-10-20</td>
						</tr>
                        <tr class="active">
                            <td><input type="checkbox" /></td>
                            <td><a style="text-decoration: none; cursor: pointer;" onclick="window.location.href='detail.html';">发传单</a></td>
                            <td>zhangsan</td>
                            <td>2020-10-10</td>
                            <td>2020-10-20</td>
                        </tr> -->
					</tbody>
				</table>
			</div>
			
			<div style="height: 50px; position: relative;top: 30px;">
				<div id="activityPage"></div>
			</div>
			
		</div>
		
	</div>
</body>
