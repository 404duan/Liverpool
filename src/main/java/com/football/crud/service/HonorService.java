package com.football.crud.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.football.crud.bean.Honor;
import com.football.crud.dao.HonorMapper;

@Service
public class HonorService {

	@Autowired
	HonorMapper honorMapper;
	
	public List<Honor> getAll() {
		// TODO 自动生成的方法存根
		return honorMapper.selectAll();
	}

	public Honor getHor(Integer id) {
		// TODO 自动生成的方法存根
		return honorMapper.selectByPrimaryKey(id);
	}

	public void updateHor(Honor honor) {
		// TODO 自动生成的方法存根
		honorMapper.updateByPrimaryKeySelective(honor);
	}

	public void addHor(Honor honor) {
		// TODO 自动生成的方法存根
		honorMapper.insertSelective(honor);
	}

	public void deleteHor(Integer id) {
		// TODO 自动生成的方法存根
		honorMapper.deleteByPrimaryKey(id);
	}

}
