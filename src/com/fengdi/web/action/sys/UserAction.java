package com.fengdi.web.action.sys;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.Map.Entry;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.fengdi.common.action.struts.BaseAction;
import com.fengdi.common.entity.SessionBean;
import com.fengdi.web.entity.SimpleUser;
import com.fengdi.web.entity.SysTips;
import com.fengdi.web.entity.SysUser;
import com.fengdi.web.entity.User;
import com.fengdi.web.service.ISysService;

import util.Constant;
import util.DateUtil;
import util.FieldUtil;
import util.MD5;
import util.MessageUtil;
import util.Page;
import util.SearchParamBean;
import util.StringUtil;

/***
 * 
 * @描述 : 用户Controller
 * @创建者：fengdi
 * @创建时间： 2017年3月17日下午2:43:18
 *
 */
@ParentPackage("struts-default")
@Namespace("/com")
@Component
public class UserAction extends BaseAction {
	@Autowired
	private ISysService service;

	/*
	 * @RequestMapping(value = "/reg.do", method = RequestMethod.POST) public
	 * String reg(SimpleUser bean) throws Exception { String msg = "";
	 * HttpSession session = null; try { service.addSimpleUser(bean); msg =
	 * "注册成功"; } catch (Exception e) { e.printStackTrace(); msg = "注册失败"; }
	 * session.setAttribute("regErrorMessage", msg); return "redirect:/reg.jsp";
	 * }
	 */

