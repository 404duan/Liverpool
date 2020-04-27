package com.football.crud.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.football.crud.bean.Msg;
import com.football.crud.bean.Player;
import com.football.crud.service.PlayerService;

@Controller
public class PlayerController {
	
	@Autowired
	PlayerService playerService;
	
	/**
	 * 新增球员记录
	 */
	@ResponseBody
	@RequestMapping(value="/player",method=RequestMethod.POST)
	public Msg addPlayer(Player player) {
		playerService.addPlayer(player);
		return Msg.success();
	}
	
	/**
	 * 删除某球员记录
	 */
	@ResponseBody
	@RequestMapping(value="/player/{id}",method=RequestMethod.DELETE)
	public Msg delPlayer(@PathVariable("id")Integer id) {
		playerService.delPlayer(id);
		return Msg.success();
	}
	
	/**
	 * 修改某球员资料
	 */
	@ResponseBody
	@RequestMapping(value="/player/{id}",method=RequestMethod.PUT)
	public Msg updatePlayerById(Player player) {
		playerService.updatePlayer(player);
		return Msg.success();
	}
	
	/**
	 * 凭借id获取球员详情
	 */
	@ResponseBody
	@RequestMapping(value="/player/{id}",method=RequestMethod.GET)
	public Msg getPlayerById(@PathVariable("id")Integer id) {
		return Msg.success().add("player", playerService.getPlayerById(id));
	}
	
	/**
	 *  查找全体球员
	 */
	@ResponseBody
	@RequestMapping(value="/getAllPlayers",method=RequestMethod.GET)
	public Msg getAllPlayers() {
		return Msg.success().add("playList", playerService.selectAll());
	}
}
