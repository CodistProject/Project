package com.project.main.dao;
import java.util.ArrayList;

import com.project.main.dto.BoardDto;
import com.project.main.dto.MemberInfo;

public interface ProjectInterface {
	
	//로그인 처리
	public String login(String id, String pw);

	//중복 체크(Id)
	public String overlayId(String id);	
	
	//중복 체크(Nick)
	public String overlayNick(String id);	
	
	//닉네임 찾기
	public String FindNick(String userId);

	//회원가입
	public void memberJoin(MemberInfo info);
		
	// 회원정보 수정 보기
	public MemberInfo Mem_ModiView(String userId);

	// 회원정보 보기(마이페이지)
	public MemberInfo MemberData_View(String userId);

	// 회원정보 수정
	public int Member_Modify(String userId, String nickName, String pw, String name, String birth, String gender,
			String email);
	//탈퇴
	public void withdrawa(String userId);	

	//조회수 증가
	public void upHit(String idx);
	
	//패션토크 상세보기
	public Object FT_Board_Detail(String board_idx);
	
	//코디게시판 상세보기
	public Object CodiBoard_Detail(String board_idx);
	
	//QnA 글쓰기
	public int QnABoard_Writes(String nickname, String subject, String content, String filename, String newfilename);

	//FT_리스트 호출
	public ArrayList<BoardDto> FT_list(int start, int end);
	
	//FT_ 리스트 전체 갯수
	public int FTCount(String category_name);




}








