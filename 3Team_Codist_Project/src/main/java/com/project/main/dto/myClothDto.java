package com.project.main.dto;

public class myClothDto {
	
	// 나만의 옷장 테이블 자료	
	private String closet_idx;
	private String join_idx;
	private String calender_subject;
	private String calender_date;
	private String filename;
	private String new_filename;
	private String my_outer;
	private String my_top;
	private String my_pants;	

	public String getCloset_idx() {
		return closet_idx;
	}

	public void setCloset_idx(String closet_idx) {
		this.closet_idx = closet_idx;
	}

	public String getJoin_idx() {
		return join_idx;
	}

	public void setJoin_idx(String join_idx) {
		this.join_idx = join_idx;
	}

	public String getCalender_subject() {
		return calender_subject;
	}

	public void setCalender_subject(String calender_subject) {
		this.calender_subject = calender_subject;
	}

	public String getCalender_date() {
		return calender_date;
	}

	public void setCalender_date(String calender_date) {
		this.calender_date = calender_date;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public String getNew_filename() {
		return new_filename;
	}

	public void setNew_filename(String new_filename) {
		this.new_filename = new_filename;
	}

	public String getMy_outer() {
		return my_outer;
	}

	public void setMy_outer(String my_outer) {
		this.my_outer = my_outer;
	}

	public String getMy_top() {
		return my_top;
	}

	public void setMy_top(String my_top) {
		this.my_top = my_top;
	}

	public String getMy_pants() {
		return my_pants;
	}

	public void setMy_pants(String my_pants) {
		this.my_pants = my_pants;
	}

	public myClothDto() {}
}
