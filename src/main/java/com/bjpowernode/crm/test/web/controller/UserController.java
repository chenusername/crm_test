package com.bjpowernode.crm.test.web.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bjpowernode.crm.test.domain.User;
import com.bjpowernode.crm.test.service.UserService;
import com.bjpowernode.crm.test.service.impl.UserServiceImpl;
import com.bjpowernode.crm.util.PrintJson;
import com.bjpowernode.crm.util.ServiceFactory;
import com.bjpowernode.crm.vo.PaginationVO;

/**
 * Servlet implementation class UserController
 */
public class UserController extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("进入 用户模板控制器");
		String path = request.getServletPath();
		if("/test/user/pageList.do".equals(path)){
			pageList(request,response);
		}
	
	
	
	}

	private void pageList(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		System.out.println("进入到 pageList");
		
		String loginName          =request.getParameter("loginName");
		String realName           =request.getParameter("realName");
		String lastLoginTime     =request.getParameter("lastLoginTime");
		String pageNoStr = request.getParameter("pageNo");
		String pageSizeStr = request.getParameter("pageSize");
		int pageNo = Integer.valueOf(pageNoStr);
		int pageSize = Integer.valueOf(pageSizeStr);
		int skipCount = (pageNo-1)*pageSize;
		UserService us = (UserService) ServiceFactory.getService(new UserServiceImpl());
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("login_name", loginName);
		map.put("real_name", realName);
		map.put("last_login_time", lastLoginTime);
		map.put("pageNo", pageNo);
		map.put("pageSize", pageSize);
		map.put("skipCount", skipCount);
		
		PaginationVO<User> vo= us.pageList(map);
		PrintJson.printJsonObj(response, vo);
		
	}

}
