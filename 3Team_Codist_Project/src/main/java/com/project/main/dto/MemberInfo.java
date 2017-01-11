package com.project.main.dto;

import java.sql.Date;

public class MemberInfo {	

	// 로그인, 회원정보 관련	

	private int join_Idx;     // 회원idx
	private String id;   // 아이디
	private String nickName; //닉네임
	private String pw;   // 비번
	private String name; // 이름
	private String phone;	//폰번호
	private String birth;       // 생년월일
	private String gender;   // 성별
	private Date reg_date;   // 생성일
	private String email;    // 이메일	
	private String PW_QnA;   // 비밀번호 질문
	private String PW_ANSWER;   // 비밀번호 답	
	
	
	public int getJoin_Idx() {
		return join_Idx;
	}
	public void setJoin_Idx(int join_Idx) {
		this.join_Idx = join_Idx;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
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
	public String getPW_ANSWER() {
		return PW_ANSWER;
	}
	public void setPW_ANSWER(String pW_ANSWER) {
		PW_ANSWER = pW_ANSWER;
	}
	
	public Date getReg_date() {
		return reg_date;
	}
	
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
}
