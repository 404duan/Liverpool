package com.football.crud.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.football.crud.bean.Manager;
import com.football.crud.dao.ManagerMapper;

@Service
public class ManagerService {

	@Autowired
	ManagerMapper managerMapper;
	
	public List<Manager> getMans() {
		// TODO 自动生成的方法存根
		return managerMapper.selectAllMans();
	}

	public Manager getMan(Integer id) {
		// TODO 自动生成的方法存根
		return managerMapper.selectByPrimaryKey(id);
	}

	public void updateMan(Manager manager) {
		// TODO 自动生成的方法存根
		managerMapper.updateByPrimaryKeySelective(manager);
	}

	public void deleteMan(Integer id) {
		// TODO 自动生成的方法存根
		managerMapper.deleteByPrimaryKey(id);
	}

	public void addNewMan(Manager manager) {
		// TODO 自动生成的方法存根
		managerMapper.insertSelective(manager);
	}

	public List<Manager> getCoachs() {
		// TODO 自动生成的方法存根
		return managerMapper.selectAllCoachs();
	}

}
