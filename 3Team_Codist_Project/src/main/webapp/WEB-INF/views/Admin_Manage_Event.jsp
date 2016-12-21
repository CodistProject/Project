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
		</style>
	</head>
	<body>		
		
		<jsp:include page="../../resources/include/index.jsp"/>
		<div class="content">
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
				<td><input type="checkbox"></td>
				<td>사다리 게임</td>
				<td><input type="time">~<input type="time"></td>
			</tr>
			<tr>	
				<td><input type="checkbox"></td>
				<td>룰렛 게임</td>
				<td><input type="time">~<input type="time"></td>
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
		</div>	
	</body>
	<script></script>
</html>