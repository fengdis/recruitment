<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./common/head.jsp"%>
<form id="pagerForm" method="post" action="${ctx}/com/inLine.action">
	<input type="hidden" name="pageNum" value="" />
</form>

<div class="pageHeader">
	<form rel="pagerForm" onsubmit="return navTabSearch(this);" action="${ctx}/com/inUser.action" method="post">
	<div class="searchBar">
		<ul class="searchContent">
			<li>
				<label>登录名检索：</label>
				<input type="text" name="s_user.userName" value=""/>
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
			<li><a class="edit" href="${ctx}/com/outUser.action?loginid={sid_select}" target="navTab" rel="baseAdd" warn="请选择一条信息,点击需要修改的行" title="修改信息"><span>下线</span></a></li>
			<li><a title="确实要删除这些信息吗?" target="selectedTodo" rel="ids" postType="string" href="${ctx}/com/outline.action" class="delete" warn="请选择需要删除的信息"><span>批量下线</span></a></li>
		</ul>
	</div>
	<table class="table" width="100%" layoutH="138">
		<thead>
			<tr>
				<th width="2%"><input type="checkbox" group="ids" class="checkboxCtrl"></th>
				<th width="50">序号</th>
				<th width="50">登录名称</th>
				<th width="50">操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${APPLICATION_ONLINE }" var="item">
			<tr target="sid_select" rel="${item }">
				<td><input name="ids" value="${item }" type="checkbox"></td>
				<td>${item }</td>
				<td>${item }</td>
				<td width="70">
					<a title="详细信息"  href="${ctx}/com/outUser.action?loginid=${item }" class="btnEdit" target="navTab" rel="expertEdit">下线</a>
					<a title="下线" target="ajaxTodo" href="${ctx}/com/outUser.action?loginid=${item }" class="btnDel" style="margin-left: 10px">下线</a>
				</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="panelBar">
		<div class="pages">
			<span>共1条</span>
		</div>
		<div class="pagination" targetType="navTab" totalCount="1" numPerPage="1" pageNumShown="10" currentPage="1"></div>
	</div>
</div>
<%-- <%@ include file="./common/clear.jsp"%> --%>
