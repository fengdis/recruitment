// 根据检索条件查询数据
$(document).on(_click, '#queryUserInfoCondition', function()
		{
			if(sdyCheckSubmit('#queryUserInfoConditionForm'))
			{
				var url = "/userInfo/ajaxUserInfoList";
				var data = $('#queryUserInfoConditionForm').serialize();
				var result = ajaxQuery(this, url, data);
			}
		}
);

// 新增页面
$(document).on(_click, '#addUserInfo', function() 
		{
			var url = "/userInfo/addUserInfo";
			ajaxLoad(this, url, '');
		}
);

// 新增提交
$(document).on(_click,'#addUserInfoSubmit', function() 
		{
			if (sdyCheckSubmit('#addUserInfoForm')) 
			{
				var url = "/userInfo/addUserInfoSubmit";
				var data = $('#addUserInfoForm').serialize();
				var result = ajaxSubmitForSynchro(this, url, data);
			}
		}
);

// 选中条目进行编辑
$(document).on(_click, '#editUserInfo', function() 
		{
			var url = "/userInfo/updateUserInfo";
			var data = "userinfo_pin="+$(this).attr('data-pin');
			ajaxLoad(this, url, data);
		}
);

// 编辑提交
$(document).on(_click,'#editUserInfoSubmit', function() 
		{
			if (sdyCheckSubmit('#editUserInfoForm')) 
			{
				var url = "/userInfo/updateUserInfoSubmit";
				var data = $('#editUserInfoForm').serialize();
				var result = ajaxSubmitForSynchro(this, url, data);
			}
		}
);

// 重置密码
$(document).on(_click, '#resetPassword', function()
		{
			var obj = $(this);
			var url = "/userInfo/updateUserInfoForPwd";
			var data = {
							userinfo_pin : obj.attr('data-pin'),
							userinfo_id : obj.attr('data-id')
						};
			var result = ajaxSubmitForSynchro(this, url, data);
		}
);

// 停用账号
$(document).on(_click, '#deleteUserAccount', function()
		{
			var obj = $(this);
			var url = "/userInfo/updateUserInfoForYn";
			var data = {
							userinfo_pin : obj.attr('data-pin'),
							userinfo_id : obj.attr('data-id'),
							yn : obj.attr('data-yn')
						};
			var result = ajaxSubmitForSynchro(this, url, data);
		}
);

// 根据返回code进行中文转义
function escapeCode(code){
	
	if(result == 500)
	{
		alert("系统错误，请联系管理员！");
	}else if(result == 400)
	{
		alert("提交失败！");
	}else if(result == 200)
	{
		alert("提交成功！");
		divLoadContent('', '/userInfo/userInfoList');
	}
}
//验证OldPwd正确性
$(document).on(_click,'#checkOldPwdYn',function(){
	var url = "/userInfo/checkOldPwdYn";
	var data = $('#oldPwd').serialize();
	alert(data);
	var result = ajaxSubmit(this, url, data);
});

/***
 * 修改密码提交
 */
$(document).on(_click,'#updatePwdSubmit',function(){
	if (confirm("您确定修改密码！")) {
		var url = "/userInfo/updatePwdSubmit";
		var data = $('#newPwd').serialize();
		var result = ajaxSubmit(this, url, data);
	}
});

/***
 * 重置密码
 */
$(document).on(_click,'#pwdUserInfo',function(){
	if (confirm("您确定重置此用户的密码！")){
		var url = "/userInfo/updateUserInfoForPwd";
		var data = {};
		var result = ajaxSubmit(this, url, data);
	}
});