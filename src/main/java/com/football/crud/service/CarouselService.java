package com.football.crud.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.football.crud.bean.Carousel;
import com.football.crud.dao.CarouselMapper;

@Service
public class CarouselService {

	@Autowired
	CarouselMapper carouselMapper;
	
	public void updateCarou(Carousel carousel) {
		// TODO 自动生成的方法存根
		carouselMapper.updateByPrimaryKeySelective(carousel);
	}

	public List<Carousel> getAllImgPath() {
		// TODO 自动生成的方法存根
		return carouselMapper.selectAll();
	}

}
