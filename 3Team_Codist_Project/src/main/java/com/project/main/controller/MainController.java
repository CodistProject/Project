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
	public ModelAndView home(@RequestParam Map<String, String> params){
		logger.info("메인 페이지 요청");
		
		return service.TimePop(params);
		
	}
	
	//회원가입 약관 이동
	@RequestMapping(value="/joinCheck")
	public String joinCheck(){
		logger.info("회원가입 약관으로 이동");
		return "joinFormCheck";
	}
	
	//회원가입 페이지 이동
	@RequestMapping(value="/joinForm")
	public String join(){
		logger.info("회원가입 폼으로 이동");
		return "JoinForm";
	}

	//이벤트 관리 페이지 이동
	@RequestMapping(value="/TimeEvent")
	public ModelAndView TimeEvent(@RequestParam Map<String, String> params){
		logger.info("이벤트 관리 페이지 이동");
		return service.Game(params);
	}		
		
		
	//이벤트 관리 페이지 이동
	@RequestMapping(value="/Admin_Manage_Event")
	public ModelAndView Admin_Manage_Event(@RequestParam Map<String, String> params){
		logger.info("이벤트 관리 페이지 이동");
		return service.Admin_Manage_Event(params);
	}
	
	//쪽지 관리 페이지 이동
	@RequestMapping(value="/AdminMessage")
	public ModelAndView AdminMessage(){		
		logger.info("쪽지 관리 페이지");		
		return service.AdminMessage();
	}
	
	//관리자 회원관리 페이지
	@RequestMapping(value="/AdminMemberPage")
	public ModelAndView AdminMemberPage(){
		logger.info("관리자 회원 관리 페이지");
	return service.AdminMemberPage();
	}
	
		
	//로그인 처리
	@RequestMapping(value="/login")
	public ModelAndView login(@RequestParam Map<String, Object> params
			, HttpSession session){
		logger.info("로그인 처리");
		params.put("session", session);
		return service.login(params);		
	}
	
	//로그아웃
	@RequestMapping(value="/logout")
	public String logout(HttpSession session){
		logger.info("logout 요청");
		session.removeAttribute("userId");
		session.removeAttribute("mil");
		return "redirect:/";
	}
	
	//회원정보 보기(마이 페이지) 이동
	@RequestMapping(value="/MemberData_view")
	public ModelAndView MemberData_view(@RequestParam("userId") String userId) {	
		logger.info(userId);
		logger.info("회원정보 보기(마이 페이지) 이동");	
		return service.MemberData_View(userId);
	}
	
	//마일리지(마이 페이지) 이동
		@RequestMapping(value="/MyPage_Mileage")
		public ModelAndView MyPage_Mileage(@RequestParam("userId") String userId) {	
			logger.info(userId);
			logger.info("마일리지(마이 페이지) 이동");	
			return service.MyPage_Mileage(userId);
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
	
	//아이디 찾기
	@RequestMapping(value="/Find_Id")
	public String findId(){
		logger.info("아이디찾기 이동");
		return "Find_Id";
	}
	
	//비밀번호 찾기
	@RequestMapping(value="/Find_Pw")
	public String findPw(){
		logger.info("비밀번호찾기 이동");
		return "Find_Pw";
	}
		
	//코디 게시판 이동
	@RequestMapping(value="/CodiBoard")
	public String CodiBoard(){
		logger.info("코디게시판 이동 ");
		return "CodiBoard_Main";
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
	
	//게시판 상세보기(코디 게시판 제외)
	@RequestMapping(value="/Board_Detail")
	public ModelAndView Board_Detail(@RequestParam("board_idx") String board_idx ){
		logger.info("상세보기");
		return service.Board_Detail(board_idx);
	}
	
	//코기 게시판 상세보기
	@RequestMapping(value="/CodiBoard_Detail")
	public ModelAndView CodiBoard_Detail(@RequestParam("board_idx") String board_idx ){
		logger.info("상세보기");
		return service.CodiBoard_Detail(board_idx);
	}
	
	//게시판 수정 페이지 이동 
	@RequestMapping(value = "/Board_update")
	public ModelAndView Board_update(@RequestParam("board_idx") String board_idx) {	
		logger.info("회원정보 수정 기능 실행");
		return service.Board_update(board_idx);
	}
	
	//게시판 수정(코디 제외)
	@RequestMapping(value="/update")
	public ModelAndView update(
			@RequestParam Map<String, String> params
			){
		logger.info("수정 요청");
		return service.update(params);
	}
	
	//코디 게시판 수정
	@RequestMapping(value="/Codiboard_update")
	public ModelAndView Codiboard_update(MultipartHttpServletRequest multi){
		logger.info("코디게시수정 요청");
		return service.Codiboard_update(multi);
	}
	
	//탈퇴 페이지 이동
	@RequestMapping(value="/Mypage_Withdrawal")
	public ModelAndView withdrawapage(@RequestParam("userId") String userId){
		logger.info(userId);
		logger.info("탈퇴 페이지 요청");
		return service.Withdrawal(userId);
	}
	
	//탈퇴
	@RequestMapping(value = "/withdrawa")
	public ModelAndView withdrawa(@RequestParam("userId") String userId){
		logger.info("삭제 : {}",userId);
		return service.withdrawa(userId);
	}
	//강제 탈퇴
	@RequestMapping(value = "/withdrawa2")
	public ModelAndView withdrawa2(@RequestParam("userId") String userId){
		logger.info("강제 탈퇴기능");
		return service.withdrawa2(userId);
	}

	//코디 글쓰기 게시판 Form 이동 + 닉네임 찾기	
	@RequestMapping(value="/CodiBoard_Write")
	public ModelAndView CodiBoard_Write(@RequestParam("userId") String userId){
		logger.info("코디 게시판 글쓰기 이동");		
		return service.CodiBoard_Write(userId);
	}
	
	//패션토크 글쓰기 게시판 Form 이동	+ 닉네임 찾기
	@RequestMapping(value="/FTboard_Write")
	public ModelAndView FTboard_Write(@RequestParam("userId") String userId){
		logger.info("코디를 부탁해게시판 글쓰기 이동");		
		return service.FTboard_Write(userId);
	}
	
	//QnA 글쓰기 게시판 Form 이동	+ 닉네임 찾기
	@RequestMapping(value="/QnABoard_Write")
	public ModelAndView QnABoard_Write(@RequestParam("userId") String userId){
		logger.info("Q&A게시판 글쓰기 이동");		
		return service.QnABoard_Write(userId);
	}
	
	//코디를 부탁해 글쓰기 게시판 Form 이동	+ 닉네임 찾기
	@RequestMapping(value="/Coplz_Write")
	public ModelAndView Coplz_Write(@RequestParam("userId") String userId){
		logger.info("코디를 부탁해게시판 글쓰기 이동");		
		return service.Coplz_Write(userId);
	}
			
	//물물교환 글쓰기 게시판 Form 이동	+ 닉네임 찾기
		@RequestMapping(value="/Alter_Write")
		public ModelAndView Alter(@RequestParam("userId") String userId){
		logger.info("물물교환 게시판 글쓰기 이동");		
		return service.Alter_Write(userId);
	}
	//게시판 글쓰기(코디 게시판 제외)
	@RequestMapping(value="/Board_Write")
	public ModelAndView Board_Write(MultipartHttpServletRequest multi,HttpSession session){				
		logger.info("글쓰기 요청");
		return service.Board_Write(multi,session);
	}		
	
	//코디게시판  글쓰기
	@RequestMapping(value="/CodiBoard_Writes")
	public ModelAndView CodiBoard_Writes(MultipartHttpServletRequest multi){				
	logger.info("글쓰기 요청");
	
	return service.CodiBoard_Writes(multi);
	}	
	
	// 이벤트 팝업창 띄우기
	@RequestMapping(value="/Event_Popup")
	public String Event_Popup(){
		logger.info("이벤트 팝업창 이동");
		return "PoPup_Event";
	}
	
	// 유저 아이디 찾기(이메일 받아서) - 고급 버젼(찾은 아이디 이메일 쏘는거까지)
	@RequestMapping(value="/FindId_userEmail")
	public ModelAndView Find_Id(@RequestParam Map<String, String> params){
	logger.info("유저 아이디찾기+이메일로 쏴주기");
	return service.Find_Id(params);
	}
	
	// 유저 비번 찾기1(입력 아이디 받아서 메일 찾고  찾은 메일로 메일 보내기 실행) - 고급 버젼(찾은 비번 이메일 쏘는거까지)
	@RequestMapping(value="/Pw_Find")
	public ModelAndView Pw_FindEmail(@RequestParam Map<String, String> params){
		logger.info("유저 비번찾기+이메일로 쏴주기");
	return service.Find_Pw(params);
	}
	
	//나만의 옷장 페이지 이동(index 에서)
	@RequestMapping(value="/My_Calendar")
	public ModelAndView My_Calendar(@RequestParam ("userId") String userId){
		logger.info("나만의 옷장 캘린더 이동");
		logger.info("유저아이디:"+userId);		
		return service.myCloth(userId);
	}
	
	// 사다리 게임 설정값 넘기기
	@RequestMapping(value="/Bridge")
	public ModelAndView Bridge(@RequestParam Map<String, String> params){		
		logger.info("사다리 게임 설정값 넘기기");		
		return service.Bridge(params);
	}
	
	// 게시물 삭제
	@RequestMapping(value="/BoardDelete")
	public ModelAndView BoardDelete(@RequestParam("board_idx") String board_idx,
			@RequestParam("category_name") String category_name){		
		logger.info("게시물 삭제하기");		
		logger.info(category_name);		
		return service.BoardDelete(board_idx,category_name);
	}		
	
	// 사다리 게임 시간값 넘기기
	@RequestMapping(value="/Time")
	public ModelAndView Time(@RequestParam Map<String, String> params){		
		logger.info("사다리 게임 시간값 넘기기");		
		return service.Time(params);
	}	
	
	// 마일리지+쿠폰 관리 페이지 이동
	@RequestMapping(value="/Admin_Mileage")
	public String Admin_Mileage(){		
		logger.info("마일리지+쿠폰 관리 페이지 이동");		
		return "Admin_Manage_Mileage";
	}
	

	//마이페이지 쿠폰함 가기
		@RequestMapping(value="/Mypage_Coupon")
		public ModelAndView Mypage_Coupon(@RequestParam ("userId") String userId){
			logger.info("마이페이지 쿠폰함 가기");
			logger.info("유저아이디:"+userId);		
			return service.Mypage_Coupon(userId);
		}
	
	//마일리지 사용하기
	@RequestMapping(value="/usemile")
	public ModelAndView usemile(@RequestParam Map<String, String> params, 
			HttpSession session){
		logger.info("마일리지 사용하기");		
		return service.usemile(params,session);
	}

	// 회원 관리 리스트 페이지 이동
	@RequestMapping(value="/Admin_Member")
	public String Admin_Member(){		
		logger.info("관리자 회원관리 리스트 페이지 이동");		
		return "Admin_Manage_Member";
	}
}