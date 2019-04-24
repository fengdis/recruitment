package com.fengdi.web.action.sys;

import java.util.LinkedList;
import java.util.Map.Entry;
import java.util.Set;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;

import com.fengdi.common.action.struts.BaseAction;
import com.fengdi.web.entity.SysType;
import com.fengdi.web.service.ISysService;
import com.opensymphony.xwork2.ModelDriven;

import util.Constant;
import util.DateUtil;
import util.FieldUtil;
import util.MessageUtil;
import util.Page;
import util.SearchParamBean;
import util.StringUtil;

/***
 * 
 * @描述 : 类型Controller
 * @创建者：fengdi
 * @创建时间： 2017年3月17日下午2:43:18
 *
 */
@ParentPackage("struts-default")
@Namespace("/sys")
@Component
public class SysTypeAction extends BaseAction implements ModelDriven<SysType> {
	@Autowired
	private ISysService service;

	private int uid;
	private SysType bean = new SysType();

	@Action(value = "add2SysType", results = { @Result(name = "add2", location = "/WEB-INF/jsp/sys/addSysType.jsp") })
	public String add2() {
		return "add2";
	}

	@Action(value = "getSysType", results = { @Result(name = "getOne", location = "/WEB-INF/jsp/sys/modifySysType.jsp") })
	public String get() {
		try {
			SysType temp = (SysType) service.get(SysType.class, uid);
			putRequestValue("modifybean", temp);
			return "getOne";
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}

	@Action(value = "deleteSysType")
	public String delete() {
		try {
			service.delete(SysType.class, ids);
			MessageUtil.addRelMessage(getHttpServletRequest(), "删除信息成功.", "mainquery");
			return SUCCESS;
		} catch (Exception e) {
			MessageUtil.addMessage(getRequest(), "删除信息失败");
			return ERROR;
		}
	}

	@Action(value = "updateSysType")
	public String update() {
		try {
			bean.setAddDate(DateUtil.getCurrentTime());
			service.update(bean);
			MessageUtil.addMessage(getHttpServletRequest(), "更新成功.");
			return SUCCESS;
		} catch (Exception e) {
			MessageUtil.addMessage(getRequest(), "更新失败");
			return ERROR;
		}
	}

	@Action(value = "addSysType")
	public String add() {
		try {
			String type = bean.getType();
			/*if("shehui".equals(type)){
				bean.setType("社会招聘");
			} else if("xiaoyuan".equals(type)){
				bean.setType("校园招聘");
			} else if("neitui".equals(type)){
				bean.setType("内部推荐");
			} */
			
			bean.setAddDate(DateUtil.getCurrentTime());
			service.add(bean);
			MessageUtil.addMessage(getHttpServletRequest(), "添加成功.");
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			MessageUtil.addMessage(getRequest(), "添加失败");
			return ERROR;
		}
	}

	@Action(value = "querySysType", results = { @Result(name = "queryList", location = "/WEB-INF/jsp/sys/listSysType.jsp") })
	public String query() {
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
				p.setItemsPerPage(Constant.SESSION_PAGE_NUMBER);

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

			getHttpSession().setAttribute(Constant.SESSION_PAGE, page);
			return "queryList";
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}

	public SysType getModel() {
		return bean;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	private String ids;

	public String getIds() {
		return ids;
	}

	public void setIds(String ids) {
		this.ids = ids;
	}

	private String type;

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

}
