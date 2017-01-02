package com.project.main.dto;

import java.sql.Date;

public class ReplyDto {

   private  int reple_idx;
   private  int board_idx;
   private 	String id;
   private  String nickname;
   private  String reple_content;
   private  Date reple_date;
   private  int reple_like;
   private  int reple_hate;
   
   
   public String getId() {
	return id;
}
public void setId(String id) {
	this.id = id;
}
public int getReple_idx() {
      return reple_idx;
   }
   public void setReple_idx(int reple_idx) {
      this.reple_idx = reple_idx;
   }
   public int getBoard_idx() {
      return board_idx;
   }
   public void setBoard_idx(int board_idx) {
      this.board_idx = board_idx;
   }
   public String getNickname() {
      return nickname;
   }
   public void setNickname(String nickname) {
      this.nickname = nickname;
   }
   public String getReple_content() {
	return reple_content;
   }
   public void setReple_content(String reple_content) {
	   this.reple_content = reple_content;
   }
   public Date getReple_date() {
      return reple_date;
   }
   public void setReple_date(Date reple_date) {
      this.reple_date = reple_date;
   }
   public int getReple_like() {
      return reple_like;
   }
   public void setReple_like(int reple_like) {
      this.reple_like = reple_like;
   }
   public int getReple_hate() {
      return reple_hate;
   }
   public void setReple_hate(int reple_hate) {
      this.reple_hate = reple_hate;
   }
   
      
   }
   
   
   


