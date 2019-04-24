<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./common/head.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>${appTitle }</title>

<link href="${ctx }/dwz/themes/default/style.css" rel="stylesheet"
	type="text/css" media="screen" />
<link href="${ctx }/dwz/themes/css/core.css" rel="stylesheet"
	type="text/css" media="screen" />
<link href="${ctx }/dwz/themes/css/print.css" rel="stylesheet"
	type="text/css" media="print" />
<link href="${ctx }/dwz/uploadify/css/uploadify.css" rel="stylesheet"
	type="text/css" media="screen" />
<!--[if IE]>
<link href="${ctx }/dwz/themes/css/ieHack.css" rel="stylesheet" type="text/css" media="screen"/>
<![endif]-->

<!--[if lte IE 9]>
<script src="${ctx }/dwz/js/speedup.js" type="text/javascript"></script>
<![endif]-->

<script src="${ctx }/dwz/js/jquery-1.7.2.js" type="text/javascript"></script>
<script src="${ctx }/dwz/js/jquery.cookie.js" type="text/javascript"></script>
<script src="${ctx }/dwz/js/jquery.validate.js" type="text/javascript"></script>
<script src="${ctx }/dwz/js/jquery.bgiframe.js" type="text/javascript"></script>
<script src="${ctx }/dwz/xheditor/xheditor-1.2.1.min.js"
	type="text/javascript"></script>
<script src="${ctx }/dwz/xheditor/xheditor_lang/zh-cn.js"
	type="text/javascript"></script>
<script src="${ctx }/dwz/uploadify/scripts/jquery.uploadify.js"
	type="text/javascript"></script>

<!-- svg图表  supports Firefox 3.0+, Safari 3.0+, Chrome 5.0+, Opera 9.5+ and Internet Explorer 6.0+ -->
<!-- <script type="text/javascript" src="${ctx }/dwz/chart/raphael.js"></script> -->
<!-- <script type="text/javascript" src="${ctx }/dwz/chart/g.raphael.js"></script> -->
<!-- <script type="text/javascript" src="${ctx }/dwz/chart/g.bar.js"></script> -->
<!-- <script type="text/javascript" src="${ctx }/dwz/chart/g.line.js"></script> -->
<!-- <script type="text/javascript" src="${ctx }/dwz/chart/g.pie.js"></script> -->
<!-- <script type="text/javascript" src="${ctx }/dwz/chart/g.dot.js"></script> -->

<script src="${ctx }/dwz/js/dwz.core.js" type="text/javascript"></script>
<script src="${ctx }/dwz/js/dwz.util.date.js" type="text/javascript"></script>
<script src="${ctx }/dwz/js/dwz.validate.method.js"
	type="text/javascript"></script>
