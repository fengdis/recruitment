<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./head.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>招聘信息管理系统</title>
<link href="${ctx }/dwz/themes/login/login.css" rel="stylesheet"
	rev="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="${ctx }/dwz/themes/login/jQuery1.7.js"></script>
<script type="text/javascript"
	src="${ctx }/dwz/themes/login/jquery-1.8.2.min.js"></script>
<script type="text/javascript"
	src="${ctx }/dwz/themes/login/jquery1.42.min.js"></script>
<script type="text/javascript"
	src="${ctx }/dwz/themes/login/jquery.SuperSlide.js"></script>
<script type="text/javascript"
	src="${ctx }/dwz/themes/login/Validform_v5.3.2_min.js"></script>

<link type="text/css" rel="stylesheet" href="${ctx }/dwz/layer/skin/layer.css" />
<script src="${ctx }/dwz/js/jquery-1.7.2.js" type="text/javascript"></script>
<link type="text/css" rel="stylesheet" href="${ctx }/web/css/form.css" />
<script type="text/javascript" src="${ctx }/dwz/layer/layer.min.js"></script>
<script type="text/javascript">
	var currenttabindex = 0;
	$(document).ready(function() {
		var $tab_li = $('#tab ul li');
		$tab_li.hover(function() {
			$(this).addClass('selected').siblings().removeClass('selected');
			var index = $tab_li.index(this);
			$('div.tab_box > div').eq(index).show().siblings().hide();
			if (index != currenttabindex) {
				$("#checkcode" + index).click();
			}
			currenttabindex = index;
		});
	});
</script>
<script type="text/javascript">
	$(function() {
		$(".screenbg ul li").each(function() {
			$(this).css("opacity", "0");
		});
		$(".screenbg ul li:first").css("opacity", "1");
		var index = 0;
		var t;
		var li = $(".screenbg ul li");
		var number = li.size();
		function change(index) {
			li.css("visibility", "visible");
			li.eq(index).siblings().animate({
				opacity : 0
			}, 3000);
			li.eq(index).animate({
				opacity : 1
			}, 3000);
		}
		function show() {
			index = index + 1;
			if (index <= number - 1) {
				change(index);
			} else {
				index = 0;
				change(index);
			}
		}
		t = setInterval(show, 5000);
		//根据窗口宽度生成图片宽度
		var width = $(window).width();
		$(".screenbg ul img").css("width", width + "px");

	});
</script>

<script>
	var pageii;
	function toReg(){
		layer.close(pageii);
		pageii = $.layer({
		    type: 1,
		    title: '用户注册',
		    area: ['520', '500'],
		    border: [10, 0.3, '#000'],
		    shade: [0.3, '#000'],
		    closeBtn: [1, true],
		    shadeClose: true,
		    fadeIn: 300,
		    fix: true,
		    closeBtn: [1, true],
		    page: {dom: '#regbox',},
		    close:function(){
		    }
		});
	}
	function doLogin() {
		var username = $("#stu_username_hide").val();
		var password = $("#stu_password_hide").val();
		var checkcode = $("#stu_code_hide").val();
		if (username == "") {
			document.getElementById("errormsg").innerHTML = "请输入账号";
			return false;
		}
		if (password == "") {
			document.getElementById("errormsg").innerHTML = "请输入密码";
			return false;
		}
		if (checkcode == "") {
			document.getElementById("errormsg").innerHTML = "请输入验证码";
			return false;
		}
		$.ajax({
					url : "${pageContext.request.contextPath }/com/userLogin.action",
					contentType : "application/x-www-form-urlencoded;charset=UTF-8",
					type : "post",
					dataType : "json",
					data : {
						"name" : "" + username + "",
						"password" : "" + password + "",
						"checkcode" : "" + checkcode + ""
					},//window.encodeURI(中文值)：对字符串进行编码
					success : function(json) {
						if (json.msg == "成功") {
							window.location.href = "${pageContext.request.contextPath }/com/index.action";
						} else {
							document.getElementById("errormsg").innerHTML = json.msg;
						}
					},
					error : function(json) {
					}
		});
	}
	
	function doReg() {
		var reguname = $("#stu_username_hide").val();
		var password = $("#stu_password_hide").val();
		var checkcode = $("#stu_code_hide").val();
		var regusername = $("#regusername").val();
		var reggender = $("#reggender").val();
		var regphone = $("#regphone").val();
		var regemail = $("#regemail").val();
		var regaddress = $("#regaddress").val();
		var regjob = $("#regjob").val();
		if (username == "") {
			//document.getElementById("errormsg").innerHTML = "请输入账号";
			alert("请输入账号")
			return false;
		}
		if (password == "") {
			alert("请输入密码")
			return false;
		}
		if (checkcode == "") {
			alert("请输入验证码")
			return false;
		}
		if (regphone == "") {
			alert("请填写联系方式")
			return false;
		}
		if (regjob == "") {
			alert("请填写工作类型")
			return false;
		}
		$.ajax({
					url : "${pageContext.request.contextPath }/com/userReg.action",
					contentType : "application/x-www-form-urlencoded;charset=UTF-8",
					type : "post",
					dataType : "json",
					data : {
						"regbean.user.uname" : reguname,
						"regbean.user.userPassword" : password,
						"regbean.user.userName" : regusername,
						"regbean.user.userGender":reggender,
						"regbean.user.userPhone" : regphone,
						"regbean.user.userEmail":regemail,
						"regbean.user.userAddress":regaddress,
						"regbean.user.userJob" : regjob,
						"checkcode" : checkcode
					},//window.encodeURI(中文值)：对字符串进行编码
					success : function(json) {
						if (json.msg == "成功") {
							alert("恭喜您,注册成功");
							layer.close(pageii);
							window.location.href = "${pageContext.request.contextPath }/com/index.action";
						} else {
							alert(json.msg);
						}
					},
					error : function(json) {
					}
		});
	}
	
	
