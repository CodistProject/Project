package com.project.main.dao;
import com.project.main.dto.MemberInfo;

public interface ProjectInterface {
	
	//로그인 처리
	public String login(String id, String pw);

	// 회원정보 수정 보기
	public MemberInfo Mem_ModiView(String joinIdx);

	// 회원 정보 수정
	public int Member_Modify(int joinIdx, String userPw, String userName, int userBirth, String userEmail);

	// 회원정보 보기(마이페이지)
	public MemberInfo MemberData_View(String userId);
	
}








