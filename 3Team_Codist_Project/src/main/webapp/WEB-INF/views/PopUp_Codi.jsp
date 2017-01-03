<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<html>
   <head>
      <script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>Insert title here</title>
      <style>
		.PopUpCloth{
		   	position : absoulte;
			background-color : yellow;
			width: 300px;
			height: 100px;
			display:none;
			left: 200px;
			border : 1px solid;
			padding : 10px;					
		}
		.PopUp2Cloth{
		    position : absoulte;
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
  		<!-- 나만의 옷장 글쓰기  -->
	   <div class="PopUpCloth">
	   		<table id="PopUp_table" >
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
	   		<table id="PopUp2_table">
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
   <script></script>
</html>