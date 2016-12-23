package com.project.main.dao;
import com.project.main.dto.MemberInfo;

public interface ProjectInterface {
	
	//로그인 처리
	public String login(String id, String pw);

	// 회원정보 수정 보기
	public MemberInfo Mem_ModiView(String userId);

	// 회원정보 보기(마이페이지)
	public MemberInfo MemberData_View(String userId);

	// 회원정보 수정
	public int Member_Modify(String userId, String nickName, String pw, String name, String birth, String gender,
			String email);

	
		
}








