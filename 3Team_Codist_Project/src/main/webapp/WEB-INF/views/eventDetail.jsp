<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<html>
	<head>
		<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<style></style>
	</head>
	<style>
			table.popup{
				width: 100%;			
				border-collapse:collapse;
				padding: 5px;
				text-align: center;				
			}
			
			#popup{		
				padding: 20px;		
				position:absolute;
				z-index:2;
				width: 500px;
				height: 550px;
				background-color:white;
				border: 1px solid gray;
				top: 15%;
				left: 25%;
				/* display:none; */
			}
			
			.winner{
				float: right;
				padding: 15px;			
			}
			
			.event{				
				width: 400px;
				height: 500px;
			}
			
			#eventclose{
				float: right;
			}
			
			.winnerclick{
				text-decoration: none;
			}					
		</style>
	</head>
	<body>		
		<div id="popup">
			<div class="winner">				
				<a class= "winnerclick" href="#">당첨확인</a>				
				
			</div>	
			<div class="event">						
				<p>VS 이벤트</p>
				<table class="popup">
					<tr>						
						<td>사진1</td>
						<td>vs</td>
						<td>사진2</td>
					</tr>
					<tr>						
						<td><input type="button" value="선택"></td>
						<td></td>
						<td><input type="button" value="선택"></td>
					</tr>										
				</table>
				<br/>
				<div id="graph">
					<table>
						<tr>						
							<td>1번</td>
							<td>그래프</td>						
						</tr>
						<tr>						
							<td>2번</td>
							<td>그래프</td>						
						</tr>
					</table>
				</div>
				
			<div class="timeeven">
				<p>TIME 이벤트</p>
				<div>
					게임 API
				</div>				
			</div>			
			</div>	
			<input id="eventclose" type="button" value="닫기">		
		</div>		
	</body>
</html>