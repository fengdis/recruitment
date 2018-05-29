<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/head.jsp"%>
<form id="pagerForm" method="post" action="${ctx}/sys/querySysHotel.action">
	<input type="hidden" name="pageNum" value="" />
</form>

<div class="pageHeader">
	<form rel="pagerForm" onsubmit="return navTabSearch(this);" action="${ctx}/sys/querySysHotel.action" method="post">
	<div class="searchBar">
		<ul class="searchContent">
			<li>
				<label>酒店名称检索：</label>
				<input type="text" name="s_name" value=""/>
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
			<li><a class="add" href="${ctx}/sys/add2SysHotel.action" target="navTab"  rel="baseAdd" title="添加信息"> <span>添加</span></a></li>
			<li><a class="edit" href="${ctx}/sys/getSysHotel.action?uid={sid_select}" target="navTab" rel="baseAdd" warn="请选择一条信息,点击需要修改的行" title="修改信息"><span>修改</span></a></li>
			<li><a title="确实要删除这些信息吗?" target="selectedTodo" rel="ids" postType="string" href="${ctx}/sys/deleteSysHotel.action" class="delete" warn="请选择需要删除的信息"><span>批量删除</span></a></li>
		</ul>
	</div>
	<table class="table" width="100%" layoutH="138">
		<thead>
			<tr>
				<th width="3%"><input type="checkbox" group="ids" class="checkboxCtrl"></th>
				<th width="50">序号</th>
				<th width="50">酒店名称</th>
				<th width="50">酒店类型</th>
				<th width="50">价格区间</th>
				<th width="50">酒店地址</th>
				<th width="50">酒店简介</th>
				<th width="70">操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${SESSION_PAGE.list}" var="item">
			<tr target="sid_select" rel="${item.id }">
				<td><input name="ids" value="${item.id }" type="checkbox"></td>
				<td>${item.id}</td>
				<td>${item.name}</td>
				<td>${item.type}</td>
				<td>${item.price}</td>
				<td>${item.address}</td>
				<td>${item.content}</td>
				<td width="70">
					<a title="详细信息"  href="${ctx}/sys/getSysHotel.action?uid=${item.id}" class="btnEdit" target="navTab" rel="expertEdit">详细信息</a>
					<a title="确实要删除这条记录吗?" target="ajaxTodo" href="${ctx}/sys/deleteSysHotel.action?ids=${item.id}" class="btnDel" style="margin-left: 10px">删除</a>
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
