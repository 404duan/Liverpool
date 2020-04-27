package com.football.crud.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.football.crud.bean.Admin;
import com.football.crud.bean.Msg;
import com.football.crud.service.AdminService;
import com.football.crud.utils.Md5Util;

@Controller
public class AdminController {
	
	@Autowired
	AdminService adminService;
	
	/**
	 * 更改密码
	 * @param admin
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/updPsw/{admId}",method=RequestMethod.PUT)
	public Msg updPsw(Admin admin) {
		String admPassword = admin.getAdmPassword();
		Md5Util md5Util = new Md5Util();
		String md5Psw = md5Util.getMd5(admPassword);
		admin.setAdmPassword(md5Psw);
		adminService.updPsw(admin);
		return Msg.success();
	}
	
	/**
	 * 凭借admName查询
	 */
	@ResponseBody
	@RequestMapping(value="/findByName/{admName}",method=RequestMethod.GET)
	public Msg findByName(@PathVariable("admName")String admName) {
		return Msg.success().add("admin", adminService.findByName(admName));
	}
	
	/**
	 * 验证登录用户名密码
	 */
	@ResponseBody
	@RequestMapping(value="/login",method=RequestMethod.GET)
	public Msg login(Admin admin,HttpSession session,HttpServletRequest request,HttpServletResponse response) {
		String flag = request.getParameter("remember");//记住密码 没选值为null，选中值为"on"
		if (flag != null) {
			Cookie cookie = new Cookie("rememberMe", flag);
			cookie.setPath("/");
			cookie.setMaxAge(24*60*60);//一天时效
			response.addCookie(cookie);
		}
		String admName = admin.getAdmName();
		String admPassword = admin.getAdmPassword();
		Md5Util md5Util = new Md5Util();
		String md5Psw = md5Util.getMd5(admPassword);	//转为密文
		Integer checkId = adminService.select(admName,md5Psw);
		if (checkId != null) {
			session.setAttribute("LOGIN_USER", admName);
			return Msg.success();
		}
		return Msg.fail();
	}
	
	/**
	 * 注销登录
	 */
	@ResponseBody
	@RequestMapping(value="/logout",method=RequestMethod.GET)
	public Msg logout(HttpSession session,HttpServletRequest request,HttpServletResponse response) {
		Cookie[] cookies = request.getCookies();
		if(cookies != null){
			for(int i=0; i<cookies.length; i++){
				if(cookies[i].getName().equals("rememberMe")){
					Cookie cookie = cookies[i];
					cookie.setMaxAge(0);
					cookie.setPath("/");
					response.addCookie(cookie);
				}
			}
		}
		session.setAttribute("LOGIN_USER", null);
		return Msg.success();
	}
}
