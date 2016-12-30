package com.project.main.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public class CodiUploadFile {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	//파일 경로(다운로드/삭제에서 사용)
	String fullPath = "D:/spring/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/3Team_Codist_Project/resources/upload";
	
	//파일 업로드
	public String fileUp(MultipartHttpServletRequest multi, String filename) {				
		
		String newfilename = "";//변환된 파일 명
		
		
		//1. 저장경로 찾기
		String root = multi.getSession().getServletContext().getRealPath("/");
		String path = root+"resources/upload/";
		logger.info(path);
		
		//2. 폴더 생성
		File dir = new File(path);
		if(!dir.isDirectory()){
			logger.info("폴더 없음 생성 시작");
			dir.mkdir();
		}
		
		//3. 파일 가져 오기				
				
					//파일 바이너리 뽑기
					String uploadFile = "";				
					logger.info("uploadFile : "+uploadFile);
					//파일 메모리 저장
					MultipartFile mFile = multi.getFile(uploadFile);
					
				//4. 파일 만들기
					//새로운 파일 생성
					newfilename = System.currentTimeMillis()+"."
							+filename.substring(filename.lastIndexOf(".")+1);
					logger.info("저장 파일명 : {}",newfilename);
					
				//5. 메모리 -> 실제 파일
					try {
						mFile.transferTo(new File(path+newfilename));
					} catch (Exception e) {
						e.printStackTrace();
					}								
				return newfilename;
			}

	//파일 삭제
	public void delete(String delName) {
		
		fullPath += delName;
		logger.info(fullPath);
		File file = new File(fullPath);
		if(file.exists()){
			file.delete();
		}else{
			logger.info("이미 삭제된 파일");
		}
	}

	//파일 다운로드
	public void download(String file, String oriFileName, 
			HttpServletResponse resp) throws Exception {
		
		//한글 깨짐 방지
		String downFile = URLEncoder.encode(oriFileName,"UTF-8");
		//파일 객체 생성
		fullPath += file;
		logger.info(fullPath);
		File fileObj = new File(fullPath);
		//파일 읽어들임
		InputStream is = new FileInputStream(fileObj);
		//반환 객체 설정
		resp.setContentType("application/octet-stream");
		resp.setHeader("content-Disposition", 
				"attachment; filename=\""+downFile+"\"");
		//반환객체에 스트림 연결
		OutputStream os = resp.getOutputStream();
		//반환 객체에 파일을 쓰기
		byte[] buffer = new byte[1024];
		int length;
		while((length = is.read(buffer))!= -1){
			os.write(buffer,0,length);
		}
		//자원 반납
		os.flush();
		os.close();
		is.close();
		
	}

}