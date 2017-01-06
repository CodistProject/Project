<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>

<html>	
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Q & A < 게시판</title>
		<link rel="stylesheet" type="text/css" href="resources/css/QnaBoard.css"/>
		<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
	</head>
	<body>		
		<jsp:include page="../../resources/include/index.jsp"/>
		<div class="content">		
		<table class="QnA_board1" align="center">
			<tr>
			 	<td id="QnA_sub" colspan="5">
					<b>Q & A</b>												
				</td>
			</tr>				
		</table>
		</br>
		<table class="QnA_board2" align="center">
			<thead>		
				<tr>
					<td id="btn_write" colspan="5" align="right">
						게시물 갯수 : 
							<select id="QnA_page">
							<option value="5">5</option>
							<option value="10">10</option>
							<option value="15">15</option>
							<option value="20">20</option>
							</select>
						<button id="writeQna" onclick="location.href='./QnABoard_Write?userId=${sessionScope.userId}'">글쓰기</button>
					</td>					
				</tr>		
				<tr>
					<td class="QnA_subject" id="Ft1">번호</td>
					<td class="QnA_subject" id="Ft2">제목</td>
		    		<td class="QnA_subject" id="Ft3">작성자</td>				
					<td class="QnA_subject" id="Ft4">작성일</td>
					<td class="QnA_subject" id="Ft5">조회수</td>
				</tr>
			</thead>			
			<tbody id="list">
				<!-- 리스트가 출력될 내용 영역 tbody -->				
			</tbody>
			<tr>
				<td id="QnA_pageNum" colspan="5" align="center">
					<div id="QnA_pagenation"></div>	
				</td>				
			</tr>						
		</table>
		</div>		
	</body>
	<script>
var currPage = 1;

	</script>
</html>
