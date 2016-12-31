package com.project.main.service;

import java.util.ArrayList;
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
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.project.main.dao.ProjectInterface;
import com.project.main.dto.BoardDto;
import com.project.main.dto.MemberInfo;
import com.project.main.dto.ReplyDto;
import com.project.main.util.CodiUploadFile;
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
	
	//게시판 상세보기
	public ModelAndView Board_Detail(String board_idx) {
		inter = sqlSession.getMapper(ProjectInterface.class);
		ModelAndView mav = new ModelAndView();
		//조회수
		//inter.upHit(idx);
		//불러오기
		String page="main";
		switch(inter.CategoryName(board_idx))
		{
		case "FT":
			page="FT_Board_Detail";
		break;
		
		case "CP":
			page="CodiBoard_Detail";
		break;
			
		case "QnA":
			page="QnABoard_Detail";
		break;
		
		case "Alter":
			page="AlterBoard_Detail";
		break;
		
		}
		mav.addObject("content", inter.Board_Detail(board_idx));
		mav.setViewName(page);		
		return mav;
		
	}
	
	//게시판 수정페이지이동
	public ModelAndView Board_update(String board_idx) {
		inter= sqlSession.getMapper(ProjectInterface.class);
		ModelAndView mav =new ModelAndView();
		String page="main";
		switch(inter.CategoryName(board_idx))
		{
		case "FT":
			page="FT_Board_Update";
		break;
		
		case "CP":
			page="CodiBoard_Update";
		break;
			
		case 	"QnA":
			page="QnABoard_Update";
		break;
		
		case "Alter":
			page="AlterBoard_Update";
		break;
		
		}
		mav.addObject("content",inter.Board_Detail(board_idx));
		mav.setViewName(page);
		return mav;
	}
	//Q&A 닉네임 찾기
	public ModelAndView QnABoard_Write(String userId) {		
		inter = sqlSession.getMapper(ProjectInterface.class);
		ModelAndView mav = new ModelAndView();
		String nickName = inter.FindNick(userId);
		logger.info("닉네임:"+nickName);
		mav.addObject("nickName", nickName);
		mav.setViewName("QnABoard_Write");
		return mav;
	}
	
	//코디를 부탁해 닉네임 찾기
	public ModelAndView Coplz_Write(String userId) {
		inter = sqlSession.getMapper(ProjectInterface.class);
		ModelAndView mav = new ModelAndView();
		String nickName = inter.FindNick(userId);
		logger.info("닉네임:"+nickName);
		mav.addObject("nickName", nickName);
		mav.setViewName("Coplz_Write");
		return mav;		
	
	}
	//물물교환 닉네임 찾기
	public ModelAndView Alter_Write(String userId) {
		inter = sqlSession.getMapper(ProjectInterface.class);
		ModelAndView mav = new ModelAndView();
		String nickName = inter.FindNick(userId);
		logger.info("닉네임:"+nickName);
		mav.addObject("nickName", nickName);
		mav.setViewName("AlterBoard_Write");
		return mav;	
	}
	
	//패션토크 닉네임 찾기
	public ModelAndView FTboard_Write(String userId) {
		inter = sqlSession.getMapper(ProjectInterface.class);
		ModelAndView mav = new ModelAndView();
		String nickName = inter.FindNick(userId);
		logger.info("닉네임:"+nickName);
		mav.addObject("nickName", nickName);
		mav.setViewName("FT_Board_Write");
		return mav;		
	}
	
	//코디게시판 닉네임 찾기
	public ModelAndView CodiBoard_Write(String userId) {
		inter = sqlSession.getMapper(ProjectInterface.class);
		ModelAndView mav = new ModelAndView();
		String nickName = inter.FindNick(userId);
		logger.info("닉네임:"+nickName);
		mav.addObject("nickName", nickName);
		mav.setViewName("CodiBoard_Write");
		return mav;		
	}
	//탈퇴하기 페이지 이동(Pw 찾기)
	public ModelAndView Withdrawal(String userId) {
		inter = sqlSession.getMapper(ProjectInterface.class);
		ModelAndView mav = new ModelAndView();
		mav.addObject("userPw",inter.FindPw(userId));
		mav.setViewName("Mypage_Withdrawal");
		return mav;
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
	// 글쓰기
	public ModelAndView Board_Write(MultipartHttpServletRequest multi, HttpSession session)  {		
		inter = sqlSession.getMapper(ProjectInterface.class);
		ModelAndView mav = new ModelAndView();		
			
		String subject = multi.getParameter("subject");
		String content = multi.getParameter("content");
		String nickName = multi.getParameter("nickName");	
		String filename = multi.getParameter("filename");
		String newfilename = "";		
		String category_name = multi.getParameter("category");		
		String userId = (String) session.getAttribute("userId");	
		
		if(filename.equals("")){
			logger.info("파일이 없어요");
		}else {
			//파일 업로드
			logger.info("파일 업로드");
			UploadFile upload = new UploadFile();
			newfilename = upload.fileUp(multi, filename);
		}		
		logger.info(nickName+" / "+ subject+" / "+ content+" / "+filename+" / "+ newfilename+" / "+category_name);
		inter.Board_Write(nickName, subject, content,filename, newfilename,category_name);		
		String page = "";
		String msg = "로그인을 해주세요.";		
		
		if(userId != null){	
			logger.info("userId:{}",userId);
			
			msg = "등록에 성공 하였습니다.";
			if(category_name.equals("QnA")){
				page = "QnABoard_Main";
			}else if(category_name.equals("AT")){
				page = "AlterBoard_Main";
			}else if(category_name.equals("FT")){
				page = "FT_Board_Main";
			}else if(category_name.equals("CP")){
				page = "Coplz_Main";
			}else if(category_name.equals("CB")){
				page = "CodiBoard_Main";
			}
		}
		
		mav.addObject("msg",msg);
		mav.setViewName(page);
		return mav;		
		}
	
	/*//코디 글쓰기
	public ModelAndView CodiBoard_Writes(MultipartHttpServletRequest multi, HttpSession session)  {				
		inter = sqlSession.getMapper(ProjectInterface.class);			
		ModelAndView mav = new ModelAndView();			
		ArrayList filenames = new ArrayList();
		ArrayList category_names = new ArrayList();			
		String userId = (String) session.getAttribute("userId");				
		String filenames[] =new String[4];
		String category_names[] =new String[4];				
			
			
		if(!(multi.getParameter("filename1").equals(""))){
			filenames.add(multi.getParameter("filename1"));
			category_names.add("코디메인");				
		}
		if(!(multi.getParameter("filename2").equals(""))){
			filenames.add(multi.getParameter("filename2"));
			category_names.add("외투");
		}
		if(!(multi.getParameter("filename3").equals(""))){
			filenames.add(multi.getParameter("filename3"));
			category_names.add("상의");
		}
		if(!(multi.getParameter("filename4").equals(""))){
			filenames.add(multi.getParameter("filename4"));
			category_names.add("하의");
		}
			
						
			for(int i=0; i< filenames.size();i++)	{			
			String category_name = "";
			String newfilename = "";	
			String filename = "";
			
			filename = filenames.get(i).toString();			
			category_name = category_names.get(i).toString();	
			
				//파일 업로드
				logger.info("파일 업로드");
				CodiUploadFile upload = new CodiUploadFile();
				newfilename = upload.fileUp(multi, filename);			
					
			newfilename = upload.fileUp(multi, filename);		
					
			inter.CodiBoard_Writes(filename, category_name, newfilename);
			logger.info(filename);
			logger.info(category_name);
			logger.info(newfilename);					
			}
			
			String page = "CodiBoard_Main";
			String msg = "로그인을 해주세요.";
			
			
			mav.addObject("msg",msg);
			mav.setViewName(page);
			
			return mav;					
		}		*/
	//게시판 리스트 보여주기(Cd제외)
	public Map<String, Object> Board_list(Map<String, String> params) {
		inter = sqlSession.getMapper(ProjectInterface.class);
		//현재페이지
		int currPage =Integer.parseInt(params.get("page"));
				
		//페이지당 보여줄 게시문 갯수
		int pagePerNum =Integer.parseInt(params.get("pagePerNum"));
		logger.info("현재 페이지 : {}",currPage);
		logger.info("페이지 당 보여줄 수 : {}",pagePerNum);
	
		String category_name ="FT";
		int end = currPage*pagePerNum; 				//게시문 끝 번호
		int start = end-pagePerNum+1;					//게시물 시작 번호
		int allCnt = inter.BoardCount(category_name);	//전체 개시물 수
		logger.info("전체 게시물수 : {}",allCnt);
				
		int page =allCnt%pagePerNum>0? 
				Math.round(allCnt/pagePerNum)+1:
					Math.round(allCnt/pagePerNum); // 생성 할 수 있는 페이지
		logger.info("생성 할수 있는 게시물 수:{}",page);
		Map<String, Object> json = new HashMap<String, Object>();
		Map<String, ArrayList<BoardDto>> obj 
			= new HashMap<String, ArrayList<BoardDto>>();
		obj.put("list", inter.Board_list(start, end,category_name));
				
		json.put("jsonList", obj);
		json.put("currPage", currPage);
		json.put("allCnt", allCnt);		
		json.put("page", page);		
					
		return json;
	}			
	
	//Cd리스트 보여주기 
	public Map<String, Object> Cd_list(Map<String, String> params) {
		inter = sqlSession.getMapper(ProjectInterface.class);
		//현재페이지
		int currPage =Integer.parseInt(params.get("page"));
				
		//페이지당 보여줄 게시문 갯수
		int pagePerNum =Integer.parseInt(params.get("pagePerNum"));
		logger.info("현재 페이지 : {}",currPage);
		logger.info("페이지 당 보여줄 수 : {}",pagePerNum);
	
		String category_name ="Cd";
		int end = currPage*pagePerNum; 				//게시문 끝 번호
		int start = end-pagePerNum+1;					//게시물 시작 번호
		int allCnt = inter.BoardCount(category_name);	//전체 개시물 수
		logger.info("전체 게시물수 : {}",allCnt);
				
		int page =allCnt%pagePerNum>0? 
				Math.round(allCnt/pagePerNum)+1:
					Math.round(allCnt/pagePerNum); // 생성 할 수 있는 페이지
		logger.info("생성 할수 있는 게시물 수:{}",page);
		Map<String, Object> json = new HashMap<String, Object>();
		Map<String, ArrayList<BoardDto>> obj 
			= new HashMap<String, ArrayList<BoardDto>>();
		obj.put("list", inter.Cd_list(start, end,category_name));
				
		json.put("jsonList", obj);
		json.put("currPage", currPage);
		json.put("allCnt", allCnt);		
		json.put("page", page);		
					
		return json;
	}			
	
	//게시글 추천
	public ModelAndView  ft_like(String ft_like) {
		inter = sqlSession.getMapper(ProjectInterface.class);
		ModelAndView mav = new ModelAndView();	
		inter.ft_like(ft_like);	
		//불러오기
		mav.setViewName("ft_like");		
		return mav;
	}
	//게시글 비추천
	public ModelAndView  ft_hate(String ft_hate) {
		inter = sqlSession.getMapper(ProjectInterface.class);
		ModelAndView mav = new ModelAndView();
		inter.ft_hate(ft_hate);	
		//불러오기
		mav.setViewName("ft_hate");	
	return mav;
	}

	
	//댓글 등록
	public Map<String, Integer> replyRegist(Map<String, String> params) {
			
			inter = sqlSession.getMapper(ProjectInterface.class);
			Map<String, Integer> obj = new HashMap<String, Integer>();
			int idx = Integer.parseInt(params.get("idx"));
			String nick = params.get("nickname");
			String content= params.get("content");
			logger.info("글번호:"+idx);
			logger.info("닉네임:"+nick);
			logger.info("내용:"+content);
			obj.put("msg",inter.replyRegist(idx,nick,content));
		return obj;
		}			
	
	
	//댓글리스트
	public Map<String, ArrayList<ReplyDto>> replyList(
			String idx) {
			inter = sqlSession.getMapper(ProjectInterface.class);
			Map<String, ArrayList<ReplyDto>> obj 
				= new HashMap<String, ArrayList<ReplyDto>>();
			obj.put("list", inter.replyList(idx));
			obj.put("userId",inter.FindId(idx) );
			return obj;
	}
	//게시판 수정하기
	public ModelAndView update(Map<String, String> params) {
		inter = sqlSession.getMapper(ProjectInterface.class);
		ModelAndView mav = new ModelAndView();		
		String subject = params.get("subject");
		String content = params.get("content");
		String idx = params.get("idx");
		String nickname = params.get("nickname");
		String msg = "수정에 실패 했습니다.";
		
		int success = inter.update(subject, content, idx,nickname);
		
		if(success == 1){
			msg = "수정에 성공 했습니다.";
		}
		mav.addObject("msg", msg);
		mav.setViewName("list");

		return mav;
	}
	
	// 댓글 삭제 기능
	public Map<String, Object> repleDel(String reple_idx) {		
		inter = sqlSession.getMapper(ProjectInterface.class);	
		Map<String, Object> map = new HashMap<String, Object>();		
		int success=0;			
		success = inter.repleDel(reple_idx);
		map.put("success", success);				
		return map;
	}
	//댓글 추천 기능
	public Map<String, Integer> reple_like(String reple_like) {
		inter = sqlSession.getMapper(ProjectInterface.class);
		Map<String, Integer> map = new HashMap<String, Integer>();
		int success=0;
		success= inter.reple_like(reple_like);	
		map.put("success", success);
		return map;
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
	
	
