package com.football.crud.dao;

import java.util.List;

import com.football.crud.bean.Manager;

public interface ManagerMapper {

    int deleteByPrimaryKey(Integer manId);

    int insert(Manager record);

    int insertSelective(Manager record);

    Manager selectByPrimaryKey(Integer manId);

    int updateByPrimaryKeySelective(Manager record);

    int updateByPrimaryKey(Manager record);

	List<Manager> selectAllMans();

	List<Manager> selectAllCoachs();
}