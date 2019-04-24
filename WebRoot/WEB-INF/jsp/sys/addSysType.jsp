<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/head.jsp"%>
<h2 class="contentTitle">添加${type == "shehui" ? "社会招聘" :(type == "xiaoyuan" ? "校园招聘" : "内部推荐") }</h2>
<div class="pageContent">
	<form method="post" action="${ctx}/sys/addSysType.action" class="pageForm required-validate" enctype="multipart/form-data" onsubmit="return iframeCallback(this)">
		<%-- <input type="hidden" value="${type}" name="type"> --%>
		<input type="hidden" value="${type == 'shehui' ? '社会招聘' :(type == 'xiaoyuan' ? '校园招聘' : '内部推荐') }" name="type">
		<div class="pageFormContent" layoutH="97">
			<table>
					<tr>
						<td colspan="2"><dl>
							<dt>标题：</dt>
							<dd><input name="name"  type="text"  class="required" size="80"/></dd>
							</dl></td>
					</tr>
					<tr>
						<td colspan="2"><dl>
							<dt>发布时间：</dt>
							<dd><input name="addDate"  type="text"  class="date required" size="80"/></dd>
							</dl></td>
					</tr>
					<!-- <tr>
						<td colspan="2"><dl>
							<dt>类型模块：</dt>
							<dd><input name="type"  type="text"  class="required" size="80"/></dd>
							</dl></td>
					</tr> -->
					<tr>
						<td colspan="2"><dl>
							<dt>正文：</dt>
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
