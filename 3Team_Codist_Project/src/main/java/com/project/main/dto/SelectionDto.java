package com.project.main.dto;

public class SelectionDto {
	private int idx;
	private String selection_type;
	private String selection_name;
	private int selection_like;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getSelection_type() {
		return selection_type;
	}
	public void setSelection_type(String selection_type) {
		this.selection_type = selection_type;
	}
	public String getSelection_name() {
		return selection_name;
	}
	public void setSelection_name(String selection_name) {
		this.selection_name = selection_name;
	}
	public int getSelection_like() {
		return selection_like;
	}
	public void setSelection_like(int selection_like) {
		this.selection_like = selection_like;
	}
	
}
