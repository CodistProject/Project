<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<html>
	<head>
		<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>로그인 후 변경</title>
		<link rel="stylesheet" type="text/css" href="resources/css/main.css"/>
	</head>
	<body>		
			<table class="logses">
				<tr >
					<td>${sessionScope.userId}님 반갑습니다.</td>		
				</tr>
				<br/>
				<tr>
					<td>
						<a class="a2" href="./MemberData_view?userId=${sessionScope.userId}">마이페이지</a>  
					 	<a class="a2" href="./logout?userId=${sessionScope.userId}">로그아웃</a>
					 </td>				
			</table>	
	</body>
	<script></script>
</html>