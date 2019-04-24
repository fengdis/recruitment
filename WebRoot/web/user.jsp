<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./head.jsp"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>个人中心</title>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<meta name="description" content="" />
		<meta name="keywords" content="" />
		<link href="${ctx }/web/css/g.css" rel="stylesheet" />
		<noscript>
		<link rel="stylesheet" href="${ctx }/web/css/5grid/core.css" />
		<link rel="stylesheet" href="${ctx }/web/css/5grid/core-desktop.css" />
		<link rel="stylesheet" href="${ctx }/web/css/5grid/core-1200px.css" />
		<link rel="stylesheet" href="${ctx }/web/css/5grid/core-noscript.css" />
		<link rel="stylesheet" href="${ctx }/web/css/style.css" />
		<link rel="stylesheet" href="${ctx }/web/css/style-desktop.css" /></noscript>
		<script src="${ctx }/web/css/5grid/jquery.js"></script>
		<script src="${ctx }/web/css/5grid/init.js?use=mobile,desktop,1000px&amp;mobileUI=1&amp;mobileUI.theme=none&amp;mobileUI.titleBarHeight=60&amp;mobileUI.openerWidth=52"></script>
		<!--[if IE 9]><link rel="stylesheet" href="${ctx }/web/css/style-ie9.css" /><![endif]-->
		<link rel="stylesheet" type="text/css" href="${ctx }/web/css/btn.css" />
	</head>
	<body>

		<!-- Header -->

			<div id="header-wrapper">
				 <jsp:include page="./menu.jsp"><jsp:param value="user" name="type"/> </jsp:include> 
			</div>

		<!-- Main -->

			<div id="main-wrapper" class="subpage">
				<div class="5grid-layout">
					<div class="row">
						<div class="3u">
						
							<!-- Sidebar -->
							
								<section style="margin-left:40px">
									<h3>个人中心</h3>
									<ul class="link-list">
										<li><a href="${ctx }/com/toUser.action?type=interview">面试信息</a></li>
										<li><a href="${ctx }/com/toUser.action?type=apply">我的信息</a></li>
										<li><a href="${ctx }/com/toUser.action?type=info">个人资料</a></li>
										<li><a href="${ctx }/com/toUser.action?type=pwd">修改密码</a></li>
										<li><a href="${ctx }/com/toUser.action?type=tips">求职技巧</a></li>
										<li><a href="${ctx }/com/toUser.action?type=consultation">我的留言</a></li>
									</ul>
								</section>
						</div>
						<div class="9u mobileUI-main-content">
					
							<!-- Content -->
									
								<article class="first" style="margin-top: 0px">
									 <c:if test="${type=='info' }">
									 
									 <form action="${ctx }/com/userUpdate.action" method="post" class="basic-grey" id="updateForm" style="margin-left: 50px">
										    <label>
										    <span>账号 :</span>
										    <input id="regname" type="text" value="${SimpleUser.user.uname }" readonly="readonly" name="updatebean.uname" placeholder="您的账号" />
										    </label>
										 	<label>
										    <span>姓名 :</span>
										    <input id="reguname" type="text" name="updatebean.userName" value="${SimpleUser.user.userName }" placeholder="您的姓名" />
										    </label>
										     <label>
											<span>性别 :</span><select name="updatebean.userGender">
											<option value="1" <c:if test="${SimpleUser.user.userGender=='1' }">selected</c:if> >男</option>
											<option value="0" <c:if test="${SimpleUser.user.userGender=='0' }">selected</c:if> >女</option>
											</select>
											</label>
											<label>
										    <span>生日 :</span>
										    <input id="regphone" type="text" name="updatebean.userBirth" value="${SimpleUser.user.userBirth}" placeholder="您的生日.如:1990-08-08" />
										    </label>
											
											<label>
										    <span>联系电话 :</span>
										    <input id="regphone" type="text" name="updatebean.userPhone" value="${SimpleUser.user.userPhone }" placeholder="您的联系电话" />
										    </label>
										    
										    <label>
										    <span>电子邮箱 :</span>
										    <input id="regemail" type="text" name="updatebean.userEmail" value="${SimpleUser.user.userEmail }" placeholder="您的电子邮箱" />
										    </label>
										    
										    <label>
										    <span>联系地址 :</span>
										    <input id="regaddress" type="text" name="updatebean.userAddress" value="${SimpleUser.user.userAddress }" placeholder="您的联系地址" />
										    </label>
										    <label>
										    <span>工作类型 :</span>
										    <input id="regjob" type="text" name="updatebean.userJob" value="${SimpleUser.user.userJob }" placeholder="您的工作类型" />
										    </label>
											
										    <label>
										    <span>&nbsp;</span>
										    <input type="button" class="button" onclick="toupdate()" value="修改" />
										    </label>
										    </form>
									 </c:if>
									 
									 <c:if test="${type=='pwd' }">
									 	<form action="" method="post" class="basic-grey" id="updateForm" style="margin-left: 50px">
										    	<label>
											    <span>旧密码 :</span>
											    <input id="regpwd1" type="password" name="" placeholder="您的旧密码" />
											    </label>
											    <label>
											    <span>新密码 :</span>
											    <input id="regpwd2" type="password" name="" placeholder="您的新密码" />
											    </label>
											    <label>
											    <span>确认新密码 :</span>
											    <input id="regpwd3" type="password" name="" placeholder="您的新密码" />
											    </label>
											     <label>
											    <span>&nbsp;</span>
											    <input type="button" class="button" onclick="updatepwd()" value="修改密码" />
											    </label>
										</form>
									 </c:if>
								</article>
								 <c:if test="${type=='consultation' }">
								 			<a class="button" onclick="toConsultation()" style="float: left">我要留言</a>
										 <ul style="font-size: 14px;margin-top: 110px">
										 	<c:forEach items="${conmentList }" var="item">
										 	<li><div style="width: 100%;word-break:break-all; word-wrap:break-word ;">
										 		<p><span style="font-weight: bold">[${item.addDate}] </span>:${item.content } <a href="${ctx}/com/delConsultation.action?uid=${item.id}">删除</a>
										 			<c:if test="${not empty item.reDate }">
										 			<br/><span >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[回复] </span>[${item.reDate}]: ${item.reContent }
										 			</c:if>
										 		</p>
										 		</div> 
										 	</li>
										 	</c:forEach>
										 </ul>
										
									 </c:if>					
								 <c:if test="${type=='tips' }">
								 		<form action="${ctx }/com/toUser.action?type=tips" method="post">
								 			<input type="text" name="ques" value="${ques }" placeholder="请输入您的问题" size="50">
												<input type="submit" class="button black small" value="查询">								 		
								 		</form>
										 <ul style="font-size: 14px;margin-top: 10px">
										 	<c:forEach items="${tipsList }" var="item">
										 	<li><div style="width: 100%;word-break:break-all; word-wrap:break-word ;background:#f1f1f1">
										 		<p>${item.key.name } 
										 			<br/><span >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>${item.key.answer }
										 		</p>
										 		</div> 
										 	</li>
										 	</c:forEach>
										 </ul>
										
									 </c:if>					
								 <c:if test="${type=='interview' }">
										<table width="100%">
										 	<thead>
										 	<tr style="background:#f1f1f1">
										 		<th align="left" width="20%">职位名称</th>
										 		<th align="left" width="20%">所属公司</th>
										 		<th align="left" width="10%">面试时间</th>
										 		<th align="left" width="10%">面试地区</th>
										 		
										 		<th align="left"  width="10%">操作</th>
										 	</tr>
										 	</thead>
										 	<tbody style="font-size: 13px">
										 	<c:if test="${empty interviewList}"><tr><td colspan="4" style="color: blue">未找到相关信息</td></tr></c:if>
										 	<c:forEach items="${interviewList}" var="item">
										 		<tr>
										 		<td align="left"><a href="${ctx}/com/getPosition.action?uid=${item.position.id}" target="blank">${item.position.name }</a></td>
										 		<td align="left"><a href="${ctx}/com/getCompany.action?uid=${item.position.company.id}" target="blank">${item.position.company.name }</a></td>
										 		<td>${item.interviewDate}</td>
										 		<td>${item.interviewArea}</td>
										 		<td><a href="${ctx}/com/delPre.action?uid=${item.id}" class="button small">取消面试</a>
										 		</td>
										 		</tr>
										 	</c:forEach>
										 	</tbody>
										 </table>
									 </c:if>
									<c:if test="${type=='apply' }">
										<table width="100%">
										 	<thead>
										 	<tr style="background:#f1f1f1">
										 		<th align="left" width="20%">职位名称</th>
										 		<th align="left" width="20%">公司名称</th>
										 		<th align="left"  width="10%">所在城市</th>
										 		<th align="left"  width="10%">状态</th>
										 		<th align="left"  width="10%">操作</th>
										 	</tr>
										 	</thead>
										 	<tbody style="font-size: 13px">
										 	<c:if test="${empty interviewList}"><tr><td colspan="4" style="color: blue">未找到相关信息</td></tr></c:if>
										 	<c:forEach items="${interviewList}" var="item">
										 		<tr>
										 		<td align="left"><a href="${ctx}/com/getPosition.action?uid=${item.position.id}" target="blank">${item.position.name }</a></td>
										 		<td align="left"><a href="${ctx}/com/getCompany.action?uid=${item.position.company.id}" target="blank">${item.position.company.name }</a></td>
										 		<td>${item.position.company.area}</td>
										 		<td>${item.status}</td>
										 		<td>
										 		<c:if test="${item.status=='待投简历' }">
										 			<a class="button small" onclick="toApply('${item.id}')">投简历</a>
										 			<a class="button small" href="${ctx}/com/delPre.action?uid=${item.id}" >删除</a>
										 		</c:if>
										 		<c:if test="${item.status=='通知面试' }">
										 			<a class="button small" onclick="backApply('${item.id}')">取消面试</a>
										 		</c:if>
										 		</td>
										 		</tr>
										 	</c:forEach>
										 	</tbody>
										 </table>
									 </c:if>
						</div>
					</div>
				</div>
			</div>
			  <jsp:include page="./footer.jsp"></jsp:include> 
			  
			  
