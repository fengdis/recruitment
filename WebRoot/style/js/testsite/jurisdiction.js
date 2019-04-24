/***
 * 点击查询按钮
 */
$(document).on(_click, '#queryJurisdictionSub', function() {
	var url = '/jurisdiction/ajaxJurisdictionList';
	var data = $('#queryJurisdictionForm').serialize();
	ajaxQuery(this, url, data);
});

/***
 * 点击添加按钮加载页面
 */
$(document).on(_click, '#addJurisdiction', function() {
	var url = "/jurisdiction/loadAddJurisdiction";
	ajaxLoad(this, url, '');
});

/**
 * 新增模块提交
 */
$(document).on(_click,'#addJurisdictionSubmit', function() {
	if (sdyCheckSubmit('#addJurisdictionForm')) {
		var url = "/jurisdiction/addJurisdictionSubmit";
		var data = $('#addJurisdictionForm').serialize();
		var result = ajaxSubmit(this, url, data);
	}
});

/***
 * 点击修改按钮，加载修改页面
 * @param id
 */
function updateJurisdiction(obj, id){
	var url = "/jurisdiction/loadUpdateJurisdiction";
	var data = {jur_id:id};
	ajaxLoad($(obj), url, data);
}

/**
 *	修改模块提交
 */
$(document).on(_click, '#updateJurisdictionSubmit', function() {
	if (sdyCheckSubmit()) {
		var url = "/jurisdiction/updateJurisdictionSubmit";
		var data = $('#updateJurisdictionForm').serialize();
		var result = ajaxSubmit(this, url, data);
	}
});

/***
 * 根据ID删除模块
 */
function delJurisdiction(obj, id){
	var url = "/jurisdiction/deleteJurisdiction";
	var data = {jur_id:id};
	ajaxDeleteSubmit(this, url, data);
}