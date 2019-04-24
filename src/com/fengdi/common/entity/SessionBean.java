package com.fengdi.common.entity;

import java.io.Serializable;
import java.util.Date;

/***
 * 
 * @描述 : SessionBean
 * @创建者：fengdi
 * @创建时间： 2017年3月17日下午2:43:18
 *
 */
public class SessionBean implements Serializable {
	private Object user;
	private Date date;
	private String str;

	public Object getUser() {
		return user;
	}

	public void setUser(Object user) {
		this.user = user;
	}
	
	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getStr() {
		return str;
	}

	public void setStr(String str) {
		this.str = str;
	}

	public String getRole() {
		if (user == null) {
			return "";
		}
		String ret = user.getClass().getSimpleName();
		//System.out.println(ret);
		return ret;

	}

}
