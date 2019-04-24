<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/head.jsp"%>
<form id="pagerForm" method="post" action="${ctx}/sys/queryPosition.action">
	<input type="hidden" name="pageNum" value="" />
</form>

<div class="pageHeader">
	<form rel="pagerForm" onsubmit="return navTabSearch(this);" action="${ctx}/sys/queryPositionUser.action" method="post">
	<div class="searchBar">
		<ul class="searchContent">
			<li>
				<label>日期检索：</label>
				<input type="text" name="s_applyDate" value=""/>
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
			<%-- <li><a class="add" href="${ctx}/sys/add2PositionUser.action" target="navTab"  rel="baseAdd" title="添加信息"> <span>添加</span></a></li> --%>
			<li><a class="edit" href="${ctx}/sys/getPositionUser.action?uid={sid_select}" target="navTab" rel="baseAdd" warn="请选择一条信息,点击需要修改的行" title="修改信息"><span>回复</span></a></li>
			<li><a title="确实要删除这些信息吗?" target="selectedTodo" rel="ids" postType="string" href="${ctx}/sys/deletePositionUser.action" class="delete" warn="请选择需要删除的信息"><span>批量删除</span></a></li>
		</ul>
	</div>
	<table class="table" width="100%" layoutH="138">
		<thead>
			<tr>
				<th width="2%"><input type="checkbox" group="ids" class="checkboxCtrl"></th>
				<th width="3%">序号</th>
				<th width="50">申请日期</th>
				<th width="50">数量</th>
				<th width="50">状态</th>
				<th width="50">职位</th>
				<th width="50">用户姓名</th>
				<th width="50">回复日期</th>
				<th width="50">面试时间</th>
				<th width="50">面试地区</th>
				<th width="50">扩展字段</th>
				<th width="50">操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${SESSION_PAGE.list}" var="item">
			<tr target="sid_select" rel="${item.id }">
				<td><input name="ids" value="${item.id }" type="checkbox"></td>
				<td>${item.id}</td>
				<td>${item.applyDate}</td>
				<td>${item.amount}</td>
				<td>${item.status}</td>
				<td>${item.position.name}</td>
				<td>${item.user.id}</td>
				<td>${item.reDate}</td>
				<td>${item.interviewDate}</td>
				<td>${item.interviewArea}</td>
				<td>${item.extend}</td>
				<td width="70">
					<a title="详细信息"  href="${ctx}/sys/getPositionUser.action?uid=${item.id}" class="btnEdit" target="navTab" rel="expertEdit">详细信息</a>
					<a title="确实要删除这条记录吗?" target="ajaxTodo" href="${ctx}/sys/deletePositionUser.action?ids=${item.id}" class="btnDel" style="margin-left: 10px">删除</a>
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
