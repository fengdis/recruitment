package com.fengdi.common.action.struts;

import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.fengdi.common.entity.SessionBean;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.util.ValueStack;

import util.Constant;

/***
 * 
 * @描述 : 基类Action，所有Action需继承
 * @创建者：fengdi
 * @创建时间： 2017年3月17日下午2:43:18
 *
 */
@Results({ @Result(name = "success", location = "/WEB-INF/jsp/common/success.jsp"), @Result(name = "error", location = "/WEB-INF/jsp/common/error.jsp") })
public class BaseAction extends ActionSupport implements RequestAware, SessionAware {
	private Map<String, Object> session;
	private Map<String, Object> request;
	private Map<String, Object> application;
	private List<String> onlineList;
	
	protected static Logger log = Logger.getLogger(BaseAction.class);

	protected void putRequestValue(String name, Object value) {
		request.put(name, value);
	}
	protected void putSessionValue(String name, Object value) {
		session.put(name, value);
	}
	protected void putApplicationValue(String name, Object value) {
		session.put(name, value);
	}

	
	protected Object getRequestValue(String name) {
		return request.get(name);
	}
	protected Object getSessionValue(String name) {
		return session.get(name);
	}
	protected Object getApplicationValue(String name) {
		return session.get(name);
	}
	
	
	public Map<String, Object> getRequest() {
		return request;
	}
	public Map<String, Object> getSession() {
		return session;
	}
	public Map<String, Object> getApplication() {
		return application;
	}
	
	
	public void setRequest(Map<String, Object> request) {
		this.request = request;
	}
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}
	public void setApplication(Map<String, Object> application) {
		this.application = application;
	}

	
	public List<String> getOnlineList() {
		return onlineList;
	}
	public void setOnlineList(List<String> onlineList) {
		this.onlineList = onlineList;
	}
	
	protected ActionContext getActionContext() {
		return ActionContext.getContext();
	}

	protected ValueStack getValueStack() {
		return getActionContext().getValueStack();
	}

	protected HttpServletRequest getHttpServletRequest() {
		HttpServletRequest request = ServletActionContext.getRequest();
		return request;
	}
	protected HttpServletResponse getHttpServletResponse() {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("utf-8");
		return response;
	}
	protected HttpSession getHttpSession() {
		HttpServletRequest request = ServletActionContext.getRequest();
		return request.getSession();
	}
	protected ServletContext getHttpApplication() {
		
		ServletContext application = ServletActionContext.getRequest().getSession().getServletContext();
		return application;
	}
	
	protected Object getSessionUser() {
		SessionBean sb = (SessionBean) getHttpSession().getAttribute(Constant.SESSION_BEAN);
		return sb.getUser();
	}
	
	
}
