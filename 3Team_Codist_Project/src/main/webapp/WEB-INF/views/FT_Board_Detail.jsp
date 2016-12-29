<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>패션토크 게시판 상세보기</title>
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
		.user{
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
		
		</style>
	</head>
	<body>
		<jsp:include page="../../resources/include/index.jsp"/>
		<div class="content">
		<table>
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
			<tr>
				<td colspan="6">
				<a href="like" id="ft_like">추천</a>${content.ft_like}
				<a href="hade" id="ft_hate">비추천</a>${content.ft_hate}
				</td>
			</tr>
			</tr>
			<tr>
				<td colspan="6">
				<input type="button" onclick="location.href='./list'" value="목록"/>
				<input type="button" onclick="location.href='./Board_update?board_idx=${content.board_idx}'" value="수정"/>
				<input type="button" onclick="location.href='./list'" value="취소"/>
				
				</td>
			</tr>
		</table>
		<!--댓글 등록 폼  -->
		<table>
			<tr>
				<td class="user">${sessionScope.userId }</td>
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
			<tr>
				<td class="user">
				</td>
				<td class="data">
				</td>
				<td class="user">
				</td>
				<td class="user">
				</td>
				
			</tr>
		
		</table>
		</div>
	</body>
	<script>
	var data  = {};
	var url = "";
	
	replyList();


	
	function replyList(){
		url = "./rest/replyList";
		data = {};
		data.idx = $("#idx").html();
		sendServer(data,url);
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

				if(url =="./rest/replyList"){
					printReple(d.list);
				}
			},
			error:function(e){
				console.log(e);
			}				
		});
	}
	
	function printReple(list){
		$("#repleZone").empty();
		var content = "";
		for(var i=0; i<list.length;i++){
			content +="<tr>"
				+"<td class='user'>"+list[i].nickname+"</td>"
				+"<td class='data left'>"+list[i].reple_content+"</td>"
				+"<td class='data left'>"+list[i].reple_date+"</td>"
				+"<td class='data left'>"+list[i].reple_like+"</td>"
			+"</tr>"
		}
		$("#repleZone").append(content);
	}
	//추천 .비추천
	function like(){
		url = "./rest/ft_like"
		data = {};
		data.idx = $("#like").html();
		sendServer(data,url);
	}
	function hate(){
		url = "./rest/ft_hate"
		data = {};
		data.idx = $("#hate").html();
		sendServer(data,url);
	}
	
	</script>
</html>