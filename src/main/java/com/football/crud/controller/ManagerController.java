package com.football.crud.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.football.crud.bean.Manager;
import com.football.crud.bean.Msg;
import com.football.crud.service.ManagerService;

@Controller
public class ManagerController {

	@Autowired
	ManagerService managerService;
	
	/**
	 * 新增教练团队成员
	 */
	@ResponseBody
	@RequestMapping(value="/coach",method=RequestMethod.POST)
	public Msg addNewCoach(Manager manager) {
		SimpleDateFormat year = new SimpleDateFormat("yyyy");
        Date date = new Date();
        manager.setManYear(year.format(date));
		manager.setManType(1);//表示为教练组
		managerService.addNewMan(manager);
		return Msg.success();
	}
	
	/**
	 * 新增管理组成员
	 */
	@ResponseBody
	@RequestMapping(value="/man",method=RequestMethod.POST)
	public Msg addNewMan(Manager manager) {
		SimpleDateFormat year = new SimpleDateFormat("yyyy");
        Date date = new Date();
        manager.setManYear(year.format(date));
		manager.setManType(0);//表示为管理组
		managerService.addNewMan(manager);
		return Msg.success();
	}
	
	/**
	 * 凭借id删除管理组某人
	 */
	@ResponseBody
	@RequestMapping(value="/man/{ids}",method=RequestMethod.DELETE)
	public Msg deleteMan(@PathVariable("ids")String ids) {
		Integer id = Integer.parseInt(ids);
		managerService.deleteMan(id);
		return Msg.success();
	}
	
	/**
	 *凭借id更新某人信息
	 */
	@ResponseBody
	@RequestMapping(value="/man/{manId}",method=RequestMethod.PUT)
	public Msg saveMan(Manager manager) {
		if (manager.getManNation().equals("Afghanistan")) {
			manager.setManNation(null);
		}
		managerService.updateMan(manager);
		return Msg.success();
	}
	
	/**
	 *  凭借id获取某个管理组人员
	 */
	@RequestMapping(value="/man/{id}",method=RequestMethod.GET)
	@ResponseBody
	public Msg getMan(@PathVariable("id")Integer id) {
		Manager manager = managerService.getMan(id);
		String year = manager.getManYear().split("-")[0];
		manager.setManYear(year);
		return Msg.success().add("man", manager);
	}
	
	/**
	 * 获取所有教练组人员列表（man_type=1）
	 */
	@ResponseBody
	@RequestMapping(value="/getCoachs",method=RequestMethod.GET)
	public Msg getAllCoach() {
		return Msg.success().add("coachs", managerService.getCoachs());
	}
	
	/**
	 * 获取所有管理组人员列表（man_type=0）
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/getMans",method=RequestMethod.GET)
	public Msg getAllManager() {
		return Msg.success().add("managers", managerService.getMans());
	}
}
