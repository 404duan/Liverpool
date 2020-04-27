package com.football.crud.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.football.crud.bean.Admin;
import com.football.crud.dao.AdminMapper;

@Service
public class AdminService {
	
	@Autowired
	AdminMapper adminMapper;

	public Integer select(String admName, String admPassword) {
		// TODO 自动生成的方法存根
		return adminMapper.selectByAdm(admName,admPassword);
	}

	public Admin findByName(String admName) {
		// TODO 自动生成的方法存根
		return adminMapper.selectByAdmName(admName);
	}

	public void updPsw(Admin admin) {
		// TODO 自动生成的方法存根
		adminMapper.updateByPrimaryKeySelective(admin);
	}
}
