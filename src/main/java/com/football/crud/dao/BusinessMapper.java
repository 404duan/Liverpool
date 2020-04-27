package com.football.crud.dao;

import java.util.List;

import com.football.crud.bean.Business;

public interface BusinessMapper {

    int deleteByPrimaryKey(Integer busiId);

    int insert(Business record);

    int insertSelective(Business record);

    Business selectByPrimaryKey(Integer busiId);

    int updateByPrimaryKeySelective(Business record);

    int updateByPrimaryKey(Business record);

	List<Business> selectAll();
}