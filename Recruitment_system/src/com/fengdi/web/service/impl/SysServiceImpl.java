package com.fengdi.web.service.impl;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.fengdi.common.service.BaseService;
import com.fengdi.web.action.Analzyer;
import com.fengdi.web.dao.ISysDao;
import com.fengdi.web.entity.Company;
import com.fengdi.web.entity.Position;
import com.fengdi.web.entity.Resume;
import com.fengdi.web.entity.SimpleUser;
import com.fengdi.web.entity.SysTips;
import com.fengdi.web.entity.SysUser;
import com.fengdi.web.entity.User;
import com.fengdi.web.entity.UserLog;
import com.fengdi.web.service.ISysService;

import util.DateUtil;
import util.MD5;
import util.Page;

/***
 * 
 * @描述 : Service实现类
 * @创建者：fengdi
 * @创建时间： 2017年3月17日下午2:43:18
 *
 */
@Service("sysService")
@Repository
public class SysServiceImpl extends BaseService implements ISysService {

	@Autowired
	private ISysDao dao;

	@Override
	public List<Company> findRecommend(SimpleUser su, int currentCompanyid) {
		List<Company> list = new ArrayList<Company>();
		Company current = (Company) dao.get(Company.class, currentCompanyid);
		if (su == null) {
			list = dao.queryByHQL("from Company where id!=" + currentCompanyid + " order by id desc", 0, 4);
		} else {
			List<UserLog> loglist = dao.queryByHQL("from UserLog where user.id=? order by amount",su.getId());
			String ls = "";
			for(UserLog log: loglist){
				ls += "'"+log.getCompany().getArea()+"',";
			}
			if(StringUtils.isNotBlank(ls)){
				ls = ls.substring(0,ls.length()-1);
				list = dao.queryByHQL("from Company where id!=" + currentCompanyid + " and area in ("+ls+") order by id desc", 0, 6);
			}else{
				list = dao.queryByHQL("from Company where id!=" + currentCompanyid + " order by id desc", 0, 4);
			}
		}

		return list;
	}

	@Override
	public void addSimpleUser(SimpleUser obj) {
		User user = obj.getUser();
		MD5 md = new MD5();
		user.setUserPassword(md.getMD5ofStr(user.getUserPassword()));
		dao.save(user);
		dao.save(obj);
	}

	@Override
	public void updateSimpleUser(SimpleUser obj) {
		SimpleUser temp = (SimpleUser) dao.get(SimpleUser.class, obj.getId());
		User user = temp.getUser();
		user.setUserAddress(obj.getUser().getUserAddress());
		user.setUserBirth(obj.getUser().getUserBirth());
		user.setUserEmail(obj.getUser().getUserEmail());
		user.setUserGender(obj.getUser().getUserGender());
		user.setUserName(obj.getUser().getUserName());
		user.setUserPhone(obj.getUser().getUserPhone());
		user.setUserJob(obj.getUser().getUserJob());
		if (StringUtils.isNotBlank(obj.getUser().getUserPassword())) {
			MD5 md = new MD5();
			user.setUserPassword(md.getMD5ofStr(obj.getUser().getUserPassword()));
		}
		dao.merge(user);
		obj.setUser(user);
		dao.merge(obj);

	}

	/**
	 * 添加对象
	 * 
	 * @param obj
	 */
	@Override
	public void add(Object obj) {
		dao.save(obj);
	}

	/**
	 * 修改对象
	 * 
	 * @param obj
	 */
	@Override
	public void update(Object obj) {
		dao.merge(obj);
	}

