<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/head.jsp"%>
<h2 class="contentTitle">添加招聘职位信息</h2>
<div class="pageContent">
	<form method="post" action="${ctx}/sys/addPosition.action" class="pageForm required-validate" enctype="multipart/form-data" onsubmit="return iframeCallback(this)">
		<div class="pageFormContent" layoutH="97">
			<table>
					<tr>
						<td colspan="2"><dl>
							<dt>所属公司：</dt>
							<dd>
								<select name="company.id" class="">
									<c:forEach items="${list }" var="item">
										<option value="${item.id }">${item.name }</option>
									</c:forEach>
								</select>
							</dd>
							</dl></td>
					</tr>
					<tr>
						<td colspan="2"><dl>
							<dt>职位名称：</dt>
							<dd><input name="name"  type="text"  class="required" /></dd>
							</dl></td>
					</tr>
					<tr>
						<td colspan="2"><dl>
							<dt>所在城市：</dt>
							<dd><input name="area"  type="text"  class="required" /></dd>
							</dl></td>
					</tr>
					<tr>
						<td colspan="2"><dl>
							<dt>职位类型：</dt>
							<dd><input name="positionType"  type="text"  class="required" /></dd>
							</dl></td>
					</tr>
					<tr>
						<td colspan="2"><dl>
							<dt>发布日期：</dt>
							<dd><input name="addDate"  type="text"  class="date required" readonly="readonly" /></dd>
							</dl></td>
					</tr>
					<tr>
						<td colspan="2"><dl>
							<dt>薪资标准：</dt>
							<dd><input name="salary"  type="text"  class="required" /></dd>
							</dl></td>
					</tr>
					<tr>
						<td colspan="2"><dl>
							<dt>招聘数量：</dt>
							<dd><input name="positionCount"  type="text"  class="number required" /></dd>
							</dl></td>
					</tr>
					<tr>
						<td colspan="2"><dl>
							<dt>招聘类型：</dt>
							<dd>
								<select name="sysType">
									<option value="社会招聘">社会招聘</option>
									<option value="校园招聘">校园招聘</option>
									<option value="内部推荐">内部推荐</option>
								</select>
							</dd>
							</dl></td>
					</tr>
					<tr>
						<td colspan="2"><dl>
							<dt>相关信息：</dt>
							<dd><input name="introduce"  type="text"  class="required" /></dd>
							<%-- <dd>
								<textarea class="editor" name="introduce" rows="10" cols="100" tools="simple" 
								upImgUrl="${ctx}/sys/imageUpload.action" upImgExt="jpg,jpeg,gif,png" ></textarea>
							</dd> --%>
							</dl></td>
					</tr>
					<tr>
						<td colspan="2"><dl>
							<dt>任职要求：</dt>
							<dd>
								<textarea class="editor" name="content" rows="20" cols="100" tools="" 
								upImgUrl="${ctx}/sys/imageUpload.action" upImgExt="jpg,jpeg,gif,png" ></textarea>
							</dd>
							</dl></td>
					</tr>
					
				</table>
		</div>
		<div class="formBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">提交</button></div></div></li>
				<li><div class="button"><div class="buttonContent"><button type="reset" class="reset">重置</button></div></div></li>
			</ul>
		</div>
	</form>
</div>
