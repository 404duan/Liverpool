package com.football.crud.controller;

import java.io.File;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.football.crud.bean.Carousel;
import com.football.crud.bean.Msg;
import com.football.crud.service.CarouselService;

@Controller
public class CarouselController {
	
	@Autowired
	CarouselService carouselService;
	
	/**
	 * 查询
	 */
	@ResponseBody
	@RequestMapping(value="/carou",method=RequestMethod.GET)
	public Msg getImgPath() {
		return Msg.success().add("allImg", carouselService.getAllImgPath());
	}
	
	/**
	 * 修改首页轮播图
	 */
	@ResponseBody
	@RequestMapping(value="/carou",method=RequestMethod.POST)
	public Msg updateCarou(Carousel carousel) {
		carouselService.updateCarou(carousel);
		return Msg.success();
	}
	
	/**
	 * 上传首页轮播图
	 */
	@ResponseBody
	@RequestMapping(value="/uploadImg",method=RequestMethod.POST)
	public Msg updateImg(MultipartFile image,HttpServletRequest request) {
		// TODO 自动生成的方法存根
		if(image == null) {
			return Msg.fail().add("tip", "选择要上传的文件！");
		}
		if (image.getSize() > 10*1024*1024) {
			return Msg.fail().add("tip", "文件不能大于10M！");
		}
		//获取文件后缀
		String suffix = image.getOriginalFilename().substring(image.getOriginalFilename().lastIndexOf(".")+1,image.getOriginalFilename().length());
		if (!"jpg,jpeg,gif,png".toUpperCase().contains(suffix.toUpperCase())) {
			return Msg.fail().add("tip", "请选择jpg,jpeg,gif,png格式的图片！");
		}
		String savePath = request.getServletContext().getRealPath("/") + "/images/";
		File savePathFile = new File(savePath);
		if(!savePathFile.exists()) {
			savePathFile.mkdir();
		}
		String fileName = new Date().getTime()+"."+suffix;
		try {
			//将文件保存至指定目录
			image.transferTo(new File(savePath+fileName));
		} catch (Exception e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
			return Msg.fail().add("tip", "文件保存异常！");
		}
		String filePath = request.getServletContext().getContextPath() + "/images/" + fileName;

		return Msg.success().add("filePath", filePath);
	}
}
