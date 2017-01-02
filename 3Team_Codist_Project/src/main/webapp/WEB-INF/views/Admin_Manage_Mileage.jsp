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
		<title>관리자 마일리지(쿠폰) 관리 페이지</title>
		<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
		<style>		
			.edge{
				border : 1px solid;
				border-collapse : collapse;
			}	
			.MC_board1{
				border : 1px solid white;
				border-collapse : collapse;			
				border-top-color : black;				
				border-bottom-color : black;
				width : 100%;
			}
			.MC_board2{
				border : 1px solid white;	
				border-collapse : collapse;							
				border-bottom-color : black;
				width : 100%;
			}
			.MC_board2 td{
				border : 1px solid;
				border-collapse : collapse;								
			}
			#btn_apply, #MC_pageNum{
				border : 1px solid white;				
				border-top-color : black;				
				border-bottom-color : black;	
			}		
			#MC_sub{
				font-size : 30pt;
				font-family : 굴림체;
			}			
			.MC_subject{
				text-align : center;
			}
			#MC1{
				border : 1px solid white;	
				border-top-color : black;
				border-right-color : black;				
				border-bottom-color : black;
			}
			#MC7{
				border : 1px solid white;	
				border-top-color : black;
				border-left-color : black;				
				border-bottom-color : black;
			}
			.MC_subject{
				background-color : yellow;				
			}			
		</style>
	</head>
	<body>		
		<%-- <jsp:include page="index.jsp"/> --%>
		<div class="content">		
		<div class="edge">
		<table class="MC_board1" align="center">
			<tr>
			 	<td id="MC_sub" colspan="7" align="left">
					<b>■ 마일리지, 쿠폰 관리</b>												
				</td>
			</tr>				
		</table>
		</br>
		<table class="MC_board2" align="center">
			<thead>				
				<tr>
					<td class="MC_subject" id="MC1">번호</td>
					<td class="MC_subject" id="MC2">사용자</td>
		    		<td class="MC_subject" id="MC3">쿠폰5%</td>				
					<td class="MC_subject" id="MC4">쿠폰10%</td>
					<td class="MC_subject" id="MC5">쿠폰15%</td>
					<td class="MC_subject" id="MC6">쿠폰20%</td>
					<td class="MC_subject" id="MC7">마일리지</td>
				</tr>
			</thead>			
			<tbody id="list">
				<!-- 리스트가 출력될 내용 영역 tbody -->				
			</tbody>
			<tr>
				<td id="MC_pageNum" colspan="7" align="center">
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
			<tr>
				<td id="btn_apply" colspan="7" align="right">
					<button onclick="location.href='./마일리지, 쿠폰 설정 적용 기능으로'">적용</button>
				</td>					
			</tr>						
		</table>
		</div>
		</div>		
	</body>
	<script>	
	</script>
</html>