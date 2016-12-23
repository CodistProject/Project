package com.project.main.service;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import com.project.main.dao.ProjectInterface;
import com.project.main.dto.MemberInfo;



@Service
public class ProjectService {

	@Autowired
	SqlSession sqlSession;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	ProjectInterface inter = null;	

	//로그인 처리
	public ModelAndView login(Map<String, Object> params) {	
		
		String id = (String) params.get("userId");
		String pw = (String) params.get("userPass");
		HttpSession session = (HttpSession) params.get("session");
		ModelAndView mav = new ModelAndView();	
		
		logger.info("id: {}",id);
		logger.info("pw: {}",pw);
		
		String page = "ioi";		
		if(id == null || pw == null){
			mav.addObject("msg","응 여기 안와..");
		}else{
			inter = sqlSession.getMapper(ProjectInterface.class);			
			
			String result=inter.login(id, pw);
			System.out.println(result);
			
			if(inter.login(id, pw) != null){
				session.setAttribute("userId", id);				
			}else{
				mav.addObject("msg","아이디 또는 비밀번호를 확인 하세요");
			}			
		}
		mav.setViewName(page);
		return mav;
	}	

	// 회원 정보 수정 페이지 이동(보기)
	public ModelAndView Mem_modify_view(String userId) {
		logger.info("회원정보 수정전 보기(회원수정 폼 페이지");		
		inter = sqlSession.getMapper(ProjectInterface.class);		
		ModelAndView mav = new ModelAndView();
		mav.addObject("MemberData", inter.Mem_ModiView(userId));
		mav.setViewName("Mypage_Member_Update");				 
		return mav;
	}

	

	// 회원 정보 보기
	public ModelAndView MemberData_View(String userId) {
		logger.info("마이페이지-회원정보 보기 기능실행");
		logger.info(userId);
		inter = sqlSession.getMapper(ProjectInterface.class);
		ModelAndView mav = new ModelAndView();		
		mav.addObject("MemberData", inter.MemberData_View(userId));
		mav.setViewName("Mypage_View");
		return mav;
	}

	// 회원정보 수정 기능
	public ModelAndView Member_Modify(Map<String, String> params) {
		logger.info("회원정보 수정 기능 처리");
		inter = sqlSession.getMapper(ProjectInterface.class);
		
		ModelAndView mav = new ModelAndView();				
		String userId = params.get("userId");
		String nickName = params.get("nickName");
		String Pw = params.get("pw");		
		String Name = params.get("name");
		String Birth = params.get("birth");
		String Gender = params.get("gender");		
		String Email = params.get("email");	
		
		logger.info(userId+"/"+nickName+"/"+Pw+"/"+Name+"/"+Birth+"/"+Gender+"/"+Email);
		// 수정 성공 결과 담기
		int success = inter.Member_Modify(userId, nickName, Pw, Name, Birth, Gender, Email);
		// 수정 결과 메시지 만들기
		String msg = "수정에 실패하였습니다.";
		// 수정 결과 성공시 msg 띄우기
		if(success==1){
			msg="수정에 성공하였습니다!";
		}
		// msg 담아서 보내기 (얼럿뜨는건 Mypage_View에서 script에서 띄우게 코딩)
		mav.addObject("MemberData", params);
		mav.addObject("msg", msg);
		mav.setViewName("Mypage_View");
		
		return mav;
	}
}
