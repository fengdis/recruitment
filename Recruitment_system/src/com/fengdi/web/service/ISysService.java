package com.fengdi.web.service;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import com.fengdi.web.entity.Company;
import com.fengdi.web.entity.Position;
import com.fengdi.web.entity.Resume;
import com.fengdi.web.entity.SysTips;
import com.fengdi.web.entity.SimpleUser;
import com.fengdi.web.entity.SysUser;
import com.fengdi.web.entity.User;

import util.Page;

/***
 * 
 * @描述 : Service接口
 * @创建者：fengdi
 * @创建时间： 2017年3月17日下午2:43:18
 *
 */
public interface ISysService {
	public void add(Object obj);

	public void addSysUser(SysUser obj);

	public void update(Object obj);

	public void updateSysUser(SysUser obj);

	public void delete(Class clazz, String ids);

	@SuppressWarnings("rawtypes")
	public Object get(Class clazz, Serializable id);

	public void deleteUser(String ids);

	public Object findUser(String type, String userid, String pwd);

	public User findUser(Integer userid);
	
	public User findUserByUname(String uname);

	public Page findUser(Page page);

	public Page find(Page page, Class clazz);

	public List findAll(Class clazz);

	public List findAll(Class clazz, Map<String, Object> params);

	public void addSimpleUser(SimpleUser obj);

	public void updateSimpleUser(SimpleUser obj);
	
	public void updateResume(Resume obj);

	public List findLimit(Class clazz, String orderBy, int max);

	public List findLimit(String hql, int max);

	public List findMyPosition(int userid);

	public Map<SysTips, Integer> findSysTips(String ques);

	public void updateUserLog(SimpleUser su, Company company);
	
	public void updateUserLog(SimpleUser su, Position position);

	public List<Company> findRecommend(SimpleUser su, int currentPointid);

}
