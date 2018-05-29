<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./head.jsp"%>
<script src="${ctx }/dwz/js/jquery-1.7.2.js" type="text/javascript"></script>
<link type="text/css" rel="stylesheet"
	href="${ctx }/dwz/layer/skin/layer.css" />
<link type="text/css" rel="stylesheet" href="${ctx }/web/css/form.css" />
<script type="text/javascript" src="${ctx }/dwz/layer/layer.min.js"></script>
<header class="5grid-layout" id="site-header">
	<div class="row">
		<div class="12u">
			<div id="logo">
				<h1 class="mobileUI-site-name" style="font-size: 30px">${appTitle}</h1>
			</div>
			<nav class="mobileUI-site-nav" id="site-nav">
				<ul>
					<li id="menuli_index"><a href="${ctx}/com/index.action">首页</a></li>
					<li id="menuli_position"><a
						href="${ctx}/com/findPosition.action">职位</a></li>
					<li id="menuli_resume"><a href="javascript:;"
						onclick="topre()">填写简历</a></li>
					<li id="menuli_company"><a
						href="${ctx}/com/findCompany.action">公司</a></li>
					<li id="menuli_syshotel"><a
						href="${ctx}/com/findSysHotel.action">酒店</a></li>
					<li id="menuli_sysnews"><a
						href="${ctx}/com/findSysNews.action">新闻</a></li>
					<li id="menuli_systype"><a href="${ctx}/com/findSysType.action">招聘信息</a></li>
					<!-- 					<li id="menuli_tuijian"><a href="${ctx}/com/findNews.action?s_type=推荐">当季推荐</a></li> -->
					<!-- 					<li id="menuli_changshi"><a href="${ctx}/com/findNews.action?s_type=常识">旅游小常识</a></li> -->
					<c:if test="${empty SimpleUser }">
						<li><a href="javascript:;" onclick="tologin()">登录</a></li>
						<li><a href="javascript:;" onclick="toreg()">注册</a></li>
					</c:if>
					<c:if test="${not empty SimpleUser }">
						<li id="menuli_user"><span
							style="font-size: 16px; color: red">欢迎您:</span><a
							href="${ctx}/com/toUser.action" style="font-size: 15px; color: red">${SimpleUser.user.userName }</a></li>
						<li><a
							href="${ctx}/com/userLogout.action?name=${SimpleUser.user.userName }">退出</a></li>
					</c:if>
				</ul>
			</nav>
		</div>
	</div>
</header>

<div id="regbox"
	style="display: none; width: 500px; margin-top: 10px; margin-left: 10px">
	<form action="" method="post" class="basic-grey">
		<label> <span>账号 :</span> <input id="regname" type="text"
			name="" placeholder="您的账号" />
		</label> <label> <span>密码 :</span> <input id="regpwd" type="password"
			name="" placeholder="您的密码" />
		</label> <label> <span>姓名 :</span> <input id="reguname" type="text"
			name="" placeholder="您的姓名" />
		</label> <label> <span>性别 :</span><select id="reggender">
				<option value="1">男</option>
				<option value="0">女</option>
		</select>
		</label> <label> <span>联系电话 :</span> <input id="regphone" type="text"
			name="" placeholder="您的联系电话" />
		</label> <label> <span>电子邮箱 :</span> <input id="regemail" type="text"
			name="" placeholder="您的电子邮箱" />
		</label> <label> <span>联系地址 :</span> <input id="regaddress"
			type="text" name="" placeholder="您的联系地址" />
		</label> <label> <span>工作类型 :</span> <input id="regjob" type="text"
			name="" placeholder="您的工作类型" />
		</lable> <label><span>验证码：</span> <input type="text" id="regcode"
				style="width: 221px" name="checkcode" placeholder="请输入验证码" /> <img
				id="checkcode0" style="width: 100px" src="${ctx}/checkcode"
				title="点击更换" alt="验证码占位图"
				onclick="this.src = '${ctx}/checkcode?' + Math.random();" /> </label> <label>
				<span>&nbsp;</span> <input type="button" style="margin-left: 110px"
				class="button" onclick="doreg()" value="注册" />
		</label>
	</form>
