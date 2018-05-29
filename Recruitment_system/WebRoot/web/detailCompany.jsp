<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./head.jsp"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>${item.name }</title>
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
		<script src="${ctx }/web/css/5grid/init.js?use=mobile,desktop,1000px&amp;mobileUI=1&amp;mobileUI.theme=none&amp;mobileUI.titleBarHeight=60&amp;mobileUI.openerWidth=52"></script>
		<!--[if IE 9]><link rel="stylesheet" href="${ctx }/web/css/style-ie9.css" /><![endif]-->
<!-- 		<link href="${ctx }/web/raty/demo//stylesheets/labs.css" media="screen" rel="stylesheet" type="text/css"> -->
		<script src="${ctx }/chart/Chart.js" type="text/javascript"></script>
		<link rel="stylesheet" href="${ctx }/web/css/btn.css" />
		<style type="text/css">
		.menu_list{width:268px;margin:0 auto;}
		.menu_head{height:47px;line-height:47px;padding-left:38px;font-size:14px;color:#525252;cursor:pointer;border:1px solid #e1e1e1;position:relative;margin:0px;font-weight:bold;background:#f1f1f1 url(images/pro_left.png) center right no-repeat;}
		.menu_list .current{background:#f1f1f1 url(images/pro_down.png) center right no-repeat;}
		.menu_body{line-height:38px;border-left:1px solid #e1e1e1;backguound:#fff;border-right:1px solid #e1e1e1;}
		.menu_body a{display:block;height:38px;line-height:38px;padding-left:38px;color:#777777;background:#fff;text-decoration:none;border-bottom:1px solid #e1e1e1;}
		.menu_body a:hover{text-decoration:none;}
		</style>
	</head>
	<body>
		<!-- Header -->
			<div id="header-wrapper">
				 <jsp:include page="./menu.jsp"><jsp:param value="company" name="type"/> </jsp:include> 
			</div>

		<!-- Main -->

			<div id="main-wrapper" class="subpage">
				<div class="5grid-layout">
					<div class="row">
						<div class="3u">
								<section>	</section>
						</div>
						<div class="9u mobileUI-main-content">
						<article class="first" style="margin-top: 1px">
							<div style="float: left; width: 550px">
							<h3>${item.name }</h3>
							<h5>位置: ${item.area}</h5>
							<h5>公司介绍:</h5>
							<h5 style="font-size: 15px">${item.content }</h5>
							</div>
						</article>
						<div style="clear: both"></div>
						<article class="first" style="margin-top: 20px">
							<div style="float: left; width: 100%">
								<h4 id="fh1" class="menu_head">您可能还感兴趣的公司推荐</h4>
								<table width="100%">
								 	<tbody style="font-size: 13px">
								 	<c:forEach items="${recommendList }" var="item">
								 		<tr>
								 		<td align="left"><a href="${ctx}/com/getCompany.action?uid=${item.id}">${item.name }</a></td>
								 		</tr>
								 	</c:forEach>
								 	</tbody>
								 </table>
							</div>
						</article>	
						</div>
					</div>
				</div>
			</div>
		<!-- Footer -->
	<jsp:include page="./footer.jsp"></jsp:include> 
	 
	</body>
	 
									
</html>