<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Q & A  상세보기</title>
		<script src ="//code.jquery.com/jquery-3.1.0.min.js"></script>
		<style>
		#center {
            position: relative;
            left:150px;
            top: 10px;
            width: 750px;
            padding: 15px;
            margin-bottom: 20px;
            float: left;
            border: 1px solid #bcbcbc;
        }
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
		<jsp:include page="index.jsp"></jsp:include>
		<div id="center">
		<table>
			<tr>
				<td>글번호</td>
				<td id="idx">${content.idx}</td>
				<td>작성자</td>
				<td>${content.user_name}</td>
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
				<input type="button" onclick="location.href='./list'" value="목록"/>
				<input type="button" onclick="location.href='./updateQna?idx=${content.idx}'" value="수정"/>
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
				
			</tr>
		
		</table>
		</div>
	</body>
	<script>
	var data  = {};
	var url = "";
	
	replyList();

	$("#go").click(function(){
		url = "./rest/replyRegist";
		data = {};
		data.idx = $("#idx").html();
		data.replyer = "${sessionScope.userId}";
		data.content = $("#content").val();
		sendServer(data,url);
	});
	/*사진만 보였을때 뜨게 하기  */
	$(document).ready(function(){
			var fileName = "${content.fileName}";
			var newFileName = "${content.newFileName}";
			if(fileName == ""){
				$("#attach").html("첨부된 파일이 없습니다.");
			}else{
				//var ext = newFileName.substring(newFileName.length-3,newFileName.length);
				var ext = newFileName.substring(newFileName.lastIndexOf(".")+1);
				console.log(ext);
				if(ext=="jpg"||ext=="png"||ext=="gif"){
					var content = "<img width='450px' src='resources/upload/"+newFileName+"'/>";
				}else{
					var content = "<a href='./download?file="+newFileName+"'>"
						+"<img width='15px' src='resources/img/default.png'/>"
						+"${content.fileName}</a>";
				}
				$("#attach").append(content);
			}
		});
	
	
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
				if(url == "./rest/replyRegist"){
					if(d.success == 1){
						alert("댓글이 등록 되었습니다.");
						$("#content").val("");
						replyList();
					}else{
						alert("다시 시도해 주세요!");
					}
				}
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
				+"<td class='user'>"+list[i].replyer+"</td>"
				+"<td class='data left'>"+list[i].reple+"</td>"
			+"</tr>"
		}
		$("#repleZone").append(content);
	}
	</script>
</html>