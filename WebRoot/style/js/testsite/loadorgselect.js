/**
 * 加载组织机构级联
 */
$(function() {
	$.ajax({
		url : "/organize/ajaxOrganize",
		type : "post",
		dataType : "json",
		success : function(result) {
			//下一级分类
			var obj = result.result.data.nextList;
			//所有上级分类
			var lastobj = result.result.data.lastList;
			var msg = "";
			if(lastobj!=undefined){
				alert('上级加载');
				for ( var i = 0; i < lastobj.length; i++) {
					var o = "<select><option value=" + lastobj[i].org_id + ">"
						+ lastobj[i].org_name + "</option></select>";
					$("#seldiv").append(o);
				}
			}
					
			for ( var i = 0; i < obj.length; i++) {
				var o = "<option value=" + obj[i].org_id + ">"
					+ obj[i].org_name + "</option>";
				msg += o;
			}
			$("#seldiv").append("<select onchange='searchOrg(this.value,this);'><option value='0'>请选择</option>"
						+ msg + "</select>");
			}
	
		});
	
});

/**
 * 查询下级机构（查询）
 * 
 * @param id
 */
function searchOrg(id, oj) {
	$(oj).nextAll("select").remove();
	if (!isNull(id) && id!=0) {
		$.ajax({
			url : "/organize/ajaxOrganize",
			type : "post",
			dataType : "json",
			data : {
				org_fid:id
			},
			success : function(result) {
				var obj = result.result.data.nextList;
				var msg = "";
				if (obj != undefined) {
					for ( var i = 0; i < obj.length; i++) {
						var o = "<option value=" + obj[i].org_id + ">"
								+ obj[i].org_name + "</option>";
						msg += o;
					}
					$("#seldiv").append("<select onchange='searchOrg(this.value,this,1);'><option value='0'>请选择</option>"
							+ msg + "</select>");
				}
			}
		});
	}
}