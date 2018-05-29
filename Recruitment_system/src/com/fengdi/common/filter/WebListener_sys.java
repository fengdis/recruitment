package com.fengdi.common.filter;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import javax.xml.ws.Endpoint;

/**
 * web监听器  用于将Web应用部署到服务器运行时，在初始化WebServicePublishServlet时执行初始化的各种操作
 * 使用Servlet3.0提供的@WebListener注解将实现了ServletContextListener接口的WebServicePublishListener类标注为一个Listener
 */
/***
 * 
 * @描述 : WebListener
 * @创建者：fengdi
 * @创建时间： 2017年3月17日下午2:43:18
 *
 */
@WebListener
public class WebListener_sys implements ServletContextListener {

	@Override
	public void contextDestroyed(ServletContextEvent arg0) {

	}

	@Override
	public void contextInitialized(ServletContextEvent event) {
		// WebApplicationContext wac =
		// WebApplicationContextUtils.getRequiredWebApplicationContext(event.getServletContext());
		// ISysService service = (ISysService) wac.getBean("sysService");

		// 监听器发布WebService
		//String address = "http://192.168.1.100:8080/WS_Server/WebService";
		// 发布WebService，WebServiceImpl类是WebServie接口的具体实现类
		//Endpoint.publish(address, new WebServiceImpl());
		//System.out.println("使用WebServicePublishListener发布webservice成功!");
	}

}
