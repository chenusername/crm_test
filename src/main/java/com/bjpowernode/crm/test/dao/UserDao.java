package com.bjpowernode.crm.test.dao;

import java.util.List;
import java.util.Map;

import com.bjpowernode.crm.test.domain.User;

public interface UserDao {

	public int getTotalByCondition(Map<String, Object> map) ;

	public List<User> getUserListByCondition(Map<String, Object> map) ;

}
