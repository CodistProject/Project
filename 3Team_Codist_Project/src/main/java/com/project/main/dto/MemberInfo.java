package com.project.main.dto;

public class MemberInfo {	

	// 로그인, 회원정보 관련	
	private int joinIdx;     // 회원idx
	private String userId;   // 아이디
	private String nickName;  // 닉네임
	private String userPw;   // 비번
	private String userName; // 이름
	private int birth;       // 생년월일
	private String gender;   // 성별
	private String email;    // 이메일	
	private String PW_QnA;   // 비밀번호 질문
	private String PW_Ans;   // 비밀번호 답	
	
	public int getJoinIdx() {
		return joinIdx;
	}
	public void setJoinIdx(int joinIdx) {
		this.joinIdx = joinIdx;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getUserPw() {
		return userPw;
	}
	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public int getBirth() {
		return birth;
	}
	public void setBirth(int birth) {
		this.birth = birth;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPW_QnA() {
		return PW_QnA;
	}
	public void setPW_QnA(String pW_QnA) {
		PW_QnA = pW_QnA;
	}
	public String getPW_Ans() {
		return PW_Ans;
	}
	public void setPW_Ans(String pW_Ans) {
		PW_Ans = pW_Ans;
	}
}
