<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Q & A 수정하기</title>
		<script src ="//code.jquery.com/jquery-3.1.0.min.js"></script>
		<style>
			#center {
	            position: relative;
	            left:150px;
	            top: 10px;
	            width: 750px;
	            padding: 15px;
	            margin-bottom: 20px;
	            float: left;
	            border: 1px solid #bcbcbc;
	        }
			table,td{
			
			border : 2px solid gray;
			border-collapse: collapse;
			margin : 5px;
			text-align: center;
		}
		table{
			width:100%;
		}
		input[type='text']{
			width:100%;
		}
		textarea{
			width:100%;
			resize:none;
		
		}
		</style>
	</head>
	<body>
	<jsp:include page="../../resources/include/index.jsp"></jsp:include>
	<div id="center">
	<form action="update" method="post">
		<table>
			<tr>
				<td>제목</td>
				<td>
				<input type="text" name="subject" value="${content.subject }"/>
				</td>
			</tr>
			<tr>
			<!--세션에 아이디가 엇으면 저장하지 못하도록 함  -->
				<td>작성자</td>
				<td >
				<input type="hidden" name="idx" value="${content.idx}"/>
				<input type="text" name="user_name" value="${content.user_name}" readonly/>
				</td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea  name="content" rows="30">${content.content}</textarea></td>
			</tr>
			<tr>
			<td>첨부 파일</td>
				<td>
					<input type="file"  name="file" value="첨부" onchange="fileView(this)"/>
					<input  id="fileName"  type="hidden" name="fileName"/>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="수정"/>
					<input type="button" onclick="location.href='./qna'"value="취소"/>
				</td>
			</tr>
		</table>
		</form>
		</div>
	</body>
	<script></script>
</html>