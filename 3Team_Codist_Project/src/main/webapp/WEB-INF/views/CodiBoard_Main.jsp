<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>

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
					<td colspan="3" align="right">
						<c:if test="${sessionScope.userId =='ADMIN'}">
							<button class="admin"  onclick="location.href='./CodiBoard_Write?userId=${sessionScope.userId}'">글쓰기</button>						
						</c:if>
					</td>					
				</tr>		
			</thead>			
			<tbody id="list">
				<!-- 리스트가 출력될 내용 영역 tbody -->				
			</tbody>
			<tr>
				<td id="Cd_pageNum" colspan="6" align="center">
					<div id="Cd_pagenation"></div>			
				</td>	
				<!-- <a href="javascript:"></a>	 -->		
			</tr>						
		</table>

	</div>		
	</body>
	<script>
		var msg = "${msg}";
		
		if(msg != ""){
			alert(msg);
		}
		var currPage=1;
		
		listCall(currPage);
		
		function listCall(currPage){
			var url="./rest/Cd_list";
			var data = {};
			data.page = currPage;
			data.pagePerNum = 9;
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
						currPage=d.currPage
						printPaging(currPage, d.page);
						}
					},error:function(e){
							console.log(e)
						}
			});
		}
		
		function printList(list){
			console.log(list);
			var content = "";
			var userId ="${sessionScope.userId}";
			
			console.log(userId);
			for(var i=0; i<list.length; i++)
			{
				if(i==0)
					{
					content +="<tr>";	
					}
				if(i % 3 ==0)
					{
					content	+="</tr><tr>";
					}
				content +="<td>"
				if(userId=="ADMIN"){
					content	+="<input type='checkbox' class='admin'"+i+"/>"
				}
					content	+="<a href='./CodiBoard_Detail?board_idx="+list[i].board_idx+"'>"
							+"<img width='280px'  alt='메인 코디' src='./resources/upload/"+list[i].newfilename+"'/>"
							+"</a>"
							+"</br>"	
							+list[i].subject
							+"</br>"
							+list[i].sub_subject
							+"	</td>"
				if(i==(list.length-1))
					{
					content+="</tr>";
					}
			}
			
			$("#list").append(content);
		}
		//더보기 페이징 처리	
		function printPaging(currPage,pageNum){
		console.log("현재 페이지 :"+currPage);
		//외투
			$("#Cd_pageNum").empty();
			var content = "";
		 	if(currPage<pageNum)
		 		{
		 		currPage+=1;
		 		content +=" <a href='#' onclick='listCall("+currPage+")'>+더보기</a> "
		 		}
			
			$("#Cd_pageNum").append(content);		
		}
	
	</script>
</html>