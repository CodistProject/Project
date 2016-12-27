package com.project.main.controller;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.project.main.dto.MemberInfo;
import com.project.main.dto.ReplyDto;
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
	//추천
	@RequestMapping(value="/ft_like")
	public @ResponseBody ModelAndView ft_like(
			@RequestParam("like") String ft_like){
			logger.info("추천수 증가");
		return service.ft_like(ft_like);
	}
	//비추천
	@RequestMapping(value="/ft_hate")
	public @ResponseBody ModelAndView ft_hate(
			@RequestParam("hate") String ft_hate){
			logger.info("비추천수 증가");
		return service.ft_hate(ft_hate);
	}
	//댓글 등록
		@RequestMapping(value="/replyRegist")
		public @ResponseBody Map<String, Integer> replyRegist(
			@RequestParam Map<String, String> params){
			logger.info("댓글 달기 요청");
			return service.replyRegist(params);
		}
	//댓글 리스트 보기
	@RequestMapping(value="/replyList")
	public @ResponseBody Map<String, ArrayList<ReplyDto>> replyList(
			@RequestParam ("idx") String idx){
		logger.info("댓글 달기 요청");
		return service.replyList(idx);
		}	
		

}
