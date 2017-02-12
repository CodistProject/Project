<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>물물교환 게시판 상세보기</title>
		<script src ="//code.jquery.com/jquery-3.1.0.min.js"></script>
		<link rel="stylesheet" type="text/css" href="resources/css/button.css"/>
		<link rel="stylesheet" type="text/css" href="resources/css/contentView.css"/>
	</head>
	<style>
		.del,.Alter{
			display: none;
		}
	</style>
	<body>
		<jsp:include page="../../resources/include/index.jsp"/>
		<div class="content">
		<table class="detail">
			<tr>
				<td colspan="6">
					<h2>ALTER BOARD</h2>
				</td>
			</tr>
			<tr>
				<td>글번호</td>
				<td id="idx" height="30px">${content.board_idx}</td>
				<td>작성자</td>
				<td>${content.nickName}</td>
				<td>조회수</td>
				<td>${content.bhit}</td>
			</tr>
			<tr>
				<td>제목</td>
				<td colspan="5" class="left" height="50px">${content.subject}</td>
			</tr>
			<tr>
				<td>내용</td>
				<td  colspan="5" class="left" height="200px">${content.content}
				</td>
				
			</tr>
			<tr>
				<td>첨부파일</td>
				<td colspan="5" class="left" id="attach" width="30px">
				<c:if test="${content.filename != null}">	
				${content.filename}	
				</c:if>
				<c:if test="${content.filename == null}">	
				첨부 파일이 없습니다.
				</c:if>		
				</td>
			<tr>
				<td colspan="6">
				<a href="javascript:board_Uplike('${content.board_idx}')" id="ft_like" class="a2">추천</a>${content.ft_like}
				</td>
			</tr>
			<tr>
				<td colspan="6">
					<input type="button" class="bt" onclick="location.href='./AlterBoard'" value="목록"/>
					<input type="button" class="bt Alter" onclick="location.href='./Board_update?board_idx=${content.board_idx}'" value="수정"/>
					<input type="button" class="bt del" onclick="location.href='./BoardDelete?board_idx=${content.board_idx}&category_name=Alter'" value="삭제" />						
				</td>
			</tr>
			
		</table>
		<!--댓글 등록 폼  -->
		<table class="detail">
			<tr>
				<td class="user"><!-- 닉네임출력 --></td>
				<td class="data">
					<textarea id="content" rows="3"></textarea>
				</td>
				<td class="btn">
					<button id ="go" >댓글달기</button>
				</td>
			</tr>
		</table>
		<!--댓글 리스트  -->
		<table id="repleZone">		
		</table>
		</div>
	</body>
	<script>

	// 유저아이디로 찾은(아작스처리한) 닉네임과 content에 담아서 보낸 닉네임 비교하기 위한 변수들
	var nick = "${content.nickName}";
	var userNick="";
	console.log(nick);	
	
	// 리플 리스트 실행
	var userId="${sessionScope.userId}";
	FindNick(userId);
	replyList();
	
	$("#go").click(function(){
		url ="./rest/replyRegist";
		data ={};
		data.idx=$("#idx").html();
		data.nickname = $(".user").html();
		console.log($(".user").html());
		data.content= $("#content").val();
		if(data.nickname=="")
		{
		alert("로그인 후 가능합니다.");
		}
	else
		{
		sendServer(data,url);
		}		
	});
	
	//댓글 닉네임 찾기
	function FindNick(userId)
	{
		var url="./rest/FindNick";
		var data={};
		data.userId=userId
		console.log(data.userId);
		sendServer(data,url);
	}
	
	// 리플 리스트 뿌리는 함수
	function replyList(){
		url = "./rest/replyList";
		data = {};
		data.idx = $("#idx").html();
		sendServer(data,url);
	}
		
	// 리플 삭제에 필요한 정보 보내기
	function repleDel(reple_idx){				
		console.log(reple_idx);
		url = "./rest/repleDel";
		data={};
		data.reple_idx = reple_idx;
		console.log(reple_idx);
		sendServer(data, url);
	}
	
	//댓글 추천보내기
	function reple_like(reple_idx,board_idx){
		url = "./rest/reple_like"
		data = {}; 
		data.reple_idx = reple_idx;
		data.nickname=$(".user").html();
		data.userId= "${sessionScope.userId}";
		data.board_idx=board_idx
		if(data.nickname=="")
			{
			alert("로그인 후 가능합니다.");
			}
		else
			{
			sendServer(data,url);
			}
	};
	 
	//댓글 비추천 보내기	
	function reple_hate(reple_idx,board_idx){
		url = "./rest/reple_hate"
		data = {};
		data.reple_idx = reple_idx;
		data.nickname=$(".user").html();
		data.userId= "${sessionScope.userId}";
		data.board_idx=board_idx;
		if(data.nickname=="")
		{
		alert("로그인 후 가능합니다.");
		}
	else
		{
		sendServer(data,url);
		}
	};
	 //추천 하기
	function board_Uplike(board_idx){
		url = "./rest/board_Uplike"
		data = {}; 
		data.board_idx = board_idx;
		data.userId= "${sessionScope.userId}";
		console.log(board_idx);
		console.log(data.userId);
		if(data.userId=="")
			{
			alert("로그인 후 가능합니다.");
			}
		else
			{
			sendServer(data,url);
			}
	};
	
	function sendServer(obj, url){
		console.log(obj);
		console.log(url);
		$.ajax({
			url:url,
			type:"get",
			data:obj,
			dataType:"json",
			success:function(d){
				console.log(d);	
	            if(url=="./rest/replyRegist"){
	            	replyList();
	            }
	            
				if(url =="./rest/replyList"){
					printReple(d.list,d.userId);
				}
				
				if(url == "./rest/FindNick"){
					userNick = d.userNick;
					$(".user").html(d.userNick);
					Show_btn(userNick);
					}
				if(url == "./rest/repleDel"){					
					alert("삭제에 성공하였습니다.");
					replyList();
					if(d.success!=1){
						alert("삭제에 실패 했습니다.");
					}else{
						replyList();
					}
				}
				if(url=="./rest/reple_like"){
					if(d.success==1){
						alert("댓글 추천에 성공하셧습니다");
					}else{
						alert("이미 추천, 비추천을 하셨습니다.");
					}
				}
				if(url=="./rest/reple_hate"){
						if(d.success==1){							
							alert("댓글 비 추천에 성공하셨습니다.");
						}else{
							alert("이미 추천, 비추천을 하셨습니다.");
						}					
				}
				if(url=="./rest/board_Uplike"){
	            	alert(d.msg);
	            }
			},
			error:function(e){
				console.log(e);
			}				
		});
	}
	
	// 삭제 버튼 보이기 안보이기 하기	
	function Show_btn(userNick){
		if(userNick==nick){
			$(".Alter").css("display", "inline-block");	
			$(".del").css("display", "inline-block");	
		}else{
			$(".del").css("display", "none");
			$(".Alter").css("display", "none");
		}		
	}

	// 리스트 뿌리는 역할 함수
	function printReple(list,userId){
		$("#content").val("");
		var content = "";
		for(var i=0; i<list.length;i++){
			content +="<tr>"
				+"<td class='repleNick'>"+list[i].nickname+"</td>"
				+"<td class='data left'>"+list[i].reple_content+"</td>"
				+"<td class='RepleAlter'>"+list[i].reple_date+"</td>"
				+"<td class='RepleAlter'>"
				+"<a href=javascript:reple_like("+list[i].reple_idx+","+list[i].board_idx+")>"
				+"<img width='20' height='20'  alt='좋아요' src='./resources/img/like.PNG'/></a>"+list[i].reple_like
				+"</td>"
				+"<td class='RepleAlter'>"
				+"<a href=javascript:reple_hate("+list[i].reple_idx+","+list[i].board_idx+")>"
				+"<img width='20' height='20'  alt='싫어요' src='./resources/img/hate.PNG'/></a>"+list[i].reple_hate
				+"</td>";
				if("${sessionScope.userId}"==userId[0].id)
					{
					content +="<td  class='RepleAlter'><a href='javascript:repleDel("+list[i].reple_idx+");' style='text-decoration:none'>삭제</a>"+"</td>";
					}
				content +="</tr>";
		}
		$("#repleZone").empty();
		$("#repleZone").append(content);
	}
	

	</script>
</html>