package com.football.crud.dao;

import com.football.crud.bean.History;

public interface HistoryMapper {

    int deleteByPrimaryKey(Integer hisId);

    int insert(History record);

    int insertSelective(History record);

    History selectByPrimaryKey(Integer hisId);

    int updateByPrimaryKeySelective(History record);

    int updateByPrimaryKey(History record);
}