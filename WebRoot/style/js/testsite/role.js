/**
 * 点击查询按钮
 */
$(document).on(_click, '#queryRoleSub', function() {
	var url = '/role/ajaxRoleList';
	var data = $('#queryRoleForm').serialize();
	ajaxQuery(this, url, data);
});

/**
 * 点击添加按钮加载页面
 */
$(document).on(_click, '#addRole', function() {
	var url = "/role/loadAddRole";
	ajaxLoad(this, url, '');
});

/**
 * 新增角色提交
 */
$(document).on(_click,"#addRoleSubmit",function() {
	if (sdyCheckSubmit()) {
		var url = "/role/addRoleSubmit";
		var data = $('#addRoleForm').serialize();
		var result = ajaxSubmit(this, url, data);
	}
});

/**
 * 点击修改按钮，加载修改页面
 * @param id
 */
function updateRole(obj, id){
	var url = '/role/loadUpdateRole';
	var data = {role_id:id};
	ajaxLoad($(obj), url, data);
}

/**
 *	修改角色提交
 */
$(document).on(_click,"#updateRoleSubmit",function() {
	if (sdyCheckSubmit()) {
		var url = "/role/updateRoleSubmit";
		var data = $('#addRoleForm').serialize();
		var result = ajaxSubmit(this, url, data);
	}
});

/**
 * 根据ID删除角色
 */
function delRole(obj, id){
	var url = "/role/deleteRole";
	var data = {role_id:id};
	ajaxDeleteSubmit(this, url, data);
}

/**
 * 新增角色页面，点击th中全选复选框，选中或取消选中该行所有复选框
 * @param obj
 */
function selectAllJur(obj) {
	if ($(obj).is(':checked')) {
		$(obj).parents("th").next("td").find(":checkbox").each(function() {
			$(this).prop('checked', true);
		});
	} else {
		$(obj).parents("th").next("td").find(":checkbox").each(function() {
			$(this).prop('checked', false);
		});
	}
}

/**
 * 新增角色页面，当td中的复选框取消选中时，将该行的th中的全复选框取消选中
 * @param obj
 */
function selectParentJur(obj) {
	var flag = true;
	if (!$(obj).is(':checked')) {
		flag = false;
		$(obj).parents("tr").find(":checkbox").eq(0).prop('checked', flag);
		return;
	} else {
		$(obj).parents("td").find(":checkbox").each(function() {
			if (!$(this).is(':checked')) {
				flag = false;
				return;
			}
		});
		$(obj).parents("tr").find(":checkbox").eq(0).prop('checked', flag);
	}
}
