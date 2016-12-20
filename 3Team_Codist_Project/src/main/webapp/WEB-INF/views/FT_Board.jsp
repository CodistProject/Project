<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%
	final int ROWSIZE = 4;
	final int BLOCK = 5;
	int pg = 1;
	
	int allPage = 0;
	
	int startPage = ((pg-1)/BLOCK*BLOCK)+1;
	int endPage = ((pg-1)/BLOCK*BLOCK)+BLOCK;
%>    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>	
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>패션토크 게시판</title>
		<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
		<style>			
			.Ft_board1{
				border : 1px solid white;			
				border-top-color : black;				
				border-bottom-color : black;
				width : 100%;
			}
			.Ft_board2{
				border : 1px solid white;								
				border-bottom-color : black;
				width : 100%;
			}
			.Ft_board2 td{
				border : 1px solid;								
			}
			#btn_write, #Ft_pageNum{
				border : 1px solid white;	
				border-top-color : black;				
				border-bottom-color : black;	
			}		
			#Ft_sub{
				font-size : 30pt;
				font-family : 굴림체;
				text-align : center;									
			}			
			.Ft_subject{
				text-align : center;
			}
			#Ft1{
				border : 1px solid white;	
				border-top-color : black;
				border-right-color : black;				
				border-bottom-color : black;
			}
			#Ft6{
				border : 1px solid white;	
				border-top-color : black;
				border-left-color : black;				
				border-bottom-color : black;
			}
			.Ft_subject{
				background-color : yellow;
			}			
		</style>
	</head>
	<body>		
		<%-- <jsp:include page="index.jsp"/> --%>
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
						<button onclick="location.href='./컨트롤러 글쓰기 기능으로'">글쓰기</button>
					</td>					
				</tr>		
				<tr>
					<td class="Ft_subject" id="Ft1">글 번호</td>
					<td class="Ft_subject" id="Ft2">제목</td>
		    		<td class="Ft_subject" id="Ft3">작성자</td>				
					<td class="Ft_subject" id="Ft4">이미지</td>
					<td class="Ft_subject" id="Ft5">조회수</td>
					<td class="Ft_subject" id="Ft6">추천수</td>
				</tr>
			</thead>			
			<tbody id="list">
				<!-- 리스트가 출력될 내용 영역 tbody -->				
			</tbody>
			<tr>
				<td id="Ft_pageNum" colspan="6" align="center">
				<%
					/* if(pg>BLOCK) { */
				%>
						[<a href="list.jsp?pg=1">◀◀</a>]
						[<a href="list.jsp?pg=<%=startPage-1%>">◀</a>]
				<%
					/* } */
				%>		
				<%
					for(int i=startPage;i<=endPage;i++){
						if(i==pg){
				%>
							<u><b>[<%=i %>]</b></u>
				<%
						}else{
				%>
							[<a href="list.jsp?pg=<%=i %>"><%=i %></a>]
				<%
						}
				}
				%>		
				<%
					/* if(endPage<allPage){ */
				%>
						[<a href="list.jsp?pg=<%=endPage+1%>">▶</a>]
						[<a href="list.jsp?pg=<%=allPage%>">▶▶</a>]
				<%
					/* } */
				%>					
				</td>				
			</tr>						
		</table>
		</div>		
	</body>
	<script>	
	</script>
</html>