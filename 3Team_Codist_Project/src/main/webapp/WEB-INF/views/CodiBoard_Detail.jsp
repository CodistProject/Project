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
		}
			
		div.img2{
				border: 1px solid;
				position: absolute;
				left: 550px;
				top: 215px;
			}
		div.img3{
				border: 1px solid;
				position: absolute;
				left: 730px;
				top: 215px;
			}
		div.img4{
				border: 1px solid;
				position: absolute;
				left: 550px;
				top:400px;
			}
		div.img5{
			position: relative;
			left:50px;
		}
		div#popUp{
			 	position:absolute;
				z-index:2;
				width: 260px;
				height: 300px;
				background-color:white;
				border: 1px solid gray;
				top: 15%;
				left: 25%;
				display:none;
		}
		
		
		#img1{
		 padding-left: 10px;
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
		#button1{
		position: relative;
		left:590px;
		margin:5px;	
		}		
		#td7{
			border-color-right : white;
			border-color-left : white;
			border-color-bottom : white;
		}
		
		.PopUpCloth{
		    position : absoulte;
		    z-index : 3;
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
		    z-index : 3;
		    width : 250px;									
			background-color : yellow;
			border : 1px solid;
			top : 50%;
			left : 50%;
			display : none;	
			padding : 10px;					
		}
		.btn_table{
		
		}
		</style>
 	</head>
  	<body>  	
  	<jsp:include page="../../resources/include/index.jsp"/>  	
   	<div class="content">
   		<div class="img1">
   			<img src="./resources/upload/${content.filename} " width="300" height="335" alt="이미지1"/>
   		</div>
   		
   		<c:forEach items="${subcontent}" var="dto">
	   		<c:if test="${dto.category_name =='Outer' }">
	   			<div  class="img2">	
	   				<img  src="./resources/upload/${dto.filename} " width="150" height="150" alt="이미지2"/>
	   			</div>
	   		</c:if>
	   		<c:if test="${dto.category_name =='Top' }">
		   		<div  class="img3">	
		   			<img  src="./resources/upload/${dto.filename} " width="150" height="150" alt="이미지3"/>
		   		</div>
	   		</c:if>
	   		<c:if test="${dto.category_name =='Pants' }">
		   		<div  class="img4">	
		   			<img  src="./resources/upload/${dto.filename} " width="150" height="150" alt="이미지4"/>
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
   					</td>
   				</tr>
   				<tr>
   					<td class="td3"><a href="#">상의</a></td>
   				</tr>
   				<tr>
   					<td class="td4" >
   					<div id="TopList" class="img5">
             		 <input type="checkbox"  value="상의1"/>
   					<img src="#" id="img1"width="150" height="150" alt="상의1" />
   					<input type="checkbox"  value="상의2"/>
   					<img src="#" id="img1" width="150" height="150" alt="상의2"/>
   					<input type="checkbox"  value="상의3"/>
   					<img src="#" id="img1"width="150" height="150" alt="상의3"/>
   					</div>
   					</td>
   				</tr>
   				<tr>
   					<td class="td5"><a href="#">하의</a></td>
   				</tr>
   				<tr>
   					<td class="td6">
   					<div id="PantsList" class="img5">
             		<input type="checkbox"  value="하의1"/>
   					<img src="#" id="img1"width="150" height="150" alt="하의1" />
   					<input type="checkbox"  value="하의2"/>
   					<img src="#" id="img1" width="150" height="150" alt="하의2"/>
   					<input type="checkbox"  value="하의3"/>
   					<img src="#" id="img1"width="150" height="150" alt="하의3"/> 
   					</div>   					
   					</td>
   				</tr>   					
   				</table>
   				<table class="btn_table">
   				<tr>
   					<td id="btn_td" align="right">
   						<input type="button" name="mod_btn" value="수정" />
   					 	<input type="button" name="put_btn" value="담기"/>
   					</td>   					
   				</tr>
   				</table>
   				
   				<c:if test="${sessionScope.userId == ADMIN}">
   						<input type="button" id="button1" value="수정"/>
   				</c:if>
   					 	<input type="button" id="button1" onclick="popUp()" value="담기"/>
   				<div id="popUp">팝업창</div>
   				
   		</div>
   </div>
   <div class="PopUpCloth">
   		<table id="PopUp_table" align="center">
   			<tr>
   				<td>
   					날짜 :  <input type="text"  name="Date" value=""/>
   				</td>
   			</tr>
   			<tr>
   				<td>
   					제목 :  <input type="text"  name="Subject" value=""/>
   				</td>
   			</tr>
   			<tr>
   				<td align="center">
   					<input type="button"  name="myCloth_Move" value="나만의 옷장으로 이동"/>
   					<input type="button"  name="Cencel" value="취소"  onclick="cancel()'"/>			
   				</td>
   			</tr>   			
   		</table>
   </div>
   
   
   <div class="PopUp2Cloth">
   		<table id="PopUp2_table" align="center">
   			<tr>
   				<td>
   					<b>나만의 옷장으로 이동되었습니다!</b>
   				</td>
   			</tr>   			
   			<tr>
   				<td align="center">
   					<input type="button"  name="myCloth_Move" value="나만의 옷장에 담기" onclick="location.href='./'"/>
   					<input type="button"  name="Cencel2" value="취소"  onclick="cancel2()'"/>			
   				</td>
   			</tr>   			
   		</table>
   </div>
   
  	</body>
  	<script>
  	
  	// 코디 담기 버튼실행- 나만의 옷장으로 보내기 팝업 띄우기(날짜/이름작성 팝업창)
  	$("input[name='put_btn']").click(function(){
  		$(".PopUpCloth").css("display", "block");
  	})
  	
  	// 코디 담기 버튼실행- 나만의 옷장으로 보내기 팝업 띄우기(날짜/이름작성 팝업창)
  	$("input[name='myCloth_Move']").click(function(){
  		$(".PopUp2Cloth").css("display", "block");
  	})
  	
  	// 코디 담기 취소 기능(날짜/이름 작성 취소) - 취소누르면 팝업창 없애기
  	$("input[name='Cencel']").click(function(){
  		$(".PopUpCloth").css("display", "none");
  	})
  	
  	// 코디 담기 취소 기능2(나만의 옷장이동-캘린더 취소)
  	$("input[name='Cencel2']").click(function(){
  		$(".PopUp2Cloth").css("display", "none");
  	})
  	
  	$(".td1").click(function(){
  		 $(".td2").toggle();
  		 return false;
  	 });
  	$(".td3").click(function(){
 		 $(".td4").toggle();
 		 return false;
 	 });
  	$(".td5").click(function(){
 		 $(".td6").toggle();
 		 return false;
 	 });
  	
  	var userId ="${sessionScope.userId}";
  	
  	function popUp() {
  		$("#popup").css("display","block");
	};
	
	//리스트 뿌리기
	var OutercurrPage = 1;
	var TopcurrPage= 1;
	var PantscurrPage=1;
	
	OuterlistCall(OutercurrPage);
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
					printList(d.jsonList.list);
					//페이지 세팅
					OutercurrPage = d.currPage;
					//printPaging(d.allCnt, d.page);
					}
				if(data.category_name == "Top"){
					printList(d.jsonList.list);
					//페이지 세팅
					TopcurrPage = d.currPage;
					//printPaging(d.allCnt, d.page);
					}
				if(data.category_name == "Pants"){
					printList(d.jsonList.list);
					//페이지 세팅
					PantscurrPage = d.currPage;
					//printPaging(d.allCnt, d.page);
					}
				},error:function(e){
						console.log(e)
					}
		});
	}
	
	function printList(list){
		console.log(list);
		var content = "";
		for(var i=0; i<list.length; i++)
		{
			
			content +="<input type='checkbox' value='Cloth'/>" 
						+"<a href='"+list[i].cloth_url+"'>"
						+"<img width='100' height='100'  alt='메인 코디' src='./resources/upload/"+list[i].filename+"'/>"
						+"</a>"
						+"</br>"	
						+list[i].real_name
						+"</br>"
						+list[i].cloth_detail
						
			
		}
		
		$("#OuterList").empty();
		$("#OuterList").append(content);
	}
	
  	</script>
</html>