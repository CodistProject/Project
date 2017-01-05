<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>물물교환 게시판 상세보기</title>
		<script src ="//code.jquery.com/jquery-3.1.0.min.js"></script>
		<style>
		/* div.content {
            position: relative;
            left:150px;
            top: 10px;
            width: 750px;
            padding: 15px;
            margin-bottom: 20px;
            float: left;
            border: 1px solid #bcbcbc;
        } */
		table{
			width:100%;
			margin-top: 10px;
			}
		table,td{
			border: 2px solid gray;
			border-collapse: collapse;
			paddind:5px;
			text-align: center;
			font-size: 16px;
		}
		.user,.repleNick{
			width:50px;
			margin: 5px;
		}
		.data{
			width:350px;
			margin: 5px;
		}
		.btn{
			width:45px;
			margin: 5px;
		}
		#pic{
			width: 300px;
			height: 200px;
			
		}
		
		textarea {
				width:100%;
				resize: none;
		}
		.left{
			text-align: left;
		}
		.RepleAlter
		{
			font-size: 8px;
			width: 20px;
		}
		
		</style>
	</head>
	<body>
		<jsp:include page="../../resources/include/index.jsp"/>
		<div class="content">
		<table>
			<tr>
				<td colspan="6">
					<h2>ALTER BOARD</h2>
				</td>
			</tr>
			<tr>
				<td>글번호</td>
				<td id="idx">${content.board_idx}</td>
				<td>작성자</td>
				<td>${content.nickName}</td>
				<td>조회수</td>
				<td>${content.bhit}</td>
			</tr>
			<tr>
				<td>제목</td>
				<td colspan="5" class="left">${content.subject}</td>
			</tr>
			<tr>
				<td>내용</td>
				<td  colspan="5" class="left">${content.content}
				</td>
				
			</tr>
			<tr>
				<td>첨부파일</td>
				<td colspan="5" class="left" id="attach">		
				</td>
			</tr>
			<tr>
				<td colspan="6">
				<input type="button" onclick="location.href='./QnABoard'" value="목록"/>
				<input type="button" onclick="location.href='./Board_update?board_idx=${content.board_idx}'" value="수정"/>
				<input type="button" onclick="location.href='./deleteFT?board_idx=${content.board_idx}'" value="삭제"/>
				</td>
			</tr>
			
		</table>
		<!--댓글 등록 폼  -->
		<table>
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
	function reple_like(reple_idx){
		url = "./rest/reple_like"
		data = {}; 
		data.reple_idx = reple_idx;
		data.nickname=$(".user").html();
		if(data.nickname=="")
		{
		alert("로그인 후 가능합니다.");
		}
	else
		{
		sendServer(data,url);
		}
	}
	 
	//댓글 비추천 보내기	
	function reple_hate(reple_idx){
		url = "./rest/reple_hate"
		data = {};
		data.reple_idx = reple_idx;
		data.nickname=$(".user").html();
		if(data.nickname=="")
		{
		alert("로그인 후 가능합니다.");
		}
	else
		{
		sendServer(data,url);
		}
	}	 
	
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
					$(".user").html(d.userNick);
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
					alert("댓글 추천");
					if(d.success!=1){
						alert("추천 실패");
					}
				}
				if(url=="./rest/reple_hate"){
					alert("댓글 비추천");
				}
			},
			error:function(e){
				console.log(e);
			}				
		});
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
				+"<a href=javascript:reple_like("+list[i].reple_idx+")>"
				+"<img width='20' height='20'  alt='좋아요' src='./resources/img/like.PNG'/></a>"+list[i].reple_like
				+"</td>"
				+"<td class='RepleAlter'>"
				+"<a href=javascript:reple_hate("+list[i].reple_idx+")>"
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