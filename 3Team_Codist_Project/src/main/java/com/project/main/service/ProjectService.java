package com.project.main.service;

import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;
import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;
import com.project.main.dao.ProjectInterface;
import com.project.main.dto.MemberInfo;

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
	
	//로그인 처리
	public ModelAndView login(Map<String, Object> params) {	
		inter=sqlSession.getMapper(ProjectInterface.class);
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
				session.setAttribute("userPw", pw);
			}else{
				mav.addObject("msg","아이디 또는 비밀번호를 확인 하세요");
			}			
		}
		mav.setViewName(page);
		return mav;
	}	

	//회원가입
	public MemberInfo join(Map<String, String> params) {
		inter=sqlSession.getMapper(ProjectInterface.class);
		MemberInfo info =new MemberInfo();
		info.setId(params.get("id"));
		info.setNickName(params.get("nickName"));
		info.setPw(params.get("pw"));
		info.setPW_QnA(params.get("PW_QnA"));
		info.setPW_ANSWER(params.get("PW_ANSWER"));
		info.setName(params.get("name"));
		info.setPhone(params.get("phone"));
		info.setBirth(params.get("birth"));
		info.setGender(params.get("gender"));
		info.setEmail(params.get("email"));
		inter.memberJoin(info);
		return info;
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
	
	//패션토크 상세보기
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
	public ModelAndView CodiBoard_Detail(String board_idx) {
		inter = sqlSession.getMapper(ProjectInterface.class);
		ModelAndView mav = new ModelAndView();
		//불러오기
		mav.addObject("content", inter.CodiBoard_Detail(board_idx));
		mav.setViewName("CodiBoard_Detail");		
		return mav;
	}
	
	//닉네임 찾기
	public Map<String, String> FindNick(HttpSession session) {
		inter = sqlSession.getMapper(ProjectInterface.class);
		 Map<String, String> mav =new HashMap<String, String>();
		String userId=(String) session.getAttribute("userId");
		logger.info(userId);
		String NickName=inter.FindNick(userId);
		logger.info(NickName);
		mav.put("nickname",NickName);
		return mav;
	}

	// 이메일 보내기(G mail 전용)
	public Map<String, String> Email(Map<String, String> params) {
		
		// 1:1 문의용 관련 정보
    	final String userEmail = params.get("userEmail"); // 유저 이메일    	
    	final String content = params.get("content"); // 유저 문의 내용
    	final String userId = params.get("userId"); // 유저 아이디 담기(보낸 이)
    	
    	// 아이디 찾아서 메일로 보내주기 용 관련 정보(내용:유저아이디 / 받을 유저 메일 주소)
    	final String content_userId = params.get("content_userId"); // 유저아이디가 담긴 컨텐트
    	final String FindId_userEmail = params.get("FindId_userEmail"); // 아이디 찾을때 쓴 유저 이메일 주소(=보내줄 메일 주소)
    	
    	// 비번 찾아서 메일로 보내주기2 용 관련 정보(내용: 유저 비번 / 받을 유저 메일 주소)
    	final String content_userPw = params.get("content_userPw");  // 유저 비번이 담긴 내용
    	final String FindPw_userEmail = params.get("FindPw_userEmail"); // 비번 찾을때 쓸 유저 메일주소(=보내줄 메일 주소)
    	
    	// 비번 찾아서 메일로 보내주기1 용 관련 정보(내용: 유저 비번 / 받을 유저 메일 주소)
    	final String content_userPw2 = params.get("user_Pw");  // 유저 비번이 담긴 내용
    	final String FindPw_userEmail2 = params.get("user_Email"); // 비번 찾을때 쓸 유저 메일주소(=보내줄 메일 주소)
    	    	
    	// 유저 및 관리자 정보 가져오기 확인
    	logger.info("------------1:1 문의용 정보 ---------");
    	logger.info("유저 아이디(보내는 이):"+userId);
    	logger.info("유저 이메일(보내는 이 메일주소):"+userEmail);
    	logger.info("문의 내용 :"+content);    	
         
    	// 아이디 찾고 메일 담아 보내주기용 관련정보 체크
    	logger.info("------------아이디 찾아 메일 쏘기 정보 ---------");
    	logger.info("메일내용(담은 유저 아이디) :"+content_userId);
    	logger.info("받을 유저 메일주소 :"+FindId_userEmail);
    	
    	// 비번 찾고 메일 담아 보내주기용2 관련정보 체크
    	logger.info("------------비번 찾아 메일 쏘기 정보2 ---------");
    	logger.info("메일내용(담은 유저 비번) :"+content_userPw);
    	logger.info("받을 유저 메일주소 :"+FindPw_userEmail);
    	
    	// 비번 찾고 메일 담아 보내주기용1 관련정보 체크
    	logger.info("------------비번 찾아 메일 쏘기 정보1 ---------");
    	logger.info("메일내용(담은 유저 비번) :"+content_userPw2);
    	logger.info("받을 유저 메일주소 :"+FindPw_userEmail2);
    	
        Properties props = System.getProperties();          
          
        props.put("mail.smtp.host", "smtp.gmail.com"); 
		props.put("mail.smtp.port", "25"); 
		props.put("mail.debug", "true"); 
		props.put("mail.smtp.auth", "true"); 
		props.put("mail.smtp.starttls.enable","true"); 
		props.put("mail.smtp.EnableSSL.enable","true");
		props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");   
		props.setProperty("mail.smtp.socketFactory.fallback", "false");   
		props.setProperty("mail.smtp.port", "465");   
		props.setProperty("mail.smtp.socketFactory.port", "465"); 
	
		Session session = Session.getInstance(props, 
		 new javax.mail.Authenticator() { 
		protected PasswordAuthentication getPasswordAuthentication() { 
		return new PasswordAuthentication("0304kiss", "sksqkqh1");  // 보낼사람 구글 계정 아이디, 비번 
		}});		
		
		Map<String, String> map = new HashMap<String, String>();
		
		try{					
			Message message = new MimeMessage(session); 
			message.setFrom(new InternetAddress("0304kiss@gmail.com")); // 작성자 메일주소(유저/보낸사람 이메일주소) - 구글이메일만 가능(하지만 결국 관리자로 할꺼임)
			// 유저 메일주소(아이디 찾기용)이 빈값이 아닐경우 - 유저 아이디 찾아 보내기용
			if(userId==null && FindPw_userEmail==null && FindPw_userEmail2==null){
				message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(FindId_userEmail)); // 찾은 아이디 받을 사람(유저 메일주소)
				message.setSubject("잃어버린 아이디를 찾았습니다. 확인 바랍니다."); // 제목
				message.setText("찾으시는 아이디 :"+content_userId); // 찾은 유저아이디 담은 내용
				map.put("msg", "찾으시는 아이디가 이메일로 전송되었습니다.");
			}
			// 유저 아이디(로그인한)가 빈값이 아닐 경우  - 1:1 문의용
			if(FindId_userEmail==null && FindPw_userEmail==null && FindPw_userEmail2==null){
				message.setRecipients(Message.RecipientType.TO, InternetAddress.parse("starcsiran0@naver.com"));  // 관리자 메일주소(받는 사람)
				message.setSubject(userId+"님께서 1:1 문의를 하셨습니다."); // 제목
				message.setText(content); // 문의내용
				map.put("msg", "1:1문의가 이메일로 전송 되었습니다!");
			}			 
			// 유저 메일주소(비번 찾기용2)이 빈값이 아닐경우 - 유저 비번 찾아 보내기용
			if(FindId_userEmail==null && userId==null && FindPw_userEmail==null){
				message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(FindPw_userEmail)); // 찾은 아이디 받을 사람(유저 메일주소)
				message.setSubject("잃어버린 비밀번호를 찾았습니다. 확인 바랍니다."); // 제목
				message.setText("찾으시는 비밀번호 :"+content_userPw); // 찾은 유저아이디 담은 내용
				map.put("msg", "찾으시는 비밀번호가 이메일로 전송되었습니다.");
			}
			// 유저 메일주소(비번 찾기용1)이 빈값이 아닐경우 - 유저 비번 찾아 보내기용
			if(userId==null && FindId_userEmail==null && FindPw_userEmail==null){
				message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(FindPw_userEmail2)); // 찾은 아이디 받을 사람(유저 메일주소)
				message.setSubject("잃어버린 비밀번호를 찾았습니다. 확인 바랍니다."); // 제목
				message.setText("찾으시는 비밀번호 :"+content_userPw2); // 찾은 유저아이디 담은 내용
				map.put("msg", "찾으시는 비밀번호가 이메일로 전송되었습니다.");
			}				
			
 //message.setContent("내용","text/html; charset=utf-8");//글내용을 html타입 charset설정
			
			System.out.println("이메일 전송중!");
			Transport.send(message);
			System.out.println("이메일 전송 완료!");		
			
		} catch(Exception e){
			e.printStackTrace();
		}					
		return map;
	}
	
	// 유저 아이디 찾기 서비스
	public ModelAndView Find_Id(Map<String, String> params) {
		inter = sqlSession.getMapper(ProjectInterface.class);
		String E = params.get("userEmail1");
		String E2 = params.get("userEmail2");
		String userEmail = E+"@"+E2;  // 유저 메일 주소(아이디 찾을용+아이디 담아 보내줄 멜주소)
		// 완성된 유저 이메일 주소
		logger.info("유저 메일주소(아이디 찾기용/아이디 담아서 보내줄 멜주소:"+userEmail);
		
		// params에 찾은 아이디와 이메일 주소 담아주기(Email 클래스에서 갖다쓰게)
		params.put("content_userId", inter.Find_Id(userEmail));
		params.put("FindId_userEmail", userEmail);
		
		ModelAndView mav = new ModelAndView();				
		mav.addObject("Find_Id", Email(params));		
		mav.setViewName("ioi");
		return mav;
	}

	// 유저 비번 찾기 서비스
	public ModelAndView Find_Pw(Map<String, String> params) {
		inter = sqlSession.getMapper(ProjectInterface.class);
		logger.info("유저 비번찾기 서비스 실행");
		// 유저 비번찾기1에 필요한 정보
		String user_Id = params.get("user_Id"); // 유저 아이디
		// 받아온 유저아이디 체크
		logger.info(user_Id);
		String user_Email = inter.Find_Email(user_Id); // 유저 메일주소
	
		// 유저 비번(아이디로), 메일 찾기(아이디로) 하고 params에 담기(메일함수에 담아 보내기 위해)
		params.put("user_Pw", inter.FindPw_userEmail(user_Id));		
		params.put("user_Email", user_Email);
		// 유저 비번찾기1에서 가져온 유저 메일주소
		logger.info("유저 메일주소(비번 찾기용1/비번 담아서 보내줄 멜주소):"+user_Email);
				 
		// 유저 비번찾기2에 필요한 정보 + 이메일문의에 필요한 정보
		String userId = params.get("userId");
		String E = params.get("email1");
		String E2 = params.get("email2");
		String userEmail = E+"@"+E2;  // 유저 메일 주소(비번 찾을용+비번 담아 보내줄 멜주소)
		// 유저 비번찾기2에서 가져온 유저 메일주소 완성본
		logger.info("유저 메일주소(비번 찾기용2/비번 담아서 보내줄 멜주소):"+userEmail);
		
		
		// params에 유저 이메일로 찾은 비번과 보내줄 유저 메일 주소 담기
		params.put("content_userPw", inter.FindPw_userEmail(userId));
		params.put("FindPw_userEmail", userEmail);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("Find_Pw", Email(params));
		mav.setViewName("ioi");
		return mav;
	}
}
