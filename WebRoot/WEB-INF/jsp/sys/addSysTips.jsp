<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/head.jsp"%>
<h2 class="contentTitle">添加招聘问题帮助</h2>
<div class="pageContent">
	<form method="post" action="${ctx}/sys/addSysTips.action" class="pageForm required-validate" enctype="multipart/form-data" onsubmit="return iframeCallback(this)">
		<div class="pageFormContent" layoutH="97">
			<table>
					<tr>
						<td colspan="2"><dl>
							<dt>问题：</dt>
							<dd><input name="name"  type="text"  class="required" size="80"/></dd>
							</dl></td>
					</tr>
					 
					<tr>
						<td colspan="2"><dl>
							<dt>回答：</dt>
							<dd>
								<textarea  rows="10" cols="100" name="answer" class="required"></textarea>
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
