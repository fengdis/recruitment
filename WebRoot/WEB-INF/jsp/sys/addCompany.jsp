<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/head.jsp"%>
<h2 class="contentTitle">添加招聘公司信息</h2>
<div class="pageContent">
	<form method="post" action="${ctx}/sys/addCompany.action" class="pageForm required-validate" enctype="multipart/form-data" onsubmit="return iframeCallback(this)">
		<div class="pageFormContent" layoutH="97">
			<table>
					<tr>
						<td colspan="2"><dl>
							<dt>公司名称：</dt>
							<dd><input name="name"  type="text"  class="required" size="80"/></dd>
							</dl></td>
					</tr>
					<tr>
						<td colspan="2"><dl>
							<dt>所在城市：</dt>
							<dd><input name="area"  type="text"  class="required" size="80"/></dd>
							</dl></td>
					</tr>
					<tr>
						<td colspan="2"><dl>
							<dt>公司简介：</dt>
							<dd><input name="introduce"  type="text"  class="required" size="80"/></dd>
							</dl></td>
					</tr>
					<tr>
						<td colspan="2"><dl>
							<dt>公司详情：</dt>
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
