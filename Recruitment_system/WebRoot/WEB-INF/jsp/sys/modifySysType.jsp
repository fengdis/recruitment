<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/head.jsp"%>
<h2 class="contentTitle">修改${modifybean.type }</h2>
<div class="pageContent">
	<form method="post" action="${ctx}/sys/updateSysType.action" class="pageForm required-validate" enctype="multipart/form-data" onsubmit="return iframeCallback(this)">
		<%-- <input type="hidden" value="${modifybean.type}" name="type"> --%>
		<input type="hidden" value="${modifybean.id}" name="id">
		<div class="pageFormContent" layoutH="97">
			<table>
					<tr>
						<td colspan="2"><dl>
							<dt>标题：</dt>
							<dd><input name="name" value="${modifybean.name}" type="text"  class="required" size="80"/></dd>
							</dl></td>
					</tr>
					<tr>
						<td colspan="2"><dl>
							<dt>发布时间：</dt>
							<dd><input name="addDate" value="${modifybean.addDate}" type="text"  class="date required" size="80"/></dd>
							</dl></td>
					</tr>
					<tr>
						<td colspan="2"><dl>
							<dt>类型模块：</dt>
							<dd>
								<select name="type" class="" id="">
									<option value="社会招聘">社会招聘</option>
									<option value="校园招聘">校园招聘</option>
									<option value="内部推荐">内部推荐</option>
								</select>
							</dd>
							
							</dl></td>
					</tr>
					<tr>
						<td colspan="2"><dl>
							<dt>内容：</dt>
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
