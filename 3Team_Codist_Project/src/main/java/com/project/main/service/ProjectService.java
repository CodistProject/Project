package com.project.main.service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.project.main.dao.ProjectInterface;
import com.project.main.util.UploadFile;



@Service
public class ProjectService {

	@Autowired
	SqlSession sqlSession;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	

	ProjectInterface inter = null;

	//중복 체크(ID)
	public Map<String, String> overlayId(String id) {
		Map<String, String> obj= new HashMap<String, String>();
		inter=sqlSession.getMapper(ProjectInterface.class);
		String use="N";
		if(inter.overlayId(id) ==null)
		{
			use="Y";
		}
		obj.put("useId", use);
		
		return obj;
	}
	
	//중복 체크(NickName)
	public Map<String, String> overlayNick(String nick) {
		Map<String, String> obj= new HashMap<String, String>();
		inter=sqlSession.getMapper(ProjectInterface.class);
		String use="N";
		if(inter.overlayNick(nick) ==null)
		{
			use="Y";
		}
		obj.put("useNick", use);
		
		return obj;
	}
		
	
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
				session.setAttribute("userPass", pw);			
			}else{
				mav.addObject("msg","아이디 또는 비밀번호를 확인 하세요");
			}			
		}
		mav.setViewName(page);
		return mav;
	}	

	// 회원 정보 수정 페이지 이동(보기)
	public ModelAndView Mem_modify_view(String joinIdx) {
		logger.info("회원정보 수정전 보기");		
		inter = sqlSession.getMapper(ProjectInterface.class);		
		ModelAndView mav = new ModelAndView();
		mav.addObject("memberData", inter.Mem_ModiView(joinIdx));
		mav.setViewName("Mypage_Member_Update");
		// Mypage_View 에다가 memberData 이용해서 (MemberInfo Dtd에 담긴) 회원정보를 담아온다. 즉, 그 폼에 넣어주면됨		 
		return mav;
	}

	// 회원정보 수정 기능
	public ModelAndView Member_Modify(Map<String, String> params) {
		logger.info("회원정보 수정 서비스 실행");
		inter = sqlSession.getMapper(ProjectInterface.class);		
		
		int joinIdx = Integer.parseInt(params.get("joinIdx"));		
		String userPw = params.get("userPw");
		String userName = params.get("userName");
		int userBirth = Integer.parseInt(params.get("birth"));
		String userEmail = params.get("email");		
		
		String msg = "수정에 실패 했습니다.";
		int success = inter.Member_Modify(joinIdx, userPw, userName, userBirth, userEmail);
		if(success == 1){
			msg = "수정에 성공 했습니다.";
		}
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", msg);
		mav.setViewName("Mypage_View");
		return mav;
	}
	
	//패션토크 상세보기
	@Transactional
	public ModelAndView FT_Board_Detail(String board_idx) {
		inter = sqlSession.getMapper(ProjectInterface.class);
		ModelAndView mav = new ModelAndView();
		//조회수
		//inter.upHit(idx);
		//불러오기
		mav.addObject("content", inter.FT_Board_Detail(board_idx));
		mav.setViewName("FT_Board_Detail");		
		return mav;
		
	}
	//코디게시판 상세보기
	@Transactional
	public ModelAndView CodiBoard_Detail(String board_idx) {
		inter = sqlSession.getMapper(ProjectInterface.class);
		ModelAndView mav = new ModelAndView();
		//불러오기
		mav.addObject("content", inter.CodiBoard_Detail(board_idx));
		mav.setViewName("CodiBoard_Detail");		
		return mav;
	}

	public ModelAndView MemberData_View() {
		// TODO Auto-generated method stub
		return null;
	}
	
	//탈퇴하기
	public ModelAndView withdrawa(String userId) {
		ModelAndView mav = new ModelAndView();
		inter = sqlSession.getMapper(ProjectInterface.class);
		logger.info(userId);
		inter.withdrawa(userId);		
		mav.setViewName("redirect:/logout");				
		return mav;
		
	}

	//Q&A 글쓰기
	public ModelAndView QnABoard_Writes(MultipartHttpServletRequest multi, HttpSession session)  {		
		inter = sqlSession.getMapper(ProjectInterface.class);
		ModelAndView mav = new ModelAndView();		
			
		String subject = multi.getParameter("subject");
		String content = multi.getParameter("content");
		String nickname = multi.getParameter("nickname");	
		String filename = multi.getParameter("filename");		
		String newfilename = null;
		logger.info(subject+" / "+content+" / "+nickname+"/"+filename+"/"+newfilename);
		String userId = (String) session.getAttribute("userId");
		
		logger.info("아이디"+userId);
		
		if(filename != null){
			//파일 업로드
			UploadFile upload = new UploadFile();
			
			newfilename = upload.fileUp(multi, filename);
		}
		inter.QnABoard_Writes(nickname, subject, content,filename, newfilename);
		String page = "";
		String msg = "";
		
		if(userId != null){
			logger.info(userId);
			msg = "등록에 성공 하였습니다.";
			page = "QnABoard_Main";						
		}else{
			page = "QnABoard_Write";
			msg = "등록에 실패 하였습니다.";			
		}
		mav.addObject("msg",msg);
		mav.setViewName(page);
		return mav;		
		}			
	}