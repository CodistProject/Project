<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>코디를 부탁해 수정하기</title>
		<script src ="//code.jquery.com/jquery-3.1.0.min.js"></script>
		<link rel="stylesheet" type="text/css" href="resources/css/button.css"/>
		<link rel="stylesheet" type="text/css" href="resources/css/contentView.css"/>
	</head>
	<body>
	<jsp:include page="../../resources/include/index.jsp"></jsp:include>
	<div class="content">
	<form action="B_update" method="post">
		<table class="detail">
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
				<input type="hidden" name="idx" value="${content.board_idx}"/>
				<input type="text" name="nickname" value="${content.nickName}" readonly/>
				</td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea  name="content" rows="30">${content.content}</textarea></td>
			</tr>
			<tr>
			<td>첨부 파일</td>
				<td>
					<div id="photo">첨부된 파일이 없습니다.</div>	
					<input  type="file"  name="file" value="첨부" onchange="fileView(this)"/>
					<input id="fileName"  type="hidden" name="fileName" value="${content.filename }"/>
					<input  type="hidden"  name="newfilename"  value="${content.newfilename }"/>
					<input  type="hidden"  name="filenameCheck"  value="${content.filename }"/>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input class="bt" type="submit" value="수정"/>
					<input class="bt" type="button" onclick="location.href='./qna'"value="취소"/>
				</td>
			</tr>
		</table>
		</form>
		</div>
	</body>
	<script>
	var fileMap={};	
		fileMap["${content.newfilename}"]="${content.filename}";
	console.log(fileMap);
	
	$(document).ready(function(){
		if(fileMap != null){
			var ext = "";
			Object.keys(fileMap).forEach(function(item){
				console.log(item)
				console.log(fileMap[item])
				ext = item.substring(item.lastIndexOf(".")+1);
				console.log(ext)
				if(ext=="jpg"||ext=="png"||ext=="gif"){
					var content ="<img width='400px' src='./resources/upload/"+item+"'/>"
										+"</br>"
										+fileMap[item];
					$("#photo").empty();
					$("#photo").append(content);
				}				
			});
		}	 			
	});
	
	//파일 이름 가져오기
	function fileView(elem){
		console.log(elem.value);
		var fullPath = elem.value;
		var filename = fullPath.substring(12);
		//앞에 12개 fake어쩌구삭제
		console.log(filename);
		$("#fileName").val(filename);
	}
		
	</script>
</html>