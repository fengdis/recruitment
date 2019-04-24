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
import com.fengdi.web.entity.Company;
import com.fengdi.web.service.ISysService;
import com.opensymphony.xwork2.ModelDriven;

import util.Constant;
import util.FieldUtil;
import util.MessageUtil;
import util.Page;
import util.SearchParamBean;
import util.StringUtil;

/***
 * 
 * @描述 : 公司Controller
 * @创建者：fengdi
 * @创建时间： 2017年3月17日下午2:43:18
 *
 */
@ParentPackage("struts-default")
@Namespace("/sys")
@Component
public class CompanyAction extends BaseAction implements ModelDriven<Company> {
	@Autowired
	private ISysService service;

	private int uid;
	private Company bean = new Company();

	@Action(value = "add2Company", results = { @Result(name = "add2", location = "/WEB-INF/jsp/sys/addCompany.jsp") })
	public String add2() {
		return "add2";
	}

	@Action(value = "getCompany", results = { @Result(name = "getOne", location = "/WEB-INF/jsp/sys/modifyCompany.jsp") })
	public String get() {
		try {
			Company temp = (Company) service.get(Company.class, uid);
			putRequestValue("modifybean", temp);
			return "getOne";
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}

	@Action(value = "deleteCompany")
	public String delete() {
		try {
			service.delete(Company.class, ids);
			MessageUtil.addRelMessage(getHttpServletRequest(), "删除信息成功.", "mainquery");
			return SUCCESS;
		} catch (Exception e) {
			MessageUtil.addMessage(getRequest(), "删除信息失败");
			return ERROR;
		}
	}

	@Action(value = "updateCompany")
	public String update() {
		try {
			service.update(bean);
			MessageUtil.addMessage(getHttpServletRequest(), "更新成功.");
			return SUCCESS;
		} catch (Exception e) {
			MessageUtil.addMessage(getRequest(), "更新失败");
			return ERROR;
		}
	}

	@Action(value = "addCompany")
	public String add() {
		try {
			service.add(bean);
			MessageUtil.addMessage(getHttpServletRequest(), "添加成功.");
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			MessageUtil.addMessage(getRequest(), "添加失败");
			return ERROR;
		}
	}

	@Action(value = "queryCompany", results = { @Result(name = "queryList", location = "/WEB-INF/jsp/sys/listCompany.jsp") })
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
							parmnames.add(name);
							parmvalues.add(FieldUtil.format(Company.class, name, fieldValue));
							if (name.equals("type")) {
								putRequestValue("companyType", fieldValue);
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
			page = service.find(p, Company.class);

			getHttpSession().setAttribute(Constant.SESSION_PAGE, page);
			return "queryList";
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}

	public Company getModel() {
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
