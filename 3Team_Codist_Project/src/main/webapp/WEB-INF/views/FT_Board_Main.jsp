<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>

    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>	
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>패션토크 게시판</title>
		<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
		<style>			
			.Ft_board1{
				border : 1px solid white;			
				border-top-color : black;				
				border-bottom-color : black;
				width : 100%;
			}
			.Ft_board2{
				border : 1px solid white;								
				border-bottom-color : black;
				width : 100%;
			}
			.Ft_board2 td{
				border : 1px solid;								
			}
			#btn_write, #Ft_pageNum{
				border : 1px solid white;	
				border-top-color : black;				
				border-bottom-color : black;	
			}		
			#Ft_sub{
				font-size : 30pt;
				text-align : center;									
			}			
			.Ft_subject{
				text-align : center;
			}
			#Ft1{
				border : 1px solid white;	
				border-top-color : black;
				border-right-color : black;				
				border-bottom-color : black;
			}
			#Ft6{
				border : 1px solid white;	
				border-top-color : black;
				border-left-color : black;				
				border-bottom-color : black;
			}
			.Ft_subject{
				background-color : yellow;
			}
			/* 버튼 css */
			#FTQna
			{
			-moz-box-shadow:inset 0px 1px 0px 0px #ffffff;
			-webkit-box-shadow:inset 0px 1px 0px 0px #ffffff;
			box-shadow:inset 0px 1px 0px 0px #ffffff;
			background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #ffffff), color-stop(1, #f6f6f6));
			background:-moz-linear-gradient(top, #ffffff 5%, #f6f6f6 100%);
			background:-webkit-linear-gradient(top, #ffffff 5%, #f6f6f6 100%);
			background:-o-linear-gradient(top, #ffffff 5%, #f6f6f6 100%);
			background:-ms-linear-gradient(top, #ffffff 5%, #f6f6f6 100%);
			background:linear-gradient(to bottom, #ffffff 5%, #f6f6f6 100%);
			filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffffff', endColorstr='#f6f6f6',GradientType=0);
			background-color:#ffffff;
			-moz-border-radius:6px;
			-webkit-border-radius:6px;
			border-radius:6px;
			border:1px solid #dcdcdc;
			display:inline-block;
			cursor:pointer;
			color:#666666;
			font-family:Arial;
			font-size:15px;
			font-weight:bold;
			padding:6px 24px;
			text-decoration:none;
			text-shadow:0px 1px 0px #ffffff;
			}
			
			#FTQna:hover {
			background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #f6f6f6), color-stop(1, #ffffff));
			background:-moz-linear-gradient(top, #f6f6f6 5%, #ffffff 100%);
			background:-webkit-linear-gradient(top, #f6f6f6 5%, #ffffff 100%);
			background:-o-linear-gradient(top, #f6f6f6 5%, #ffffff 100%);
			background:-ms-linear-gradient(top, #f6f6f6 5%, #ffffff 100%);
			background:linear-gradient(to bottom, #f6f6f6 5%, #ffffff 100%);
			filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#f6f6f6', endColorstr='#ffffff',GradientType=0);
			background-color:#f6f6f6;
			}
			
			#FTQna:active {
			position:relative;
			top:1px;
		}			
		</style>
	</head>
	<body>
			
     <jsp:include page="../../resources/include/index.jsp"/>
 		<div class="content">
		<table class="Ft_board1" align="center">
			<tr>
			 	<td id="Ft_sub" colspan="6">
					<b>패션토크 게시판</b>												
				</td>
			</tr>				
		</table>
		</br>
		<table class="Ft_board2" align="center">
			<thead>		
				<tr>
					<td id="btn_write" colspan="6" align="right">
						<button id="FTQna" onclick="location.href='./컨트롤러 글쓰기 기능으로'">글쓰기</button>
					</td>					
				</tr>		
				<tr>
					<td class="Ft_subject" id="Ft1">글 번호</td>
					<td class="Ft_subject" id="Ft2">제목</td>
		    		<td class="Ft_subject" id="Ft3">작성자</td>				
					<td class="Ft_subject" id="Ft4">이미지</td>
					<td class="Ft_subject" id="Ft5">조회수</td>
					<td class="Ft_subject" id="Ft6">추천수</td>
				</tr>
			</thead>			
			<tbody id="list">
				<!-- 리스트가 출력될 내용 영역 tbody -->				
			</tbody>
			<tr>
				<td id="Ft_pageNum" colspan="6" align="center">
							<div id="FT_pagenation"></div>
				</td>				
			</tr>						
		</table>
		</div>		
	</body>
	<script>
	var msg = "${msg}";
	console.log("msg : "+msg);
	if(msg != ""){
		alert(msg);
	}
	
	var currPage = 1;
	
	listCall(currPage);
	
	/* $("#Ft_page").change(function(){
		listCall(currPage);
	}); */
	

	function listCall(currPage){
		var url="./rest/FT_list";
		var data = {};
		data.page = currPage;
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
				if(url == "./rest/FT_list"){
					printList(d.jsonList.list);
					//페이지 세팅
					currPage = d.currPage;
					printPaging(d.allCnt, d.page);
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
							+"<td>"+list[i].nickname+"</td>"
							+"<td>"+list[i].reg_date+"</td>"
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
		
		$("#Ft_pageNum").append(content);
		
	}
	

	</script>
</html>