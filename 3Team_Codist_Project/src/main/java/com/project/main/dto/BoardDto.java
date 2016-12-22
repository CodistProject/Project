package com.project.main.dto;

import java.util.Date;

public class BoardDto {
	//게시판 내용
     private String category_name;
      private int board_idx;
      private String nickname;
      private String subject;
      private String sub_subject;
      private String content;
      private Date reg_date;
      private String sysdate;
      private String filename;
      private String gender;
      private String weather;
      private int ft_like;
      private int ft_hate;
      
   public String getCategory_name() {
      return category_name;
   }
   public void setCategory_name(String category_name) {
      this.category_name = category_name;
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
   public String getSubject() {
      return subject;
   }
   public void setSubject(String subject) {
      this.subject = subject;
   }
   public String getContent() {
      return content;
   }
   public void setContent(String content) {
      this.content = content;
   }
   public Date getReg_date() {
      return reg_date;
   }
   public void setReg_date(Date reg_date) {
      this.reg_date = reg_date;
   }
   public String getSysdate() {
      return sysdate;
   }
   public void setSysdate(String sysdate) {
      this.sysdate = sysdate;
   }
   public String getFilename() {
      return filename;
   }
   public void setFilename(String filename) {
      this.filename = filename;
   }
   public String getGender() {
      return gender;
   }
   public void setGender(String gender) {
      this.gender = gender;
   }
   public String getWeather() {
      return weather;
   }
   public void setWeather(String weather) {
      this.weather = weather;
   }
   public int getFt_like() {
      return ft_like;
   }
   public void setFt_like(int ft_like) {
      this.ft_like = ft_like;
   }
   public int getFt_hate() {
      return ft_hate;
   }
   public void setFt_hate(int ft_hate) {
      this.ft_hate = ft_hate;
   }

    public String getSub_subject() {
      return sub_subject;
   }
   public void setSub_subject(String sub_subject) {
      this.sub_subject = sub_subject;
   } 
}