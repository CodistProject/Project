package com.project.main.service;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.project.main.dao.ProjectInterface;


@Service
public class ProjectService {

	@Autowired SqlSession sqlSession;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	

	ProjectInterface inter = null;
	
	public ModelAndView login(Map<String, Object> params) {
		String id = (String) params.get("userId");
		String pw = (String) params.get("userPass");
		HttpSession session = (HttpSession) params.get("session");
		ModelAndView mav = new ModelAndView();		
		
		logger.info("id: {}",id);
		logger.info("pw: {}",pw);
		
		String page = "index";		
		if(id == null || pw == null){
			page="index";
		}else{
			inter = sqlSession.getMapper(ProjectInterface.class);			
			String idx=inter.login(id, pw);
			System.out.println(idx);
			if(inter.login(id, pw) != null){
				page = "AdminPage";
				session.setAttribute("userId", id);
			}else{
				mav.addObject("msg","아이디 또는 비밀번호를 확인 하세요");
			}			
		}
		mav.setViewName(page);
		return mav;
	}

}
