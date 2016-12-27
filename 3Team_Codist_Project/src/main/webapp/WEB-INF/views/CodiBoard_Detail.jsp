<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<html>
 	<head>
  		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  		<title>코디게시판 상세보기</title>
		<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
		<style>
		.table1,.td1,.td2,.td3,.td4,.td5,.td6{
			border: 2px solid #bcbcbc;
			border-collapse: collapse;
			width: 700px;
		}
		.td2,.td4,.td6{
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
   			<img src="#" width="300" height="335" alt="이미지1"/>
   		</div>
   		
   		
   		<div  class="img2">	
   			<img  src="#" width="150" height="150" alt="이미지2"/>
   		</div>
   		
   		<div  class="img3">
   			<img  src="#" width="150" height="150" alt="이미지3"/>
   		</div>
   		
   		
   		<div  class="img4">
   			<img  src="#" width="150" height="150" alt="이미지4"/>
   		</div>
   		
   		<div class="det">
   			<table class="table1" >
   				<tr>
   					<td class="td1"><a href="#">외투</a></td>
   				</tr>
   				<tr>
   					<td class="td2" >
             		 <div  class="img5">
             		 <input type="checkbox"  value="외투1"/>
   					<img src="#" id="img1"width="150" height="150" alt="외투1" />
   					<input type="checkbox"  value="외투2"/>
   					<img src="#" id="img1" width="150" height="150" alt="외투2"/>
   					<input type="checkbox"  value="외투3"/>
   					<img src="#" id="img1"width="150" height="150" alt="외투3"/>
   					</div>
   					</td>
   				</tr>
   				<tr>
   					<td class="td3"><a href="#">상의</a></td>
   				</tr>
   				<tr>
   					<td class="td4" >
   					<div  class="img5">
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
   					<div  class="img5">
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
   					<td id="btn_td" align="right">
   						<input type="button" name="mod_btn" value="수정" />
   					 	<input type="button" name="put_btn" value="담기"/>
   					</td>   					
   				</tr>
   				</table>
   				
   				
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
  	</script>
</html>