<div id="notebox" style="display: none;width: 590px;margin-top:10px">
    <form action="${ctx }/com/addConsultation.action" method="post" class="basic-grey">
    <label>
    <span>留言内容 :</span>
    <textarea  type="text" name="consultation.content" placeholder="留言内容" ></textarea>
    </label>
     <label>
    <span>&nbsp;</span>
    <input type="submit" class="button"  value="留言" style="margin-left:90px" />
    </label>
    </form>
</div>
<div id="applybox" style="display: none;width: 590px;margin-top:10px">
    <form action="${ctx }/com/toApply.action" method="post" class="basic-grey">
    	<input type="hidden" value="" name="uid" id="applyuid">
    <label>
    <span>投简历 :</span>
    	<input  type="text" readonly="readonly" id="apply"/>
    </label>
     <label>
    <span>&nbsp;</span>
    <input type="submit" class="button"  value="投简历" style="margin-left:90px"/>
    </label>
    </form>
</div>
<script type="text/javascript">
function toupdate(){
	$("#updateForm").submit();
}
function backApply(uid){
	$.ajax({
 		url:"${ctx }/com/backApply.action",
 		contentType:"application/x-www-form-urlencoded;charset=UTF-8",
 		type:"post",
 		dataType:"json",
 		data:{"uid":uid},
 		success:function(json){
 			if(json.msg=="成功"){
 				alert("取消成功");
				layer.close(pageii);
				window.location.href="${ctx }/com/toUser.action?type=interview";
 			}else{
 				alert(json.msg);
 			}
 		},
 		error:function(json){}
});
}

