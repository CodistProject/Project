<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Q & A 게시판</title>
		<script src ="//code.jquery.com/jquery-3.1.0.min.js"></script>
		<style>
		
		#center {
            position: relative;
            left:150px;
            top: 50px;
            width: 750px;
            padding: 15px;
            margin-bottom: 20px;
            float: left;
            border: 1px solid #bcbcbc;
        }
        table{
				width:100%;
			}
		table, td, th{
				border :0.5px solid gray;
				border-collapse : collapse;
				padding: 5px;
				text-align: center;
			}
		
		a {
		    text-decoration: none;
		    color: black;
		    font-size: 13px;
		}
		#paging{
			text-align: center;
		}
		#writeQna{
			position: relative;
			left: 230px;
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
			<jsp:include page="index.jsp"></jsp:include>
		<div id="center">
    		<table>
    			<tr>
    				<th colspan="5"><h2>Q & A</h2></th>
    			</tr>
    			<tr>
    				<td>번호</td>
    				<td>제목</td>
    				<td>이미지</td>
    				<td>작성자</td>
    				<td>조회수</td>
    			</tr>
    			<tr>
    				<td colspan="5" id="paging">
    				이전 1 2 3 4 5 다음 
    				<input id="writeQna" type="button" value="글쓰기"/> 
    				
    				</td>
    			</tr>
    		
    		</table>
		</div>
	
	</body>
	<script>
	 
	</script>
</html>