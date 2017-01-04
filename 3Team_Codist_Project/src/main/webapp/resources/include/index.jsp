<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<html>
	<head>
		<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>인덱스</title>
		 <link rel="stylesheet" type="text/css" href="resources/css/main.css"/>
		 <link rel="stylesheet" type="text/css" href="resources/css/button.css"/>
	</head>
	<body>
		<div id="head">
			<img alt="로고">
		</div>
		<div id="weather">
			<a class="top" href="javascript:Event();">이벤트</a>
			<br/>
			<a class="top" href="#">월</a>
			<a class="top" href="#">화</a>			
			<a class="middle" href="#">수</a>
			<a class="middle" href="#">목</a>
			<a class="middle" href="#">금</a>
			<a class="bottom" href="#">토</a>
			<a class="bottom" href="#">일</a>			
		</div>	
		
		<div id="extra">
			<div id="loginSession">
				<c:if test="${sessionScope.userId ==null}">
					<jsp:include page="loginBox.jsp"></jsp:include>
					<a href="#" class="a2" onclick="location.href='./joinCheck'">회원 가입</a>
					<br/>
					<br/>
					<a href="Find_Id" class="a2">아이디</a><a href="Find_Pw" class="a2">/비밀번호 찾기</a> 
				</c:if>
				
				<c:if test="${sessionScope.userId !=null}">
					<jsp:include page="login_Session.jsp"></jsp:include>
				</c:if>
			</div>
			
			<br/>
				<table class="serch">
					<tr>
						<td>		
							<input type="text" size="18">
							<input type="button" class="serchbtn" value="검색"> 
						</td>						
					</tr>
				</table>
			<br/>
			<div id="ask">
				<textarea id="askBox" cols="28px" rows="8px" placeholder="답변 받을 이메일 주소 입력 : "></textarea>			
				<div id="ask1">
				<input  type="button" class="askbtn" value="쪽지" />
				<input type="button"  class="askbtn" value="이메일" name="email"/>				
				</div>				
			</div>
		</div>
		<div id="menu">		
			<table class="menu">
				<tr class="menu">
					<td class="menuTd"><a class="board" href="./CodiBoard">코디 게시판</a></td>
					<td class="menuTd"><a class="board" href="./FTBoard">패션토크 게시판</a></td>
					<td class="menuTd"><a class="board" href="./CoplzBoard">코디를 부탁해</a></td>
					<td class="menuTd"><a class="board" href="#">나만의 옷장</a></td>
					<td class="menuTd"><a class="board" href="./QnABoard">Q&A</a></td>
					<td class="menuTd"><a class="board" href="./AlterBoard">물물 교환</a></td>					
				</tr>
			</table>
		</div>
	</body>
	<script>			
	
	   // 유저 아이디, 유저 메일, 관리자 메일 담기
		var userId ="${sessionScope.userId}";				
		
		// 이벤트 팝업
		function Event(){
			var Popup_url = "./Event_Popup";
			var Popup_option = "width=500px, height=600px, resizalbe=no, top=500px, left=500px";
			window.open(Popup_url,"",Popup_option);
		}
		
		// 이메일 문의(url, data 담아서 아작스처리)
		$("input[name='email']").click(function(){
			console.log("작동 된다!");
			url = "./rest/Email";
			data={};
			data.userId = userId;			
			data.content=$("#askBox").val();			
			// console 로 data 담은 것들 제대로 담겼는지 체크
			// 유저 정보
			console.log(data.userId);	
			console.log(data.content);				
			
			// 아작스로 보내서 처리(url, data)
			ajaxCall(url, data);
		});		
		
		// 아작스 처리(이메일 문의)
		function ajaxCall(reqUrl, reqData){
			console.log(reqUrl);			
			$.ajax({
				url : reqUrl,				
				type : "post",
				data : reqData,
				dataType : "json",
				success:function(data){
					console.log(data);
					console.log("성공");
					if(url=="./rest/Email"){									
						alert("문의하신 내용이 이메일 전송이 완료되었습니다.");
					}else{
						alert("이메일 전송이 실패하였습니다!");			
					}					
				}, error : function(e){
					console.log("에러");
				}
			});
		}		
		
	</script>	
</html>