<script src="${ctx }/dwz/js/dwz.regional.zh.js" type="text/javascript"></script>
<script src="${ctx }/dwz/js/dwz.barDrag.js" type="text/javascript"></script>
<script src="${ctx }/dwz/js/dwz.drag.js" type="text/javascript"></script>
<script src="${ctx }/dwz/js/dwz.tree.js" type="text/javascript"></script>
<script src="${ctx }/dwz/js/dwz.accordion.js" type="text/javascript"></script>
<script src="${ctx }/dwz/js/dwz.ui.js" type="text/javascript"></script>
<script src="${ctx }/dwz/js/dwz.theme.js" type="text/javascript"></script>
<script src="${ctx }/dwz/js/dwz.switchEnv.js" type="text/javascript"></script>
<script src="${ctx }/dwz/js/dwz.alertMsg.js" type="text/javascript"></script>
<script src="${ctx }/dwz/js/dwz.contextmenu.js" type="text/javascript"></script>
<script src="${ctx }/dwz/js/dwz.navTab.js" type="text/javascript"></script>
<script src="${ctx }/dwz/js/dwz.tab.js" type="text/javascript"></script>
<script src="${ctx }/dwz/js/dwz.resize.js" type="text/javascript"></script>
<script src="${ctx }/dwz/js/dwz.dialog.js" type="text/javascript"></script>
<script src="${ctx }/dwz/js/dwz.dialogDrag.js" type="text/javascript"></script>
<script src="${ctx }/dwz/js/dwz.sortDrag.js" type="text/javascript"></script>
<script src="${ctx }/dwz/js/dwz.cssTable.js" type="text/javascript"></script>
<script src="${ctx }/dwz/js/dwz.stable.js" type="text/javascript"></script>
<script src="${ctx }/dwz/js/dwz.taskBar.js" type="text/javascript"></script>
<script src="${ctx }/dwz/js/dwz.ajax.js" type="text/javascript"></script>
<script src="${ctx }/dwz/js/dwz.pagination.js" type="text/javascript"></script>
<script src="${ctx }/dwz/js/dwz.database.js" type="text/javascript"></script>
<script src="${ctx }/dwz/js/dwz.datepicker.js" type="text/javascript"></script>
<script src="${ctx }/dwz/js/dwz.effects.js" type="text/javascript"></script>
<script src="${ctx }/dwz/js/dwz.panel.js" type="text/javascript"></script>
<script src="${ctx }/dwz/js/dwz.checkbox.js" type="text/javascript"></script>
<script src="${ctx }/dwz/js/dwz.history.js" type="text/javascript"></script>
<script src="${ctx }/dwz/js/dwz.combox.js" type="text/javascript"></script>
<script src="${ctx }/dwz/js/dwz.print.js" type="text/javascript"></script>
<!--
<script src="${ctx }/dwz/bin/dwz.min.js" type="text/javascript"></script>
-->
<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
	<!-- Ionicons -->
	<link rel="stylesheet"
		href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
		<!-- Theme style -->
		<link rel="stylesheet"
			href="${ctx }/adminIte/dist/css/AdminLTE.min.css">
			<!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
			<link rel="stylesheet"
				href="${ctx }/adminIte/dist/css/skins/_all-skins.min.css">
				<!-- iCheck -->
				<link rel="stylesheet"
					href="${ctx }/adminIte/plugins/iCheck/flat/blue.css">
					<!-- Morris chart -->
					<link rel="stylesheet"
						href="${ctx }/adminIte/plugins/morris/morris.css">
						<!-- jvectormap -->
						<link rel="stylesheet"
							href="${ctx }/adminIte/plugins/jvectormap/jquery-jvectormap-1.2.2.css">
							<!-- Date Picker -->
							<link rel="stylesheet"
								href="${ctx }/adminIte/plugins/datepicker/datepicker3.css">
								<!-- Daterange picker -->
								<link rel="stylesheet"
									href="${ctx }/adminIte/plugins/daterangepicker/daterangepicker.css">
									<!-- bootstrap wysihtml5 - text editor -->
									<link rel="stylesheet"
										href="${ctx }/adminIte/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
										<!-- jvectormap -->
										<link rel="stylesheet"
											href="${ctx }/adminIte/plugins/jvectormap/jquery-jvectormap-1.2.2.css">
											<!-- Theme style -->
											<link rel="stylesheet"
												href="${ctx }/adminIte/dist/css/AdminLTE.min.css">
												<!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
												<link rel="stylesheet"
													href="${ctx }/adminIte/dist/css/skins/_all-skins.min.css">
													<script src="${ctx }/dwz/js/dwz.regional.zh.js"
														type="text/javascript"></script>

													<script type="text/javascript">
														$(function() {
															DWZ
																	.init(
																			"${ctx }/dwz.frag.xml",
																			{
																				loginUrl : "login_dialog.html",
																				loginTitle : "登录",
																				//		loginUrl:"login.html",	
																				statusCode : {
																					ok : 200,
																					error : 300,
																					timeout : 301
																				},
																				pageInfo : {
																					pageNum : "pageNum",
																					numPerPage : "numPerPage",
																					orderField : "orderField",
																					orderDirection : "orderDirection"
																				},
																				debug : false,
																				callback : function() {
																					initEnv();
																					$(
																							"#themeList")
																							.theme(
																									{
																										themeBase : "${ctx }/dwz/themes"
																									});
																				}
																			});
														});

														function addtime() {
															dt = new Date();
															var h = dt
																	.getHours();
															var m = dt
																	.getMinutes();
															var s = dt
																	.getSeconds();
															document
																	.getElementById("addtime").innerHTML = h
																	+ ":"
																	+ m
																	+ ":" + s;
														}
														
													</script>
		<style type="text/css">
			
			#gongao #scroll_begin,
			#gongao #scroll_end {
				display: inline
			}
		</style>
		<script type="text/javascript">
			function ScrollLeft() {
				var speed = 50;
				var scroll_begin = document.getElementById("scroll_begin");
				var scroll_end = document.getElementById("scroll_end");
				var scroll_div = document.getElementById("scroll_div");
				scroll_end.innerHTML = scroll_begin.innerHTML;

				function Marquee() {
					if(scroll_end.offsetWidth - scroll_div.scrollLeft <= 0)
						scroll_div.scrollLeft -= scroll_begin.offsetWidth;
					else
						scroll_div.scrollLeft++;
				}
				var MyMar = setInterval(Marquee, speed);
				scroll_div.onmouseover = function() { clearInterval(MyMar); }
				scroll_div.onmouseout = function() { MyMar = setInterval(Marquee, speed); }
			}
		</script>
