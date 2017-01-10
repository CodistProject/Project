<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<html>	
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>패션토크 게시판</title>
		<link rel="stylesheet" type="text/css" href="resources/css/Ftboard.css"/>
		<link rel="stylesheet" type="text/css" href="resources/css/button.css"/>
		<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
		<style type="text/css">
			#Ft4{
			 	text-align : center;
            	background-color : #434441;
            	color: white;
			}
			.Ft1,.Ft2,.Ft4,.Ft5,.Ft6,.Ft7{
				text-align: center;	
			}
		</style>
	</head>
	<body>
     <jsp:include page="../../resources/include/index.jsp"/>
 		<div class="content">
		<table class="Ft_board1" align="center">
			<tr>
			 	<td id="Ft_sub" colspan="7">
					<b>패션토크 게시판</b>												
				</td>
			</tr>				
		</table>
		</br>
		<table class="Ft_board2" align="center">
			<thead>		
				<tr>
					<td id="btn_write" colspan="7" align="right">
							게시물 갯수 : 
							<select id="Ft_page">
							<option value="5">5</option>
							<option value="10">10</option>
							<option value="15">15</option>
							<option value="20">20</option>
							</select>
						<c:if test="${sessionScope.userId !=null}">
							<button id="FTQna" onclick="location.href='./FTboard_Write?userId=${sessionScope.userId}'">글쓰기</button>
						</c:if><!-- FTbutton -->
					</td>					
				</tr>		
				<tr class="Ft_subject">
					<td class="Ft1" id="Ft4" width="60px" height="50px">글 번호</td>
					<td class="Ft2" id="Ft4" width="150px">이미지</td>
		    		<td class="Ft3"  id="Ft4">제목</td>				
					<td class="Ft4" id="Ft4" width="70px">작성자</td>
					<td class="Ft5"  id="Ft4" width="60px">조회수</td>
					<td class="Ft6"  id="Ft4" width="150px">작성일</td>
					<td class="Ft7"  id="Ft4"width="70px">추천수</td>
				</tr>
			</thead>			
			<tbody id="list">
				<!-- 리스트가 출력될 내용 영역 tbody -->				
			</tbody>
			<tr>
				<td id="Ft_pageNum" colspan="7" align="center">
							<!-- 페이지 처리가 출력될 내용 영역 -->
				</td>				
			</tr>						
		</table>
		</div>		
	</body>
	<script>

	var userId="${sessionScope.userId}";
	//댓글 닉네임 찾기
	function FindNick(userId)
	{
		var url="./rest/FindNick";
		var data={};
		data.userId=userId
		console.log(data.userId);
		reqServer(url,data);
	}
	//페이징 처리
	var currPage = 1;
	listCall(currPage);
	//페이지 갯수 정하기
	$("#Ft_page").change(function(){
		listCall(currPage);
	}); 
	

	 //추천 하기
	function UP_like(board_idx){
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
			reqServer(url,data);
			}
	};
	
	function listCall(currPage){
		var url="./rest/Board_list";
		var data = {};
		data.page = currPage;
		data.category_name="FT";
		console.log(currPage);
		data.pagePerNum = $("#Ft_page").val();
		reqServer(url, data);
	}
	
	function tog(num){
		   
		//댓글 보여주기(기본)
		var url="./rest/FT_Board_Detail";
		var data = {};
		data.board_idx = $("#Idx"+num).html()
		data.num=num;
		reqServer(url, data);
		//댓글 리플 처리
		replyList(num);
		//토글처리
		
		$("#"+num).slideToggle("slow",function(){
            var view = $("#"+num).css("display");
            if(view == "none")
                {
            	$("#T"+num).css("visibility","hidden");
                }               
            else
                {
            	for(var i=0;i<100;i++)
            		{
           			if(num==i)
           				{
           				$("#T"+i).css("visibility","visible");
           				}
           			else
           				{
           				$("#T"+i).css("visibility","hidden");
           				$("#"+i).slideUp("fast");
           				}
            		}
            	}
        });   
     };
 	
     // 댓글 리스트 뿌리는 함수
 	function replyList(num){
 		url = "./rest/replyList";
 		data = {};
 		data.idx = $("#Idx"+num).html();
 		data.num=num;
 		reqServer(url,data);
 	}
     
     //댓글쓰기
 	function replyRegist(idx){
		url ="./rest/replyRegist";
		data ={};
		data.idx=idx;
		data.nickname = $(".user").html();
		data.content= $("."+idx).val();
		if(data.nickname=="")
		{
		alert("로그인 후 가능합니다.");
		}
	else
		{
		reqServer(url,data);
		}
	};
	
	// 댓글 삭제에 필요한 정보 보내기
	function repleDel(reple_idx){				
		console.log(reple_idx);
		url = "./rest/repleDel";
		data={};
		data.reple_idx = reple_idx;
		console.log(reple_idx);
		reqServer(url,data);	
	};
	
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
			reqServer(url,data);
			}
	};
	 
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
		reqServer(url,data);
		}
	};	 
	
	//댓글 쓰기 위한 카운트
	var count=0;
	
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
					printList(d.jsonList.list,url);
					//페이지 세팅
					currPage = d.currPage;
					printPaging(d.allCnt, d.page,0);
					}
				if(url == "./rest/FT_Board_Detail"){
					count= data.num;					
					printList(d.content,url,data.num);
					FindNick(userId);
					}
				if(url == "./rest/FindNick"){
					$(".user").html(d.userNick);
					}
				if(url =="./rest/replyList"){
					printReple(d.list,d.userId);
					}
				 if(url=="./rest/replyRegist"){
					 replyList(count);
	           	 	}
				 if(url == "./rest/repleDel"){					
						alert("삭제에 성공하였습니다.");
						replyList(count);
						if(d.success!=1){
							alert("삭제에 실패 했습니다.");
						}else{
							replyList(count);
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
				
				if(url =="./rest/board_Uplike")
				{
				 alert(d.msg);		//확인 누르는 순간 바뀌게 하기
				}
				
				},error:function(e){
						console.log(e)
					}
		});
	}
	
	
	function printList(list,url,num){
		console.log(list);
		var content = "";
		var number=0;
		if(url == "./rest/Board_list"){
		for(var i=0; i<list.length; i++){
				content +="<tr>"
							+"<td id='Idx"+i+"' class='Ft1' height='100px'>"+list[i].board_idx+"</td>"
							if(list[i].newfilename == null){
								content += "<td>" 
										    +"<img width='15px' src='resources/img/default.jpg'/>";
								}
							else
								{
								content +="<td class='Ft2'>"
										    +"<img width='150' height='100px'  alt='메인 코디' src='./resources/upload/"+list[i].newfilename+"'/>";
								}
				content +=	"</td>"
							+"	<td>"
							+"<a class='subject' href='javascript:tog("+i+")' style='text-decoration:none'>"
							+list[i].subject
							+"</a>";
							if(list[i].replies >0){
								content += " <b>["+list[i].replies+"]</b>";
							}
							+"</td>"
				content +="<td class='Ft4'>"+list[i].nickName+"</td>"
							+"<td class='Ft5'>"+list[i].bhit+"</td>"
							+"<td class='Ft6'>"+list[i].reg_date+"</td>"
							+"<td class='Ft7'>"+list[i].ft_like+"</td>"
							+"</tr>"
							+"<tr id='T"+i+"'class='tog1'>"
							+"<td colspan='7'>"
							+"<div id='"+i+"' class='tog2'>"
							/* 상세보기 */
						    +"</div>"
							+"</td>"
							+"</tr>";
		}
		
		$("#list").empty();
		$("#list").append(content);
		}
		
		if(url == "./rest/FT_Board_Detail"){
			content +="내용: "+list.content
				   		+"<div id='LikeGO'>"
				   		+"<br/>"
				   		+"<center>"
				   		+"<a href=javascript:UP_like('"+list.board_idx+"') style='text-decoration:none'>"
				   		+"<img width='20px' height='20px' alt='조아요' src='./resources/img/like.PNG'> "
				   		+"</a>"
				   		+"<br/>"
				   		+"<span id='LIKE'>추천 "
				   		+list.ft_like
				   		+"</span>"
				   		+"</center>"
				   		+"</div>"
						+"<table class=Ft_board3>"
						+"<tr>"
						+"<td class='user' width='60px' style='background-color:#FBFEC8'>"
						/* 닉네임 출력 */
						+list.nickName
						+"</td>"
						+"<td class='data'>"
						+"<textarea id='texta' class='"+list.board_idx+"' rows='3' placeholder='댓글작성이 가능합니다.' ></textarea>"
						+"</td>"
						+"<td class='btn' width='80px'>"
						+"<button class='bt' onclick='replyRegist("+list.board_idx+")' >댓글달기</button>"
						+"</td>"
						+"</tr>"
						+"</table>"
						+"<table id='"+list.board_idx+"'>"
						+"</table>";
		$("#"+num).empty();					
		$("#"+num).append(content);
		}
	}
	//리플 리스트
	function printReple(list,userId){
		$("#texta").val("");
		console.log(userId);
		console.log(userId[0].id);
		var content = "";
		for(var i=0; i<list.length;i++){
			content +="<tr>"
						+"<td class='RepleNick' width='60px' style='background-color:#FBFEC8'>"+list[i].nickname+"</td>"
						+"<td class='Relecontent'>"+list[i].reple_content+"</td>"
						+"<td class='Ft6' width='120px'>"+list[i].reple_date+"</td>"
						+"<td class='Ft6'>"
						+"<a href=javascript:reple_like("+list[i].reple_idx+")>"
						+"<img width='20' height='20'  alt='좋아요' src='./resources/img/like.PNG'/></a>"+list[i].reple_like
						+"</td>"
						+"<td class='Ft6'>"
						+"<a href=javascript:reple_hate("+list[i].reple_idx+")>"
						+"<img width='20' height='20'  alt='싫어요' src='./resources/img/hate.PNG'/></a>"+list[i].reple_hate
						+"</td>";
				if("${sessionScope.userId}"==userId[0].id)
						{
						content +="<td class='Ft7' width='40px'><a href='javascript:repleDel("+list[i].reple_idx+");' style='text-decoration:none'>삭제</a>"+"</td>";
						}
						content +="</tr>";
		}
		$("#"+list[0].board_idx).empty();
		$("#"+list[0].board_idx).append(content);
	}
	
	
		//일반 페이징 방식		
		function printPaging(allCnt, pageNum){
		console.log("전체 게시물 :"+allCnt );
		console.log("생성 가능 페이지 :"+pageNum );
		console.log("현재 페이지 :"+currPage);
		
		$("#Ft_pageNum").empty();
		var start;	//페이지 시작
		var end;	//페이지 끝
		var range = (currPage / 5);	//다음 페이지 있는지 여부
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
		
		
		//[< 이전]
		if(currPage > 5){
			content +="<a href='#' class='a2' onclick='listCall("
				+(start-1)+")'>이전</a> | ";
		}		
		
		 for(var i=start; i<=end;i++)
		{
			if(i<=pageNum)
			{
				if(currPage ==i){
					content +="<b>"+i+"</b>";
				}else{
					content += " <a href='#' class='a2' onclick='listCall("+i+")'>"
					+i+"</a> ";
				}					
			}			
		} 
		
		//마지막 페이지가 전체 페이지 수 보다 적으면 다음 링크 생성 [다음>]
		if(end<pageNum)
		{
			content +=" | <a href='#' class='a2' onclick='listCall("
					+(end+1)+")'>다음</a> "
		}
		
		$("#Ft_pageNum").append(content);	
	}
	

	</script>
</html>