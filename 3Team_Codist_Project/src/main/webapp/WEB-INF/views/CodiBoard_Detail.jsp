<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<html>
 	<head>
  		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  		<title>코디게시판 상세보기</title>
		<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
		<style>
		table.table1,td.td1,td.td2,td.td3,td.td4,td.td5,td.td6{
			border: 2px solid #bcbcbc;
			border-collapse: collapse;
			width: 700px;
		}
		td.td2,td.td4,td.td6{
			height: 300px;
			display: none;
		}
		div.img1{
				border: 1px solid;
				position: absolute;
				left: 230px;
				top: 215px;
				border-color: white;
		}
			
		div.img2{
				border: 1px solid;
				position: absolute;
				left: 550px;
				top: 215px;
				border-color: white;
			}
		div.img3{
				border: 1px solid;
				position: absolute;
				left: 730px;
				top: 215px;
				border-color: white;
			}
		div.img4{
				border: 1px solid;
				position: absolute;
				left: 550px;
				top:400px;
				border-color: white;
			}
		div.img5{
			position: relative;
			left:50px;
		}
	
		input[type="checkbox"]{
			position:relative;
			bottom: 130px;
		}
		.det{
			position:absolute;
			left: 230px;
			top: 600px;
		}	
		.buttonA{
			position: relative;
			left:605px;
			margin:1px;	
		}		
		
		.PopUpCloth{
		    position : absoulte;
		    width : 250px;									
			background-color : yellow;
			border : 1px solid;
			top : 20%;
			left : 25%;
			display : none;	
			padding : 10px;					
		}
		.PopUp2Cloth{
		    position : absoulte;
		    width : 250px;									
			background-color : yellow;
			border : 1px solid;
			top : 50%;
			left : 50%;
			display : none;	
			padding : 10px;					
		}
		</style>
 	</head>
  	<body>  	
  	<jsp:include page="../../resources/include/index.jsp"/>  	
   	<div >
   		<div class="img1">
   			<img src="./resources/upload/${content.newfilename} " width="300" height="335" alt="이미지1"/>
   		</div>
   		
   		<c:forEach items="${subcontent}" var="dto">
	   		<c:if test="${dto.category_name =='Outer' }">
	   			<div  class="img2">	
	   				<img  src="./resources/upload/${dto.newfilename} " width="150" height="150" alt="이미지2"/>
	   				<br/>${dto.real_name }
	   			</div>
	   		</c:if>
	   		<c:if test="${dto.category_name =='Top' }">
		   		<div  class="img3">	
		   			<img  src="./resources/upload/${dto.newfilename} " width="150" height="150" alt="이미지3"/>
		   			<br/>${dto.real_name }
		   		</div>
	   		</c:if>
	   		<c:if test="${dto.category_name =='Pants' }">
		   		<div  class="img4">	
		   			<img  src="./resources/upload/${dto.newfilename} " width="150" height="150" alt="이미지4"/>
		 			<br/>${dto.real_name }
		   		</div>
	   		</c:if>
   		</c:forEach>
   		
   		<div class="det">
   			<table class="table1" >
   				<tr>
   					<td class="td1"><a href="#">외투</a></td>
   				</tr>
   				<tr>
   					<td class="td2" >
             		 <div id="OuterList" class="img5">
             		 <!-- 외투 리스트 뿌리기  -->
   					</div>
   					<div id="OuterAdd"><!-- 더보기 --></div>
   					</td>
   				</tr>
   				<tr>
   					<td class="td3"><a href="#">상의</a></td>
   				</tr>
   				<tr>
   					<td class="td4" >
   					<div id="TopList" class="img5">
            		<!-- 상의 리스트 뿌리기 -->
   					</div>
   					<div id="TopAdd"><!-- 더보기 --></div>
   					</td>
   				</tr>
   				<tr>
   					<td class="td5"><a href="#">하의</a></td>
   				</tr>
   				<tr>
   					<td class="td6">
   					<div id="PantsList" class="img5">
   					<!-- 하의 리스트 뿌리기 -->
   					</div>
   					<div id="PantsAdd"><!-- 더보기 --></div>   					
   					</td>
   				</tr>   					
   				</table>
   				<table class="btn_table">
   				<tr>
   					<td id="btn_td" align="right">
   						<input type="button" class="buttonA"  value="수정" />
   					 	<input type="button" class="buttonA"  onclick="popUp()" value="담기"/>
   					</td>   					
   				</tr>
   				</table>
   		</div>
   </div>
   
   
   <!-- 나만의 옷장 글쓰기  -->
   <div class="PopUpCloth">
   		<table id="PopUp_table" align="center">
   			<tr>
   				<td>
   					날짜 :  <input type="text"  id="Date" value=""/>
   				</td>
   			</tr>
   			<tr>
   				<td>
   					제목 :  <input type="text"  id="Subject" value=""/>
   				</td>
   			</tr>
   			<tr>
   				<td align="center">
   					<input type="button" value="나만의 옷장으로 이동" onclick="RegistCloth()"/>
   					<input type="button" value="취소"  onclick="cancel()'"/>			
   				</td>
   			</tr>   			
   		</table>
   </div>
   
   <!-- 이동 되었습니다 팝업 -->
   <div class="PopUp2Cloth">
   		<table id="PopUp2_table" align="center">
   			<tr>
   				<td>
   					<b>나만의 옷장으로 이동되었습니다!</b>
   				</td>
   			</tr>   			
   			<tr>
   				<td align="center">
   					<input type="button" value="계속 보기!" onclick="cancel2()"/>
   					<input type="button"  value="옷장 으로!" onclick="location.href='./GoCalender'"/>			
   				</td>
   			</tr>   			
   		</table>
   </div>
   
  	</body>
  	<script>
  	
  	// 코디 담기 버튼실행- 나만의 옷장으로 보내기 팝업 띄우기(날짜/이름작성 팝업창)
  	function popUp(){
  		$(".PopUpCloth").css("display", "block");
  	}
  	// 나만의 옷장에 담기  
  	function RegistCloth(){
  			/* 아작스처리 */
  		$(".PopUpCloth").css("display", "none");
  		$(".PopUp2Cloth").css("display", "block");
  	}
  	// 나만의 옷장 글쓰기 취소
  	function cancel(){
  		$(".PopUpCloth").css("display", "none");
  	}
  	
  	//계속 옷장 담기 하기
 	function cancel2(){
  		$(".PopUp2Cloth").css("display", "none");
  	}
  	
  	$(".td1").click(function(){
  		 $(".td2").slideToggle()
  	 });
  	$(".td3").click(function(){
 		 $(".td4").slideToggle();
 	 });
  	$(".td5").click(function(){
 		 $(".td6").slideToggle();
 	 });
  	
	
	//리스트 뿌리기
	var OutercurrPage = 1;
	var TopcurrPage= 1;
	var PantscurrPage=1;
	
	OuterlistCall(OutercurrPage);
	ToplistCall(TopcurrPage);
	PantslistCall(PantscurrPage);
	
	//외투 뿌리기
	function OuterlistCall(OutercurrPage){
		var url="./rest/CC_list";
		var data = {};
		data.page = OutercurrPage;
		data.category_name="Outer";
		console.log(OutercurrPage);
		data.pagePerNum = 6;
		reqServer(url, data);
	}
	//상의 뿌리기
	function ToplistCall(TopcurrPage){
		var url="./rest/CC_list";
		var data = {};
		data.page = TopcurrPage;
		data.category_name="Top";
		console.log(TopcurrPage);
		data.pagePerNum = 6;
		reqServer(url, data);
	}
	//하의 뿌리기
	function PantslistCall(PantscurrPage){
		var url="./rest/CC_list";
		var data = {};
		data.page = PantscurrPage;
		data.category_name="Pants";
		console.log(PantscurrPage);
		data.pagePerNum = 6;
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
				if(data.category_name == "Outer"){
					printList(d.jsonList.list,'Outer');
					//페이지 세팅
					OutercurrPage = d.currPage+1;
					printPaging(OutercurrPage,d.page,'Outer');
					}
				if(data.category_name == "Top"){
					printList(d.jsonList.list,'Top');
					//페이지 세팅
					TopcurrPage = d.currPage+1;
					printPaging(TopcurrPage,d.page,'Top');
					}
				if(data.category_name == "Pants"){
					printList(d.jsonList.list,'Pants');
					//페이지 세팅
					PantscurrPage = d.currPage+1;
					printPaging(PantscurrPage,d.page,'Pants');
					}
				},error:function(e){
						console.log(e)
					}
		});
	}
	
	function printList(list,category_name){
		console.log(list);
		var content = "";
		for(var i=0; i<list.length; i++)
		{
			
			content +="<input type='checkbox' value='Cloth'/>" 
						+"<a href='http://"+list[i].cloth_url+"'>"
						+"<img width='100' height='100'  alt='메인 코디' src='./resources/upload/"+list[i].newfilename+"'/>"
						+"</a>"
						+"</br>"	
						+list[i].real_name
						+"</br>"
						+list[i].cloth_detail
						
			
		}
		if(category_name=="Outer")
			{
			$("#OuterList").append(content);
			}
		if(category_name=="Top")
			{
			$("#TopList").append(content);
			}
		if(category_name=="Pants")
			{
			$("#PantsList").append(content);
			}
	}
	
	//더보기 페이징 처리	
	function printPaging(currPage,pageNum,category_name){
	console.log("현재 페이지 :"+currPage);
	//외투
	if(category_name =="Outer")
		{
		$("#OuterAdd").empty();
		var content = "";
	 	if(currPage<pageNum)
	 		{
			content +=" <a href='#' onclick='listCall("+currPage+")'>+더보기</a> "
	 		}
		
		$("#OuterAdd").append(content);		
		}
	//상의
	if(category_name =="Top")
		{
		$("#TopAdd").empty();
		var content = "";
	 	if(currPage<pageNum)
	 		{
			content +=" <a href='#' onclick='listCall("+currPage+")'>+더보기</a> "
	 		}
		
		$("#TopAdd").append(content);		
		}
	//하의
	if(category_name =="Pants")
		{
		$("#PantsAdd").empty();
		var content = "";
	 	if(currPage<pageNum)
	 		{
			content +=" <a href='#' onclick='listCall("+currPage+")'>+더보기</a> "
	 		}
		
		$("#PantsAdd").append(content);		
		}

}
	
  	</script>
</html>