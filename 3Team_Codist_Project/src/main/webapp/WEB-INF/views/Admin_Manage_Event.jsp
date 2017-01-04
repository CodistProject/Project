<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<html>
	<head>
		<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>관리자 이벤트 관리 페이지</title>
		<style>
			div.img{
				
			}
			div.ok{
				padding: 10px;
				float: right;
			}
			
			div.ya
         	{
         	position: absolute;
         	top: 20%;
         	left:30%;         
         	}
			
		</style>
	</head>
	<body>	
		<jsp:include page="../../resources/include/index.jsp"></jsp:include>
		<div>				
   		<jsp:include page="../../resources/include/AdminPage.jsp"></jsp:include>   		
   		</div>
		<div class="ya">		
		<h3>VS 이벤트</h3>
		<p>사진 선택</p>
		<table>
			<tr>
				<div class="img">
					<td>
					<input type="checkbox"/> 
					사진1
					</td>
				</div>
				<div class="img">
					<td>
					<input type="checkbox"/> 
					사진2
					</td>
				</div>
				<div class="img">
					<td>
					<input type="checkbox"/> 
					사진3
					</td>
				</div>
			</tr>
			<tr>
				<td>설명1</td>
				<td>설명2</td>
				<td>설명3</td>
			</tr>
		</table>
		<br/>
		당첨자 설정 : <input type="text"/>
		<br/>
		포인트 설정 : <input type="text"/>
		<br/>
		<div class="ok">
		<input type="button" value="적용"/>	
		</div>		
		<h3>시간 이벤트</h3>
		<p>게임 선택</p>
		<table>		
			<tr>
				<td><input type="checkbox" id="bri"></td>
				<td>사다리 게임</td>				
				<td><input type="time">~<input type="time"></td>
			</tr>
			<!-- <tr>	
				<td><input type="checkbox" id="rool"></td>
				<td>룰렛 게임</td>
				<td><input type="time">~<input type="time"></td>
			</tr> -->
			</table>
			<br/>				
			<form action="Bridge" method="post">
			인원 수 : <input type="text" name="timenum" value="${ladder_Data.timenum}"><br/>
			1번 설정값 : <input type="text" name="select1" value="${ladder_Data.select1}"><br/>
			2번 설정값 : <input type="text" name="select2" value="${ladder_Data.select2}"><br/>
			3번 설정값 : <input type="text" name="select3" value="${ladder_Data.select3}"><br/>
			4번 설정값 : <input type="text" name="select4" value="${ladder_Data.select4}"><br/>
			5번 설정값 : <input type="text" name="select5" value="${ladder_Data.select5}"><br/>
			6번 설정값 : <input type="text" name="select6" value="${ladder_Data.select6}"><br/>			
			<input type="submit" value="설정"/>
			</form>			
			<br/>	
			당첨자 설정 : <input type="text"/>			
			<br/>
			포인트 설정 : <input type="text"/>
			<br/>
			<div class="ok">
			<input type="button" value="적용"/>		
			</div>	
		</div>	
		 </div>
	</body>
	<script>
		var ladder = $("#ladder");			
	/* 	
		function val() {
			var num = $("#num").val();			
			var i = 1;
			var html = '';			
			
			if(num<=1){
				alert("숫자가 너무 적습니다.");				
			}else if(num<=6){
				for(i;i<=num;i++){
					 html += '설정값 : <input type="text" name="val'+i+'"  value=""><br/>';					
				}						
				ladder.append(html)
				ladder.append("<input type='hidden' name='val0' value='"+num+"'/>")
				ladder.append("<input type='submit' value='설정'/>")
			}else{
				alert("숫자가 너무 많습니다.");
			}			
			
		}	 */
	</script>
</html>