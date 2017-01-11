package com.project.main.dto;

import java.sql.Date;

public class NoteDto {
	private int note_idx;  
	private String user_id;     
	private int join_idx;   
	private String admin;   
	private int admin_idx;     
	private String letter_content; 
	private Date letter_date;     
	private String letter_new;
	
	public int getNote_idx() {
		return note_idx;
	}
	public void setNote_idx(int note_idx) {
		this.note_idx = note_idx;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getJoin_idx() {
		return join_idx;
	}
	public void setJoin_idx(int join_idx) {
		this.join_idx = join_idx;
	}
	public String getAdmin() {
		return admin;
	}
	public void setAdmin(String admin) {
		this.admin = admin;
	}
	public int getAdmin_idx() {
		return admin_idx;
	}
	public void setAdmin_idx(int admin_idx) {
		this.admin_idx = admin_idx;
	}
	public String getLetter_content() {
		return letter_content;
	}
	public void setLetter_content(String letter_content) {
		this.letter_content = letter_content;
	}
	public Date getLetter_date() {
		return letter_date;
	}
	public void setLetter_date(Date letter_date) {
		this.letter_date = letter_date;
	}
	public String getLetter_new() {
		return letter_new;
	}
	public void setLetter_new(String letter_new) {
		this.letter_new = letter_new;
	}  

}
