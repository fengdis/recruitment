/*************************************chenyun start******************************************/
var name_place_prefix = '.87d9bb400';

var _click = 'click' + name_place_prefix;
var _change = 'change' + name_place_prefix;
var _focus = 'focus' + name_place_prefix;
var _blur = 'blur' + name_place_prefix;
var _select = 'select' + name_place_prefix;

$(function(){
	/*$.ajaxSetup ({
		cache: false
	});*/
	initBind();
});

function initBind() {
	//鼠标滚轮向下时，将头部导航栏固定，鼠标滚轮向上时，恢复原来状态
	$(window).mousewheel(function(event,delta){
		if(delta<0){
			$(".main-header").removeClass("fixed-nav");
			$(".temp-header").hide();
		}else{
			$(".main-header").addClass("fixed-nav");
			$(".temp-header").show();
		}
	});

	//下拉或收起折叠区域
	$("[data-id='fold-head']").click(function(){
		$("[data-id='fold-body']").slideToggle(70);
		$("[data-id='fold-body'] .fold-body-content").slideToggle(100);
	});

	//切换搜索按钮样式
	$("[data-icon='transform-search']").click(function(){
		if($("[data-icon='transform-search']").hasClass("fa-search-plus")){
			$("[data-icon='transform-search']").removeClass("fa-search-plus")
				.addClass("fa-search-minus");
		}else{
			$("[data-icon='transform-search']").removeClass("fa-search-minus")
				.addClass("fa-search-plus");
		}
	});

	//新增菜单页面，选择一级菜单时，隐藏所属分类选项，选择二级菜单时，显示所属分类选项
	$(".menu_config input[name='menuType']").click(function(){
		var v = $(this).val();
		if(v == '2') {
			$(".menu_config .first-level-menu").removeClass("hidden");
		}else {
			$(".menu_config .first-level-menu").addClass("hidden");
		}
	});

	//新增菜单配置，选择模块图标下拉框选项后，在右侧显示图标
	$(".menu_config .select-icon").click(function(){
		var iconClassName = $(".menu_config .select-icon").val();
		var iconClass = "menu-icon fa fa-fw " + iconClassName;
		$(".menu_config i.menu-icon").attr("class",iconClass);
	});

    //菜单配置页面，打开新增菜单摸态框时，重置表单
    $("#menu_config").on('shown.bs.modal',function(){
    	$('#addMenu')[0].reset();
    });

    //菜单配置页面，点击新增菜单按钮，显示新增配置页面模态框
    $("[data-id='addMenu']").click(function(){
    	$("#menu_config").modal("show");
    });
    
    //加载load样式
    if($('.sk-circle') != null && $('.sk-circle') != '') {
    	var oHtml = '';
    	for (k=1;k<=12;k++) {
    		oHtml += '<div class="sk-circle' + k + ' sk-child"></div>'
    	}
    	$('.sk-circle').html(oHtml)
    }
}

/*************************************chenyun end******************************************/