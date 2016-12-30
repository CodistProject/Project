package com.project.main.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

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
			
		case 	"QnA":
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
	
	
	//패션 토크 수정페이지
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


	//닉네임 찾기
	public  Map<String, String> FindNick(HttpSession session) {
		inter = sqlSession.getMapper(ProjectInterface.class);
		 Map<String, String> mav =new HashMap<String, String>();
		String userId=(String) session.getAttribute("userId");
		logger.info(userId);
		String NickName=inter.FindNick(userId);
		logger.info(NickName);
		mav.put("nickname",NickName);	
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
	
	//코디 글쓰기
	public ModelAndView CodiBoard_Writes(MultipartHttpServletRequest multi, HttpSession session)  {				
		inter = sqlSession.getMapper(ProjectInterface.class);			
		ModelAndView mav = new ModelAndView();			
		ArrayList filenames = new ArrayList();
		ArrayList category_names = new ArrayList();			
		String userId = (String) session.getAttribute("userId");				
		/*String filenames[] =new String[4];*/
		/*String category_names[] =new String[4];*/				
			
			
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
		}		
	
	//FT리스트 보여주기
	public Map<String, Object> FT_list(Map<String, String> params) {
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
		int allCnt = inter.FTCount(category_name);	//전체 개시물 수
		logger.info("전체 게시물수 : {}",allCnt);
				
		int page =allCnt%pagePerNum>0? 
				Math.round(allCnt/pagePerNum)+1:
					Math.round(allCnt/pagePerNum); // 생성 할 수 있는 페이지
		logger.info("생성 할수 있는 게시물 수:{}",page);
		Map<String, Object> json = new HashMap<String, Object>();
		Map<String, ArrayList<BoardDto>> obj 
			= new HashMap<String, ArrayList<BoardDto>>();
		obj.put("list", inter.FT_list(start, end));
				
		json.put("jsonList", obj);
		json.put("currPage", currPage);
		json.put("allCnt", allCnt);		
		json.put("page", page);		
					
		return json;
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
	
	
	
}
	
	
