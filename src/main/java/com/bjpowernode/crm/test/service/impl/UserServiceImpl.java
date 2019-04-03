package com.bjpowernode.crm.test.service.impl;

import java.util.List;
import java.util.Map;

import com.bjpowernode.crm.test.dao.UserDao;
import com.bjpowernode.crm.test.domain.User;
import com.bjpowernode.crm.test.service.UserService;
import com.bjpowernode.crm.util.SqlSessionUtil;
import com.bjpowernode.crm.vo.PaginationVO;

public class UserServiceImpl implements UserService {
	private UserDao userDao = SqlSessionUtil.getSqlSession().getMapper(UserDao.class);
	
	public PaginationVO<User> pageList(Map<String, Object> map) {
		int total = userDao.getTotalByCondition(map);
		
		List<User> dataList = userDao.getUserListByCondition(map);
		
		//将total和dataList封装到vo中
		PaginationVO<User> vo = new PaginationVO<User>();
		vo.setTotal(total);
		vo.setDataList(dataList);
		
		
		return vo;
	}

}
