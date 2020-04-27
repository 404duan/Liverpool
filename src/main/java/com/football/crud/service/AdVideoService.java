package com.football.crud.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.football.crud.bean.AdVideo;
import com.football.crud.dao.AdVideoMapper;

@Service
public class AdVideoService {

	@Autowired
	AdVideoMapper adVideoMapper;
	
	public AdVideo getAll() {
		// TODO 自动生成的方法存根
		return adVideoMapper.selectByPrimaryKey(1);
	}

	public void updateAdvByTitle(AdVideo adVideo) {
		// TODO 自动生成的方法存根
		adVideoMapper.updateByPrimaryKeySelective(adVideo);
	}

}
