<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./head.jsp"%>
<!DOCTYPE HTML>
<html>
<head>
<title>${appTitle }</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<link href="${ctx }/web/css/g.css" rel="stylesheet" />
<link rel="stylesheet" href="${ctx }/web/css/5grid/core.css" />
<link rel="stylesheet" href="${ctx }/web/css/5grid/core-desktop.css" />
<link rel="stylesheet" href="${ctx }/web/css/5grid/core-1200px.css" />
<link rel="stylesheet" href="${ctx }/web/css/5grid/core-noscript.css" />
<link rel="stylesheet" href="${ctx }/web/css/style.css" />
<link rel="stylesheet" href="${ctx }/web/css/style-desktop.css" />
<script src="${ctx }/web/css/5grid/jquery.js"></script>
<script
	src="${ctx }/web/css/5grid/init.js?use=mobile,desktop,1000px&amp;mobileUI=1&amp;mobileUI.theme=none&amp;mobileUI.titleBarHeight=60&amp;mobileUI.openerWidth=52"></script>
<!--[if IE 9]><link rel="stylesheet" href="${ctx }/web/css/style-ie9.css" /><![endif]-->
</head>
<body>

	<!-- Header -->

	<div id="header-wrapper">
		<jsp:include page="./menu.jsp"><jsp:param value="index"
				name="type" />
		</jsp:include>
	</div>

	<div id="main-wrapper">
		<div class="5grid-layout">

			<!-- Banner -->

			<div class="row">
				<div class="12u" style="height:500px">
					<div id="banner">

						<img src="${ctx }/web/images/main.png" alt="" />

					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		function tosearch() {
			if ($("#searchKey").val() == '') {
				alert("请输入搜索关键字");
				$("#searchKey").focus();
				return;
			}
			$("#searchForm").submit();
		}
	</script>

	<footer class="5grid-layout" id="site-footer">
		<div class="row">
			<div class="3u" >
				<section class="first" style="margin-left:120px">
					<h2>
						<a href="${ctx}/com/findCompany.action">招聘公司</a>
					</h2>
					<ul class="link-list">
						<c:forEach items="${list1}" var="item">
							<li><a href="${ctx }/com/getCompany.action?uid=${item.id}"
								target="blank"><span
									style="width: 280px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; display: block;">${item.name }</span></a>
						</c:forEach>
					</ul>
				</section>
			</div>
			<div class="3u">
				<section>
					<h2>
						<a href="${ctx}/com/findSysType.action?s_type=shehui">社会招聘</a>
					</h2>
					<ul class="link-list">
						<c:forEach items="${list2}" var="item">
							<li><a href="${ctx }/com/getSysType.action?uid=${item.id}"
								target="blank"><span
									style="width: 280px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; display: block;">${item.name }</span></a>
						</c:forEach>
					</ul>
				</section>
			</div>
			<div class="3u">
				<section>
					<h2>
						<a href="${ctx}/com/findSysType.action?s_type=xiaoyuan">校园招聘</a>
					</h2>
					<ul class="link-list">
						<c:forEach items="${list3}" var="item">
							<li><a href="${ctx }/com/getSysType.action?uid=${item.id}"
								target="blank" title="${item.name }"><span
									style="width: 280px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; display: block;">${item.name }</span></a>
						</c:forEach>
					</ul>
				</section>
			</div>
			<div class="3u">
				<section class="last">
					<h2>
						<a href="${ctx}/com/findSysType.action?s_type=neitui">内部推荐</a>
					</h2>
					<ul class="link-list">
						<c:forEach items="${list4}" var="item">
							<li><a href="${ctx }/com/getSysType.action?uid=${item.id}"
								target="blank"><span
									style="width: 280px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; display: block;">${item.name }</span></a>
						</c:forEach>
					</ul>
				</section>
			</div>
		</div>
	</footer>
	<jsp:include page="./footer.jsp"></jsp:include>
	<div id="copyright">
		<%-- <audio autoplay="autoplay" controls="controls">
		<source src="${ctx }/resource/jikechufa.mp3" type="audio/mpeg">
		</audio> --%>
	</div>

</body>
</html>