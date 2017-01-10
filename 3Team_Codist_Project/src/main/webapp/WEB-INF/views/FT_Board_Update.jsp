<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>패션 토크 수정하기</title>
		<script src ="//code.jquery.com/jquery-3.1.0.min.js"></script>
		<link rel="stylesheet" type="text/css" href="resources/css/button.css"/>
		<link rel="stylesheet" type="text/css" href="resources/css/contentView.css"/>
	</head>
	<body>
	<jsp:include page="../../resources/include/index.jsp"></jsp:include>
	<div class="content">
	<form action="update" method="post">
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
					<input  type="file"  name="file" value="첨부" onchange="fileView(this)"/>
					<input id="fileName"  type="hidden" name="fileName"/>
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
	<script></script>
</html>