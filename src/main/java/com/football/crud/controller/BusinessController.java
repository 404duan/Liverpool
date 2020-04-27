package com.football.crud.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.football.crud.bean.Business;
import com.football.crud.bean.Msg;
import com.football.crud.service.BusinessService;

@Controller
public class BusinessController {
	
	@Autowired
	BusinessService businessService;
	
	/**
	 * 凭借id更新一条记录
	 */
	@ResponseBody
	@RequestMapping(value="/busi/{busiId}",method=RequestMethod.PUT)
	public Msg updateBusi(Business business) {
		businessService.updateBusi(business);
		return Msg.success();
	}
	
	/**
	 * 凭借id查询一条记录
	 */
	@ResponseBody
	@RequestMapping(value="/busi/{id}",method=RequestMethod.GET)
	public Msg getBusi(@PathVariable("id")Integer id) {
		return Msg.success().add("busi", businessService.getBusi(id));
	}
	
	/**
	 * 删除一条记录
	 */
	@ResponseBody
	@RequestMapping(value="/busi/{busiId}",method=RequestMethod.DELETE)
	public Msg delBusi(@PathVariable("busiId")Integer busiId) {
		businessService.deleteBusi(busiId);
		return Msg.success();
	}
	
	/**
	 * 新增一条商务合作信息
	 */
	@ResponseBody
	@RequestMapping(value="/busi",method=RequestMethod.POST)
	public Msg addBusi(Business business) {
		businessService.addNewBusi(business);
		return Msg.success();
	}
	
	/**
	 * 获取所有合作商信息列表
	 */
	@ResponseBody
	@RequestMapping(value="/busi",method=RequestMethod.GET)
	public Msg getAll() {
		return Msg.success().add("busi", businessService.getAll());
	}
}
