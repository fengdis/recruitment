/***
 * 回车登录
 */
$(function(){
	$('#password').keydown(function(event){
        if(event.keyCode==13){
        	$("#btnSub").trigger("click");
        	return false;
        }
    });
});

/***
 * 登录
 */
function userLogin(){

	var url = window.location.href;
	alert("----"+url);
	var returnUrl = "";
	if(url.indexOf("?")==-1){
		returnUrl="";
	}else{
		returnUrl = url.substring(url.indexOf("?")+1,url.length);
	}
	alert("----"+returnUrl)
	$.ajax({
		url : "userLogin/login",
		type : "post",
		dataType : "json",
		data : {
				userinfo_pin:$("#userName").val().toLowerCase(),
				userinfo_pwd:$("#password").val(),
				returnUrl:returnUrl
		},
		success : function(result) {
			if (result.result.message == "100") {
				window.location.href = result.result.data;
			}
			if (result.result.message == "104") {
				alert("用户名或密码错误或该用户已被冻结！");
			}
			if (result.result.message == "102") {
				alert("用户名不能为空！");
			}
			if (result.result.message == "103") {
				alert("密码不能为空！");
			}
		}
	});
}