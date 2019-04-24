package com.fengdi.web.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.stereotype.Repository;

import com.fengdi.common.dao.hibernate.BaseHibernateDao;
import com.fengdi.web.dao.ISysDao;
import com.fengdi.web.entity.User;

/***
 * 
 * @描述 : Dao（Repository）实现类（继承基类BaseHibernateDao,和BaseHibernateDao共同实现ISysDao和BaseDao中的接口）
 * @创建者：fengdi
 * @创建时间： 2017年3月17日下午2:43:18
 *
 */
@Repository
public class SysDaoImpl extends BaseHibernateDao implements ISysDao {
	@Override
	public void saveUser(User user) {
		save(user);
	}

	@Override
	public Object queryUser(String type, String userid, String pwd) {
		return unique("from " + type + " where user.uname='" + userid + "' and user.userPassword='" + pwd + "'");
	}

	@Override
	public User queryUser(Integer userid) {
		return unique("from User where userid=?", userid);
	}

	@Override
	public List queryByHQL(final String hql, final int start, final int max) {

		try {

			List resultList = getHibernateTemplate().executeFind(

					new HibernateCallback() {

						public Object doInHibernate(Session arg0)

								throws HibernateException, SQLException {

							Query query = arg0.createQuery(hql);

							query.setFirstResult(start);

							query.setMaxResults(max);

							return query.list();
						}
					});
			return resultList;
		} catch (RuntimeException re) {
			throw re;
		}

	}

	@Override
	public User queryUserByUname(String uname) {
		return unique("from User where uname=?", uname);
	}

}