</div>
<div id="loginbox"
	style="display: none; width: 500px; margin-top: 10px; margin-left: 10px">
	<form action="${ctx }/com/userLogin.do" method="post"
		class="basic-grey">
		<label> <span>账号 :</span> <input id="loginname" type="text"
			name="loginname" placeholder="您的账号" />
		</label> <label> <span>密码 :</span> <input id="loginpwd"
			type="password" name="loginpwd" placeholder="您的密码" />
		</label> <label><span>验证码：</span> <input type="text" id="logincode"
			style="width: 221px" name="checkcode" placeholder="请输入验证码" /> <img
			id="checkcode0" style="width: 100px; margin-top:"
			src="${ctx}/checkcode" title="点击更换" alt="验证码占位图"
			onclick="this.src = '${ctx}/checkcode?' + Math.random();" /> </label> <label>
			<span>&nbsp;</span> <input type="button" style="margin-left: 110px"
			class="button" onclick="doLogin()" value="登录" />
		</label>
	</form>
</div>
<div id="prebox"
	style="display: none; width: 500px; margin-top: 10px; margin-left: 10px">
	<form action="" method="post" class="basic-grey">
		<label> <span>姓名:</span> <input id="p_uname" type="text"
			name="" placeholder="您的姓名" value="${SimpleUser.user.userName }" />
		</label> <label> <span>性别 :</span><select id="p_gender">
				<option value="1">男</option>
				<option value="0">女</option>
		</select>
		</label> <label> <span>联系电话 :</span> <input id="p_phone" type="text"
			name="" placeholder="您的联系电话" value="${SimpleUser.user.userPhone }" />
		</label> <label> <span>电子邮箱 :</span> <input id="p_email" type="text"
			name="" placeholder="您的电子邮箱" value="${SimpleUser.user.userEmail }" />
		</label> <label> <span>联系地址 :</span> <input id="p_address" type="text"
			name="" placeholder="您的联系地址" value="${SimpleUser.user.userAddress }" />
		</label> <label> <span>工作类型 :</span> <input id="p_job" type="text"
			name="" placeholder="您的工作类型" value="${SimpleUser.user.userJob }" />
			</lable> 
		</label> <label> <span>正文:</span> <textarea id="p_content" type="text"
			name="" placeholder="您的自我介绍" value="" ></textarea>
		</lable> 
		</label> <label> <span>附件 :</span> <input id="p_file" type="file"
			name="" placeholder="附件" value="" />
		</lable> 
			
			<label> <span>&nbsp;</span> <input type="button"
				class="button" style="margin-top: 10px" onclick="dopre()"
				value="确定" />
		</label>
	</form>
</div>
<%
	String type = request.getParameter("type");
