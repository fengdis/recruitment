package com.fengdi.common.dao.hibernate;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import util.Page;

/***
 * 
 * @描述 : 基类Dao（Repository）接口，所有Dao（Repository）接口需继承
 * @创建者：fengdi
 * @创建时间： 2017年3月17日下午2:43:18
 *
 */
public interface BaseDao {
	@SuppressWarnings("rawtypes")
	public void deleteByIds(Class clazz, String ids);

	public Serializable save(Object model);

	public void saveOrUpdate(Object model);

	public void update(Object model);

	public void merge(Object model);

	public void delete(Object model);

	public void delete(Class clazz, Serializable id);

	public Object get(Class clazz, Serializable id);

	public Object load(Class clazz, Serializable id);

	@SuppressWarnings("rawtypes")
	public List queryByHQL(String hql, Object... values);

	@SuppressWarnings("rawtypes")
	public List queryByHQL(String hql);

	public void updateByHQL(String hql, Object... values);

	public void updateByHQL(String hql, Object values);

	public Page list(final Page p, final String name);

	public List findAll(Class clazz, Map<String, Object> params);

}
