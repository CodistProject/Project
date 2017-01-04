<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>

<html>	
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>코디를 부탁해</title>
		<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
		<link rel="stylesheet" type="text/css" href="resources/css/reqBoard.css"/>
	</head>
	<body>
			
     <jsp:include page="../../resources/include/index.jsp"/>
 		<div class="content">
		<table class="CP_board1" align="center">
			<tr>
			 	<td id="CP_sub" colspan="6">
					<b>코디를부탁해</b>												
				</td>
			</tr>				
		</table>
		</br>
		<table class="CP_board2" align="center">
			<thead>		
				<tr>
					<td id="btn_write" colspan="6" align="right">
						<button id="CPQna" onclick="location.href='./Coplz_Write?userId=${sessionScope.userId}'">글쓰기</button>
					</td>					
				</tr>		
				<tr>
					<td class="CP_subject" id="Ft1">글 번호</td>
					<td class="CP_subject" id="Ft2">제목</td>
		    		<td class="CP_subject" id="Ft3">작성자</td>				
					<td class="CP_subject" id="Ft4">이미지</td>
					<td class="CP_subject" id="Ft5">조회수</td>
					<td class="CP_subject" id="Ft6">추천수</td>
				</tr>
			</thead>			
			<tbody id="list">
				<!-- 리스트가 출력될 내용 영역 tbody -->				
			</tbody>
			<tr>
				<td id="CP_pageNum" colspan="6" align="center">
							<div id="CP_pagenation"></div>
				</td>				
			</tr>						
		</table>
		</div>		
	</body>
	<script>
	
	var currPage = 1;
	
	listCall(currPage);
	
	/* $("#Ft_page").change(function(){
		listCall(currPage);
	}); */
	

	function listCall(currPage){
		var url="./rest/CP_list";
		var data = {};
		data.page = currPage;
		console.log(currPage);
		data.pagePerNum = 5;//$("#Ft_pageNum").val();
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
				if(url == "./rest/CP_list"){
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
							+"<a href='./detail?idx="+list[i].board_idx+"'>"
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
							+"<td>"+list[i].bhit+"</td>"
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
		
		$("#CP_pageNum").empty();
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
			content +="<a href='#' onclick='listCall("
				+(start-1)+")'>이전</a> | "
		}
		
		
		
		/* for(var i=start; i<=end;i++)
		{
			if(i<=pageNum)
			{
				if(currPage ==i){
					content +="<b>"+i+"</b>";
				}else{
					content += " <a href='#' onclick='listCall("+i+")'>"
					+i+"</a> "
				}					
			}			
		} */
		
		//마지막 페이지가 전체 페이지 수 보다 적으면 다음 링크 생성
		if(end<pageNum)
		{
			content +=" | <a href='#' onclick='listCall("
					+(end+1)+")'>다음</a> "
		}
		
		$("#CP_pageNum").append(content);
		
	}
	

	</script>
</html>