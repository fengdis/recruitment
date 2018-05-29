<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/head.jsp"%>
<h2 class="contentTitle">修改招聘职位信息</h2>
<div class="pageContent">
	<form method="post" action="${ctx}/sys/updatePosition.action" class="pageForm required-validate" enctype="multipart/form-data" onsubmit="return iframeCallback(this)">
		<input type="hidden" value="${modifybean.id}" name="id">
		<div class="pageFormContent" layoutH="97">
			<table>
					<tr>
						<td colspan="2"><dl>
							<dt>所属公司：</dt>
							<dd>
								<select name="company.id" class="" id="updatesi4324324234classid">
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
							<dd><input name="name" value="${modifybean.name}" type="text"  class="required" readonly="readonly"/></dd>
							</dl></td>
					</tr>
					<tr>
						<td colspan="2"><dl>
							<dt>所在城市：</dt>
							<dd><input name="area" value="${modifybean.area}" type="text"  class="required" readonly="readonly"/></dd>
							</dl></td>
					</tr>
					<tr>
						<td colspan="2"><dl>
							<dt>职位类型：</dt>
							<dd><input name="positionType" value="${modifybean.positionType}" type="text"  class="required"/></dd>
							</dl></td>
					</tr>
					<tr>
						<td colspan="2"><dl>
							<dt>发布日期：</dt>
							<dd><input name="addDate" value="${modifybean.addDate}" type="text"  class="date required"/></dd>
							</dl></td>
					</tr>
					<tr>
						<td colspan="2"><dl>
							<dt>薪资标准：</dt>
							<dd><input name="salary" value="${modifybean.salary}" type="text"  class="required"/></dd>
							</dl></td>
					</tr>
					<tr>
						<td colspan="2"><dl>
							<dt>招聘数量：</dt>
							<dd><input name="positionCount" value="${modifybean.positionCount}" type="text"  class="number required"/></dd>
							</dl></td>
					</tr>
					<tr>
						<td colspan="2"><dl>
							<dt>相关信息：</dt>
							<dd><input name="introduce" value="${modifybean.introduce}" type="text"  class="required"/></dd>
							</dl></td>
					</tr>
					<tr>
						<td colspan="2"><dl>
							<dt>招聘类型：</dt>
							<dd>
								<select name="sysType" class="" id="updat3423432id">
									<option value="社会招聘">社会招聘</option>
									<option value="校园招聘">校园招聘</option>
									<option value="内部推荐">内部推荐</option>
								</select>
							</dd>
							</dl></td>
					</tr>
					<tr>
						<td colspan="2"><dl>
							<dt>任职要求：</dt>
							<dd>
								<textarea class="editor" name="content" rows="20" cols="100" tools="" 
								upImgUrl="${ctx}/sys/imageUpload.action" upImgExt="jpg,jpeg,gif,png" >${modifybean.content}</textarea>
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
<script type="text/javascript">
$("#updatesi4324324234classid").val("${modifybean.company.id}");
$("#updat3423432id").val("${modifybean.sysType}");
</script>