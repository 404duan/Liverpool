package com.football.crud.dao;

import com.football.crud.bean.Carousel;
import java.util.List;

public interface CarouselMapper {

    int deleteByPrimaryKey(Integer imgId);

    int insert(Carousel record);

    int insertSelective(Carousel record);

    Carousel selectByPrimaryKey(Integer imgId);

    int updateByPrimaryKeySelective(Carousel record);

    int updateByPrimaryKey(Carousel record);

	List<Carousel> selectAll();
}