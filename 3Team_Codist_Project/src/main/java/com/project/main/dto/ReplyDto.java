package com.project.main.dto;

import java.util.Date;

public class ReplyDto {

   private  int reple_idx;
   private  int board_idx;
   private  String nickname;
   private  String peple_content;
   private  Date reple_date;
   private  int reple_like;
   private  int reple_hate;
   
   
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
   public String getPeple_content() {
      return peple_content;
   }
   public void setPeple_content(String peple_content) {
      this.peple_content = peple_content;
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
   
   
   


