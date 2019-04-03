package com.bjpowernode.crm.test.service;

import java.util.Map;

import com.bjpowernode.crm.test.domain.User;
import com.bjpowernode.crm.vo.PaginationVO;

public interface UserService {

	PaginationVO<User> pageList(Map<String, Object> map);
	
}
