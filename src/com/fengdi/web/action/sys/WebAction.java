package com.fengdi.web.action.sys;

import java.io.IOException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.ServletContext;

import java.util.Set;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.fengdi.common.action.struts.BaseAction;
import com.fengdi.common.entity.SessionBean;
import com.fengdi.web.entity.SysTips;
import com.fengdi.web.entity.SysType;
import com.fengdi.web.entity.SysHotel;
import com.fengdi.web.entity.SysNews;
import com.fengdi.web.entity.Company;
import com.fengdi.web.entity.Consultation;
import com.fengdi.web.entity.Position;
import com.fengdi.web.entity.PositionUser;
import com.fengdi.web.entity.Resume;
import com.fengdi.web.entity.SimpleUser;
import com.fengdi.web.entity.User;
import com.fengdi.web.service.ISysService;

import util.Constant;
import util.DateUtil;
import util.FieldUtil;
import util.MD5;
import util.Page;
import util.SearchParamBean;
import util.StringUtil;

/***
 * 
 * @描述 : 前台webController
 * @创建者：fengdi
 * @创建时间： 2017年3月17日下午2:43:18
 *
 */
@ParentPackage("json-default")
@Namespace("/com")
@Component
public class WebAction extends BaseAction {
	@Autowired
	private ISysService service;

	private int uid;
	private String type;
	private String name, password, oldpwd, newpwd;
	private PositionUser positionUser;
	private Consultation Consultation;
	private SimpleUser regbean;
	private Resume resume;
	private User updatebean;
	private String checkcode;

