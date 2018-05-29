<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>招聘信息管理系统登录入口</title>
<meta name="author" content="DeathGhost" />
<link rel="stylesheet" type="text/css" href="style/css/index/style.css"
	tppabs="css/style.css" />
<style>
body {
	height: 100%;
	background: #16a085;
	overflow: hidden;
}

canvas {
	z-index: -1;
	position: absolute;
}
</style>
<script src="style/js/index/jquery.js"></script>
<script src="style/js/index/verificationNumbers.js"
	tppabs="js/verificationNumbers.js"></script>
<script src="style/js/index/Particleground.js"
	tppabs="js/Particleground.js"></script>
<script type="text/javascript" src="style/js/testsite/login.js"></script>
<script type="text/javascript" src="dwz/themes/login/jQuery1.7.js"></script>
<script type="text/javascript" src="dwz/themes/login/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="dwz/themes/login/jquery1.42.min.js"></script>
<script type="text/javascript" src="dwz/themes/login/jquery.SuperSlide.js"></script>
<script type="text/javascript"
	src="dwz/themes/login/Validform_v5.3.2_min.js"></script>
<script type="text/javascript">
var currenttabindex = 0;
$(document).ready(function(){
	var $tab_li = $('#tab ul li');
	$tab_li.hover(function(){
		$(this).addClass('selected').siblings().removeClass('selected');
		var index = $tab_li.index(this);
		$('div.tab_box > div').eq(index).show().siblings().hide();
		if(index != currenttabindex){$("#checkcode"+index).click();}
		currenttabindex = index;
	});	
});
</script>
<script type="text/javascript">

$(document).ready(function() {
$("#userName").focus(function(){
 var username = $(this).val();
 if(username=='输入账号'){
 $(this).val('');
 }
});

$("#userName").focusout(function(){
 var username = $(this).val();
 if(username==''){
 $(this).val('输入账号');
 }
});

$("#password").focus(function(){
 var username = $(this).val();
 if(username=='输入密码'){
 $(this).val('');
 }
});
$("#password").focusout(function(){
 var username = $(this).val();
 if(username==''){
 $(this).val('输入密码');
 }
});
$("#code").focus(function(){
 var username = $(this).val();
 if(username=='输入验证码'){
 $(this).val('');
 }
});
$("#code").focusout(function(){
 var username = $(this).val();
 if(username==''){
 $(this).val('输入验证码');
 }
});

$(".stu_login_error").Validform({
	tiptype:function(msg,o,cssctl){
		var objtip=$(".stu_error_box");
		cssctl(objtip,o.type);
		objtip.text(msg);
	},
	ajaxPost:false
});


  //粒子背景特效
  $('body').particleground({
    dotColor: '#408cd0',
    lineColor: '#408cd0'
  });
  //测试提交，对接程序删除即可
  $("#btnSub1").click(function(){
	  alert("111");
	  document.getElementById("errormsg").innerHTML = "暂不提供注册";
	  //location.href="javascrpt:;"/*tpa=http://***index.html*/;
	  //location.href="/userLogin/login";
  });
});
</script>
</head>
<body>
	<script type="text/javascript" src="style/js/canvas-nest.js"
		count="200" zindex="-2" opacity="0.5" color="255,48,48">

 
		</script>
	<dl class="admin_login">
		<dt>
			<strong>招聘信息管理系统</strong> <em>Management System</em>
		</dt>
		<div class="stu_error_box errormsg" id="errormsg" style="color:white;">
			<c:if test="${not empty signErrorMessage }">${signErrorMessage }</c:if>
		</div>
		<form action="${pageContext.request.contextPath }/com/logins.action"
			method="post" class="stu_login_error">
			<input type="hidden" value="SysUser" name="logintype" />
			<dd class="user_icon">
				<input type="text" id="userName" class="login_txtbx"
					placeholder="用户名" name="loginid" value="admin" nullmsg="账号不能为空！"
					datatype="s2-18" errormsg="账号范围在2~18个字符之间！" sucmsg=" " />
			</dd>
			<dd class="pwd_icon">
				<input type="password" id="password" class="login_txtbx"
					placeholder="密码" name="password" value="123456" nullmsg="密码不能为空！"
					datatype="*6-16" errormsg="密码范围在6~16位之间！" sucmsg=" " />
			</dd>
			<dd class="val_icon">
				<input type="text" id="code" class="login_txtbx" placeholder="输入验证码"
					style="width: 170px" name="checkcode" 
					nullmsg="验证码不能为空！" datatype="*4-4" errormsg="验证码有4位数！" sucmsg=" " />
				<img id="checkcode0" style="width: 95px; height: 45px;"
					src="${pageContext.request.contextPath }/checkcode" title="点击更换"
					alt="验证码占位图"
					onclick="this.src = '${pageContext.request.contextPath }/checkcode?' + Math.random();" />

			</dd>
			<dd>
				<input id="btnSub" type="submit" onclick="" value="登陆"
					class="submit_btn" />
			</dd>
			<dd>
				<input id="btnSub1" type="button" onclick=""
					value="注册" class="submit_btn" />
			</dd>



			<dd>
				<p>Copyright &copy; 2017</p>
				<p>招聘信息管理系统</p>
			</dd>
	</dl>
</body>
</html>
