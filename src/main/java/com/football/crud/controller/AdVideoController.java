package com.football.crud.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.football.crud.bean.AdVideo;
import com.football.crud.bean.Msg;
import com.football.crud.service.AdVideoService;

@Controller
public class AdVideoController {

	@Autowired
	AdVideoService adVideoService;
	
	@ResponseBody
	@RequestMapping(value="/getAdv",method=RequestMethod.GET)
	public Msg getAdvAll() {
		return Msg.success().add("extend", adVideoService.getAll());
	}
	
	@ResponseBody
	@RequestMapping(value="/updateAdv",method=RequestMethod.POST)
	public Msg updateAdv(AdVideo adVideo) {
		adVideoService.updateAdvByTitle(adVideo);
		return Msg.success().add("extend", adVideoService.getAll());
	}
}
