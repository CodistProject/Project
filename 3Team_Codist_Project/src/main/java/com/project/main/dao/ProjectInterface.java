package com.project.main.dao;
<<<<<<< HEAD
import java.util.ArrayList;
import java.util.Map;

import com.project.main.dto.BoardDto;
=======
import org.springframework.web.servlet.ModelAndView;

>>>>>>> 7c974ebe7ee00507105e0b97aecd8b60f5d0882b
import com.project.main.dto.MemberInfo;
import com.project.main.dto.ReplyDto;


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
	//회원 탈퇴 Pw찾기
	public String FindPw(String userId);
	
	//탈퇴
	public void withdrawa(String userId);	

	//조회수 증가
	public void upHit(String idx);
	
	//카테고리 네임 가져오기
	public String CategoryName(String board_idx);
		
	//패션토크 상세보기,FT_수정하기 가져오기
	public BoardDto Board_Detail(String board_idx);
	
	//QnA 글쓰기
	public int QnABoard_Writes(String nickname, String subject, String content, String filename, String newfilename);

	//패션토크 상세보기
	public BoardDto FT_Board_Detail(String board_idx);
	
	//코디게시판 상세보기
	public BoardDto CodiBoard_Detail(String board_idx);	

	//게시판 리스트 호출(코디 게시판 제외)
	public ArrayList<BoardDto> Board_list(int start, int end, String category_name);
	
<<<<<<< HEAD
	//코디 게시판 리스트 호출
	public ArrayList<BoardDto> Cd_list(int start, int end, String category_name);
	
	//리스트 전체 갯수
	public int BoardCount(String category_name);

	//게시판 글쓰기
	public int Board_Write(String nickName, String subject, String content, String filename, String newfilename,
			String category_name);
	
	//추천수 증가
	public void ft_like(String ft_like);
	
	//비추천수 증가
	public void ft_hate(String ft_hate);
	
	//댓글 가져오기
	public ArrayList<ReplyDto> replyList(String idx);

	//게시판 수정
	public int update(String subject, String content, String idx, String nickname);
	
	//댓글 쓰기
	public int replyRegist(int idx, String nick, String content);
	
	//글 삭제
	public int delete(String idx);
=======
	// 유저 비밀번호 담기(로그인시 세션에 담기)
	public String pw(String id);

	// 유저 아이디 찾기(유저 이메일 받아서 - 이메일 쏘는거 까지)
	public String Find_Id(String userEmail);

	// 유저 비번 찾기(아이디 받아서 비번 찾기)
	public String FindPw_userEmail(String userId);  

	// 유저 이메일 찾기(아이디 받아서)
	public String Find_Email(String user_Id);				
}
>>>>>>> 7c974ebe7ee00507105e0b97aecd8b60f5d0882b

	// 댓글 삭제
	public int repleDel(String reple_idx);
	
	//댓글 추천수 증가
	public int reple_like(String reple_like);
	
	//아이디 찾기
	public ArrayList<ReplyDto> FindId(String idx);

	//코디 게시판 글쓰기
	public void CodiBoard_Writes(String filename, String category_name, String newfilename);
	

	
}







