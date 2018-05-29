/***
 * load页面
 */
function divLoadContent(url) {
	$(document).off(name_place_prefix);
	$("#frameLoading").removeClass("hidden");
	$('.all-content').load(url, {temp:new Date().getTime()}, function(r,s,x) {
		$("#frameLoading").addClass("hidden"); 
		if(url.indexOf("?") > 0){
			$('#baseUrl').val(url.substring(0, url.indexOf("?")));
		}else{
			$('#baseUrl').val(url);
		}
		initBind();
		if (s == 'error') {
			$('.all-content').html(r);
		}
	});
}

/***
 * 点击查询按钮
 */
function ajaxQuery(obj,url,data) {
	$.ajax({
		url : url,
		type : "post",
		dataType : "html",
		data : data,
		beforeSend : function() {
			$("#loading").removeClass("hidden");
		},
		success : function(result) {
			if (result == "{\"code\":\"NotLogin\"}") {
				top.location.href = GLOBAL_URL;
			}
			$("#loading").addClass("hidden");
			$("#tableData").html(result);
		}
	});
}

/***
 * ajax提交表单
 * 调用时使用ajaxSubmit(this, url, data);
 */
function ajaxSubmit(obj, url, data) {
	$(obj).attr("disabled", true);
	$.ajax({
		url : url,
		type : "post",
		dataType : "json",
		data : data,
		async: false,
		success : function(result) {
			if (result.code == "NotLogin") {
				window.location.href = GLOBAL_URL;
			} else if (result.result.message == "200") {
				divLoadContent($('#baseUrl').val());
				return result.result.message;
			}  else {
				$(obj).attr("disabled", false);
				return result.result.message;
			}
		},
		error : function(xhr,status,error) {
			$(obj).attr("disabled", false);
			return 500;
		}
	});
}

function ajaxDeleteSubmit(obj, url, data) {
	if (confirm("您确定删除该项信息！")){
		$.ajax({
			url : url,
			type : "post",
			dataType : "json",
			data : data,
			async: false,
			success : function(result) {
				if (result.code == "NotLogin") {
					window.location.href = GLOBAL_URL;
				} else if (result.result.message == "200") {
					divLoadContent($('#baseUrl').val());
					return result.result.message;
				}  else {
					$(obj).attr("disabled", false);
					return result.result.message;
				}
			},
			error : function(xhr,status,error) {
				$(obj).attr("disabled", false);
				return 500;
			}
		});
	}
}

/***
 * ajax提交表单
 * 调用时使用ajaxSubmitForSynchro(this, url, data);
 */
function ajaxSubmitForSynchro(obj,url,data) {
	$(obj).attr("disabled", true);
	$.ajax({
		url : url,
		type : "post",
		dataType : "json",
		async : false,
		data : data,
		async: false,
		success : function(result) {
			if (result.code == "NotLogin") {
				window.location.href = GLOBAL_URL;
			} else if (result.result.message == "200") {
				var baseUrlPageIndex = $('#baseUrl').val();
//				if(pageIndex != 'undefined'){
//					baseUrlPageIndex = baseUrlPageIndex + "?pageIndex="+pageIndex;
//				}
				if(pageParamVal != 'undefined'){
					if(baseUrlPageIndex.indexOf("?") > 0){
						baseUrlPageIndex = baseUrlPageIndex + "&" +pageParamVal;
					}else{
						baseUrlPageIndex = baseUrlPageIndex + "?" +pageParamVal;
					}
				}
				divLoadContent(baseUrlPageIndex);
				return result.result.message;
			}  else {
				$(obj).attr("disabled", false);
				return result.result.message;
			}
		},
		error : function(xhr,status,error) {
			$(obj).attr("disabled", false);
			return 500;
		}
	});
}

/***
 * ajax加载页面
 * 调用时使用ajaxSubmit(this, url, data);
 */
function ajaxLoad(obj, url, data) {
	$(obj).attr("disabled", true);
	$.ajax({
		url : url,
		type : "post",
		dataType : "html",
		data : data,
		success : function(result) {
			if (result == "{\"code\":\"NotLogin\"}") {
				top.location.href = GLOBAL_URL;
			}
			$('#' + $(obj).attr('id') + 'ChildDIV').html(result);
			$('#' + $(obj).attr('id') + 'DIV').modal('show');
		},
		error : function() {
			$(obj).attr("disabled", true);
			return;
		}
	});
}

/**
 * ajax分页
 * @param url
 */
function selectPage(url) {
	$.ajax({
		url : url,
		type : "post",
		dataType : "html",
		beforeSend : function() {
			$("#loading").removeClass("hidden");
		},
		success : function(data) {
			if (data == "{\"code\":\"NotLogin\"}") {
				top.location.href = GLOBAL_URL;
			}
			$("#loading").addClass("hidden");
			$("#tableData").html(data).show();
		},
	});
}

/*************************************chenyun start******************************************/
//实现点击一级菜单展开收起效果
$(".sidebar-menu .treeview > a").click(function(){
	if(!$("body").hasClass("sidebar-collapse")){
		var current_treeview_menu = $(this).next(".treeview-menu");
		var current_location = $(".sidebar-menu .treeview .treeview-menu li.active > a");
		if(current_treeview_menu.is(":visible")){
			current_treeview_menu.slideUp();
		}else{
			current_treeview_menu.slideDown();
			$(this).parent().siblings().find(".treeview-menu").slideUp();
		}
		$(this).parent().addClass("active").siblings().removeClass("active");
		current_location.parents(".treeview").addClass("active");
		return false;
	}
});

//高亮显示当前点击的二级菜单，并移除其他二级菜单的高亮样式
$(".sidebar-menu .treeview-menu a").click(function(){
	$(".sidebar-menu .treeview .treeview-menu li").removeClass("active");
	$(this).parent().addClass("active").parent().parent().addClass("active").siblings().removeClass("active");
});
/*************************************chenyun end******************************************/