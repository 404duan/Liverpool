package com.football.crud.dao;

import java.util.List;

import com.football.crud.bean.Honor;

public interface HonorMapper {

    int deleteByPrimaryKey(Integer horId);

    int insert(Honor record);

    int insertSelective(Honor record);

    Honor selectByPrimaryKey(Integer horId);

    int updateByPrimaryKeySelective(Honor record);

    int updateByPrimaryKey(Honor record);

	List<Honor> selectAll();
}