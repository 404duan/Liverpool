package com.football.crud.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.football.crud.bean.History;
import com.football.crud.bean.Msg;
import com.football.crud.service.HistoryService;

@Controller
public class HistoryController {
	
	@Autowired
	HistoryService historyService;
	
	@ResponseBody
	@RequestMapping(value="/gethisText",method=RequestMethod.GET)
	public Msg getHistoryText() {
		return Msg.success().add("hisDetail", historyService.getHisText(1));
	}
	
	@ResponseBody
	@RequestMapping(value="/updateHis",method=RequestMethod.POST)
	public Msg updateHisText(History history) {
		historyService.updateHis(history);
		return Msg.success();
	}
}
