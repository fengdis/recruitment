package com.fengdi.web.dao;

import java.util.List;

import com.fengdi.common.dao.hibernate.BaseDao;
import com.fengdi.web.entity.User;

/***
 * 
 * @描述 : Dao（Repository）接口
 * @创建者：fengdi
 * @创建时间： 2017年3月17日下午2:43:18
 *
 */
public interface ISysDao extends BaseDao {

	public void saveUser(User user);

	public Object queryUser(String type, String userid, String pwd);

	public User queryUser(Integer userid);
	
	public User queryUserByUname(String uname);

	public List queryByHQL(final String hql, final int start, final int max);

	public <T> T unique(final String hql, final Object... paramlist);
}
