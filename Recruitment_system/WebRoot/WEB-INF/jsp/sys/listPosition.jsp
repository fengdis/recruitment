<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/head.jsp"%>
<form id="pagerForm" method="post" action="${ctx}/sys/queryPosition.action">
	<input type="hidden" name="pageNum" value="" />
</form>

<div class="pageHeader">
	<form rel="pagerForm" onsubmit="return navTabSearch(this);" action="${ctx}/sys/queryPosition.action" method="post">
	<div class="searchBar">
		<ul class="searchContent">
			<li>
				<label>公司名称检索：</label>
				<input type="text" name="s_company.name" value=""/>
			</li>
		</ul>
		<div class="subBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">检索</button></div></div></li>
			</ul>
		</div>
	</div>
	</form>
</div>
<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<li><a class="add" href="${ctx}/sys/add2Position.action" target="navTab"  rel="baseAdd" title="添加信息"> <span>添加</span></a></li>
			<li><a class="edit" href="${ctx}/sys/getPosition.action?uid={sid_select}" target="navTab" rel="baseAdd" warn="请选择一条信息,点击需要修改的行" title="修改信息"><span>修改</span></a></li>
			<li><a title="确实要删除这些信息吗?" target="selectedTodo" rel="ids" postType="string" href="${ctx}/sys/deletePosition.action" class="delete" warn="请选择需要删除的信息"><span>批量删除</span></a></li>
		</ul>
	</div>
	<table class="table" width="100%" layoutH="138">
		<thead>
			<tr>
				<th width="2%"><input type="checkbox" group="ids" class="checkboxCtrl"></th>
				<th width="3%">序号</th>
				<th width="50">职位名称</th>
				<th width="50">所在城市</th>
				<th width="50">职位类型</th>
				<th width="50">发布日期</th>
				<th width="50">薪资标准</th>
				<th width="50">招聘数量</th>
				<th width="50">任职要求</th>
				<th width="50">相关信息</th>
				<th width="50">公司名称</th>
				<th width="50">招聘类型</th>
				<th width="50">扩展字段</th>
				<th width="50">操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${SESSION_PAGE.list}" var="item">
			<tr target="sid_select" rel="${item.id }">
				<td><input name="ids" value="${item.id }" type="checkbox"></td>
				<td>${item.id}</td>
				<td>${item.name}</td>
				<td>${item.area}</td>
				<td>${item.positionType}</td>
				<td>${item.addDate}</td>
				<td>${item.salary}</td>
				<td>${item.positionCount}</td>
				<td>${item.content}</td>
				<td>${item.introduce}</td>
				<td>${item.company.name}</td>
				<td>${item.sysType}</td>
				<td>${item.extend}</td>
				<td width="70">
					<a title="详细信息"  href="${ctx}/sys/getPosition.action?uid=${item.id}" class="btnEdit" target="navTab" rel="expertEdit">详细信息</a>
					<a title="确实要删除这条记录吗?" target="ajaxTodo" href="${ctx}/sys/deletePosition.action?ids=${item.id}" class="btnDel" style="margin-left: 10px">删除</a>
				</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="panelBar">
		<div class="pages">
			<span>共${SESSION_PAGE.totalNumber}条</span>
		</div>
		<div class="pagination" targetType="navTab" totalCount="${SESSION_PAGE.totalNumber}" numPerPage="${SESSION_PAGE.itemsPerPage}" pageNumShown="10" currentPage="${SESSION_PAGE.currentPageNumber}"></div>
	</div>
</div>
<%@ include file="../common/clear.jsp"%>
