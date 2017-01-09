<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<html>
	<head>
		<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<style>
			div.bord{
				border-top-style: solid;
				border-top-color: pink;
				height: 200px;		
			}
			
			div.bord1{
				float: left;	
				border: 1px solid;
				width: 47%;
				height: 150px;
			}
			
			div.bord2{
				float: right;	
				border: 1px solid;
				width: 47%;
				height: 150px;
			}		
		</style>
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
	</body>
	<script>
		//시간 이벤트 팝업
		timeevent_pop();
		
		function addZero(i) {
   			 if (i < 10) {
       		 i = "0" + i;
  		  }   		
  		  return i;  		  
		}	
		
		function timeevent_pop() {
			var now = new Date();
			var h = addZero(now.getHours());
			var m = addZero(now.getMinutes());
			var nowTime = h+":"+m;	
			var start = "${ladder_Data.time_start}";
			var end = "${ladder_Data.time_end}";
			
			
			
			console.log(nowTime);
			console.log(start);
			console.log(end);
			
			if(nowTime>=start && nowTime<=end){						
				var win	= window.open("TimeEvent", "_blank", "toolbar=yes,scrollbars=yes,resizable=yes,top=200,left=300,width=600,height=500");
			}else{						
				win.close();
			}
		}
	
	
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