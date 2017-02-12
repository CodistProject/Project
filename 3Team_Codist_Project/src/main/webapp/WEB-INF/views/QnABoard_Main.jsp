<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<html>	
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Q & A < 게시판</title>
		<link rel="stylesheet" type="text/css" href="resources/css/QnaBoard.css"/>
		<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
	</head>
	<body>		
		<jsp:include page="../../resources/include/index.jsp"/>
		<div class="content">		
		<table class="QnA_board1" align="center">
			<tr>
			 	<td id="QnA_sub" colspan="5">
					<b>Q & A</b>												
				</td>
			</tr>				
		</table>
		</br>
		<table class="QnA_board2" >
			<thead>		
				<tr>
					<td id="btn_write" colspan="5" align="right">
						게시물 갯수 : 
							<select id="QnA_page">
							<option value="5">5</option>
							<option value="10">10</option>
							<option value="15">15</option>
							<option value="20">20</option>
							</select>
						<c:if test="${sessionScope.userId !=null}">
							<button id="writeQna" onclick="location.href='./QnABoard_Write?userId=${sessionScope.userId}'">글쓰기</button>
						</c:if>
					</td>					
				</tr>		
				<tr>
					<td class="QnA_subject" id="Ft1" height="50px">번호</td>
					<td class="QnA_subject" id="Ft2">제목</td>
		    		<td class="QnA_subject" id="Ft3">작성자</td>				
					<td class="QnA_subject" id="Ft4">작성일</td>
					<td class="QnA_subject" id="Ft5">조회수</td>
				</tr>
			</thead>			
			<tbody id="list">
				<!-- 리스트가 출력될 내용 영역 tbody -->				
			</tbody>
			<tr>
				<td id="QnA_pageNum" colspan="5" align="center">
					<div id="QnA_pagenation"></div>	
				</td>				
			</tr>						
		</table>
		</div>		
	</body>
	<script>
	var msg="${msg}";
	if(msg !="")
		{
		alert(msg);
		}
	
	var userId="${sessionScope.userId}";
	var userNick="";
	FindNick(userId)
	
	var currPage = 1;
	listCall(currPage);
	//페이지 갯수 정하기
	$("#QnA_page").change(function(){
		listCall(currPage);
	}); 
	
	
	function FindNick(userId)
	{
		var url="./rest/FindNick";
		var data={};
		data.userId=userId
		console.log(data.userId);
		reqServer(url,data);
	}

	function listCall(currPage){
		var url="./rest/Board_list";
		var data = {};
		data.page = currPage;
		data.category_name="QnA";
		console.log(currPage);
		data.pagePerNum = $("#QnA_page").val();
		reqServer(url, data);
	}
	
	function reqServer(url, data){
		console.log(url);
		$.ajax({
			url:url,
			type:"post",
			data:data,
			dataType:"json",
			success:function(d){
				console.log(d)
				if(url == "./rest/Board_list"){
					printList(d.jsonList.list);
					//페이지 세팅
					currPage = d.currPage;
					printPaging(d.allCnt, d.page);
					}
				if(url == "./rest/FindNick"){
					userNick=d.userNick;
					}
				},error:function(e){
						console.log(e)
					}
		});
	}
	
	function printList(list){
		console.log(list);
		var content = "";
		for(var i=0; i<list.length; i++){
				console.log(list[i].newfilename );
				content +="<tr height='50px'>"
							+"<td>"+list[i].board_idx
							if(list[i].nickName==userNick)
							{
				content +=" <a href='./BoardDelete?board_idx="+list[i].board_idx+"&category_name="+list[i].category_name+"' style='text-decoration:none'>삭제</a></td>";
							}
				content+="</td>"
							+"	<td>"
							+"<a class='listpage' href='./Board_Detail?board_idx="+list[i].board_idx+"'>"
							+list[i].subject
							+"</a>";
							if(list[i].newfilename != null){
								content += "<h8>[첨부파일]</h8>"				
								}
							else
								{
								content += "<h8>[첨부파일X]</h8>"				
								}
							if(list[i].replies >0){
								content += " <b>["+list[i].replies+"]</b>";
							}
				content +="</td>"
							+"<td>"+list[i].nickName+"</td>"
							+"<td>"+list[i].reg_date+"</td>"
							+"<td>"+list[i].bhit+"</td>"
							+"</tr>";
		}
		$("#list").empty();
		$("#list").append(content);
	};
		//일반 페이징 방식		
		function printPaging(allCnt, pageNum){
		console.log("전체 게시물 :"+allCnt );
		console.log("생성 가능 페이지 :"+pageNum );
		console.log("현재 페이지 :"+currPage);
		
		$("#QnA_pageNum").empty();
		var start;	//페이지 시작
		var end;	//페이지 끝
		var range = (currPage/5);	//다음 페이지 있는지 여부
		var content = "";
		
		if(range >1){//5페이지 넘었을 경우
			end = currPage%5 == 0 ?
					//Math.floor 소수점 다버림 
					(Math.floor(range))*5
					:(Math.floor(range)+1)*5;
			start = Math.floor(end-4);
		}else{//5페이지 미만일 경우
			start = 1;
			end = 5;
		}
		
		//페이징 표시			
		//< 이전
		if(currPage > 5){
			content +="<a class='a2' href='javascript:listCall("
				+(start-1)+");'>이전</a> | "
		}
		
		
		
		 for(var i=start; i<=end;i++)
		{
			if(i<=pageNum)
			{
				if(currPage ==i){
					content +="<b>"+i+"</b>";
				}else{
					content += " <a class='a2' href='#' onclick='listCall("+i+")'>"
					+i+"</a> "
				}					
			}			
		} 
		
		//마지막 페이지가 전체 페이지 수 보다 적으면 다음 링크 생성
		if(end<pageNum)
		{
			content +=" | <a class='a2' href='#' onclick='listCall("
					+(end+1)+")'>다음</a> "
		}
		
		$("#QnA_pageNum").append(content);
		
	
	};

	</script>
</html>
