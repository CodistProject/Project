<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>

<html>	
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>코디를 부탁해</title>
		<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
		<link rel="stylesheet" type="text/css" href="resources/css/reqBoard.css"/>
	</head>
	<body>
			
     <jsp:include page="../../resources/include/index.jsp"/>
 		<div class="content">
		<table class="CP_board1" align="center">
			<tr>
			 	<td id="CP_sub" colspan="6">
					<b>코디를부탁해</b>												
				</td>
			</tr>				
		</table>
		</br>
		<table class="CP_board2" align="center">
			<thead>		
				<tr>
					<td id="btn_write" colspan="6" align="right">
						<button id="CPQna" onclick="location.href='./Coplz_Write?userId=${sessionScope.userId}'">글쓰기</button>
					</td>					
				</tr>		
				<tr>
				
				</tr>
			</thead>			
			<tbody id="list">
				<!-- 리스트가 출력될 내용 영역 tbody -->				
			</tbody>
			<tr>
				<td id="CP_pageNum" colspan="6" align="center">
							<div id="CP_pagenation"></div>
				</td>				
			</tr>						
		</table>
		</div>		
	</body>
	<script>
	
	</script>
</html>