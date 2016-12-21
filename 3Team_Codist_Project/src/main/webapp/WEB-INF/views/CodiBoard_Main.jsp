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
		<title>코디 게시판</title>
		<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
		<style>			
			.Cd_board1{				
				width : 100%;			
			}
			.Cd_board2{												
				border-bottom-color : black;
				width : 100%;				
			}
			
			#Cd_pageNum{
				border : 1px solid white;	
				border-top-color : black;				
				border-bottom-color : black;	
			}		
			#Cd_sub{
				font-size : 30pt;				
				text-align : center;
				border : 1px solid white;
				border-bottom-color : black;	
				border-top-color : black;												
			}			
					
		</style>
	</head>
	<body>		
		<jsp:include page="index.jsp"/>
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
						<button onclick="location.href='#'">글쓰기</button>
						<button onclick="location.href='#'">등록</button>
					</td>					
				</tr>		
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
				<div class="img">
					<td>
					<input type="checkbox"/> 
					사진4
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