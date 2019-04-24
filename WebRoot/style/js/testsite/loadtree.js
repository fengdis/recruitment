/**
 * 页面初始加载树形结构
 */
$(function() {
	$.ajax({
		url : "/organize/loadTree",
		type : "post",
		dataType : "json",
		success : function(result) {
			if (result.result.message == "200") {
				//初始化树
				loadTree(result.result.data);
				return;
			} else if (result.result.message == "204") {
				return;
			} else if (result.result.message == "500") {
				alert("系统异常！");
				return;
			}
		},
		error : function() {
			return;
		}
	});
});
/**
 * 加载
 * 
 * @param treeData
 */
function loadTree(treeData) {
	var setting = {
		callback : {
			onClick : clickTree
		}
	};
	$.fn.zTree.init($("#organizeTree"), setting, treeData);
}
/**
 * 全展开/合并
 * 
 * @param type
 */
function expandTree(type) {
	var zTree = $.fn.zTree.getZTreeObj("organizeTree");
	zTree.expandAll(type);
}