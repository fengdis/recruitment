//
///**
// * ajax分页
// * @param url
// */
//function selectPage(url) {
//	$.ajax({
//		url : url,
//		type : "post",
//		dataType : "html",
//		beforeSend : function() {
//			$("#tableData").hide();
//			$("#loading").show();
//		},
//		success : function(data) {
//			if (data == "{\"code\":\"NotLogin\"}") {
//				top.location.href = GLOBAL_URL;
//			}
//			$("#loading").hide();
//			$("#tableData").html(data).show();
//		},
//		error : function() {
//
//		}
//	});
//}
//
///**
// * 树形结构点击事件
// * 
// * @param event
// * @param treeId
// * @param treeNode
// * @param clickFlag
// */
//function clickTree(event, treeId, treeNode, clickFlag) {
//	$("input[name='organize.org_id']").val(treeNode.id);
//	$("input[name='clickName']").val(treeNode.name);
//	$("input[name='organize.org_classLevel']").val((treeNode.level+2));
//	ajaxOrganizeList_click(treeNode.id,(treeNode.level+2),treeNode.name);
//	return;
//}
//
///***
// * 加载组织机构列表(点击树形结构后右面列表变化)
// */
//function ajaxOrganizeList_click(id,classLevel,clickName){
//	$.ajax({
//		url : "/organize/ajaxOrganizeList",
//		type : "post",
//		dataType : "html",
//		data : {
//			org_id:id,
//			org_classLevel:classLevel,
//			clickName:clickName
//		},
//		success : function(result) {
//			if (result == "{\"code\":\"NotLogin\"}") {
//				top.location.href = GLOBAL_URL;
//			}
//			$("#tableData").html(result);
//		}
//	});
//}
//
///***
// * 点击查询按钮
// */
//$("#queryOrganizeSub").live("click", function() {
//	$.ajax({
//		url : "/organize/ajaxOrganizeList",
//		type : "post",
//		dataType : "html",
//		data : {
//			org_id:$("#queryOrganizeId").val(),
//			org_name:$("#queryName").val(),
//			clickName:$("input[name='clickName']").val()
//		},
//		success : function(result) {
//			if (result == "{\"code\":\"NotLogin\"}") {
//				top.location.href = GLOBAL_URL;
//			}
//			$("#tableData").html(result);
//		}
//	});
//});
//
///***
// * 弹出层弹出之前判断
// * @param id
// * @returns {Boolean}
// */
//function addOrganizeYn(id){
//    var level = $("input[name='organize.org_classLevel']").val();
//	if(level==""){
//		alert("根级机构无法添加！！");
//		return false;
//	}else{
//        $("[rel=" + id + "]").trigger("click");
//        loadAddOrganizeView();
//    }
//}
//
///***
// * 加载添加组织架构页面(alert页面)
// */
//function loadAddOrganizeView(){
//	$.ajax({
//		url : "/organize/loadAddOrganizeView",
//		type : "post",
//		dataType : "html",
//		data : {
//			org_id:$("input[name='organize.org_id']").val(),
//			org_classLevel:$("input[name='organize.org_classLevel']").val(),
//			clickName:$("input[name='clickName']").val()
//		},
//		success : function(result) {
//			if (result == "{\"code\":\"NotLogin\"}") {
//				top.location.href = GLOBAL_URL;
//			}
//			$("#addOrganizeChildDIV").html(result);
//		}
//	});
//}
//
///**
// * 新增组织架构提交
// */
//$("#subAddOrganize").live("click", function() {
//	if (sdyCheckSubmit()) {
//		$("#subAddOrganize").attr("disabled", true);
//		$.ajax({
//			url : "/organize/addOrganizeSubmit",
//			type : "post",
//			dataType : "json",
//			data : {
//				org_name:$("#name").val(),
//				org_classCode:$("#classCode").val(),
//				org_fid:$("#organizeFid").val(),
//				org_classLevel:$("#organizeLevel").val()
//			},
//			success : function(result) {
//				if (result.code == "NotLogin") {
//					top.location.href = GLOBAL_URL;
//				} else if (result.result.message == "200") {
//					alert("添加成功！");
//					window.location.href = window.location.href;
//				} else if (result.result.message == "800") {
//					window.location.href = result.result.data;
//					return;
//				} else {
//					alert("添加失败！");
//					$("#subAddOrganize").attr("disabled", false);
//				}
//			},
//			error : function() {
//				$("#subAddOrganize").attr("disabled", false);
//				return;
//			}
//		});
//	}
//});
//
///***
// * 根据ID删除组织架构
// */
//function delOrganize(id,fid){
//	if (confirm("您确定删除该项信息！")){
//		$.ajax({
//			url : "/organize/deleteOrganize",
//			type : "post",
//			dataType : "json",
//			data : {
//				org_id:id,
//				org_fid:fid
//			},
//			success : function(result) {
//				if (result.code == "NotLogin") {
//					top.location.href = GLOBAL_URL;
//				} else if (result.result.message == "200") {
//					alert("删除成功！");
//					window.location.href = window.location.href;
//				} else if (result.result.message == "800") {
//					window.location.href = result.result.data;
//					return;
//				} else if (result.result.message == '111') {
//					alert("机构下有机构或者人员，无法删除！！");
//				} else {
//					alert("删除失败！");
//				}
//			},
//			error : function() {
//				return;
//			}
//		});
//	}
//}
//
///***
// * 弹出层弹出之前判断
// * @param divId
// * @param objId
// * @param clickName
// * @returns {Boolean}
// */
//function updateOrganizeYn(divId,objId,clickName){
//    var level = $("input[name='organize.org_classLevel']").val();
//	if(level==""){
//		alert("根级机构无法修改！！");
//		return false;
//	}else{
//        $("[rel=" + divId + "]").trigger("click");
//        loadUpdateOrganizeView(objId,clickName);
//    }
//}
//
///***
// * 加载修改组织架构页面(alert页面)
// */
//function loadUpdateOrganizeView(objId,clickName){
//	$.ajax({
//		url : "/organize/loadUpdateOrganizeView",
//		type : "post",
//		dataType : "html",
//		data : {
//			org_id:objId,
//			clickName:clickName
//		},
//		success : function(result) {
//			if (result == "{\"code\":\"NotLogin\"}") {
//				top.location.href = GLOBAL_URL;
//			}
//			$("#updateOrganizeChildDIV").html(result);
//		}
//	});
//}
//
///***
// * 点击修改按钮-->隐藏显示
// */
//$("#updateHideShowDiv").live("click", function() {
//	$("#updOrgId").hide();
//	$("#updOrgId2").show();
//});
//
///**
// * 修改组织架构提交
// */
//$("#subUpdateOrganize").live("click", function() {
//	if (sdyCheckSubmit()) {
//		var v=$("#seldiv select").filter(function(){
//			  return $(this).val() != "0";
//			}).last().children("option:selected").val();
//		var fid = $("#updOrganizeFid").val();
//		if(v!=undefined){
//			fid = v;
//		}
//		$("#subUpdateOrganize").attr("disabled", true);
//		$.ajax({
//			url : "/organize/updateOrganizeSubmit",
//			type : "post",
//			dataType : "json",
//			data : {
//				org_name:$("#updName").val(),
//				org_classCode:$("#updClassCode").val(),
//				org_fid:fid,
//				org_id:$("#updOrganizeId").val(),
//				org_classLevel:$("#updOrganizeLevel").val()
//			},
//			success : function(result) {
//				if (result.code == "NotLogin") {
//					top.location.href = GLOBAL_URL;
//				} else if (result.result.message == "200") {
//					alert("修改成功！");
//					window.location.href = window.location.href;
//				} else if (result.result.message == "800") {
//					window.location.href = result.result.data;
//					return;
//				} else {
//					alert("修改失败！");
//					$("#subUpdateOrganize").attr("disabled", false);
//				}
//			},
//			error : function() {
//				$("#subUpdateOrganize").attr("disabled", false);
//				return;
//			}
//		});
//	}
//});
