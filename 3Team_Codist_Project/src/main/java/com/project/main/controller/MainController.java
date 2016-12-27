package com.project.main.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
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
		return "FT_Board_Detail";
	}
	
	//회원가입 페이지 이동
	@RequestMapping(value="/join")
	public String join(){
		logger.info("회원가입 폼으로 이동");
		return "JoinForm";
	}
	
	//로그인 처리
	@RequestMapping(value="/login")
	public ModelAndView login(@RequestParam Map<String, Object> params
			, HttpSession session){
		logger.info("로그인 처리");
		params.put("session", session);
		return service.login(params);
	}
	
	//코디 게시판 이동
	@RequestMapping(value="/CodiBoard")
	public String CodiBoard(){
		logger.info("코디게시판 이동 ");
		return "CodiBoard_Main";
	}
	
	//비밀번호 찾기
	@RequestMapping(value="/Find_Pw")
	public String findPw(){
		logger.info("비밀번호찾기 이동");
		return "Find_Pw";
	}
	
	//회원정보 보기(마이 페이지) 이동
	@RequestMapping(value="/MemberData_view")
	public ModelAndView MemberData_view(@RequestParam("userId") String userId) {	
		logger.info(userId);
		logger.info("회원정보 보기(마이 페이지) 이동");	
		return service.MemberData_View(userId);
	}
	//회원정보 수정기능 실행 전 보기 (수정보기 페이지이동)
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
	
	//패션 토크 게시판 이동
	@RequestMapping(value="/FTBoard")
	public String FTBoard(){
		logger.info("패션 토크 게시판 이동");
		return "FT_Board_Main";
	}
	
	//코디를 부탁해 게시판 이동
	@RequestMapping(value="/CoplzBoard")
	public String CoplzBoard(){
		logger.info("코디를 부탁해 게시판 이동 ");
		return "Coplz_Main";
	}
	
	//Q&A 게시판 이동
	@RequestMapping(value="/QnABoard")
	public String QnABoard(){
		logger.info("Q&A 게시판 이동");
		return "QnABoard_Main";
	}
	
	//물물교환 게시판 이동
	@RequestMapping(value="/AlterBoard")
	public String AlterBoard(){
		logger.info("물물교환 게시판 이동 ");
		return "AlterBoard_Main";
	}
	
	//아이디 찾기
	@RequestMapping(value="/Find_Id")
	public String findId(){
		logger.info("아이디찾기 이동");

	return "Find_Id";
	}
	
	//탈퇴 페이지 이동
	@RequestMapping(value="/withdrawapage")
	public String withdrawapage(){
		logger.info("탈퇴 페이지 요청");
		return "Mypage_Withdrawal";
	}
	
	//탈퇴
	@RequestMapping(value = "/withdrawa")
	public ModelAndView withdrawa(@RequestParam("userId") String userId){
		logger.info("삭제 : {}",userId);
		return service.withdrawa(userId);
	}
		
	//로그아웃
	@RequestMapping(value="/logout")
	public String logout(HttpSession session){
		logger.info("logout 요청");
		session.removeAttribute("userId");
		return "redirect:/";
	}
	
	//코디 게시판 이동
		@RequestMapping(value="/CodiBoard_Main")
		public String CodiBoard_Main(){
			logger.info("탈퇴 페이지 요청");
			return "CodiBoard_Main";
		}
		
	//코디글쓰기 페이지 이동
	@RequestMapping(value="/CodiBoard_Write")
	public String CodiBoard_Write(){
		logger.info("코디게시판 글쓰기 이동");
		return "CodiBoard_Write";
	}
	
	//Q&A 게시판 이동
	@RequestMapping(value="/QnABoard_Main")
	public String QnABoard_Main(){
		logger.info("탈퇴 페이지 요청");
		return "QnABoard_Main";
	}
		
	//Q&A 글쓰기
	@RequestMapping(value="/QnABoard_Writes")
	public ModelAndView QnABoard_Writes(HttpSession session, MultipartHttpServletRequest multi ){				
		logger.info("Q&A 글쓰기 요청");
		return service.QnABoard_Writes(multi, session);
	}
	
	//코디글쓰기 페이지 이동
	@RequestMapping(value="/QnABoard_Write")
	public String QnABoard_Write(){
		logger.info("Q&A게시판 글쓰기 이동");
		return "QnABoard_Write";
	}
	
	//패션 토크 상세보기
	@RequestMapping(value="/FT_Board_Detail")
	public ModelAndView FT_Board_Detail(@RequestParam("board_idx") String board_idx ){
	logger.info("상세보기");
	return service.FT_Board_Detail(board_idx);
	}
	
	//코디게시판  상세보기
	@RequestMapping(value="/CodiBoard_Detail")
	public ModelAndView CodiBoard_Detail(@RequestParam("board_idx") String board_idx ){
	logger.info("상세보기");
	return service.CodiBoard_Detail(board_idx);
	}

	//팝업 나만의 옷장
	@RequestMapping(value="/PopUp_Mycloth")
	public String PopUp_Mycloth(){
		logger.info("나만의 옷장 이동");
	return "PopUp_Mycloth";
	}



}