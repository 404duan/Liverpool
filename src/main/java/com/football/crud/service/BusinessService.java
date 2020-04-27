package com.football.crud.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.football.crud.bean.Business;
import com.football.crud.dao.BusinessMapper;

@Service
public class BusinessService {

	@Autowired
	BusinessMapper businessMapper;
	
	public List<Business> getAll() {
		// TODO 自动生成的方法存根
		return businessMapper.selectAll();
	}

	public void addNewBusi(Business business) {
		// TODO 自动生成的方法存根
		businessMapper.insertSelective(business);
	}

	public void deleteBusi(Integer id) {
		// TODO 自动生成的方法存根
		businessMapper.deleteByPrimaryKey(id);
	}

	public Business getBusi(Integer id) {
		// TODO 自动生成的方法存根
		return businessMapper.selectByPrimaryKey(id);
	}

	public void updateBusi(Business business) {
		// TODO 自动生成的方法存根
		businessMapper.updateByPrimaryKeySelective(business);
	}

}
