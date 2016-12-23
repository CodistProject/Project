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
             		 <input  type="checkbox"  value="외투1"/>
   					<img src="#" id="img1"width="150" height="150" alt="외투1" />
   					<input type="checkbox"  value="외투2"/>
   					<img src="#" id="img1" width="150" height="150" alt="외투2"/>
   					<input type="checkbox"  value="외투3"/>
   					<img src="#" id="img1"width="150" height="150" alt="외투3"/>
   					</div>
   					</td>
   				</tr>
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
   				<c:if test="${sessionScope.userId == ADMIN}">
   						<input type="button" id="button1" value="수정"/>
   				</c:if>
   					 	<input type="button" id="button1" onclick="PopUp_Mycloth()" value="담기"/>
   				
   		</div>
   </div>
  	</body>
  	<script type="text/javascript">
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
  	
  	function PopUp_Mycloth(){
  	   // 팝업을 띄우기
  	   window.open("PopUp_Mycloth.jsp", '나만의 옷장', 'width=300, height=400, resizable=no, scrollbars=no, status=no, location=no, directories=no;'); 
  	};
  	</script>
</html>