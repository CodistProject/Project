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
		<title>Q & A < 게시판</title>
		<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
		<style>
			.center {
				position: relative;
				left:200px;
				top:10px;
				width: 700px;
				padding: 15px;
				margin-bottom: 20px;
				float: left;
				border: 1px solid #bcbcbc;
			}		
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
				background-color : #4C2FF0;
				color: white;
			}
			#writeQna{
			position: relative;
			
			}
			/* 버튼 css */
			#writeQna
			{
			-moz-box-shadow:inset 0px 1px 0px 0px #ffffff;
			-webkit-box-shadow:inset 0px 1px 0px 0px #ffffff;
			box-shadow:inset 0px 1px 0px 0px #ffffff;
			background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #ffffff), color-stop(1, #f6f6f6));
			background:-moz-linear-gradient(top, #ffffff 5%, #f6f6f6 100%);
			background:-webkit-linear-gradient(top, #ffffff 5%, #f6f6f6 100%);
			background:-o-linear-gradient(top, #ffffff 5%, #f6f6f6 100%);
			background:-ms-linear-gradient(top, #ffffff 5%, #f6f6f6 100%);
			background:linear-gradient(to bottom, #ffffff 5%, #f6f6f6 100%);
			filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffffff', endColorstr='#f6f6f6',GradientType=0);
			background-color:#ffffff;
			-moz-border-radius:6px;
			-webkit-border-radius:6px;
			border-radius:6px;
			border:1px solid #dcdcdc;
			display:inline-block;
			cursor:pointer;
			color:#666666;
			font-family:Arial;
			font-size:15px;
			font-weight:bold;
			padding:6px 24px;
			text-decoration:none;
			text-shadow:0px 1px 0px #ffffff;
			}
			#writeQna:hover {
			background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #f6f6f6), color-stop(1, #ffffff));
			background:-moz-linear-gradient(top, #f6f6f6 5%, #ffffff 100%);
			background:-webkit-linear-gradient(top, #f6f6f6 5%, #ffffff 100%);
			background:-o-linear-gradient(top, #f6f6f6 5%, #ffffff 100%);
			background:-ms-linear-gradient(top, #f6f6f6 5%, #ffffff 100%);
			background:linear-gradient(to bottom, #f6f6f6 5%, #ffffff 100%);
			filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#f6f6f6', endColorstr='#ffffff',GradientType=0);
			background-color:#f6f6f6;
			}
			#writeQna:active {
			position:relative;
			top:1px;
		}				
		</style>
	</head>
	<body>		
		<jsp:include page="../../resources/include/index.jsp"/>
		<div class="center">		
		<table class="Ft_board1" align="center">
			<tr>
			 	<td id="Ft_sub" colspan="5">
					<b>Q & A</b>												
				</td>
			</tr>				
		</table>
		</br>
		<table class="Ft_board2" align="center">
			<thead>		
				<tr>
					<td id="btn_write" colspan="5" align="right">
						<button id="writeQna"onclick="location.href='./컨트롤러 글쓰기 기능으로'">글쓰기</button>
					</td>					
				</tr>		
				<tr>
					<td class="Ft_subject" id="Ft1">번호</td>
					<td class="Ft_subject" id="Ft2">제목</td>
		    		<td class="Ft_subject" id="Ft3">이미지</td>				
					<td class="Ft_subject" id="Ft4">작성자</td>
					<td class="Ft_subject" id="Ft5">조회수</td>
				</tr>
			</thead>			
			<tbody id="list">
				<!-- 리스트가 출력될 내용 영역 tbody -->				
			</tbody>
			<tr>
				<td id="Ft_pageNum" colspan="5" align="center">
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
