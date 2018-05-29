/**
 *	刷新数据字典
 */
$(document).on(_click,'#dictReload', function() {
	if (confirm("您确定刷新数据字典！")){
		var url = "/systemconfig/dictReload";
		var data = {};
		var result = ajaxSubmit(this, url, data);
	}
});
