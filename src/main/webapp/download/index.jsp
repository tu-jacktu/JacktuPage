<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>资源下载页</title>
	<link href="../css/bootstrap.css" rel='stylesheet' type='text/css' />
	<script src="../js/jquery.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<link href="../css/fileinput.min.css" rel='stylesheet' type='text/css' />
	<script src="../js/fileinput.min.js"></script>
	<script src="../js/zh.js"></script>
	<script src="../js/upload.js"></script>
	<style type="text/css">
		tbody,
		th {
			text-align: center;
		}
	</style>
</head>

<body>
	<div class="panel panel-default">
		<div class="panel-heading">
			<h3 class="panel-title">
				资源列表 |
				<button type="button" class="btn btn-info" data-backdrop="false" data-toggle="modal" data-target="#upModal">上传资源</button>
			</h3>
		</div>
		<table class="table table-hover table-responsive table-bordered">
			<thead>
				<tr>
					<th>资源名</th>
					<th>描述</th>
					<th>大小</th>
					<th>操作</th>
					<th>提示</th>
				</tr>
			</thead>
			<tbody id="content">

			</tbody>
		</table>
	</div>
	<!-- 弹出框 -->
	<div class="modal fade" id="upModal" tabindex="-1" role="dialog" aria-labelledby="Label" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="Label">上传文件</h4>
				</div>
				<div class="modal-body">
					<form id="file-form">
						<div class="input-group">
							<div class="input-group-addon">上传人:</div>
							<input class="form-control" name="uploader" placeholder="请输入您的 姓名/昵称">
						</div>
						<br />
						<div class="input-group">
							<div class="input-group-addon">文件描述:</div>
							<input class="form-control" name="annotation" placeholder="请输入简略描述">
						</div>
						<br />
						<input id="resources" placeholder="请输入简略描述" name="file" type="file" class="file" data-show-preview="false"
						 data-show-upload="false" />
						<br />
						<div class="input-group">
							<div class="input-group-addon">文件链接:</div>
							<input type="text" class="form-control" name="link" id="link" placeholder="可以不上传文件,只附上文件链接">
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-success" onclick="saveData()">保存</button>
				</div>
			</div>
		</div>
	</div>
</body>
<script>
	//保存上传的文件
	function saveData() {
		var form_data = new FormData();
		var f = $("#resources")[0].files[0];
		var dataJson = $("#file-form").serializeObject();
		
		var an = dataJson.annotation;
		var lk = dataJson.link;
		if (isEmpty(an)) {
			return alert("必须输入文件描述!");
		}
		if(isEmpty(f)&&isEmpty(lk)){
			return alert("至少提交一个 链接或者文件!");
		}
		if (!isEmpty(f)) {
			form_data.append('file', f);
			form_data.append('name', f.name);
			form_data.append('size', f.size);
		}else{
			form_data.append('file',new File([],".null"));
		}
		for (var attr in dataJson) {
			form_data.append(attr, dataJson[attr]);
		}
		//异步提交表单
		$.ajax({
			type: 'post',
			data: form_data,
			// false才会自动加上正确的Content-Type
			contentType: false,
			//禁止jquery对DAta数据的处理,默认会处理
			//禁止的原因是,FormData已经帮我们做了处理
			processData: false,
			//添加mimeType 让 MultipartFile处理文件
			mimeType: "multipart/form-data",
			url: "./upload.do",
			dataType: "json",
			success: function (r) {
				$('#file-form')[0].reset();
				$('#upModal').modal('hide');
				window.location.reload();
				if (r.success = true) {
					alert("上传成功!");
				}else{
					alert("上传成功!");
					console.log(r.msg);
				}
			},
			error: function (r) {
				$('#file-form')[0].reset();
				console.log(r.msg);
				alert("发生未知错误!");
			}
		})
	}
	//添加一条文件记录
	function addTr(name, size, annotation, localname, orgHref) {
		var k = 1024;
		if (size / k / k / k > 1) {
			size = roundtwo(size / k / k / k) + " GB";
		} else if (size / k / k > 1) {
			size = roundtwo(size / k / k) + " MB";
		} else if (size / k > 1) {
			size = roundtwo(size / k) + " KB";
		} else {
			size = size + "B";
		}

		var tb = $("#content");
		var tr = '<tr>'
			+ '<td>@name</td>'
			+ '<td>@annotation</td>'
			+ '<td>@size</td>'
			+ '<td>'
			+ '<button type="button" class="btn btn-success" onclick="downFile(@localname)">下载</button> | '
			+ '<button type="button" class="btn btn-info"><a target="_blank" href="@org">链接</a></button>'
			+ '</td>' + '<td>如点击下载无效,请点击<em> 链接 </em>按钮</td>' + '</tr>';
		//@name	@describe @fileid @org
		tr = tr.replace('@name', name);
		tr = tr.replace('@size', size);
		tr = tr.replace('@annotation', annotation);
		tr = tr.replace('@localname', "'" + localname + "'");
		tr = tr.replace('@org', orgHref);
		tb.append(tr);
	}
	//获取文件列表
	$.ajax({
		type: 'get',
		data: "",
		url: "./getFileList.do",
		dataType: "json",
		success: function (r) {
			if (r.success == true) {
				console.log("请求文件列表成功!");
				for (var i = 0; i < r.data.length; i++) {
					var res = r.data[i];
					addTr(res.name, res.size, res.annotation, res.localname, res.link)
				}
			} else {
				console.log("请求文件列表失败!");
			}
		},
		error: function () {
			console.log("错误!");
		}
	})
	//初始化上传组件
$(".file").fileinput({
	language : 'zh'
})
// 文件选择框,禁止输入
$(".file-caption-name").attr("disabled", true);
</script>

</html>