	/**
	 * 根据id获取对象
	 * 
	 * @param clazz
	 * @param id
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	@Override
	public Object get(Class clazz, Serializable id) {
		return dao.get(clazz, id);
	}

	@Override
	public void deleteUser(String ids) {
		dao.deleteByIds(User.class, ids);
	}

	@Override
	public void delete(Class clazz, String ids) {
		dao.deleteByIds(clazz, ids);
	}

	@Override
	public Object findUser(String type, String userid, String pwd) {
		return dao.queryUser(type, userid, pwd);
	}

	@Override
	public User findUser(Integer userid) {
		return dao.queryUser(userid);
	}

	@Override
	public Page findUser(Page page) {
		return dao.list(page, "User");
	}

	@Override
	public Page find(Page page, Class clazz) {
		return dao.list(page, clazz.getSimpleName());
	}

	@Override
	public List findAll(Class clazz) {
		return dao.queryByHQL("from " + clazz.getSimpleName());
	}

	@Override
	public void addSysUser(SysUser obj) {
		User user = obj.getUser();
		MD5 md = new MD5();
		user.setUserPassword(md.getMD5ofStr(user.getUserPassword()));
		dao.save(user);
		dao.save(obj);
	}

	@Override
	public void updateSysUser(SysUser obj) {
		SysUser temp = (SysUser) dao.get(SysUser.class, obj.getId());
		User user = temp.getUser();
		user.setUserAddress(obj.getUser().getUserAddress());
		user.setUserBirth(obj.getUser().getUserBirth());
		user.setUserEmail(obj.getUser().getUserEmail());
		user.setUserGender(obj.getUser().getUserGender());
		user.setUserName(obj.getUser().getUserName());
		user.setUserPhone(obj.getUser().getUserPhone());
		user.setUserJob(obj.getUser().getUserJob());
		if (StringUtils.isNotBlank(obj.getUser().getUserPassword())) {
			MD5 md = new MD5();
			user.setUserPassword(md.getMD5ofStr(obj.getUser().getUserPassword()));
		}
		dao.merge(user);
		obj.setUser(user);
		dao.merge(obj);

	}

	@Override
	public List findAll(Class clazz, Map<String, Object> params) {
		return dao.findAll(clazz, params);
	}

	@Override
	public List findLimit(Class clazz, String orderBy, int max) {
		return dao.queryByHQL("from " + clazz.getSimpleName() + " order by " + orderBy, 0, max);
	}

	@Override
	public List findLimit(String hql, int max) {
		return dao.queryByHQL(hql, 0, max);
	}

	@Override
	public List findMyPosition(int userid) {
		/*return dao.queryByHQL("from PositionUser where user.id=? and status != '已投简历'", userid);*/
		return dao.queryByHQL("from PositionUser where user.id=? ", userid);
	}

	@Override
	public Map<SysTips, Integer> findSysTips(String ques) {
		Map<SysTips, Integer> map = new HashMap<SysTips, Integer>();

		List<String> word = Analzyer.getWordsList(ques);
		if (!word.contains(ques)) {
			word.add(ques);
		}

		for (String w : word) {
			List<SysTips> templist = dao.queryByHQL("from SysTips where name like '%" + w + "%'");
			for (SysTips t : templist) {
				if (map.containsKey(t)) {
					map.put(t, map.get(t) + 1);
				} else {
					map.put(t, 1);
				}
			}
		}
		Map<SysTips, Integer> tempmap = sortMapByValue(map);

		return tempmap;
	}

	private Map<SysTips, Integer> sortMapByValue(Map<SysTips, Integer> oriMap) {
		Map<SysTips, Integer> sortedMap = new LinkedHashMap<SysTips, Integer>();
		if (oriMap != null && !oriMap.isEmpty()) {
			List<Map.Entry<SysTips, Integer>> entryList = new ArrayList<Map.Entry<SysTips, Integer>>(oriMap.entrySet());
			Collections.sort(entryList, new Comparator<Map.Entry<SysTips, Integer>>() {
				public int compare(Entry<SysTips, Integer> entry1, Entry<SysTips, Integer> entry2) {
					int value1 = 0, value2 = 0;

					value1 = (entry1.getValue());
					value2 = (entry2.getValue());

					return value2 - value1;
				}
			});
			Iterator<Map.Entry<SysTips, Integer>> iter = entryList.iterator();
			Map.Entry<SysTips, Integer> tmpEntry = null;
			while (iter.hasNext()) {
				tmpEntry = iter.next();
				sortedMap.put(tmpEntry.getKey(), tmpEntry.getValue());
			}
		}
		return sortedMap;
	}

	@Override
	public void updateUserLog(SimpleUser su, Company company) {
		UserLog ul = dao.unique("from UserLog where user.id=? and company.id=?", su.getId(), company.getId());
		if (ul == null) {
			ul = new UserLog();
			ul.setAddDate(DateUtil.getCurrentTime());
			ul.setAmount(1);
			ul.setCompany(company);
			ul.setUser(su);
			dao.save(ul);
		} else {
			ul.setAmount(ul.getAmount() + 1);
			ul.setAddDate(DateUtil.getCurrentTime());
			dao.update(ul);
		}
	}

	@Override
	public User findUserByUname(String uname) {
		return dao.queryUserByUname(uname);
	}

	@Override
	public void updateUserLog(SimpleUser su, Position position) {
		UserLog ul = dao.unique("from UserLog where user.id=? and position.id=?", su.getId(), position.getId());
		if (ul == null) {
			ul = new UserLog();
			ul.setAddDate(DateUtil.getCurrentTime());
			ul.setAmounts(1);
			ul.setPosition(position);
			ul.setUser(su);
			dao.save(ul);
		} else {
			ul.setAmount(ul.getAmounts() + 1);
			ul.setAddDate(DateUtil.getCurrentTime());
			dao.update(ul);
		}
	}

	@Override
	public void updateResume(Resume obj) {
		Resume ul = dao.unique("from Resume where user.id=?", obj.getUser().getId());
		if (ul == null) {
			ul = new Resume();
			ul.setContent(obj.getContent());
			ul.setUser(obj.getUser());
			dao.save(ul);
		} else {
			ul.setContent(obj.getContent());
			ul.setUser(obj.getUser());
			dao.update(ul);
		}
		
	}
}
