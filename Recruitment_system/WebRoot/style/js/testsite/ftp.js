/**
 * 测试FTP服务器是否连接成功
 */
$("#connectFtpSubmit").live("click", function() {
	$('#connectFtpSubmit').attr('disabled', true);
	$.ajax({
		url : "/ftp/connectFtpSubmit",
		type : "post",
		dataType : "json",
		data : $("#ftpForm").serialize(),
		success : function(result) {
			if (result.code == "NotLogin") {
				top.location.href = GLOBAL_URL;
			} else if (result.result.message == "200") {
				alert("连接成功！");
			} else if (result.result.message == "800") {
				window.location.href = result.result.data;
				return;
			} else {
				alert("连接失败！");
				$("#addApplyLoanSubmit").attr("disabled", false);
			}
		},
		error : function() {
			$("#addApplyLoanSubmit").attr("disabled", false);
			return;
		}
	});
});