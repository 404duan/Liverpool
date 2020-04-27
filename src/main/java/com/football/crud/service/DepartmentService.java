package com.football.crud.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.football.crud.bean.Department;
import com.football.crud.dao.DepartmentMapper;

@Service
public class DepartmentService {

	@Autowired
	private DepartmentMapper departmentMapper;
	
	public List<Department> getDepts() {
		// TODO 自动生成的方法存根
		List<Department> list = departmentMapper.selectByExample(null);
		return list;
	}

}
