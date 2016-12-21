package com.project.main.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.main.service.ProjectService;

@Controller("MainController")
public class MainController {
	@Autowired
	ProjectService service;
private Logger logger = LoggerFactory.getLogger(this.getClass());

	//메인 페이지 이동
	@RequestMapping(value="/")
	public String home(){
		logger.info("메인 페이지 요청");
		return "main";
	}
	
	//로그인 처리
	@RequestMapping(value="/login")
	public ModelAndView login(@RequestParam Map<String, Object> params
			, HttpSession session){
		logger.info("로그인 처리");
		params.put("session", session);
		return service.login(params);
	}


	
}
