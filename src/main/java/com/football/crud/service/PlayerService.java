package com.football.crud.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.football.crud.bean.Player;
import com.football.crud.dao.PlayerMapper;

@Service
public class PlayerService {

	@Autowired
	PlayerMapper playerMapper;

	public List<Player> selectAll() {
		// TODO 自动生成的方法存根
		return playerMapper.selectAll();
	}

	public Player getPlayerById(Integer id) {
		// TODO 自动生成的方法存根
		return playerMapper.selectByPrimaryKey(id);
	}

	public void updatePlayer(Player player) {
		// TODO 自动生成的方法存根
		playerMapper.updateByPrimaryKeySelective(player);
	}

	public void delPlayer(Integer id) {
		// TODO 自动生成的方法存根
		playerMapper.deleteByPrimaryKey(id);
	}

	public void addPlayer(Player player) {
		// TODO 自动生成的方法存根
		playerMapper.insertSelective(player);
	}
}
