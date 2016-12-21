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
		return "ioi";
	}
	
	//로그인 처리
	@RequestMapping(value="/login")
	public ModelAndView login(@RequestParam Map<String, Object> params
			, HttpSession session){
		logger.info("로그인 처리");
		params.put("session", session);
		return service.login(params);
	}
<<<<<<< HEAD
	//아이디찾기 이동
	@RequestMapping(value="/Find_Id")
	public String findId(){
		logger.info("아이디찾기 이동");
	return "Find_Id";
	}
	//비밀번호 찾기 이동
		@RequestMapping(value="/Find_Pw")
		public String findPw(){
			logger.info("비밀번호찾기 이동");
		return "Find_Pw";
		}



=======
>>>>>>> bac42583f9c93c5faabe22af7daf3746130e09fb
	
	//회원가입 페이지 이동
	@RequestMapping(value="/join")
	public String join(){
		logger.info("회원가입 폼으로 이동");
		return "JoinForm";
	}
	
	

}