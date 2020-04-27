package com.football.crud.dao;

import com.football.crud.bean.AdVideo;

public interface AdVideoMapper {

    int deleteByPrimaryKey(Integer advId);

    int insert(AdVideo record);

    int insertSelective(AdVideo record);

    AdVideo selectByPrimaryKey(Integer advId);

    int updateByPrimaryKeySelective(AdVideo record);

    int updateByPrimaryKey(AdVideo record);
}