function updatepwd(){
	var regpwd1 = $("#regpwd1").val();
	var regpwd2 = $("#regpwd2").val();
	var regpwd3 = $("#regpwd3").val();
	if(regpwd1==""){
		alert("请输入旧密码");return false;
	}
	if(regpwd2==""){
		alert("请输入新密码");return false;
	}
	if(regpwd3==""){
		alert("请输入确认新密码");return false;
	}
	if(regpwd2!=regpwd3){
		alert("密码输入不一致");return false;
	}
	$.ajax({
     		url:"${ctx }/com/userPwd.action",
     		contentType:"application/x-www-form-urlencoded;charset=UTF-8",
     		type:"post",
     		dataType:"json",
     		data:{"oldpwd":regpwd1,"newpwd":regpwd2},//window.encodeURI(中文值)：对字符串进行编码
     		success:function(json){
     			if(json.msg=="成功"){
     				alert("修改密码成功");
					layer.close(pageii);
					window.location.href="${ctx }/com/toUser.action?type=pwd";
     			}else{
     				alert(json.msg);
     			}
     		},
     		error:function(json){}
	});
}
var pageii;
function toConsultation(){
	layer.close(pageii);
	pageii = $.layer({
	    type: 1,
	    title: '留言',
	    area: ['580', '270'],
	    border: [10, 0.3, '#000'],
	    shade: [0.3, '#000'],
	    closeBtn: [1, true],
	    shadeClose: true,
	    fadeIn: 300,
	    fix: true,
	    page: {dom: '#notebox',},
	    close:function(){
	    }
	});
}
function toApply(id){
	$("#applyuid").val(id);
	layer.close(pageii);
	pageii = $.layer({
	    type: 1,
	    title: '待投简历',
	    area: ['585', '200'],
	    border: [10, 0.3, '#000'],
	    shade: [0.3, '#000'],
	    closeBtn: [1, true],
	    shadeClose: true,
	    fadeIn: 300,
	    fix: true,
	    page: {dom: '#applybox',},
	    close:function(){
	    }
	});
}

 

</script>
	</body>
</html>