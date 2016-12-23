<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<html>
	<head>
		<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>인덱스</title>
		<style>
			@import url(http://fonts.googleapis.com/earlyaccess/jejugothic.css);
		
			html, body, h1, h2, h3, h4, h5, h6, li, p, table {
				font-family: 'Jeju Gothic', serif;
				font-size: 13pt;
			}	
			#head {
				margin-left: 10px;
				margin-right: 10px;
				height: 80px;			
				text-align: center;
			}
			
			#weather {
				position: fixed;
				top: 15%;
				clear: left;
				float: left;
				margin-left: 10px;
				width: 120px;
				height: 800px;
				font: bold; 				
			}
			
			#weather a {
				padding-top: 5px;
				display: block;
				height: 20px;
				text-align: center;				
				text-decoration: none;				
			}
			
			#weather a.top:hover {
				background: #6BADFF;
			}
			
			#weather a.middle:hover {
				background: #6BFF7C;
			}
			
			#weather a.bottom:hover {
				background: #E5FF6B;
			}
			
			#weather a:visited {
				color: black;
			}
			
			#extra {
				position: absolute;			
				left: 1000px;
				width: 200px;
				height: 800px;				
			}
			
			#extra a.top {
				display: block;
				background: #6BADFF;
				height: 20px;
				text-align: center;
				font-weight: bold;
				color: #505050;
				text-decoration: none;
			}
			
			#extra a.middle {
				display: block;
				background: #6BFF7C;
				height: 20px;
				text-align: center;
				font-weight: bold;
				color: #505050;
				text-decoration: none;
			}
			
			#extra a.bottom {
				display: block;
				background: #E5FF6B;
				height: 20px;
				text-align: center;
				font-weight: bold;
				color: #505050;
				text-decoration: none;
			}
			
			#extra p {
				padding-left: 5px;
				padding-right: 5px;
			}	
			
			a.board{
			text-decoration: none;
			}
			
			#menu {				
				margin-left: 130px;
				margin-right: 130px;				
				width: 850px;
				height: 100px;												
			}
			
			.menuTd:hover{
				background: #6BADFF;
				font-weight: bold;
			}
			
			.menuTd:visited{
			color: black;
			}
			
			table.menu{
				width: 100%;				
				border-collapse: collapse;
				text-align: center;
			}
			
			tr.menu, td.menu{
				/* background-color: aqua; */
			}
			
			table.serch{
				width: 100%;
				border: 1px solid;
				border-collapse: collapse;				
			}
			table.serch tr{
				border: 1px solid;
			}
			
			table.serch td{
				border: 1px solid;
				padding: 5px;
			}

			.content{				
				margin-left: 130px;
				margin-right: 130px;				
				width: 840px;
			}
			
			#ask{
				border: 1px solid;
				height: 150px;
			}
			
			#ask1{
				text-align: center;
			}
			
			#askBox{
				border: white;				
				resize:none;
			}
			
						
		
		</style>
	</head>
	<body>
		<div id="head">
			<img alt="로고" src="rr.jpg">
		</div>
		
		<div id="weather">
			<a class="top" href="#">이벤트</a>
			<br/>
			<a class="top" href="#">월</a>
			<a class="top" href="#">화</a>			
			<a class="middle" href="#">수</a>
			<a class="middle" href="#">목</a>
			<a class="middle" href="#">금</a>
			<a class="bottom" href="#">토</a>
			<a class="bottom" href="#">일</a>			
		</div>	
		
		<div id="extra">
			<div id="loginSession">
				<c:if test="${sessionScope.userId ==null}">
					<jsp:include page="loginBox.jsp"></jsp:include>
				</c:if>
				
				<c:if test="${sessionScope.userId !=null}">
					<jsp:include page="login_Session.jsp"></jsp:include>
				</c:if>
				<a href="Find_Id">아이디/비밀번호 찾기</a> 
			</div>
			
			<br/>
				<table class="serch">
					<tr>
						<td>		
							<input type="text" width="50px">
							<input type="button" value="검색"> 
						</td>						
					</tr>
				</table>
			<br/>
			<div id="ask">
				<textarea id="askBox" cols="25px" rows="7px"></textarea>			
				<div id="ask1">
				<input  type="button" value="쪽지">
				<input type="button" value="이메일">
				</div>
			</div>
		</div>		
		<div id="menu">		
			<table class="menu">
				<tr class="menu">
					<td class="menuTd"><a class="board" href="./CodiBoard">코디 게시판</a></td>
					<td class="menuTd"><a class="board" href="./FTBoard">패션토크 게시판</a></td>
					<td class="menuTd"><a class="board" href="./CoplzBoard">코디를 부탁해</a></td>
					<td class="menuTd"><a class="board" href="#">나만의 옷장</a></td>
					<td class="menuTd"><a class="board" href="./QnABoard">Q&A</a></td>
					<td class="menuTd"><a class="board" href="./AlterBoard">물물 교환</a></td>					
				</tr>
			</table>
		</div>
					
	</body>
	<script>
		var msg = "${msg}";
		var userId ="${sessionScope.userId}";		
	</script>	
</html>