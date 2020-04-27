package com.football.crud.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.football.crud.bean.Honor;
import com.football.crud.bean.Msg;
import com.football.crud.service.HonorService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
public class HonorController {

	@Autowired
	HonorService honorService;
	
	/**
	 * @ResponseBody
	@RequestMapping(value="/emp/{ids}",method=RequestMethod.DELETE)
	public Msg deleteEmp(@PathVariable("ids")String ids) {
			Integer id = Integer.parseInt(ids);
			employeeService.deleteEmp(id);
		return Msg.success();
	}
	 */
	@ResponseBody
	@RequestMapping(value="/hor/{ids}",method=RequestMethod.DELETE)
	public Msg deleteHor(@PathVariable("ids")String ids) {
		Integer id = Integer.parseInt(ids);
		honorService.deleteHor(id);
		return Msg.success();
		
	}
	
	/**
	 * 获取所有记录
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/getAllHor",method=RequestMethod.GET)
	public Msg getAllHor() {
		return Msg.success().add("honor", honorService.getAll());
	}
	
	/**
	 * 得到指定id的记录
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/hor/{id}",method=RequestMethod.GET)
	@ResponseBody
	public Msg getHor(@PathVariable("id")Integer id) {
		Honor honor = honorService.getHor(id);
		return Msg.success().add("hor", honor);
	}
	
	/**
	 * 新增记录
	 * @param honor
	 * @return
	 */
	@RequestMapping(value="/hor",method=RequestMethod.POST)
	@ResponseBody
	public Msg addHor(Honor honor) {
		honorService.addHor(honor);
		return Msg.success();
	}
	
	/**
	 * 基于id更新某项记录
	 * @param honor
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/hor/{horId}",method=RequestMethod.PUT)
	public Msg saveHor(Honor honor) {
		honorService.updateHor(honor);
		return Msg.success();
	}
	
	@ResponseBody
	@RequestMapping("/hors")
	public Msg getHors(@RequestParam(value = "pn", defaultValue = "1") Integer pn) {
		PageHelper.startPage(pn, 9);
		List<Honor> hors = honorService.getAll();
		PageInfo page = new PageInfo<>(hors, 9);
		return Msg.success().add("pageInfo", page);
	}
}
