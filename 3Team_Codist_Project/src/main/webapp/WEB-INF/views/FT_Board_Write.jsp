<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>패션토크 게시판 글쓰기</title>
		<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
		<style>
			table.boardwrite{
				width:100%;
				border : 1px solid;
				border-collapse : collapse;
				padding: 5px;
				text-align: center;
			}
			td.boardwrite{				
				border : 1px solid;
				border-collapse : collapse;
				padding: 5px;
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
		<jsp:include page="index.jsp"/>
		<div class="content">
		<form action="#" method="post" enctype="multipart/form-data">		
		<table class="boardwrite">
			<tr>
				<td class="boardwrite">제목</td>
				<td class="boardwrite"><input type="text" name="subject"/></td>
			</tr>
			<tr>
				<!-- 세션에 아이디가 없으면 저장하지 못하도록 한다. -->
				<td class="boardwrite">작성자</td>
				<td align="left" class="boardwrite">
					로그인된 아이디
				</td>
			</tr>
			<tr>
				<td class="boardwrite">내용</td>
				<td class="boardwrite"><textarea name="content" rows="20"></textarea></td>
			</tr>
			<tr>
				<td class="boardwrite">파일첨부</td>
				<td class="board_write" align="left">
					<input type="file" name="file" onChange="fileView(this)"/>
					<input id="fileName" type="hidden" name="fileName"/>
				</td>
			</tr>
			<tr>
				<td class="boardwrite" colspan="2" align="right">
					<input type="submit" value="저장"/>
					<input type="reset" value="취소"/>
					<input type="button" onclick="location.href='#'" value="목록"/>
				</td>
			</tr>
		</table>
		</form>
		</div>
	</body>
	<script>
		var msg = "${msg}";
		
		if(msg != ""){
			alert(msg);
		}
	
		function fileView(elem){
			console.log(elem.value);
			var fullPath = elem.value;
			var fileName = fullPath.substring(12);
			console.log(fileName);
			$("#fileName").val(fileName);
		}
	</script>
</html>