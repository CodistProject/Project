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

import com.project.main.dto.MemberInfo;
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
	
	// 회원정보 보기(마이페이지)
	@RequestMapping(value = "/MemberData_view")
	public ModelAndView MemberData_view(@RequestParam("userId") String userId) {	
		logger.info(userId);
		logger.info("회원정보 보기(마이 페이지) 이동");	
		return service.MemberData_View(userId);
	}
	
	// 회원정보 수정기능 실행 전 보기 (수정보기 페이지이동)
	@RequestMapping(value = "/Member_modify_view")
	public ModelAndView Member_modify_view(@RequestParam("userId") String userId) {	
		logger.info("회원정보 수정 보기 페이지 이동");	
		return service.Mem_modify_view(userId);
	}
	
	// 회원정보 수정 기능 
	@RequestMapping(value = "/Member_modify")
	public ModelAndView Member_modify(@RequestParam Map<String, String> params) {	
		logger.info("회원정보 수정 기능 실행");
		return service.Member_Modify(params);
	}
	
	//회원가입 페이지 이동
	@RequestMapping(value="/join")
	public String join(){
		logger.info("회원가입 폼으로 이동");
		return "JoinForm";
	}	 
}