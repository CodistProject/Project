<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<html>
	<head>
		<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<style>
			div.bord{
				border-top-style: solid;
				border-top-color: pink;
				height: 200px;		
			}
			
			div.bord1{
				float: left;	
				border: 1px solid;
				width: 47%;
				height: 150px;
			}
			
			div.bord2{
				float: right;	
				border: 1px solid;
				width: 47%;
				height: 150px;
			}
		</style>
	</head>
	<body>
		<div>
			<jsp:include page="../../resources/include/index.jsp"></jsp:include>
		</div>
		<div class="content">
		
			BEST 코디
			<div class="bord">
				코디 게시판 목록
			</div>
			회원 추천 코디
			
			<div class="bord">
				회원 추천 코디 목록
			</div>
			
			<div class="bord1">
				코디를 부탁해 게시판 노출
			</div>
			
			<div class="bord2">
				Q&A 게시판 노출
			</div>		
		
		</div>
		
	</body>
	<script>
		var msg = "${Find_Id.msg}";		
		console.log(msg);
		if(msg!= ""){
			alert(msg);
		}
	</script>
</html>