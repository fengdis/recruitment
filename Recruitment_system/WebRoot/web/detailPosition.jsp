<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./head.jsp"%>
<!DOCTYPE HTML>
<html>
<head>
<title>${item.company.name }-${item.name }</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<link href="${ctx }/web/css/g.css" rel="stylesheet" />

<link rel="stylesheet" href="${ctx }/web/css/5grid/core.css" />
<link rel="stylesheet" href="${ctx }/web/css/5grid/core-desktop.css" />
<link rel="stylesheet" href="${ctx }/web/css/5grid/core-1200px.css" />
<link rel="stylesheet" href="${ctx }/web/css/5grid/core-noscript.css" />
<link rel="stylesheet" href="${ctx }/web/css/style-desktop.css" />
<script src="${ctx }/js/jquery-1.7.2.js" type="text/javascript"></script>
<script
	src="${ctx }/web/css/5grid/init.js?use=mobile,desktop,1000px&amp;mobileUI=1&amp;mobileUI.theme=none&amp;mobileUI.titleBarHeight=60&amp;mobileUI.openerWidth=52"></script>
<!--[if IE 9]><link rel="stylesheet" href="${ctx }/web/css/style-ie9.css" /><![endif]-->
<!-- 		<link href="${ctx }/web/raty/demo//stylesheets/labs.css" media="screen" rel="stylesheet" type="text/css"> -->
<script src="${ctx }/chart/Chart.js" type="text/javascript"></script>
<link rel="stylesheet" href="${ctx }/web/css/btn.css" />
</head>
<body>
	<!-- Header -->
	<div id="header-wrapper">
		<jsp:include page="./menu.jsp"><jsp:param
				value="position" name="type" />
		</jsp:include>
	</div>

	<!-- Main -->

	<div id="main-wrapper" class="subpage">
		<div class="5grid-layout">
			<div class="row">
				<div class="3u">
					<section></section>
				</div>
				<article class="first" style="margin-top: 1px">
					<div style="float: left; width: 550px">
						<h3>公司名称：${item.company.name }</h3>
						<h5>所在地区：${item.company.area}</h5>
						<h5>薪资标准：${item.salary}</h5>
						<h5>发布日期：${item.addDate}</h5>
						<h5>招聘数量：${item.positionCount}</h5>
						<h5>
						${item}
							职位简介：${item.introduce} 
							<c:if test="${item.applyCount < item.positionCount * 3}">
								 <a class="button" onclick="topre()">预约职位</a>
							</c:if>
						</h5>
						<h5>职位内容：</h5>
						<h5 style="font-size: 15px">${item.content}</h5>
					</div>
				</article>
			</div>
		</div>
	</div>
	<!-- Footer -->
	<jsp:include page="./footer.jsp"></jsp:include>
	<div id="prebox" style="display: none; width: 500px; margin-top: 10px; margin-left: 10px">
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
			</label> <label> <span>联系地址 :</span> <input id="p_address"
				type="text" name="" placeholder="您的联系地址"
				value="${SimpleUser.user.userAddress }" />
			</label> <label> <span>工作类型 :</span> <input id="p_job" type="text"
				name="" placeholder="您的工作类型" value="${SimpleUser.user.userJob }" />
				</lable> <label> <span>&nbsp;</span> <input type="button"
					class="button" style="margin-left: 110px" onclick="dopre()" value="确定" />
			</label>
		</form>
	</div>
	<script type="text/javascript">
var pageii;
function topre(){
	layer.close(pageii);
	pageii = $.layer({
	    type: 1,
	    title: '填写简历',
	    area: ['520', '680'],
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

function dopre(){
	var p_uname = $("#p_uname").val();
	var p_gender = $("#p_gender").val();
	var p_phone = $("#p_phone").val();
	var p_email = $("#p_email").val();
	var p_address = $("#p_address").val();
	var p_job = $("#p_job").val();
	if(p_uname==""){
		alert("请输入姓名");return false;
	}
	$.ajax({
     		url:"${ctx }/com/prePosition.action",
     		contentType:"application/x-www-form-urlencoded;charset=UTF-8",
     		type:"post",
     		dataType:"json",
     		data:{"positionUser.position.id":${item.id}},//window.encodeURI(中文值)：对字符串进行编码
     		success:function(json){
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


</body>


</html>