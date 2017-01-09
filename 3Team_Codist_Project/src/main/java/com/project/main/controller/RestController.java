package com.project.main.controller;

import java.util.ArrayList;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.main.dto.BoardDto;
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
	
	//패션토크 게시판 상세보기(더보기)
	@RequestMapping(value="/FT_Board_Detail")
	public @ResponseBody Map<String,BoardDto> FT_Board_Detail(
			@RequestParam("board_idx") String idx){
			logger.info("패션토크 게시판 상세보기(더보기)");
		return service.FT_Board_Detail(idx);
	}
	
	//회원가입
	@RequestMapping(value="/join")
	public @ResponseBody MemberInfo join(
			@RequestParam Map<String, String> params){
		logger.info("회원 가입");
		return service.join(params);
	}
	
	//코디 베스트 선정 리스트 보여주기
	@RequestMapping(value="/CB_BestList")
	public @ResponseBody Map<String, ArrayList<BoardDto>> CB_BestList(
					@RequestParam Map<String, String> params){
		logger.info("코디 게시판 베스트선정 보여주기");
		return service.CB_BestList(params);
	}
	
	//패션토크  베스트 추천 리스트 보여주기
	@RequestMapping(value="/FT_BestList")
	public @ResponseBody Map<String, ArrayList<BoardDto>> FT_BestList(
					@RequestParam Map<String, String> params){
		logger.info("코디 게시판 베스트선정 보여주기");
		return service.FT_BestList(params);
	}
	
	//게시판 리스트 보여주기
	@RequestMapping(value="/Board_list")
	public @ResponseBody Map<String, Object> Board_list(
					@RequestParam Map<String, String> params){
		logger.info("게시판 리스트 보여주기");
		return service.Board_list(params);
	}	
	
	//코디 게시판 리스트 보여주기
	@RequestMapping(value="/Cd_list")
	public @ResponseBody Map<String, Object> Cd_list(
					@RequestParam Map<String, String> params){
		logger.info("코디 게시판 리스트 보여주기");
		return service.Cd_list(params);
	}	
	
	//Cloth 리스트 보여주기(외투,상의,하의)
	@RequestMapping(value="/CC_list")
	public @ResponseBody Map<String, Object> CC_list(
			@RequestParam Map<String, String> params){
		logger.info("Cloth 게시판 리스트 보여주기");
		return service.CC_list(params);
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
	
	//게시물 추천
	@RequestMapping(value="/board_Uplike")
	public @ResponseBody Map<String,String> board_Uplike(
			@RequestParam  ("board_idx") int board_idx,
			@RequestParam  ("userId") String userId) {
			logger.info("추천수 증가");
			
		return service.board_Uplike(board_idx,userId);
	}
	
	//댓글 추천
	@RequestMapping(value="/reple_like")
	public @ResponseBody Map<String,Integer> reple_like(
			@RequestParam  ("reple_idx") int reple_idx){
			logger.info("추천수 증가");
		return service.reple_like(reple_idx);
	}
	
	//댓글 비추천
	@RequestMapping(value="/reple_hate")
	public @ResponseBody Map<String,Integer> reple_hate(
			@RequestParam  ("reple_idx") int reple_idx){
			logger.info("추천수 감소");
		return service.reple_hate(reple_idx);
	}

	
	
	// 이메일 문의(Gmail/이메일 기능)
	@RequestMapping(value="/Email")
	public @ResponseBody Map<String, String> Email(			
			@RequestParam Map<String, String> params){
		logger.info("1:1 이메일 문의");
		return service.Email(params);
	}
	
	//ID중복 체크
	@RequestMapping(value="/FindNick")
	public @ResponseBody Map<String,String> FindNick(
			@RequestParam("userId") String userId){
			logger.info("닉네임 찾기");
			logger.info(userId);
		return service.Find_Nick(userId);
	}
	
}
