<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./common/head.jsp"%>
<h2 class="contentTitle">修改个人资料</h2>
<div class="pageContent">
	<form method="post" action="${ctx}/com/modifySelf.action" class="pageForm required-validate" enctype="multipart/form-data" onsubmit="return iframeCallback(this)">
		<input name="id" value="${SESSION_BEAN.user.user.userId }" type="hidden"/>
		<%-- <input name="type" value="${SESSION_BEAN.user.sysUser.type }" type="hidden"/> --%>
		<div class="pageFormContent" layoutH="97">
			<table>
					<tr>
						<td colspan="2"><dl>
							<dt>登录名称：</dt>
							<dd><input name="bean.uname" value="${SESSION_BEAN.user.user.uname }" type="text"  class="required" readonly="readonly"/></dd>
							</dl></td>
					</tr>
					<tr>
						<td colspan="2"><dl>
							<dt>密码：</dt>
							<dd> 
								<input name="bean.userPassword"  value="" id="w_validation_pwd" type="password"  class="alphanumeric" minlength="6" maxlength="20"/>
							</dd>
							</dl></td>
					</tr>
					<tr>
						<td colspan="2"><dl class="nowrap">
							<dt>密码确认：</dt>
							<dd><input name="repassword"  value=""  type="password" class="" equalto="#w_validation_pwd"/><span class="info">(不填则不修改)</span></dd>
							</dl></td>
					</tr>
					<tr>
						<td colspan="2"><dl>
							<dt>姓名：</dt>
							<dd><input name="bean.userName" value="${SESSION_BEAN.user.user.userName }" type="text"  class="required"/></dd>
							</dl></td>
					</tr>
					<tr>
						<td colspan="2"><dl>
							<dt>性别：</dt>
							<dd>
								<select name="bean.userGender">
									<option value="0" <c:if test="${SESSION_BEAN.user.user.userGender==0}">selected="selected"</c:if> >女</option>
									<option value="1" <c:if test="${SESSION_BEAN.user.user.userGender==1}">selected="selected"</c:if>>男</option>
								</select>
							</dd>
							</dl></td>
					</tr>
					<tr>
						<td colspan="2"><dl>
							<dt>联系电话：</dt>
							<dd><input name="bean.userPhone" value="${SESSION_BEAN.user.user.userPhone }" type="text"  class="phone required"/></dd>
							</dl></td>
					</tr>
					<tr>
						<td colspan="2"><dl>
							<dt>邮箱：</dt>
							<dd><input name="bean.userEmail" value="${SESSION_BEAN.user.user.userEmail }" type="text"  class="email"/></dd>
							</dl></td>
					</tr>
					<tr>
						<td colspan="2"><dl>
							<dt>联系地址：</dt>
							<dd><input name="bean.userAddress" value="${SESSION_BEAN.user.user.userAddress }" type="text"  class=""/></dd>
							</dl></td>
					</tr>
					<tr>
						<td colspan="2"><dl>
							<dt>出生日期：</dt>
							<dd><input name="bean.userBirth" value="${SESSION_BEAN.user.user.userBirth }" type="text"  class="date"/></dd>
							</dl></td>
					</tr>
					
					<tr>
						<td colspan="2"><dl>
							<dt>工作类型：</dt>
							<dd><input name="bean.userJob" value="${SESSION_BEAN.user.user.userJob }" type="text"  class="required"/></dd>
							</dl></td>
					</tr>
					<tr>
						<td colspan="2"><dl>
							<dt>扩展字段：</dt>
							<dd><input name="bean.extend" value="${SESSION_BEAN.user.user.extend }" type="text"  class=""/></dd>
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
