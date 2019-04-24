/***
 * 点击查询按钮
 */
$(document).on(_click, '#queryJsonSub', function() {
	var json_urlId = $("#jsonUrlId").val();
	var json_name = $("#queryName").val();
	var url = "/json/jsonList?json_urlId=" + json_urlId + "&json_name=" + json_name;
	divLoadContent(url);
});

/**
 * 新增json提交
 */
$(document).on(_click,'#addJsonSubmit', function() {
	$("#formatAddJson").removeClass("btn-primary").addClass("btn-default");
	$(this).removeClass("btn-default").addClass("btn-primary");
	if (sdyCheckSubmit('#addJsonForm')) {
		var json = $("#json").val();
		var json_urlId = $("#jsonUrlId").val();
		var jo;
		try{
			jo = JSON.parse(json);
			if(jo){
				var url = "/json/addJsonSubmit";
				var data = $('#addJsonForm').serialize();
				var result = ajaxSubmit(this, url, data);
				alert("添加成功");
				var returnUrl = "/json/jsonList?json_urlId=" + json_urlId;
				divLoadContent(returnUrl);
			}
		}catch(err){
			$("#showFormatAddJson").addClass("hidden");
			alert("json格式不正确，请重新输入！");
		}
	}
});

/**
 *	修改json提交
 */
$(document).on(_click, '#updateJsonSubmit', function() {
	$("#formatUpdateJson").removeClass("btn-primary").addClass("btn-default");
	$(this).removeClass("btn-default").addClass("btn-primary");
	if (sdyCheckSubmit('#updateJsonForm')) {
		var json = $("#json").val();
		var json_urlId = $("#jsonUrlIdForUpdate").val();
		var jo;
		try{
			jo = JSON.parse(json);
			if(jo){
				var url = "/json/updateJsonSubmit";
				var data = $('#updateJsonForm').serialize();
				var result = ajaxSubmit(this, url, data);
				alert("修改成功");
				var returnUrl = "/json/jsonList?json_urlId=" + json_urlId;
				divLoadContent(returnUrl);
			}
		}catch(err){
			$("#showFormatUpdateJson").addClass("hidden");
			alert("json格式不正确，请重新输入！");
		}
		
	}
	
});

/***
 * 根据ID删除json
 */
function delJson(obj, id, urlId){
	var url = "/json/deleteJson";
	var data = {json_id:id};
	ajaxDeleteSubmit(this, url, data);
	var json_urlId = urlId;
	var returnUrl = "/json/jsonList?json_urlId="+json_urlId+"";
	divLoadContent(returnUrl);
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

/**
 * 新增json页面，点击格式化按钮，校验json格式并格式化json后展示
 */
$(document).on(_click,'#formatAddJson', function() {
	$("#addJsonSubmit").removeClass("btn-primary").addClass("btn-default");
	$(this).addClass("btn-primary").removeClass("btn-default");
	var json = $("#json").val();
	var jo;
	try{
		jo = JSON.parse(json);
	}catch(err){
		$("#showFormatAddJson").addClass("hidden");
		alert("json格式不正确，请重新输入！");
	}
	if(jo){
		$("#showFormatAddJson").html(formatJson(jo)).removeClass("hidden");
	}
});

/**
 * 修改json页面，点击格式化按钮，校验json格式并格式化json后展示
 */
$(document).on(_click,'#formatUpdateJson', function() {
	$("#updateJsonSubmit").removeClass("btn-primary").addClass("btn-default");
	$(this).addClass("btn-primary").removeClass("btn-default");
	var json = $("#json").val();
	var jo;
	try{
		jo = JSON.parse(json);
	}catch(err){
		$("#showFormatUpdateJson").addClass("hidden");
		alert("json格式不正确，请重新输入！");
	}
	if(jo){
		$("#showFormatUpdateJson").html(formatJson(jo)).removeClass("hidden");
	}
});

/***
 * 点击清空按钮
 */
$(document).on(_click, '#initJsonMark', function() {
	var json_urlId = $("#jsonUrlId").val();
	var url = "/json/initJsonMarkSubmit?json_urlId=" + json_urlId;
	ajaxSubmit(this, url, null);
	var returnUrl = "/json/jsonList?json_urlId=" + json_urlId;
	divLoadContent(returnUrl);
});

/***
 * 点击确认按钮
 */
$(document).on(_click, '#bindingJsonMark', function() {
	var json_urlId = $("#jsonUrlId").val();
	var json_id = $('input[name="json_mark"]').filter(':checked').val();
	var url = "/json/bindingJsonSubmit?json_id=" + json_id + "&json_urlId=" + json_urlId;
	ajaxSubmit(this, url, null);
	var url = "/json/jsonList?json_urlId=" + json_urlId;
	divLoadContent(url);
});
