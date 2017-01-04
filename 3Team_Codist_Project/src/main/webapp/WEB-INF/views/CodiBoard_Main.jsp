<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%
	final int ROWSIZE = 4;
	final int BLOCK = 5;
	int pg = 1;
	
	int allPage = 0;
	
	int startPage = ((pg-1)/BLOCK*BLOCK)+1;
	int endPage = ((pg-1)/BLOCK*BLOCK)+BLOCK;
%>
<html>	
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>코디 게시판</title>
		<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
		<link rel="stylesheet" type="text/css" href="resources/css/codiBoard.css"/>
	</head>
	<body>
			
		<jsp:include page="../../resources/include/index.jsp"/>
		<div class="content">		
		<table class="Cd_board1" align="center">
			<tr>
			 	<td id="Cd_sub" colspan="4">
					<b>코디 게시판</b>												
				</td>
			</tr>				
		</table>
		</br>
		<table class="Cd_board2" align="center">
			<thead>		
				<tr>
					<td colspan="4" align="right">
						<button class="admin"  onclick="location.href='./CodiBoard_Write?userId=${sessionScope.userId}'">글쓰기</button>						
					</td>					
				</tr>		
				<tr>
				<div class="img">
					<td>
					<input type="checkbox" class="admin"/> 
					사진1	<!-- <img alt="" src=""/> -->
					</td>
				</div>
				<div class="img">
					<td>
					<input type="checkbox" class="admin"/> 
					사진2	<!-- <img alt="" src=""/> -->
					</td>
				</div>
				<div class="img">
					<td>
					<input type="checkbox" class="admin"/> 
					사진3	<!-- <img alt="" src=""/> -->
					</td>
				</div>
				<div class="img">
					<td>
					<input type="checkbox" class="admin"/> 
					사진4	<!-- <img alt="" src=""/> -->
					</td>
				</div>
			</tr>
			<tr>
				<td>설명1</td>
				<td>설명2</td>
				<td>설명3</td>
				<td>설명4</td>
			</tr>
			</thead>			
			<tbody id="list">
				<!-- 리스트가 출력될 내용 영역 tbody -->				
			</tbody>
			<tr>
				<td id="Cd_pageNum" colspan="6" align="center">
					<div id="Cd_pagenation"></div>			
				</td>				
			</tr>						
		</table>
		</div>		
	</body>
	<script>
	   
		hide();	   
	   var userId = "${sessionScope.userId}";	   
	   	
		function hide() {
			console.log(userId);
			if(userId=="ADMIN"){
				$(".admin").css("display","block");				
			}					
		}
		
		var currPage = 1;
		
		listCall(currPage);

		function listCall(currPage){
			var url="./rest/Cd_list";
			var data = {};
			data.page = currPage;
			console.log(currPage);
			data.pagePerNum = 8;
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
					if(url == "./rest/Cd_list"){
						printList(d.jsonList.list);
						//페이지 세팅
						currPage = d.currPage;
						printPaging(d.allCnt, d.page);
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
					content +="<tr>"
								+"<td>"+list[i].board_idx+"</td>"
								+"	<td>"
								+"<a class='listpage' href='./Board_Detail?board_idx="+list[i].board_idx+"'>"
								+list[i].subject
								+"</a>";
								if(list[i].replies >0){
									content += " <b>["+list[i].replies+"]</b>";
								}
								/*
								if(list[i].newFileName != null){
								content += "<img width='15px' src='resources/img/default.png'/>";
								}	
								*/
					content +="</td>"
								+"<td>"+list[i].nickName+"</td>"
								+"<td>"+list[i].reg_date+"</td>"
								+"<td>"+list[i].bhit+"</td>"
								+"<td>"+list[i].ft_like+"</td>"
								+"</tr>";
			}
			$("#list").empty();
			$("#list").append(content);
		}
			//일반 페이징 방식		
			function printPaging(allCnt, pageNum){
			console.log("전체 게시물 :"+allCnt );
			console.log("생성 가능 페이지 :"+pageNum );
			console.log("현재 페이지 :"+currPage);
			
			$("#Ft_pageNum").empty();
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
				content +="<a href='#' class='listpage' onclick='listCall("
					+(start-1)+")'>이전</a> | "
			}
			
			
			
			 for(var i=start; i<=end;i++)
			{
				if(i<=pageNum)
				{
					if(currPage ==i){
						content +="<b>"+i+"</b>";
					}else{
						content += " <a href='#' class='listpage' onclick='listCall("+i+")'>"
						+i+"</a> "
					}					
				}			
			} 
			
			//마지막 페이지가 전체 페이지 수 보다 적으면 다음 링크 생성
			if(end<pageNum)
			{
				content +=" | <a href='#' class='listpage' onclick='listCall("
						+(end+1)+")'>다음</a> "
			}
			
			$("#Ft_pageNum").append(content);
			
		
		}
	</script>
</html>