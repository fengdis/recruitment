/***
 * 点击查询按钮
 */
$(document).on(_click, '#queryCategorySub', function() {
	var url = '/category/ajaxCategoryList';
	var data = {category_name:$("#queryName").val()};
	ajaxQuery(this, url, data);
});

/***
 * 点击添加按钮加载页面
 */
$(document).on(_click, '#addCategory', function() {
	var url = "/category/loadAddCategory";
	ajaxLoad(this, url, '');
});

/**
 * 新增版块分类提交
 */
$(document).on(_click,'#addCategorySubmit', function() {
	if (sdyCheckSubmit('#addCategoryForm')) {
		var url = "/category/addCategorySubmit";
		var data = $('#addCategoryForm').serialize();
		var result = ajaxSubmit(this, url, data);
	}
});

/***
 * 点击修改按钮，加载修改页面
 * @param id
 */
function updateCategory(obj, id){
	var url = '/category/loadUpdateCategory';
	var data = {category_id:id};
	ajaxLoad($(obj), url, data);
}

/**
 *	修改版块分类提交
 */
$(document).on(_click, '#updateCategorySubmit', function() {
	if (sdyCheckSubmit()) {
		var url = "/category/updateCategorySubmit";
		var data = $('#updateCategoryForm').serialize();
		var result = ajaxSubmit(this, url, data);
	}
});

/***
 * 根据ID删除版块分类
 */
function delCategory(obj, id){
	var url = "/category/deleteCategory";
	var data = {category_id:id};
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
