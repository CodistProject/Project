<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<html>
	<head>
		<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>메인 홈페이지</title>
		<link rel="stylesheet" type="text/css" href="resources/css/ioi.css"/>
		<style>
	
		</style>
	</head>
	<body>
		<div>
			<jsp:include page="../../resources/include/index.jsp"></jsp:include>
		</div>
		<div class="content">
			<br/>
			<span class="fonts">BEST 코디</span>
			<div class="bord">
				<table class='BestCody'>
					<!-- 베스트 코디 리스트  -->
				</table>
			</div>
			<div class="jump"><!-- 사이간격 --></div>
			
			<span class="fonts">회원 추천 코디</span>
			<div class="bord">
				<table class='Recommend'>
					<!-- 회원 추천 코디 목록 -->
				</table>
			</div>
			<div class="jump"><!-- 사이간격 --></div>
			
			<div class="bord1-1">
			<span class="fonts">코디를 부탁해</span> 
			<div class="bord1">
				<table class='CoplzBoardlist'>
					<!-- 코디를 부탁해 게시판 노출 -->
				</table>
			</div>
			</div>
			
			<div class="bord2-1">
			<span class="fonts">Q&A</span>
			<div class="bord2">
				<table class='QnABoardlist'>
					<!-- Q&A 게시판 노출 -->
				</table>
			</div>		
			</div>
		</div>
		
	</body>
	<script>
	// 나만의 옷장에 데이터 없을시 경보 메세지
	var my_msg = "${my_msg}";
	if(my_msg=="나만의 옷장에 담긴 데이터가 없습니다. 코디게시판에서 담아오는 서비스가 필요합니다!"){
		alert(my_msg);
	}
	
	CBlistCall();
	FTlistCall();
	QnAlistCall();
	CPlistCall();
	function CBlistCall(){
		var url="./rest/CB_BestList";
		var data = {};
		data.page = 1;
		data.pagePerNum = 3;
		data.category_name='CB';
		reqServer(url, data);
	}
	
	function FTlistCall(){
		var url="./rest/FT_BestList";
		var data = {};
		data.page = 1;
		data.pagePerNum = 3;
		data.category_name='FT';
		reqServer(url, data);
	}
	
	function CPlistCall(){
		var url="./rest/Board_list";
		var data = {};
		data.page = 1;
		data.pagePerNum = 5;
		data.category_name='CP';
		reqServer(url, data);
	}
	
	function QnAlistCall(){
		var url="./rest/Board_list";
		var data = {};
		data.page = 1;
		data.category_name="QnA";
		data.pagePerNum = 5;
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
				if(url == "./rest/CB_BestList"){
				 	ImgPrintList(d.list,url);
					//더보기 처리
					//printPaging(currPage, d.page);
					 } 
				if(url == "./rest/FT_BestList"){
					ImgPrintList(d.list,url);
					//더보기 처리
					//printPaging(currPage, d.page);
					 }
				if(url == "./rest/Board_list"){
					printList(d.jsonList.list,data.category_name);
					//더보기 처리
					//printPaging(d.allCnt, d.page);
					}
				},error:function(e){
						console.log(e)
					}
		});
	}
	//베스트선정 표현
	function ImgPrintList(list,url){
		console.log(list);
		var content = "";
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
						+"<a href='./CodiBoard_Detail?board_idx="+list[i].board_idx+"'>"
						+"<img width='275px' height='280px' alt='메인 코디' src='./resources/upload/"+list[i].newfilename+"'/>"
						+"</a>"	
						+"</br>"	
						+list[i].subject
						+"</br>";
			if(url == "./rest/CB_BestList")
				{
			content += list[i].sub_subject
						+"</td>";
				}
			else
				{
			content += list[i].content
						+"</td>";
				}		
			if(i==(list.length-1))
			{
			content+="</tr>";
			}
		}
		if(url == "./rest/CB_BestList")
			{
			$(".BestCody").append(content);
			}
		else
			{
			$(".Recommend").append(content);
			}
	}
	
	function printList(list,category_name){
		console.log(list);
		var content = "";
		if(category_name=="QnA"){
			for(var i=0; i<list.length; i++){
					content +="<tr>"
								+"<td>"+list[i].board_idx
								+"	<td>"
								+"<a href='./Board_Detail?board_idx="+list[i].board_idx+"'>"
								+list[i].subject
								+"</a>";
								if(list[i].newFileName != null){
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
			$(".QnABoardlist").empty();
			$(".QnABoardlist").append(content);
			}
	 if(category_name=="CP")
			{
			 for(var i=0; i<list.length; i++){
					content +="<tr>"
								+"<td class='CP1'>"+list[i].board_idx+"</td>"
				if(list[i].newfilename != null){
					content += "<td class='CP2'>" 
							    +"<img width='15px' src='resources/img/default.jpg'/>";
					}
				else
					{
					content +="<td class='CP2'>"
							    +"<img width='150' height='50'  alt='물물교환' src='./resources/upload/"+list[i].newfilename+"'/>";
					}
					content +=	"</td>"
								+"	<td class='CP3'>"
								+"<a href='./Board_Detail?board_idx="+list[i].board_idx+"'>"
								+list[i].subject
								+"</a>";
								if(list[i].replies >0){
									content += " <b>["+list[i].replies+"]</b>";
								}
								
					content +="</td>" 
								+"<td class='CP4'>"+list[i].nickName+"</td>"
								+"<td class='CP5'>"+list[i].bhit+"</td>"
								+"</tr>";
				}
				$(".CoplzBoardlist").empty();
				$(".CoplzBoardlist").append(content);
			}
	};
	
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
	
	
	var msg="${msg}";
	if(msg !="")
		{
		alert(msg);
		}
	
	// 메일 보내기(아이디찾기 or 비번찾기 or 이메일 문의) 성공관련 메시지 alert 띄우기
	var msg = "${msg}";
	var msg1 ="${Find_Id.msg}";
	var msg2 ="${Find_Pw.msg}";
	var msg_chk = "1:1문의가 이메일로 전송 되었습니다!";
	var msg_chk1 = "찾으시는 아이디가 이메일로 전송되었습니다."; 
	var msg_chk2 = "찾으시는 비밀번호가 이메일로 전송되었습니다.";			
	var msg_chk3 = "로그인이 필요한 서비스 입니다!";
	
	
	if(msg==msg_chk){
		console.log("1:1 문의 전송 성공 여부 :"+msg);
		alert(msg);
	}
	if(msg1==msg_chk1){
		console.log("아이디 찾기 메시지 성공 여부:"+msg1);
		alert(msg1);	
	}		
	if(msg2==msg_chk2){
		console.log("비번 찾기 메시지 성공 여부:"+msg2);
		alert(msg2);	
	}	
	if(msg==msg_chk3){
		console.log("1:1 문의 전송 성공 여부 :"+msg);
		alert(msg);
	}	
	
	
	//시간 이벤트 팝업
	timeevent_pop();
	
	function addZero(i) {
  			 if (i < 10) {
      		 i = "0" + i;
 		  }   		
 		  return i;  		  
	}	
	
	function timeevent_pop() {
		var now = new Date();
		var h = addZero(now.getHours());
		var m = addZero(now.getMinutes());
		var nowTime = h+":"+m;	
		var start = "${ladder_Data.time_start}";
		var end = "${ladder_Data.time_end}";	
		
		console.log(nowTime);
		console.log(start);
		console.log(end);
		var win;
		if(nowTime>=start && nowTime<=end){						
			 win	= window.open("TimeEvent", "_blank", "toolbar=yes,scrollbars=yes,resizable=yes,top=200,left=300,width=600,height=500");
		}else{					
			if(win){
	            win.close();
			}
		}
	}
	
	
	</script>
</html>