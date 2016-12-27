package com.project.main.controller;

import java.util.Map;
import java.util.logging.Logger;

import javax.servlet.http.HttpSession;

import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.main.dto.MemberInfo;
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
	//닉네입 찾기
	@RequestMapping(value="/Find_Nick")
	public @ResponseBody Map<String, String> findNick(HttpSession session){
		logger.info("닉네임 찾기");
	return service.FindNick(session);
	}
	
	//회원가입
	@RequestMapping(value="/join")
	public @ResponseBody MemberInfo join(
			@RequestParam Map<String, String> params){
		logger.info("회원 가입");
		return service.join(params);
	}
	
	//패션토크 리스트 보여주기
	@RequestMapping(value="/FT_list")
	public @ResponseBody Map<String, Object> listCall(@RequestParam Map<String, String> params){
		
		logger.info("리스트 보여주기");
		
		return service.FT_list(params);
	}	


}
