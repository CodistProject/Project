package com.project.main.controller;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.main.service.ProjectService;

@Controller("RestController")
@RequestMapping(value="/rest")
public class RestController {
	
	@Autowired
	ProjectService service;
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	//ID중복 체크
	@RequestMapping(value="/overlayId")
	public @ResponseBody Map<String,String> overlayId(
			@RequestParam("id") String id){
			logger.info("ID중복체크");
		return service.overlayId(id);
	}
	
	//NiCKNAME중복 체크
	@RequestMapping(value="/overlayNick")
	public @ResponseBody Map<String,String> overlayNick(
			@RequestParam("nick") String nick){
			logger.info("NickName중복체크");
		return service.overlayNick(nick);
	}

}
