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
	
	//회원가입
	@RequestMapping(value="/join")
	public @ResponseBody MemberInfo join(
			@RequestParam Map<String, String> params){
		logger.info("회원 가입");
		return service.join(params);
	}
	
	//패션토크 리스트 보여주기
	@RequestMapping(value="/FT_list")
	public @ResponseBody Map<String, Object> listCall(
					@RequestParam Map<String, String> params){
		logger.info("패션 토크리스트 보여주기");
		return service.FT_list(params);
	}	

	//댓글 추천
	@RequestMapping(value="/reple_like")
	public @ResponseBody Map<String,Integer> reple_like(
			@RequestParam("like") String reple_like){
			logger.info("추천수 증가 시작");
		return service.reple_like(reple_like);
	}
	
	//댓글 등록
		@RequestMapping(value="/replyRegist")
		public @ResponseBody Map<String, Integer> replyRegist(
			@RequestParam Map<String, String> params){
			logger.info("댓글 등록 요청");
			return service.replyRegist(params);
		}
	//댓글 리스트 보기
	@RequestMapping(value="/replyList")
	public @ResponseBody Map<String, ArrayList<ReplyDto>> replyList(
			@RequestParam ("idx") String idx){
		logger.info("댓글리스트 보기");
		return service.replyList(idx);
		}	
	
	//댓글 삭제
	@RequestMapping(value="/repleDel")
	public @ResponseBody Map<String, Object> repleDel(
			@RequestParam  ("reple_idx") String reple_idx){
		logger.info("댓글 삭제 기능 시행");
		return service.repleDel(reple_idx);
		}
	}