	@Action(value = "userLogin")
	public String userLogin() {
		String msg = "";
		try {
			String code = (String) getHttpSession().getAttribute(com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY);
			if (code == null) {
				getHttpServletRequest().getSession(false).invalidate();
				msg = "失败";
			} else {
			}
			checkcode = StringUtil.stringVerification(checkcode);
			if (code.toLowerCase().equals(checkcode.toLowerCase())) {
				MD5 md = new MD5();
				password = md.getMD5ofStr(password);
				SimpleUser user = (SimpleUser) service.findUser(SimpleUser.class.getSimpleName(), name, password);
				if (user != null) {
					ServletContext application = getHttpApplication();
					List<String> onlineList = (List<String>) application.getAttribute(Constant.APPLICATION_ONLINE_USER);
					if (onlineList == null) {
						onlineList = new ArrayList<String>();
					}
					if (!onlineList.contains(name)) {
						onlineList.add(name);
						application.setAttribute(Constant.APPLICATION_ONLINE_USER, onlineList);
						getHttpSession().setAttribute("SimpleUser", user);
						msg = "成功";
					}else{
						msg = "该用户已登录，请稍后重试";
					}
				}else{
					msg = "用户名或者密码错误，请重试";
				}
			}else{
				msg = "验证码错误，请重试";
			}
		} catch (Exception e) {
			msg = "失败";
			e.printStackTrace();
		}
		String retmsg = "{\"msg\":\"" + msg + "\"}";
		try {
			getHttpServletResponse().getWriter().write(retmsg);
			getHttpServletResponse().getWriter().flush();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	@Action(value = "userLogout", results = { @Result(name = "index", type = "redirect", location = "/com/index.action") })
	public String userLogout() {
		ServletContext application = getHttpApplication();
		List<String> onlineList = (List<String>) application.getAttribute(Constant.APPLICATION_ONLINE_USER);
		onlineList.remove(name);
		application.setAttribute(Constant.APPLICATION_ONLINE_USER, onlineList);

		// getHttpSession().removeAttribute(Constant.SESSION_BEAN);
		//getHttpSession().invalidate();
		
		getHttpSession().removeAttribute("SimpleUser");
		return "index";
	}
	
	@Action(value = "userReg")
	public String userReg() {
		String msg = "";
		try {
			String code = (String) getHttpSession().getAttribute(com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY);
			if (code == null) {
				getHttpServletRequest().getSession(false).invalidate();
				msg = "失败";
			} else {
			}
			checkcode = StringUtil.stringVerification(checkcode);
			if (code.toLowerCase().equals(checkcode.toLowerCase())) {
				User user = service.findUserByUname(regbean.getUser().getUname());
				if (user != null) {
					msg = "注册失败,账号已经被使用";
				} else {
					service.addSimpleUser(regbean);
					msg = "成功";
				}
			}else{
				msg = "验证码错误，请重试";
			}
		} catch (Exception e) {
			e.printStackTrace();
			msg = "注册失败";
		}
		String retmsg = "{\"msg\":\"" + msg + "\"}";
		try {
			getHttpServletResponse().getWriter().write(retmsg);
			getHttpServletResponse().getWriter().flush();
		} catch (IOException e) {
			e.printStackTrace();
		}

		return null;
	}
	
	@Action(value = "index", results = { @Result(name = "index", location = "/web/index.jsp") })
	public String query() {
		try {
			List list1 = service.findLimit(Company.class, "id", 5);

			List list2 = service.findLimit("from SysType where type='社会招聘' order by id desc", 5);
			List list3 = service.findLimit("from SysType where type='校园招聘' order by id desc", 5);
			List list4 = service.findLimit("from SysType where type='内部推荐' order by id desc", 5);

			putRequestValue("list1", list1);
			putRequestValue("list2", list2);
			putRequestValue("list3", list3);
			putRequestValue("list4", list4);
			return "index";
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}
	
	@Action(value = "toApply", results = { @Result(name = "index", type = "redirect", location = "/com/toUser.action?type=apply") })
	public String toApply() {
		SimpleUser su = (SimpleUser) getHttpSession().getAttribute("SimpleUser");
		if (su == null) {
			return "index";
		}
		PositionUser temp = (PositionUser) service.get(PositionUser.class, uid);
		temp.setStatus("已投简历");
		service.update(temp);
		
		
		Position ti = temp.getPosition();
		//应聘量增加
		service.updateUserLog(su,ti);
		ti.setApplyCount(ti.getApplyCount() + 1);
		service.update(ti);
		
		return "index";
	}

	@Action(value = "backApply")
	public String backApply() {
		String msg = "";
		SimpleUser su = (SimpleUser) getHttpSession().getAttribute("SimpleUser");
		if (su == null) {
			msg = "需要先登录才能操作";
		} else {
			try {
				PositionUser temp = (PositionUser) service.get(PositionUser.class, uid);
				String date = DateUtil.getCurrentTime();
				if (temp.getInterviewDate() != null && date.compareTo(temp.getInterviewDate()) > 0) {////////
					temp.setStatus("面试过期");
					service.update(temp);
					msg = "已经超过面试时间,自动删除";
				} else {
					temp.setStatus("用户取消");
					service.update(temp);

					Position ti = temp.getPosition();
					ti.setApplyCount(ti.getApplyCount() - 1);
					service.update(ti);
					msg = "成功";
				}
			} catch (Exception e) {
				msg = "取消失败";
				e.printStackTrace();
			}
		}
		String retmsg = "{\"msg\":\"" + msg + "\"}";
		try {

			getHttpServletResponse().getWriter().write(retmsg);
			getHttpServletResponse().getWriter().flush();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	@Action(value = "addConsultation", results = { @Result(name = "index", type = "redirect", location = "/com/toUser.action?type=consultation") })
	public String addConsultation() {
		SimpleUser su = (SimpleUser) getHttpSession().getAttribute("SimpleUser");
		if (su == null) {
			return "index";
		}
		//排除空格
		if (StringUtils.isNotBlank(Consultation.getContent())) {
			Consultation.setUser(su);
			Consultation.setAddDate(DateUtil.getCurrentTime());
			service.add(Consultation);
		}

		return "index";
	}

	@Action(value = "delConsultation", results = { @Result(name = "index", type = "redirect", location = "/com/toUser.action?type=consultation") })
	public String delConsultation() {
		SimpleUser su = (SimpleUser) getHttpSession().getAttribute("SimpleUser");
		if (su == null) {
			return "index";
		}
		service.delete(Consultation.class, uid + "");

		return "index";
	}

	@Action(value = "delPre", results = { @Result(name = "index", type = "redirect", location = "/com/toUser.action?type=apply") })
	public String delPre() {
		SimpleUser su = (SimpleUser) getHttpSession().getAttribute("SimpleUser");
		if (su == null) {
			return "index";
		}
		service.delete(PositionUser.class, uid + "");
		
		return "index";
	}

	@Action(value = "prePosition")
	public String prePosition() {
		String msg = "";
		SimpleUser su = (SimpleUser) getHttpSession().getAttribute("SimpleUser");
		if (su == null) {
			msg = "需要先登录才能操作";
		} else {
			try {
				if (su.getId() != null) {
					Position t = (Position) service.get(Position.class, positionUser.getPosition().getId());
					positionUser.setUser(su);
					positionUser.setAmount(1);
					positionUser.setApplyDate(DateUtil.getCurrentTime());
					positionUser.setStatus("待投简历");
					positionUser.setPosition(t);
					service.add(positionUser);
					msg = "成功";
				}else{
					msg = "保存失败";
				}

			} catch (Exception e) {
				msg = "保存失败";
				e.printStackTrace();
			}
		}
		String retmsg = "{\"msg\":\"" + msg + "\"}";
		try {

			getHttpServletResponse().getWriter().write(retmsg);
			getHttpServletResponse().getWriter().flush();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	@Action(value = "preResume")
	public String preResume() {
		String msg = "";
		SimpleUser su = (SimpleUser) getHttpSession().getAttribute("SimpleUser");
		if (su == null) {
			msg = "需要先登录才能操作";
		} else {
			try {
				if (su.getId() != null) {
					User user = service.findUserByUname(resume.getUser().getUser().getUname());
					if (user != null) {
						Map<String, Object> map = new HashMap<String, Object>();
						map.put("user.id", su.getId());
						List list = service.findAll(Resume.class, map);
						System.out.println("---------"+list.size());
						if(list.size() > 0){
							resume.setUser(su);
							service.update(resume);
							msg = "成功";
						}else{
							resume.setUser(su);
							service.add(resume);
							msg = "成功";
						}
						
					} else {
						
					}
				}else{
					msg = "保存简历失败";
				}
				
			} catch (Exception e) {
				msg = "保存简历失败";
				e.printStackTrace();
			}
		}
		String retmsg = "{\"msg\":\"" + msg + "\"}";
		try {

			getHttpServletResponse().getWriter().write(retmsg);
			getHttpServletResponse().getWriter().flush();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	@Action(value = "toUser", results = { @Result(name = "getOne", location = "/web/user.jsp"),
			@Result(name = "index", type = "redirect", location = "/com/index.action") })
	public String toUser() {
		SimpleUser su = (SimpleUser) getHttpSession().getAttribute("SimpleUser");
		if (su == null) {
			return "index";
		}
		if (StringUtil.isEmpty(type)) {
			type = "info";
		}
		if ("consultation".equals(type)) {//留言
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("user.id", su.getId());
			List list = service.findAll(Consultation.class, map);
			getHttpServletRequest().setAttribute("conmentList", list);
		} else if ("interview".equals(type)) {//通知面试的所有职位信息
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("user.id", su.getId());
			map.put("status", "通知面试");
			List list = service.findAll(PositionUser.class, map);
			getHttpServletRequest().setAttribute("interviewList", list);
		} else if ("apply".equals(type)) {//我的所有的职位信息
			List list = service.findMyPosition(su.getId());
			getHttpServletRequest().setAttribute("interviewList", list);
			
			/*Map<String, Object> map = new HashMap<String, Object>();
			map.put("user.id", su.getId());
			map.put("status", "待投简历");
			List list = service.findAll(PositionUser.class, map);
			getHttpServletRequest().setAttribute("interviewList", list);*/
		} else if ("tips".equals(type)) {//求职技巧
			String ques = getHttpServletRequest().getParameter("ques");
			if (StringUtils.isNotBlank(ques)) {
				Map<SysTips, Integer> list = service.findSysTips(ques);
				getHttpServletRequest().setAttribute("tipsList", list);
				getHttpServletRequest().setAttribute("ques", ques);
			}
		}
		getHttpServletRequest().setAttribute("type", type);
		return "getOne";
	}

	@Action(value = "userPwd")
	public String userPwd() {
		String msg = "";
		try {
			SimpleUser su = (SimpleUser) getHttpSession().getAttribute("SimpleUser");
			User sessionUser = su.getUser();
			MD5 md = new MD5();
			String password = md.getMD5ofStr(oldpwd);

			SimpleUser temp = (SimpleUser) service.get(SimpleUser.class, su.getId());
			if (!password.equals(temp.getUser().getUserPassword())) {
				msg = "旧密码错误";
			} else {
				sessionUser.setUserPassword(newpwd);
				service.updateSimpleUser(su);
				msg = "成功";
			}
		} catch (Exception e) {
			e.printStackTrace();
			msg = "修改密码失败";
		}
		String retmsg = "{\"msg\":\"" + msg + "\"}";
		try {
			getHttpServletResponse().getWriter().write(retmsg);
			getHttpServletResponse().getWriter().flush();
		} catch (IOException e) {
			e.printStackTrace();
		}

		return null;
	}

	@Action(value = "userUpdate", results = { @Result(name = "userUpdate", type = "redirect", location = "/com/toUser.action?type=info") })
	public String userUpdate() {
		try {
			SimpleUser su = (SimpleUser) getHttpSession().getAttribute("SimpleUser");
			User sessionUser = su.getUser();

			updatebean.setUserId(sessionUser.getUserId());
			updatebean.setUname(sessionUser.getUname());
			if (StringUtil.notEmpty(updatebean.getUserPassword())) {
				MD5 md = new MD5();
				String password = md.getMD5ofStr(updatebean.getUserPassword());
				updatebean.setUserPassword(password);
			} else {
				updatebean.setUserPassword(sessionUser.getUserPassword());
			}
			service.update(updatebean);

			sessionUser.setUserAddress(updatebean.getUserAddress());
			sessionUser.setUserBirth(updatebean.getUserBirth());
			sessionUser.setUserEmail(updatebean.getUserEmail());
			sessionUser.setUserGender(updatebean.getUserGender());
			sessionUser.setUserName(updatebean.getUserName());
			sessionUser.setUserPhone(updatebean.getUserPhone());
			sessionUser.setUserJob(updatebean.getUserJob());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "userUpdate";
	}

	@Action(value = "getPosition", results = { @Result(name = "getPosition", location = "/web/detailPosition.jsp") })
	public String getPosition() {
		try {
			Position item = (Position) service.get(Position.class, uid);
			putRequestValue("item", item);
			SimpleUser su = (SimpleUser) getHttpSession().getAttribute("SimpleUser");
			if (su != null) {
				service.updateUserLog(su,item.getCompany());
			}
			return "getPosition";
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}

	@Action(value = "getCompany", results = { @Result(name = "getCompany", location = "/web/detailCompany.jsp") })
	public String getCompany() {
		try {
			Company item = (Company) service.get(Company.class, uid);
			putRequestValue("item", item);
			
			
			SimpleUser su = (SimpleUser) getHttpSession().getAttribute("SimpleUser");
			List<Company> recommendList = service.findRecommend(su,item.getId());
			putRequestValue("recommendList", recommendList);
			if (su != null) {
				service.updateUserLog(su,item);
			}
			return "getCompany";
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}

	@Action(value = "getSysHotel", results = { @Result(name = "getSysHotel", location = "/web/detailSysHotel.jsp") })
	public String getSysHotel() {
		try {
			SysHotel item = (SysHotel) service.get(SysHotel.class, uid);
			putRequestValue("item", item);
			return "getSysHotel";
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}

	@Action(value = "getSysNews", results = { @Result(name = "getSysNews", location = "/web/detailSysNews.jsp") })
	public String getSysNews() {
		try {
			SysNews item = (SysNews) service.get(SysNews.class, uid);
			putRequestValue("item", item);
			return "getSysNews";
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}

	@Action(value = "getSysType", results = { @Result(name = "getSysType", location = "/web/detailSysType.jsp") })
	public String getSysType() {
		try {
			SysType item = (SysType) service.get(SysType.class, uid);
			putRequestValue("item", item);
			return "getSysType";
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}
	
	/*@Action(value = "queryScore", results = { @Result(name = "queryScore", type = "json", params = { "root", "schoolScoreList" }) })
	public String queryScore() {
		try {

			return "queryScore";
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}*/

	@Action(value = "findSysType", results = { @Result(name = "queryList", location = "/web/listSysType.jsp") })
	public String findSysType() {
		/*try {
			int pageNum = 0;
			String t = getHttpServletRequest().getParameter("pageNum");
			if (StringUtil.notEmpty(t)) {
				pageNum = Integer.valueOf(t);
			}
			Page p = (Page) getHttpSession().getAttribute(Constant.SESSION_PAGE + "_WEB");
			if (pageNum == 0 || p == null) {
				p = new Page();
				p.setCurrentPageNumber(1);
				p.setTotalNumber(0l);
				p.setItemsPerPage(Constant.SESSION_PAGE_NUMBER / 2);

				// 字段名称集合
				LinkedList<String> parmnames = new LinkedList<String>();
				// 字段值集合
				LinkedList<Object> parmvalues = new LinkedList<Object>();
				// 页面参数集合
				Set parm = getHttpServletRequest().getParameterMap().entrySet();
				for (Object o : parm) {
					Entry<String, Object> e = (Entry<String, Object>) o;
					String name = e.getKey();// 页面字段名称
					if (name.startsWith("s_")) {
						String fieldValue = getHttpServletRequest().getParameter(name);// 页面字段值
						//fieldValue = new URLDecoder().decode(fieldValue);
						System.out.println("-----------"+name);
						System.out.println("-----------"+fieldValue);
						if (StringUtil.notEmpty(fieldValue)) {
							name = name.substring(2, name.length());// 实体字段名称
							parmnames.add(name);
							parmvalues.add(FieldUtil.format(SysType.class, name, fieldValue));
							if (name.equals("type")) {
								System.out.println("-----------"+fieldValue);
								putRequestValue("sysTypeType", fieldValue);
							}
						}
					}
				}

				SearchParamBean sbean = new SearchParamBean();
				sbean.setParmnames(parmnames);
				sbean.setParmvalues(parmvalues);

				p.setConditonObject(sbean);
			} else {
				p.setCurrentPageNumber(pageNum);
			}
			Page page = null;
			page = service.find(p, SysType.class);
				
			System.out.println(page);
			getHttpSession().setAttribute(Constant.SESSION_PAGE + "_WEB", page);
			return "queryList";
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}*/
		
		try {
			int pageNum = 0;
			String t = getHttpServletRequest().getParameter("pageNum");
			if (StringUtil.notEmpty(t)) {
				pageNum = Integer.valueOf(t);
			}
			Page p = (Page) getHttpSession().getAttribute(Constant.SESSION_PAGE);
			if (pageNum == 0 || p == null) {
				p = new Page();
				p.setCurrentPageNumber(1);
				p.setTotalNumber(0l);
				p.setItemsPerPage(Constant.SESSION_PAGE_NUMBER / 2);

				// 字段名称集合
				LinkedList<String> parmnames = new LinkedList<String>();
				// 字段值集合
				LinkedList<Object> parmvalues = new LinkedList<Object>();
				// 页面参数集合
				Set parm = getHttpServletRequest().getParameterMap().entrySet();
				for (Object o : parm) {
					Entry<String, Object> e = (Entry<String, Object>) o;
					String name = e.getKey();// 页面字段名称
					if (name.startsWith("s_")) {
						String fieldValue = getHttpServletRequest().getParameter(name);// 页面字段值
						if (StringUtil.notEmpty(fieldValue)) {
							name = name.substring(2, name.length());// 实体字段名称
							if (name.equals("type")) {
								putRequestValue("sysTypeType", fieldValue);
							}
							if("shehui".equals(fieldValue)){
								fieldValue = "社会招聘";
							} else if("xiaoyuan".equals(fieldValue)){
								fieldValue = "校园招聘";
							} else if("neitui".equals(fieldValue)){
								fieldValue = "内部推荐";
							}
							parmnames.add(name);
							parmvalues.add(FieldUtil.format(SysType.class, name, fieldValue));
							
						}
					}
				}

				SearchParamBean sbean = new SearchParamBean();
				sbean.setParmnames(parmnames);
				sbean.setParmvalues(parmvalues);

				p.setConditonObject(sbean);
			} else {
				p.setCurrentPageNumber(pageNum);
			}
			Page page = null;
			page = service.find(p, SysType.class);

			getHttpSession().setAttribute(Constant.SESSION_PAGE + "_WEB", page);
			return "queryList";
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}

	@Action(value = "findCompany", results = { @Result(name = "queryList", location = "/web/listCompany.jsp") })
	public String findCompany() {
		try {
			int pageNum = 0;
			String t = getHttpServletRequest().getParameter("pageNum");
			if (StringUtil.notEmpty(t)) {
				pageNum = Integer.valueOf(t);
			}
			Page p = (Page) getHttpSession().getAttribute(Constant.SESSION_PAGE + "_WEB");
			if (pageNum == 0 || p == null) {
				p = new Page();
				p.setCurrentPageNumber(1);
				p.setTotalNumber(0l);
				p.setItemsPerPage(Constant.SESSION_PAGE_NUMBER / 2);

				// 字段名称集合
				LinkedList<String> parmnames = new LinkedList<String>();
				// 字段值集合
				LinkedList<Object> parmvalues = new LinkedList<Object>();
				// 页面参数集合
				Set parm = getHttpServletRequest().getParameterMap().entrySet();
				for (Object o : parm) {
					Entry<String, Object> e = (Entry<String, Object>) o;
					String name = e.getKey();// 页面字段名称
					if (name.startsWith("s_")) {
						String fieldValue = getHttpServletRequest().getParameter(name);// 页面字段值
						if (StringUtil.notEmpty(fieldValue)) {
							name = name.substring(2, name.length());// 实体字段名称
							parmnames.add(name);
							parmvalues.add(FieldUtil.format(Company.class, name, fieldValue));
						}
					}
				}

				SearchParamBean sbean = new SearchParamBean();
				sbean.setParmnames(parmnames);
				sbean.setParmvalues(parmvalues);

				p.setConditonObject(sbean);
			} else {
				p.setCurrentPageNumber(pageNum);
			}
			Page page = null;
			page = service.find(p, Company.class);

			getHttpSession().setAttribute(Constant.SESSION_PAGE + "_WEB", page);
			return "queryList";
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}

	@Action(value = "findSysHotel", results = { @Result(name = "queryList", location = "/web/listSysHotel.jsp") })
	public String findSysHotel() {
		try {
			int pageNum = 0;
			String t = getHttpServletRequest().getParameter("pageNum");
			if (StringUtil.notEmpty(t)) {
				pageNum = Integer.valueOf(t);
			}
			Page p = (Page) getHttpSession().getAttribute(Constant.SESSION_PAGE + "_WEB");
			if (pageNum == 0 || p == null) {
				p = new Page();
				p.setCurrentPageNumber(1);
				p.setTotalNumber(0l);
				p.setItemsPerPage(Constant.SESSION_PAGE_NUMBER / 2);

				// 字段名称集合
				LinkedList<String> parmnames = new LinkedList<String>();
				// 字段值集合
				LinkedList<Object> parmvalues = new LinkedList<Object>();
				// 页面参数集合
				Set parm = getHttpServletRequest().getParameterMap().entrySet();
				for (Object o : parm) {
					Entry<String, Object> e = (Entry<String, Object>) o;
					String name = e.getKey();// 页面字段名称
					if (name.startsWith("s_")) {
						String fieldValue = getHttpServletRequest().getParameter(name);// 页面字段值
						if (StringUtil.notEmpty(fieldValue)) {
							name = name.substring(2, name.length());// 实体字段名称
							parmnames.add(name);
							parmvalues.add(FieldUtil.format(SysHotel.class, name, fieldValue));
						}
					}
				}

				SearchParamBean sbean = new SearchParamBean();
				sbean.setParmnames(parmnames);
				sbean.setParmvalues(parmvalues);

				p.setConditonObject(sbean);
			} else {
				p.setCurrentPageNumber(pageNum);
			}
			Page page = null;
			page = service.find(p, SysHotel.class);

			getHttpSession().setAttribute(Constant.SESSION_PAGE + "_WEB", page);
			return "queryList";
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}

	@Action(value = "findSysNews", results = { @Result(name = "queryList", location = "/web/listSysNews.jsp") })
	public String findSysNews() {
		try {
			int pageNum = 0;
			String t = getHttpServletRequest().getParameter("pageNum");
			if (StringUtil.notEmpty(t)) {
				pageNum = Integer.valueOf(t);
			}
			Page p = (Page) getHttpSession().getAttribute(Constant.SESSION_PAGE + "_WEB");
			if (pageNum == 0 || p == null) {
				p = new Page();
				p.setCurrentPageNumber(1);
				p.setTotalNumber(0l);
				p.setItemsPerPage(Constant.SESSION_PAGE_NUMBER / 2);

				// 字段名称集合
				LinkedList<String> parmnames = new LinkedList<String>();
				// 字段值集合
				LinkedList<Object> parmvalues = new LinkedList<Object>();
				// 页面参数集合
				Set parm = getHttpServletRequest().getParameterMap().entrySet();
				for (Object o : parm) {
					Entry<String, Object> e = (Entry<String, Object>) o;
					String name = e.getKey();// 页面字段名称
					if (name.startsWith("s_")) {
						String fieldValue = getHttpServletRequest().getParameter(name);// 页面字段值
						if (StringUtil.notEmpty(fieldValue)) {
							name = name.substring(2, name.length());// 实体字段名称
							parmnames.add(name);
							parmvalues.add(FieldUtil.format(SysNews.class, name, fieldValue));
						}
					}
				}

				SearchParamBean sbean = new SearchParamBean();
				sbean.setParmnames(parmnames);
				sbean.setParmvalues(parmvalues);

				p.setConditonObject(sbean);
			} else {
				p.setCurrentPageNumber(pageNum);
			}
			Page page = null;
			page = service.find(p, SysNews.class);

			getHttpSession().setAttribute(Constant.SESSION_PAGE + "_WEB", page);
			return "queryList";
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}

	@Action(value = "findPosition", results = { @Result(name = "queryList", location = "/web/listPosition.jsp") })
	public String findPosition() {
		try {
			int pageNum = 0;
			String t = getHttpServletRequest().getParameter("pageNum");
			if (StringUtil.notEmpty(t)) {
				pageNum = Integer.valueOf(t);
			}
			Page p = (Page) getHttpSession().getAttribute(Constant.SESSION_PAGE + "_WEB");
			if (pageNum == 0 || p == null) {
				p = new Page();
				p.setCurrentPageNumber(1);
				p.setTotalNumber(0l);
				p.setItemsPerPage(Constant.SESSION_PAGE_NUMBER / 2);

				// 字段名称集合
				LinkedList<String> parmnames = new LinkedList<String>();
				// 字段值集合
				LinkedList<Object> parmvalues = new LinkedList<Object>();
				// 页面参数集合
				Set parm = getHttpServletRequest().getParameterMap().entrySet();
				for (Object o : parm) {
					Entry<String, Object> e = (Entry<String, Object>) o;
					String name = e.getKey();// 页面字段名称
					if (name.startsWith("s_")) {
						String fieldValue = getHttpServletRequest().getParameter(name);// 页面字段值
						if (StringUtil.notEmpty(fieldValue)) {
							name = name.substring(2, name.length());// 实体字段名称
							parmnames.add(name);
							parmvalues.add(FieldUtil.format(Position.class, name, fieldValue));
						}
					}
				}

				SearchParamBean sbean = new SearchParamBean();
				sbean.setParmnames(parmnames);
				sbean.setParmvalues(parmvalues);

				p.setConditonObject(sbean);
			} else {
				p.setCurrentPageNumber(pageNum);
			}
			Page page = null;
			page = service.find(p, Position.class);

			getHttpSession().setAttribute(Constant.SESSION_PAGE + "_WEB", page);
			return "queryList";
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getOldpwd() {
		return oldpwd;
	}

	public void setOldpwd(String oldpwd) {
		this.oldpwd = oldpwd;
	}

	public String getNewpwd() {
		return newpwd;
	}

	public void setNewpwd(String newpwd) {
		this.newpwd = newpwd;
	}

	public SimpleUser getRegbean() {
		return regbean;
	}

	public void setRegbean(SimpleUser regbean) {
		this.regbean = regbean;
	}

	public User getUpdatebean() {
		return updatebean;
	}

	public void setUpdatebean(User updatebean) {
		this.updatebean = updatebean;
	}

	public Consultation getConsultation() {
		return Consultation;
	}

	public void setConsultation(Consultation Consultation) {
		this.Consultation = Consultation;
	}

	public String getCheckcode() {
		return checkcode;
	}

	public void setCheckcode(String checkcode) {
		this.checkcode = checkcode;
	}

	public PositionUser getPositionUser() {
		return positionUser;
	}

	public void setPositionUser(PositionUser positionUser) {
		this.positionUser = positionUser;
	}

	public Resume getResume() {
		return resume;
	}

	public void setResume(Resume resume) {
		this.resume = resume;
	}

}