%>
<script type="text/javascript">
var pageii;
$("li[id^='menuli_']").each(function(){
	  if($(this).attr("id")=="menuli_"+"<%=type%>") {
			$(this).addClass("current_page_item");
		} else {
			$(this).removeClass("current_page_item");
		}
	});
	function tologin() {
		layer.close(pageii);
		pageii = $.layer({
			type : 1,
			title : '用户登录',
			area : [ '520', '320' ],
			border : [ 10, 0.3, '#000' ],
			shade : [ 0.3, '#000' ],
			closeBtn : [ 1, true ],
			shadeClose : true,
			fadeIn : 300,
			fix : true,
			page : {
				dom : '#loginbox',
			},
			close : function() {
			}
		});
	}
	function toreg() {
		layer.close(pageii);
		pageii = $.layer({
			type : 1,
			title : '用户注册',
			area : [ '520', '660' ],
			border : [ 10, 0.3, '#000' ],
			shade : [ 0.3, '#000' ],
			closeBtn : [ 1, true ],
			shadeClose : true,
			fadeIn : 300,
			fix : true,
			closeBtn : [ 1, true ],
			page : {
				dom : '#regbox',
			},
			close : function() {
			}
		});
	}
	function topre(){
		layer.close(pageii);
		pageii = $.layer({
		    type: 1,
		    title: '填写简历',
		    area: ['520', '630'],
		    border: [10, 0.3, '#000'],
		    shade: [0.3, '#000'],
		    closeBtn: [1, true],
		    shadeClose: true,
		    fadeIn: 300,
		    fix: true,
		    page: {dom: '#prebox',},
		    close:function(){
		    }
		});
	}
	function doLogin() {
		var username = $("#loginname").val();
		var password = $("#loginpwd").val();
		var checkcode = $("#logincode").val();
		if (username == "") {
			alert("请输入账号");
			return false;
		}
		if (password == "") {
			alert("请输入密码");
			return false;
		}
		if (checkcode == "") {
			alert("请输入验证码");
			return false;
		}
		$.ajax({
			url : "${ctx }/com/userLogin.action",
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
					layer.close(pageii);
					window.location.href = "${ctx }/com/index.action";
				} else {
					alert(json.msg);
				}
			},
			error : function(json) {
			}
		});
	}
	function doreg() {
		var username = $("#regname").val();
		var password = $("#regpwd").val();
		var reguname = $("#reguname").val();
		var reggender = $("#reggender").val();
		var regphone = $("#regphone").val();
		var regemail = $("#regemail").val();
		var regaddress = $("#regaddress").val();
		var regjob = $("#regjob").val();
		var checkcode = $("#regcode").val();
		if (username == "") {
			alert("请输入账号");
			return false;
		}
		if (password == "") {
			alert("请输入密码");
			return false;
		}
		if (reguname == "") {
			alert("请输入姓名");
			return false;
		}
		if (checkcode == "") {
			alert("请输入验证码");
			return false;
		}
		$.ajax({
			url : "${ctx }/com/userReg.action",
			contentType : "application/x-www-form-urlencoded;charset=UTF-8",
			type : "post",
			dataType : "json",
			data : {
				"regbean.user.uname" : username,
				"regbean.user.userPassword" : password,
				"regbean.user.userName" : reguname,
				"regbean.user.userGender" : reggender,
				"regbean.user.userPhone" : regphone,
				"regbean.user.userEmail" : regemail,
				"regbean.user.userAddress" : regaddress,
				"regbean.user.userJob" : regjob,
				"checkcode" : checkcode
			},//window.encodeURI(中文值)：对字符串进行编码
			success : function(json) {
				if (json.msg == "成功") {
					alert("恭喜您,注册成功");
					layer.close(pageii);
					window.location.href = "${ctx }/com/index.action";
				} else {
					alert(json.msg);
				}
			},
			error : function(json) {
			}
		});
	}
	function dopre(){
		var p_uname = $("#p_uname").val();
		var p_gender = $("#p_gender").val();
		var p_phone = $("#p_phone").val();
		var p_email = $("#p_email").val();
		var p_address = $("#p_address").val();
		var p_job = $("#p_job").val();
		var p_file = $("#p_file").val();
		var p_content = $("#p_content").val();
		if(p_uname==""){
			alert("请输入姓名");return false;
		}
		$.ajax({
	     		url:"${ctx }/com/preResume.action",
	     		contentType:"application/x-www-form-urlencoded;charset=UTF-8",
	     		type:"post",
	     		dataType:"json",
	     		data:{
	     			"resume.user.user.uname":p_uname,
	     			"resume.user.user.gender":p_gender,
	     			"resume.user.user.phone":p_phone,
	     			"resume.user.user.email":p_email,
	     			"resume.user.user.address":p_address,
	     			"resume.user.user.job":p_job,
	     			"resume.user.user.file":p_file,
	     			"resume.content":p_content
	     		},//window.encodeURI(中文值)：对字符串进行编码
	     		success : function(json){
	     			if(json.msg=="成功"){
	     				alert("成功");
						layer.close(pageii);
						//window.location.href="${ctx }/com/index.do";
	     			}else{
	     				alert(json.msg);
	     			}
	     		},
	     		error:function(json){}
		});
	} 
</script>
