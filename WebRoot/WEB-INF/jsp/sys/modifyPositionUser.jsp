<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/head.jsp"%>
<h2 class="contentTitle">回复招聘职位信息</h2>
<div class="pageContent">
	<form method="post" action="${ctx}/sys/updatePositionUser.action" class="pageForm required-validate" enctype="multipart/form-data" onsubmit="return iframeCallback(this)">
		<input type="hidden" value="${modifybean.id}" name="id">
		<div class="pageFormContent" layoutH="97">
			<table>
					<tr>
						<td colspan="2"><dl>
							<dt>申请日期：</dt>
							<dd><input name="applyDate" value="${modifybean.applyDate}" type="text"  class="required" readonly="readonly"/></dd>
							</dl></td>
					</tr>
					<tr>
						<td colspan="2"><dl>
							<dt>数量：</dt>
							<dd><input name="amount" value="${modifybean.amount}" type="text"  class="required" readonly="readonly"/></dd>
							</dl></td>
					</tr>
					<tr>
						<td colspan="2"><dl>
							<dt>审核状态：</dt>
							<dd>
								<select name="status" class="" id="updatestatus">
									<option value="已投简历">待投简历</option>
									<option value="已投简历">已投简历</option>
									<option value="简历通过">简历通过</option>
									<option value="通知面试">通知面试</option>
									<option value="面试通过">面试通过</option>
									<option value="面试失败">面试失败</option>
									<option value="面试结束">面试结束</option>
									<option value="用户取消">用户取消</option>
								</select>
							</dd>
							</dl></td>
					</tr>
					<tr>
						<td colspan="2"><dl>
							<dt>职位名称：</dt>
							<dd><input name="position.name" value="${modifybean.position.name}" type="text"  class="required" readonly="readonly"/></dd>
							</dl></td>
					</tr>
					<tr>
						<td colspan="2"><dl>
							<dt>公司名称：</dt>
							<dd><input name="position.company.name" value="${modifybean.position.company.name}" type="text"  class="required" readonly="readonly"/></dd>
							</dl></td>
					</tr>
					<tr>
						<td colspan="2"><dl>
							<dt>用户账号：</dt>
							<dd><input name="user.user.uname" value="${modifybean.user.user.uname}" type="text"  class="required"/ readonly="readonly"></dd>
							</dl></td>
					</tr>
					<tr>
						<td colspan="2"><dl>
							<dt>回复日期：</dt>
							<dd><input name="reDate" value="${modifybean.reDate}" type="text"  class="date required"/></dd>
							</dl></td>
					</tr>
					<tr>
						<td colspan="2"><dl>
							<dt>面试时间：</dt>
							<dd><input name="interviewDate" value="${modifybean.interviewDate}" type="text"  class="date required"/></dd>
							</dl></td>
					</tr>
					<tr>
						<td colspan="2"><dl>
							<dt>面试地区：</dt>
							<dd>
							<dd><input name="interviewArea" value="${modifybean.interviewArea}" type="text"  class="required"/></dd>
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
$("#updatestatus").val("${modifybean.status}");
</script>