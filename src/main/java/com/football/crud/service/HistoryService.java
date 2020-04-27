package com.football.crud.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.football.crud.bean.History;
import com.football.crud.dao.HistoryMapper;

@Service
public class HistoryService {

	@Autowired
	HistoryMapper historyMapper;

	public History getHisText(Integer id) {
		// TODO 自动生成的方法存根
		return historyMapper.selectByPrimaryKey(id);
	}

	public void updateHis(History history) {
		// TODO 自动生成的方法存根
		historyMapper.updateByPrimaryKeySelective(history);
	}

}