</script>
</head>

<body>
	<div id="regbox" style="display: none;width:520px;height:500px">
    <form action="" method="post" class="basic-grey">
    <!-- <label>
    <span>账号 :</span>
    <input id="regname" type="text" name="" placeholder="您的账号" />
    </label>
    <label>
    <span>密码 :</span>
    <input id="regpwd" type="password" name="" placeholder="您的密码" />
    </label> -->
 	<label>
    <span>姓名 :</span>
    <input id="regusername" type="text" name="" placeholder="您的姓名" />
    </label>
     <label>
	<span>性别 :</span><select id="reggender">
	<option value="1">男</option>
	<option value="0">女</option>
	</select>
	</label>
	<label>
    <span>联系电话 :</span>
    <input id="regphone" type="text" name="" placeholder="您的联系电话" />
    </label>
    <label>
    <span>电子邮箱 :</span>
    <input id="regemail" type="text" name="" placeholder="您的电子邮箱" />
    </label>
    <label>
    <span>联系地址 :</span>
    <input id="regaddress" type="text" name="" placeholder="您的联系地址" />
    </label>
    <label>
    <span>工作类型 :</span>
    <input id="regjob" type="text" name="" placeholder="您的工作类型" />
    </label>
	
    <label>
    <span>&nbsp;</span>
    <input type="button" style="margin-left:110px" class="button" onclick="doReg()" value="确认注册" />
    </label>
    </form>
</div>
	<div id="tab">
		<ul class="tab_menu">
		</ul>
		<div class="tab_box" style="opacity:0.7">
			<!-- 开始 -->
			<div>
				<div class="stu_error_box errormsg" id="errormsg"></div>
				<form
					action="<%-- ${pageContext.request.contextPath }/com/userLogin.action --%>"
					method="post" class="stu_login_error">
					<div id="username">
						<label>账&nbsp;&nbsp;&nbsp;号：</label> <input type="text"
							id="stu_username_hide" name="username" placeholder="请输入账号" />
						<!--ajaxurl="demo/valid.jsp"-->
					</div>
					<div id="password">
						<label>密&nbsp;&nbsp;&nbsp;码：</label> <input type="password"
							id="stu_password_hide" name="password" placeholder="请输入密码" />
					</div>
					<div id="code">
						<label>验证码：</label> <input type="text" id="stu_code_hide"
							name="checkcode" placeholder="请输入验证码" /> <img id="checkcode0"
							src="${pageContext.request.contextPath }/checkcode" title="点击更换"
							alt="验证码占位图"
							onclick="this.src = '${pageContext.request.contextPath }/checkcode?' + Math.random();" />
					</div>
					<div id="remember"></div>
					<div id="login">
						<button type="button" onclick="doLogin()">登录</button>
					</div>
					<div id="reg">
						<button type="button" onclick="toReg()">注册</button>
					</div>
				</form>
			</div>
			<!-- 结束-->

		</div>
	</div>
	<div class="bottom">Copyright &copy; 2017</div>
	<div class="screenbg">
		<ul>
			<li><a href="javascript:;"><img
					src="../dwz/themes/login/11.jpg"></a></li>
			<li><a href="javascript:;"><img
					src="../dwz/themes/login/22.jpg"></a></li>
			<li><a href="javascript:;"><img
					src="../dwz/themes/login/33.jpg"></a></li>
			<!-- <li><a href="javascript:;"><img
					src="../dwz/themes/login/44.jpg"></a></li> -->
		</ul>
	</div>
</body>
</html>
