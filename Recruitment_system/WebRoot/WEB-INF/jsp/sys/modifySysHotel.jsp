<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/head.jsp"%>
<h2 class="contentTitle">修改 酒店信息</h2>
<div class="pageContent">
	<form method="post" action="${ctx}/sys/updateSysHotel.action" class="pageForm required-validate" enctype="multipart/form-data" onsubmit="return iframeCallback(this)">
		<input type="hidden" value="${modifybean.id}" name="id"/>
		<div class="pageFormContent" layoutH="97">
			<table>
					<tr>
						<td colspan="2"><dl>
							<dt>酒店名称：</dt>
							<dd><input name="name" value="${modifybean.name}" type="text"  class="required" size="80"/></dd>
							</dl></td>
					</tr>
					<tr>
						<td colspan="2"><dl>
							<dt>酒店类型：</dt>
							<dd><input name="type" value="${modifybean.type}" type="text"  class="required" size="80"/></dd>
							</dl></td>
					</tr>
					<tr>
						<td colspan="2"><dl>
							<dt>价格区间：</dt>
							<dd><input name="price" value="${modifybean.price}" type="text"  class="required" size="80"/></dd>
							</dl></td>
					</tr>
					<tr>
						<td colspan="2"><dl>
							<dt>酒店地址：</dt>
							<dd><input name="address" value="${modifybean.address}" type="text"  class="required" size="80"/></dd>
							</dl></td>
					</tr>
					<tr>
						<td colspan="2"><dl>
							<dt>酒店简介：</dt>
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
