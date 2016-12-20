package com.project.main.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("MainController")
public class MainController {
	
private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	//메인 페이지 이동
	@RequestMapping(value="/")
	public String home(){
		logger.info("");
		return "FT_Board";
	}
}
