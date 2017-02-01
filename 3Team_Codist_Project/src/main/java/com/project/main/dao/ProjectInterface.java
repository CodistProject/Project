package com.project.main.dao;
import java.util.ArrayList;

import com.project.main.dto.BoardDto;
import com.project.main.dto.ClothDto;
import com.project.main.dto.GameDto;
import com.project.main.dto.MemberInfo;
import com.project.main.dto.MileageDto;
import com.project.main.dto.NoteDto;
import com.project.main.dto.ReplyDto;
import com.project.main.dto.SelectionDto;
import com.project.main.dto.WeatherDto;
import com.project.main.dto.myClothDto;


public interface ProjectInterface {
		
	//로그인 처리
	public String login(String id, String pw);

	//중복 체크(Id)
	public String overlayId(String id);	
	
	//중복 체크(Nick)
	public String overlayNick(String nick);	
	
	//닉네임 찾기
	public String FindNick(String userId);

	//회원가입
	public void memberJoin(MemberInfo info);
	
	// 이벤트 쿠폰 생성
	public void updateCoupon(String id, int idx);
	
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
	
	//카테고리 네임 가져오기(idx >> 카테고리 네임)
	public String CategoryName(String board_idx);
		
	//게시판 상세보기,FT_수정하기 가져오기
	public BoardDto Board_Detail(String board_idx);
	
	//QnA 글쓰기
	public int QnABoard_Writes(String nickname, String subject, String content, String filename, String newfilename);

	//코디게시판 상세보기
	public ArrayList<ClothDto> CodiBoard_Detail(String board_idx);	

	//게시판 리스트 호출(코디 게시판 제외)
	public ArrayList<BoardDto> Board_list(int start, int end, String category_name);
	
	//코디 게시판 리스트 호출
	public ArrayList<BoardDto> Cd_list(int start, int end, String category_name);
	
	//상의,하의, 외투 리스트 가져오기
	public ArrayList<ClothDto> Cloth_list(int start, int end, String category_name);
		
	//리스트 전체 갯수
	public int BoardCount(String category_name);
	
	//상의.하의.외투 전체 갯수
	public int ClothCount(String category_name);
	
	//게시판 글쓰기
	public int Board_Write(String nickName, String subject, String content, String filename, String newfilename,
			String category_name,int join_idx);
	
	//게시판 추천수 증가
	public int Board_Uplike(int board_idx);

	//댓글 가져오기
	public ArrayList<ReplyDto> replyList(String idx);

	//코디게시판 업데이트
	public void CB_Update(int board_idx, String subject, String sub_subject, String cBfilename, String cBnewfilename, String weather);
	
	//코디게시판 업데이트(옷종류)
	public void Cloth_update(String CC_idx, String string, String outtercloth_name, String outterreal_name,
			String outtercloth_cloth_url, String outtercloth_detail, String outterfilename, String outternewfilename);

	//게시판 업데이트
	public int Board_update(String idx, String subject, String content, String filename, String newfilename);
	
	//댓글 쓰기
	public int replyRegist(int idx, String nick, String content);
	
	//게시물 삭제
	public int BoardDelete(String board_idx);
	
	// 유저 비밀번호 담기(로그인시 세션에 담기)
	public String pw(String id);

	// 유저 아이디 찾기(유저 이메일 받아서 - 이메일 쏘는거 까지)
	public String Find_Id(String name, String phone, String userEmail);

	// 유저 비번 찾기1(아이디, 이름, 질문답)
	public String FindPw_userData(String userId1, String userName1, String Pw_Ans);
	
	// 유저 비번 찾기2(아이디, 이름, 생년월일)
	public String FindPw_userData2(String userId2, String userName2, String userBirth);

	// 유저 이메일 찾기(아이디 받아서)
	public String Find_Email(String userId1);				

	// 댓글 삭제
	public int repleDel(String reple_idx);
	
	//댓글 추천수 증가
	public int reple_like(int reple_idx);
	
	//댓글 추천수 감소
	public int reple_hate(int reple_idx);
	
	//아이디 찾기
	public ArrayList<ReplyDto> FindId(String idx);

	//코디 게시판 글쓰기<메인코디>
	public void CB_write(String subject, String sub_subject, String cBfilename, String cBnewfilename, String weather);
	
	//글쓰기 위한 idx찾기
	public int CB_writeFind(String subject, String sub_subject, String cBfilename, String cBnewfilename);
	
	//코디 게시판 글쓰기<외투,상의,하의>
	public void Cloth_write(int board_idx,String category_name, String cloth_name, String real_name,
			String cloth_cloth_url, String cloth_detail, String filename, String newfilename);

	//베스트 게시판 선정
	public ArrayList<BoardDto> BOARD_BestList(String category_name, int currPage, int pagePerNum);
	
	// 코디게시판-> 나만의 옷장 이동 전 팝업시(옷+일정 데이터 담기-DB에)
	public int Put_Cloth(String join_Idx, String Calendar_Subject, String Calendar_Date, String outer, String top, String pants);
	
	// 접속한 유저(세션 아이디 이용) Join_Idx 찾아오기
	public String Find_JoinIdx(String userId);

	// Join_Idx로 나만의 옷장 데이터 가져오기(옷+일정)
	public ArrayList<myClothDto> Find_myCloth(String join_Idx);

	// 사다리게임에 관한 데이터 찾아오기
	public GameDto Find_ladderData(String time_event_name);
		
	//사다리 게임 설정
	public void Bridge(String timenum, String select1, String select2, String select3, String select4, String select5,
			String select6);
	
	//사다리게임 시간 설정
	public void Time(String time_strat, String time_end);

	//마일리지 찾기
	public MileageDto Find_Mileage(String user_Id);

	//마일리지 업데이트
	public int Mileage_put(String userId, int reuslt_Mlieage);

	//마일리지 사용 및 쿠폰증정
	public int Mileage_use(String userId, int reuslt_Mlieage, String coupon);

	
	//쪽지 알람기능
	public int countNote();
	
	//쪽지 등록
	public int RegistNote( String userId,int join_idx, String content);
	
	//쪽지 리스트
	public ArrayList<NoteDto> AdminMessageList();
	
	//쪽지 N 알람제거 
	public int NewUpdate();
	
	// 마일리지+쿠폰 리스트
	public ArrayList<MileageDto> Mileage_List();

	// 전체 회원 리스트(관리자 관리모드)
	public ArrayList<MemberInfo> Member_list();

	// 마일리지 업데이트(전체 회원 - 관리자모드)
	public boolean Update_Mileage(String Update_Mileage, String userId);
	
	// 이메일 문의 내용에 담을 유저 이메일 찾기(이메일 문의용)
	public String Find_userEmail(String userId);
	
	//날씨 넣기(오늘)
	public void Weather(String weather);
	
	//날씨 넣기(내일)
	public void Weather2(String weather);
	
	//날씨 찾기
	public WeatherDto Findweather();
	
	//일일 이벤트 넣기
	public int DailyEvent(String file1);
	
	//일일 이벤트 찾기
	public ArrayList<SelectionDto> EventCall();
	
	//일일 이벤트 좋아요 올리기
	public void EventUplike(String selection_name);
	
	//당첨자 후보 업데이트 
	public int EventupLike(String userId, String selection_name);


}







