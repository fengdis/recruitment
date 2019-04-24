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
	</head>
	<body>
		<!-- Header -->
			<div id="header-wrapper">
				 <jsp:include page="./menu.jsp"><jsp:param value="syshotel" name="type"/> </jsp:include> 
			</div>

		<!-- Main -->

			<div id="main-wrapper" class="subpage">
				<div class="5grid-layout">
					<div class="row">
						<div class="3u">
								<section>	</section>
						</div>
						<article class="first" style="margin-top: 1px">
							<div style="float: left; width: 100%">
							<h3>${item.name }</h3>
							<h5>类型: ${item.type}</h5>
							<h5>价格: ${item.price}</h5>
							<h5>地址: ${item.address}</h5>
							<h5>酒店介绍:</h5>
							<h5 style="font-size: 15px">${item.content }</h5>
							</div>
						</article>	
					</div>
				</div>
			</div>
		<!-- Footer -->
	<jsp:include page="./footer.jsp"></jsp:include> 
	 
	</body>
	 
									
</html>