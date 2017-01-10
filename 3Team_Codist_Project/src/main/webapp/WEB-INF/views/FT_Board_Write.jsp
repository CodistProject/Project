<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>패션토크 글쓰기 </title>
		<script src ="//code.jquery.com/jquery-3.1.0.min.js"></script>
		<link rel="stylesheet" type="text/css" href="resources/css/Board.css"/>
		<link rel="stylesheet" type="text/css" href="resources/css/button.css"/>
	</head>
	<body>
			<jsp:include page="../../resources/include/index.jsp"></jsp:include>
		<div class="content">
			<form action="Board_Write" method="post" enctype="multipart/form-data">		
    		<table id="boardwrite">
    			<tr>
    				<td colspan="2">패션토크 게시판</td>
    				<input type="hidden" name="category" value="FT" />
    			</tr>    			
    			<tr height="30px">
    				<td>제목</td>
    				<td><input name="subject" type="text" class="text"/> </td>
    			</tr>
    			<tr height="30px">
    				<td>작성자</td>
    				<td><input class="text" name="nickName" type="text" value="${nickName}" readonly/></td>
    			</tr>
    			<tr>
					<td>내용</td>
					<td><textarea name="content" id="content" rows="30"></textarea></td>
				</tr>
				<tr>
				<td>첨부 파일</td>
				<td>				
					<input type="file" name="file" value="첨부" onchange="fileView(this)"/>
					<input  id="filenames"  type="hidden" name="filename"/>
				</td>
			</tr>
			<tr>
				<td colspan="2">					
					<input class="bt" type="submit" class="button" value="등록"/>
					<input class="bt" type="reset"  class="button" value="취소"/>				
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
		var filename = fullPath.substring(12);
		console.log(filename);
		$("#filenames").val(filename);
	}
	</script>

</html>