</head>
<body scroll="no" onload="setInterval(addtime, 1000)">
	<div id="layout">
		<div id="header">
			<div class="" style="background-color: #16A085; height: 50px">
				<!-- <a class="logo1" href=""></a> -->
				<span
					style="color: white; font-size: 20px; font-weight: bolder; font-family: 'Microsoft YaHei'; line-height: 47px; margin-left: 25px">${appTitle }&nbsp;&nbsp;&nbsp;&nbsp;Recruitment System</span>
				<ul class="nav">
					<li><a href="${ctx}/com/jumpMain.action" >首页</a></li>
					<li><a href="${ctx}/com/toSelf.action" target="navTab"
								rel="mainquery">个人资料</a></li>
					<li><a
						href="${ctx }/com/logout.action?loginid=${SESSION_BEAN.user.user.uname}">退出</a></li>
				</ul>
				<ul class="themeList" id="themeList">
					<li>
						<h2 id="addtime" style="color: white"></h2>
					</li>
				</ul>
			</div>
			<!-- navMenu -->
		</div>
		<div id="leftside">
			<div id="sidebar_s">
				<div class="collapse">
					<div class="toggleCollapse">
						<div></div>
					</div>
				</div>
			</div>
			<div id="sidebar">
				<div class="toggleCollapse">
					<h2>系统操作菜单</h2>
					<div>收缩</div>
				</div>
				<div class="accordion" fillSpace="sidebar">
					<c:if test="${SESSION_BEAN.role=='SysUser' }">
						<div class="accordionHeader">
							<h2>
								<span>Folder</span>系统模块管理
							</h2>
						</div>
						<div class="accordionContent">
							<ul class="tree treeFolder">
								<c:if test="${SESSION_BEAN.user.type=='管理员' }">
									<li><a href="${ctx}/sys/querySysUser.action"
										target="navTab" rel="mainquery">管理员列表</a></li>
								</c:if>
								<li><a href="${ctx}/sys/querySimpleUser.action"
									target="navTab" rel="mainquery">用户列表</a></li>
								<li><a href="${ctx}/sys/querySysType.action?s_type=shehui"
									target="navTab" rel="mainquery">社会招聘</a></li>
								<li><a
									href="${ctx}/sys/querySysType.action?s_type=xiaoyuan"
									target="navTab" rel="mainquery">校园招聘</a></li>
								<li><a href="${ctx}/sys/querySysType.action?s_type=neitui"
									target="navTab" rel="mainquery">内部推荐</a></li>

							</ul>
						</div>
						<div class="accordionHeader">
							<h2>
								<span>Folder</span>招聘模块管理
							</h2>
						</div>
						<div class="accordionContent">
							<ul class="tree treeFolder">
								<li><a href="${ctx}/sys/queryCompany.action"
									target="navTab" rel="mainquery">招聘公司管理</a></li>
								<li><a href="${ctx}/sys/queryPosition.action"
									target="navTab" rel="mainquery">招聘职位管理</a></li>
								<li><a href="${ctx}/sys/querySysNews.action"
									target="navTab" rel="mainquery">招聘新闻管理</a></li>
								<li><a href="${ctx}/sys/querySysHotel.action"
									target="navTab" rel="mainquery">招聘酒店管理</a></li>
							</ul>
						</div>
						<div class="accordionHeader">
							<h2>
								<span>Folder</span>用户服务管理
							</h2>
						</div>
						<div class="accordionContent">
							<ul class="tree treeFolder">
								<li><a href="${ctx}/sys/queryPositionUser.action"
									target="navTab" rel="mainquery">职位简历审核</a></li>
								<li><a href="${ctx}/sys/queryConsultation.action"
									target="navTab" rel="mainquery">用户留言管理</a></li>
								<li><a href="${ctx}/sys/querySysTips.action"
									target="navTab" rel="mainquery">问题帮助管理</a></li>
								<li><a href="${ctx}/sys/queryUserLog.action"
									target="navTab" rel="mainquery">用户操作记录</a></li>
							</ul>
						</div>
					</c:if>
					<div class="accordionHeader">
						<h2>
							<span>Folder</span>个人资料修改
						</h2>
					</div>
					<div class="accordionContent">
						<ul class="tree treeFolder">
							<li><a href="${ctx}/com/toSelf.action" target="navTab"
								rel="mainquery">修改个人资料</a></li>
							<li><a href="${ctx}/com/outLine.action" target="navTab"
								rel="mainquery">强制账号下线</a></li>
							<li><a href="${ctx}/com/inLine.action" target="navTab"
								rel="mainquery">在线管理列表</a></li>
							<li><a href="${ctx}/com/inSimpleLine.action" target="navTab"
								rel="mainquery">在线用户列表</a></li>
						</ul>
					</div>

				</div>
			</div>
		</div>
		<div id="container">
			<div id="navTab" class="tabsPage">
				<div class="tabsPageHeader">
					<div class="tabsPageHeaderContent">
						<ul class="navTab-tab">
							<li tabid="main" class="main"><a href="javascript:;"><span><span
										class="home_icon">系统主页</span></span> </a></li>
						</ul>
					</div>
					<div class="tabsLeft">left</div>
					<div class="tabsRight">right</div>
					<div class="tabsMore">more</div>
				</div>
				<ul class="tabsMoreList">
					<li><a href="javascript:;">系统主页</a></li>
				</ul>
				<div class="navTab-panel tabsPageContent layoutBox">
					<div class="page unitBox">
						<div class="pageFormContent" layoutH="50">
							<%-- <div id="gongao">
								<div style="width:900px;height:30px;margin:0 auto;white-space: nowrap;overflow:hidden;" id="scroll_div" class="scroll_div">
									<div id="scroll_begin">
										欢迎您:${SESSION_BEAN.user.user.uname}&nbsp;&nbsp;&nbsp;&nbsp;您的登录时间为${SESSION_BEAN.str}
									</div>
									<div id="scroll_end">
									</div>
									<!-- <input type="button" onclick="ScrollLeft()"> -->
								</div>
								<script type="text/javascript">
									ScrollLeft();
								</script>
							</div> --%>
							<marquee scrollamount="10" onmouseout="this.start()" onmouseover="this.stop()">欢迎您:${SESSION_BEAN.user.user.uname}&nbsp;&nbsp;&nbsp;&nbsp;您的登录时间为${SESSION_BEAN.str}</marquee>
							<%-- <p style="color: red">&nbsp;&nbsp;&nbsp;&nbsp;欢迎您:${SESSION_BEAN.user.user.uname}</p>
							<p style="color: red">您的登录时间为${SESSION_BEAN.str}</p> --%>
							<h2 style="color: red; margin-top: 5px"></h2>
							<div class="divider"></div>
							<h2 style="color: white">1</h2>

							<!-- ./col -->
							<div class="" style="float: left; margin-left: 35px">
								<!-- small box -->
								<div class="small-box bg-yellow" style="width: 225px">
									<div class="inner">
										<h3>${SESSION_BEAN.user.user.uname}</h3>

										<p style="width: 200px; height: 21px">用户信息</p>
									</div>
									<div class="icon">
										<i class="ion ion-person-add"></i>
									</div>
									<a href="${ctx}/sys/querySysUser.action" target="navTab"
										rel="mainquery" style="margin-top: 13px"
										class="small-box-footer">More info <i
										class="fa fa-arrow-circle-right"></i></a>
								</div>
							</div>
							<!-- ./col -->
							<div class="" style="float: left; margin-left: 45px">
								<!-- small box -->
								<div class="small-box bg-aqua" style="width: 225px">
									<div class="inner">
										<h3>150</h3>

										<p style="width: 200px; height: 21px">职位信息</p>
									</div>
									<div class="icon">
										<i class="ion ion-bag"></i>
									</div>
									<a href="${ctx}/sys/queryPosition.action" target="navTab"
										rel="mainquery" style="margin-top: 13px"
										class="small-box-footer">More info <i
										class="fa fa-arrow-circle-right"></i></a>
								</div>
							</div>
							<!-- ./col -->
							<div class="" style="float: left; margin-left: 45px">
								<!-- small box -->
								<div class="small-box bg-green" style="width: 225px;">
									<div class="inner">
										<h3>
											53<sup style="font-size: 20px">%</sup>
										</h3>

										<p style="width: 200px; height: 21px">用户操作</p>
									</div>
									<div class="icon">
										<i class="ion ion-stats-bars"></i>
									</div>
									<a href="${ctx}/sys/queryUserLog.action" target="navTab"
										rel="mainquery" style="margin-top: 13px"
										class="small-box-footer">More info <i
										class="fa fa-arrow-circle-right"></i></a>
								</div>
							</div>

							<!-- ./col -->
							<div class="" style="float: left; margin-left: 45px">
								<!-- small box -->
								<div class="small-box bg-red" style="width: 225px">
									<div class="inner">
										<h3>${fn:length(APPLICATION_ONLINE_USER) }</h3>

										<p style="width: 200px; height: 21px">当前在线用户数</p>
									</div>
									<div class="icon">
										<i class="ion ion-pie-graph"></i>
									</div>
									<a href="#" style="margin-top: 13px" class="small-box-footer">More
										info <i class="fa fa-arrow-circle-right"></i>
									</a>
								</div>
							</div>




							<div class="divider"></div>
							<div class="box box-solid bg-teal-gradient">
								<div class="box-header">
									<i class="fa fa-th"></i>

									<h3 class="box-title">Sales Graph</h3>

									<div class="box-tools pull-right">
										<!-- <button type="button" class="btn bg-teal btn-sm"
											data-widget="collapse">
											<i class="fa fa-minus"></i>
										</button>
										<button type="button" class="btn bg-teal btn-sm"
											data-widget="remove">
											<i class="fa fa-times"></i>
										</button> -->
									</div>
								</div>
								<div class="box-body border-radius-none">
									<div class="chart" id="line-chart" style="height: 250px;"></div>
								</div>
								<!-- /.box-body -->
								<div class="box-footer no-border"></div>
								<!-- /.box-footer -->
							</div>
							<!-- <div class="unit"></div> -->


							<!-- <div class="divider">3</div> -->
							<div class="box box-warning direct-chat direct-chat-warning"
								style="width: 520px; float: left; border: 1px solid #F39C12">
								<div class="box-header with-border">
									<h3 class="box-title">客服</h3>
								</div>
								<!-- /.box-header -->
								<div class="box-body">
									<!-- Conversations are loaded here -->
									<div class="direct-chat-messages">
										<!-- Message. Default to the left -->
										<div class="direct-chat-msg">
											<div class="direct-chat-info clearfix">
												<span class="direct-chat-name" style="margin-left: 10px">用户</span>
												<span class="direct-chat-timestamp pull-right">23 Jan
													2:00 pm</span>
											</div>
											<!-- /.direct-chat-info -->
											<img class="direct-chat-img"
												src="${ctx }/adminIte/dist/img/user1-128x128.jpg"
												alt="message user image"> <!-- /.direct-chat-img -->
												<div class="direct-chat-text" style="width: 100px">问题</div>
												<!-- /.direct-chat-text -->
										</div>
										<!-- /.direct-chat-msg -->

										<!-- Message to the right -->
										<div class="direct-chat-msg right">
											<div class="direct-chat-info clearfix">
												<span class="direct-chat-name" style="margin-left: 265px">客服</span>
												<span class="direct-chat-timestamp pull-left">23 Jan
													2:05 pm</span>
											</div>
											<!-- /.direct-chat-info -->
											<img class="direct-chat-img"
												src="${ctx }/adminIte/dist/img/user1-128x128.jpg"
												alt="message user image"> <!-- /.direct-chat-img -->
												<div class="direct-chat-text"
													style="width: 100px; margin-left: 210px">回复</div> <!-- /.direct-chat-text -->
										</div>
										<!-- /.direct-chat-msg -->

										<!-- Message. Default to the left -->
										<div class="direct-chat-msg">
											<div class="direct-chat-info clearfix">
												<span class="direct-chat-name" style="margin-left: 10px">用户</span>
												<span class="direct-chat-timestamp pull-right">23 Jan
													5:37 pm</span>
											</div>
											<!-- /.direct-chat-info -->
											<img class="direct-chat-img"
												src="${ctx }/adminIte/dist/img/user1-128x128.jpg"
												alt="message user image"> <!-- /.direct-chat-img -->
												<div class="direct-chat-text" style="width: 100px">问题</div>
												<!-- /.direct-chat-text -->
										</div>
										<!-- /.direct-chat-msg -->

										<!-- Message to the right -->
										<div class="direct-chat-msg right">
											<div class="direct-chat-info clearfix">
												<span class="direct-chat-name" style="margin-left: 265px">客服</span>
												<span class="direct-chat-timestamp pull-left">23 Jan
													6:10 pm</span>
											</div>
											<!-- /.direct-chat-info -->
											<img class="direct-chat-img"
												src="${ctx }/adminIte/dist/img/user1-128x128.jpg"
												alt="message user image"> <!-- /.direct-chat-img -->
												<div class="direct-chat-text"
													style="width: 100px; margin-left: 210px">回复</div> <!-- /.direct-chat-text -->
										</div>
										<!-- /.direct-chat-msg -->

									</div>
									<!--/.direct-chat-messages-->


									<!-- /.box-body -->
									<div class="box-footer">
										<form action="#" method="post">
											<div class="input-group">
												<input type="text" name="message"
													placeholder="Type Message ..." class="form-control">
													<span class="input-group-btn">
														<button type="button" class="btn btn-warning btn-flat">回复</button>
												</span>
											</div>
										</form>
									</div>
									<!-- /.box-footer-->
								</div>
							</div>
							<!-- <pre style="margin:5px;line-height:1.4em"></pre> -->


							<div class="box box-solid bg-light-blue-gradient"
								style="width: 520px;height:350px; float: left; margin-left: 60px; border: 1px solid #F39C12">
								<div class="box-header">
									<!-- tools box -->
									<div class="pull-right box-tools">
										<!-- <button type="button"
											class="btn btn-primary btn-sm daterange pull-right"
											data-toggle="tooltip" title="Date range">
											<i class="fa fa-calendar"></i>
										</button>
										<button type="button"
											class="btn btn-primary btn-sm pull-right"
											data-widget="collapse" data-toggle="tooltip" title="Collapse"
											style="margin-right: 5px;">
											<i class="fa fa-minus"></i>
										</button> -->
									</div>
									<!-- /. tools -->

									<i class="fa fa-map-marker"></i>

									<h3 class="box-title">用户</h3>
								</div>
								<div class="box-body">
									<div id="world-map" style="height: 250px; width: 100%;"></div>
								</div>
								<!-- /.box-body-->
								<div class="box-footer no-border">
									<div class="row">
										<div class="col-xs-4 text-center"
											style="border-right: 1px solid #f4f4f4">
											<div id="sparkline-1"></div>
											<!-- <div class="knob-label">Visitors</div> -->
										</div>
										<!-- ./col -->
										<div class="col-xs-4 text-center"
											style="border-right: 1px solid #f4f4f4">
											<div id="sparkline-2"></div>
											<!-- <div class="knob-label">Online</div> -->
										</div>
										<!-- ./col -->
										<div class="col-xs-4 text-center">
											<div id="sparkline-3"></div>
											<!-- <div class="knob-label">Exists</div> -->
										</div>
										<!-- ./col -->
									</div>
									<!-- /.row -->
								</div>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="footer">Copyright &copy; 2017 ${appTitle }</div>

</body>

</html>