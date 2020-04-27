package com.football.crud.dao;

import com.football.crud.bean.Admin;

public interface AdminMapper {
    int deleteByPrimaryKey(Integer admId);

    int insert(Admin record);

    int insertSelective(Admin record);

    Admin selectByPrimaryKey(Integer admId);

    int updateByPrimaryKeySelective(Admin record);

    int updateByPrimaryKey(Admin record);

	Integer selectByAdm(String admName, String admPassword);

	Admin selectByAdmName(String admName);
}