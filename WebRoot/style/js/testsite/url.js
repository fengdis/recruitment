/***
 * 点击查询按钮
 */
$(document).on(_click, '#queryUrlSub', function() {
	var url = '/url/ajaxUrlList';
	var data = {url_name:$("#queryName").val()};
	ajaxQuery(this, url, data);
});

/***
 * 点击添加按钮加载页面
 */
$(document).on(_click, '#addUrl', function() {
	var url = "/url/loadAddUrl";
	ajaxLoad(this, url, '');
});

/**
 * 新增url提交
 */
$(document).on(_click,'#addUrlSubmit', function() {
	if (sdyCheckSubmit('#addUrlForm')) {
		var url = "/url/addUrlSubmit";
		var data = $('#addUrlForm').serialize();
		var result = ajaxSubmit(this, url, data);
	}
});

/***
 * 点击修改按钮，加载修改页面
 * @param id
 */
function updateUrl(obj, id){
	var url = '/url/loadUpdateUrl';
	var data = {url_id:id};
	ajaxLoad($(obj), url, data);
}

/**
 *	修改url提交
 */
$(document).on(_click, '#updateUrlSubmit', function() {
	if (sdyCheckSubmit()) {
		var url = "/url/updateUrlSubmit";
		var data = $('#updateUrlForm').serialize();
		var result = ajaxSubmit(this, url, data);
	}
});

/***
 * 根据ID删除url
 */
function delUrl(obj, id){
	var url = "/url/deleteUrl";
	var data = {url_id:id};
	ajaxDeleteSubmit(this, url, data);
}

/**
 * 新增页面加载图标
 */
$(document).on(_change, '#addIco', function() {
	var iconClass = "menu-icon fa fa-fw " + $(this).val();
	$("#addMenuIco").attr("class",iconClass);
});

/**
 * 修改页面加载图标
 */
$(document).on(_change, '#updateIco', function() {
	var iconClass = "menu-icon fa fa-fw " + $(this).val();
	$("#updateMenuIco").attr("class",iconClass);
});