	@Action(value = "/login", results = { @Result(name = "index", type = "redirect", location = "/index.jsp"),
			@Result(name = "main", location = "/WEB-INF/jsp/main.jsp") })
	public String login() throws Exception {
		log.info(loginid + " " + password + " " + logintype);
		String errorMessage = null;
		try {
			String code = (String) getHttpSession().getAttribute(com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY);
			if (code == null) {
				getHttpServletRequest().getSession(false).invalidate();
				return "index";
			} else {
			}
			checkcode = StringUtil.stringVerification(checkcode);
			if (code.toLowerCase().equals(checkcode.toLowerCase())) {
				loginid = StringUtil.stringVerification(loginid).toLowerCase();
				MD5 md = new MD5();
				password = md.getMD5ofStr(password);
				Object user = service.findUser(logintype, loginid, password);
				if (user != null) {
					//单点登录
					ServletContext application = getHttpApplication();
					List<String> onlineList = (List<String>) application.getAttribute(Constant.APPLICATION_ONLINE);
					if (onlineList == null) {
						onlineList = new ArrayList<String>();
					}
					if (!onlineList.contains(loginid)) {
					
						SessionBean sb = new SessionBean();
						sb.setUser(user);

						getHttpSession().setAttribute(Constant.SESSION_BEAN, sb);
						onlineList.add(loginid);
						application.setAttribute(Constant.APPLICATION_ONLINE, onlineList);

						log.info("登录成功:" + loginid);
					} else {
						errorMessage = "此账号已登录,请稍后重试";
					}
					
				} else {
					errorMessage = "登录帐号或密码错误";
				}
			} else {
				errorMessage = "验证码错误";
			}
			if (errorMessage == null) {
				return "main";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (errorMessage == null) {
			errorMessage = "登录失败,请稍后重试";
		}
		getHttpSession().setAttribute("signErrorMessage", errorMessage);
		return "index";
	}

	@Action(value = "/logins", results = { @Result(name = "login", type = "redirect", location = "/login.jsp"),
			@Result(name = "main", location = "/WEB-INF/jsp/main.jsp") })
	public String logins() throws Exception {
		log.info(loginid + " " + password + " " + logintype);
		String errorMessage = null;
		try {
			String code = (String) getHttpSession().getAttribute(com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY);
			if (code == null) {
				getHttpServletRequest().getSession(false).invalidate();
				return "login";
			} else {
			}
			checkcode = StringUtil.stringVerification(checkcode);
			if (code.toLowerCase().equals(checkcode.toLowerCase())) {
				loginid = StringUtil.stringVerification(loginid).toLowerCase();
				MD5 md = new MD5();
				password = md.getMD5ofStr(password);
				Object user = service.findUser(logintype, loginid, password);
				if (user != null) {
					ServletContext application = getHttpApplication();
					List<String> onlineList = (List<String>) application.getAttribute(Constant.APPLICATION_ONLINE);
					if (onlineList == null) {
						onlineList = new ArrayList<String>();
					}
					if (!onlineList.contains(loginid)) {
						
						SessionBean sb = new SessionBean();
						sb.setUser(user);
						Date date = new Date();
					
						sb.setStr(DateUtil.getLongTime(date));

						getHttpSession().setAttribute(Constant.SESSION_BEAN, sb);
						onlineList.add(loginid);
						application.setAttribute(Constant.APPLICATION_ONLINE, onlineList);
						
						log.info("登录成功:" + loginid);
					} else {
						errorMessage = "此账号已登录,请稍后重试";
					}
				} else {
					errorMessage = "登录帐号或密码错误";
				}
			} else {
				errorMessage = "验证码错误";
			}
			if (errorMessage == null) {
				return "main";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (errorMessage == null) {
			errorMessage = "登录失败,请稍后重试";
		}
		getHttpSession().setAttribute("signErrorMessage", errorMessage);
		return "login";
	}

	@Action(value = "toSelf", results = { @Result(name = "modifySelf", location = "/WEB-INF/jsp/modifySelf.jsp") })
	public String toSelf() {
		return "modifySelf";
	}
	
	@Action(value = "outLine", results = { @Result(name = "outUser", location = "/WEB-INF/jsp/outUser.jsp") })
	public String outLine() {
		return "outUser";
	}
	
	@Action(value = "jumpMain", results = { @Result(name = "jumpMain", location = "/WEB-INF/jsp/main.jsp") })
	public String jumpMain() {
		return "jumpMain";
	}

	@Action(value = "modifySelf")
	public String modifySelf() {
		try {
			User sessionUser = null;
			SessionBean sb = (SessionBean) getSessionValue(Constant.SESSION_BEAN);
			Object sbuser = sb.getUser();
			if (SysUser.class.getSimpleName().equals(sb.getRole())) {
				sessionUser = ((SysUser) sbuser).getUser();
			} else if (SimpleUser.class.getSimpleName().equals(sb.getRole())) {
				sessionUser = ((SimpleUser) sbuser).getUser();
			}
			bean.setUserId(sessionUser.getUserId());
			bean.setUname(sessionUser.getUname());
			if (StringUtil.notEmpty(bean.getUserPassword())) {
				MD5 md = new MD5();
				String password = md.getMD5ofStr(bean.getUserPassword());
				bean.setUserPassword(password);
			} else {
				bean.setUserPassword(sessionUser.getUserPassword());
			}
			service.update(bean);

			sessionUser.setUserAddress(bean.getUserAddress());
			sessionUser.setUserBirth(bean.getUserBirth());
			sessionUser.setUserEmail(bean.getUserEmail());
			sessionUser.setUserGender(bean.getUserGender());
			sessionUser.setUserName(bean.getUserName());
			sessionUser.setUserPhone(bean.getUserPhone());
			sessionUser.setUserJob(bean.getUserJob());
			sessionUser.setExtend(bean.getExtend());

			MessageUtil.addMessage(getHttpServletRequest(), "修改成功.");
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			MessageUtil.addMessage(getHttpServletRequest(), "修改失败.");
			return ERROR;
		}
	}
	
	@Action(value = "outUser")
	public String outUser() {
		try {
			ServletContext application = getHttpApplication();
			List<String> onlineList = (List<String>) application.getAttribute(Constant.APPLICATION_ONLINE);
			onlineList.remove(loginid);
			application.setAttribute(Constant.APPLICATION_ONLINE, onlineList);
			MessageUtil.addMessage(getHttpServletRequest(), "下线成功.");
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			MessageUtil.addMessage(getRequest(), "下线失败");
			return ERROR;
		}
	}
	
	@Action(value = "outSimpleUser")
	public String outSimpleUser() {
		try {
			ServletContext application = getHttpApplication();
			List<String> onlineList = (List<String>) application.getAttribute(Constant.APPLICATION_ONLINE_USER);
			onlineList.remove(loginid);
			application.setAttribute(Constant.APPLICATION_ONLINE_USER, onlineList);
			MessageUtil.addMessage(getHttpServletRequest(), "下线成功.");
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			MessageUtil.addMessage(getRequest(), "下线失败");
			return ERROR;
		}
	}

	@Action(value = "logout", results = { @Result(name = "logout", type = "redirect", location = "/login.jsp") })
	public String logout() {
		ServletContext application = getHttpApplication();
		List<String> onlineList = (List<String>) application.getAttribute(Constant.APPLICATION_ONLINE);
		onlineList.remove(loginid);
		application.setAttribute(Constant.APPLICATION_ONLINE, onlineList);

		// getHttpSession().removeAttribute(Constant.SESSION_BEAN);
		getHttpSession().invalidate();
		return "logout";
	}
	
	@Action(value = "inLine", results = { @Result(name = "inUser", location = "/WEB-INF/jsp/inUser.jsp") })
	public String inLine() {
		try {
			/*ServletContext application = getHttpApplication();
			List<String> onlineList = (List<String>) application.getAttribute(Constant.APPLICATION_ONLINE);*/
			return "inUser";
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
		
	}
	
	@Action(value = "inSimpleLine", results = { @Result(name = "inSimpleUser", location = "/WEB-INF/jsp/inSimpleUser.jsp") })
	public String inSimpleLine() {
		try {
			return "inSimpleUser";
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
		
	}
	
	private User bean;
	
	public User getBean() {
		return bean;
	}

	public void setBean(User bean) {
		this.bean = bean;
	}

	private String loginid;
	private String password;
	private String logintype;
	private String checkcode;

	public String getLoginid() {
		return loginid;
	}

	public void setLoginid(String loginid) {
		this.loginid = loginid;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getLogintype() {
		return logintype;
	}

	public void setLogintype(String logintype) {
		this.logintype = logintype;
	}

	public String getCheckcode() {
		return checkcode;
	}

	public void setCheckcode(String checkcode) {
		this.checkcode = checkcode;
	}

}
