<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>

<html>	
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>코디 게시판</title>
		<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
		<link rel="stylesheet" type="text/css" href="resources/css/codiBoard.css"/>
	</head>
	<body>
			
		<jsp:include page="../../resources/include/index.jsp"/>
		<div class="content">		
		<table class="Cd_board1" align="center">
			<tr>
			 	<td id="Cd_sub" colspan="4">
					<b>코디 게시판</b>												
				</td>
			</tr>				
		</table>
		</br>
		<table class="Cd_board2" align="center">
			<thead>		
				<tr>
					<td colspan="4" align="right">
						<button class="admin"  onclick="location.href='./CodiBoard_Write?userId=${sessionScope.userId}'">글쓰기</button>						
					</td>					
				</tr>		
				<tr>
				<div class="img">
					<td>
					<input type="checkbox" class="admin"/> 
					사진1	<!-- <img alt="" src=""/> -->
					</td>
				</div>
				<div class="img">
					<td>
					<input type="checkbox" class="admin"/> 
					사진2	<!-- <img alt="" src=""/> -->
					</td>
				</div>
				<div class="img">
					<td>
					<input type="checkbox" class="admin"/> 
					사진3	<!-- <img alt="" src=""/> -->
					</td>
				</div>
				<div class="img">
					<td>
					<input type="checkbox" class="admin"/> 
					사진4	<!-- <img alt="" src=""/> -->
					</td>
				</div>
			</tr>
			<tr>
				<td>설명1</td>
				<td>설명2</td>
				<td>설명3</td>
				<td>설명4</td>
			</tr>
			</thead>			
			<tbody id="list">
				<!-- 리스트가 출력될 내용 영역 tbody -->				
			</tbody>
			<tr>
				<td id="Cd_pageNum" colspan="6" align="center">
					<div id="Cd_pagenation"></div>			
				</td>				
			</tr>						
		</table>
		</div>		
	</body>
	<script>
	
	</script>
</html>