<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<html>
	<head>
		<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Codist</title>
		<link rel="stylesheet" type="text/css" href="resources/css/ioi.css"/>
	</head>
	<body>
		<div>
			<jsp:include page="../../resources/include/index.jsp"></jsp:include>
		</div>
		<div class="content">
			BEST 코디
			<div class="bord">
				코디 게시판 목록
			</div>
			회원 추천 코디
			
			<div class="bord">
				회원 추천 코디 목록
			</div>
			
			<div class="bord1">
				코디를 부탁해 게시판 노출
			</div>
			
			<div class="bord2">
				Q&A 게시판 노출
			</div>		
		
		</div>
		
	</body>
	<script>
	
		// 메일 보내기(아이디찾기 or 비번찾기 or 이메일 문의) 성공관련 메시지 alert 띄우기
		var msg1 ="${Find_Id.msg}";
		var msg2 ="${Find_Pw.msg}";
		var msg_chk1 = "찾으시는 아이디가 이메일로 전송되었습니다."; 
		var msg_chk2 = "찾으시는 비밀번호가 이메일로 전송되었습니다."; 
			
		if(msg1==msg_chk1){
			console.log("아이디 찾기 메시지 성공 여부:"+msg1);
			alert(msg1);	
		}		
		if(msg2==msg_chk2){
			console.log("비번 찾기 메시지 성공 여부:"+msg2);
			alert(msg2);	
		}		
		
		
	</script>
</html>