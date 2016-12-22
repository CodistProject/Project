package com.project.main.dao;

import com.project.main.dto.MemberInfo;

public interface ProjectInterface {
	
	//로그인 처리
	public String login(String id, String pw);

	//중복 체크(Id)
	public String overlayId(String id);	
	
	//중복 체크(Nick)
	public String overlayNick(String id);	
	
	// 회원정보 수정 보기
	public MemberInfo Mem_ModiView(String joinIdx);

	// 회원 정보 수정
	public int Member_Modify(int joinIdx, String userPw, String userName, int userBirth, String userEmail);
	

}








