//表单转为json对象
$.fn.serializeObject = function() {
	var o = {};
	var a = this.serializeArray();
	$.each(a, function() {
		if (o[this.name]) {
			if (!o[this.name].push) {
				o[this.name] = [ o[this.name] ];
			}
			o[this.name].push(this.value || '');
		} else {
			o[this.name] = this.value || '';
		}
	});
	return o;
};
//保留2为小数
function roundtwo(num) {
	return Math.round(num * 100) / 100;
}
// 判断是否为空
function isEmpty(obj) {
	return obj == "" || obj == null || obj == "null" || obj == undefined;
}

// 下载文件的方法
function downFile(localname) {
	if (!isEmpty(localname)) {
		window.open("./downfile/" + localname + "/j.do", "_blank");
	}else{
		alert("抱歉,无法下载!");
	}
		
}
