<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<html>	
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>패션토크 게시판</title>
		<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
		<link rel="stylesheet" type="text/css" href="resources/css/board.css"/>
	</head>
	<body>
     <jsp:include page="../../resources/include/index.jsp"/>
 		<div class="content">
		<table class="Ft_board1" align="center">
			<tr>
			 	<td id="Ft_sub" colspan="6">
					<b>패션토크 게시판</b>												
				</td>
			</tr>				
		</table>
		</br>
		<table class="Ft_board2" align="center">
			<thead>		
				<tr>
					<td id="btn_write" colspan="6" align="right">
							게시물 갯수 : 
							<select id="Ft_page">
							<option value="5">5</option>
							<option value="10">10</option>
							<option value="15">15</option>
							<option value="20">20</option>
							</select>
						<button id="FTbutton" onclick="location.href='./FTboard_Write?userId=${sessionScope.userId}'">글쓰기</button>
					</td>					
				</tr>		
				<tr>
					<td class="Ft_subject" id="Ft1">글 번호</td>
					<td class="Ft_subject" id="Ft2">제목</td>
		    		<td class="Ft_subject" id="Ft3">작성자</td>				
					<td class="Ft_subject" id="Ft4">작성일</td><!-- 이미지로 변경 -->
					<td class="Ft_subject" id="Ft5">조회수</td>
					<td class="Ft_subject" id="Ft6">추천수</td>
				</tr>
			</thead>			
			<tbody id="list">
				<!-- 리스트가 출력될 내용 영역 tbody -->				
			</tbody>
			<tr>
				<td id="Ft_pageNum" colspan="6" align="center">
							<!-- 페이지 처리가 출력될 내용 영역 -->
				</td>				
			</tr>						
		</table>
		</div>		
	</body>
	<script>


	</script>
</html>